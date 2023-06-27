using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using RapChieuPhim.Areas.Admin.Controllers;
using RapChieuPhim.Dao;
using RapChieuPhim.Models;
using RapChieuPhim.ViewModel;

namespace RapChieuPhim.Controllers
{
    public class VeController : BaseController
    {
        // GET: Ve
        private DBcontext db = new DBcontext();
        public ActionResult Index(int id)

        {
            var dao = new PhimDao();
            PhimViewModel phimmodel = dao.getPhimFindbyId(id);
            Session.Add("PHIM", phimmodel);
            ViewData["listCinema"] = db.RapPhims.ToList();
            ViewData["listChair"] = db.Ghes.ToList();
            ViewData["Showtimes"] = db.LichChieux.ToList();
            ViewData["phimmodel"] = phimmodel;

            return View();
        }
        public ActionResult Create(string username, string email, string showtimes,string chair,string cinema,string numberchair,string payment)
        {
            int idLC = Int32.Parse(showtimes);
            int idRap = Int32.Parse(cinema);
            int idGe = Int32.Parse(chair);
            int soluong = Int32.Parse(numberchair);
             Session.Add("IDG",idGe);
            var phims = (PhimViewModel)Session["PHIM"];
            var user = (TaiKhoan)Session["USERSESSIO"];
            var rapphim = new RapPhimDao().GetRapPhimFindByID(idRap);

            var vedao = new VeDao();
            var lichDao = new LichChieuDao();
            var gheDao = new GheDao();
            LichChieu lichChieu = lichDao.GetLichChieuFindByID(idLC);
            lichChieu.IdPhim = phims.Id;
            lichDao.UpdateLichChieu(lichChieu);
            Ghe ghe = gheDao.GetGheFindByID(idGe);   
            Ve ve = new Ve();
            ve.IdRap = idRap;
            ve.IdTaiKhoan = user.Id;
            ve.Id_LichChieu = lichChieu.Id;
            ve.Soluong = soluong;
            ve.NgayDat = DateTime.Now;
            ve.GiaVe = (decimal?)(soluong * ghe.LoaiGhe.GiaGhe);
            Ve saveVe= vedao.SaveVe(ve);
            ghe.Id_Ve = saveVe.Id;
            ghe.TringTrang = true;
            gheDao.UpdateGhe(ghe);
            ViewData["phimmodel"] = phims;
            ViewData["VeData"] = saveVe;
            ViewData["lichChieu"] = lichChieu;
            ViewData["Ghe"] = ghe;
            ViewData["RAP"] = rapphim;
            var url = "/Payment/SendOrder?order="+ve.Id;
            return Redirect(url);

            

        }
    }
}
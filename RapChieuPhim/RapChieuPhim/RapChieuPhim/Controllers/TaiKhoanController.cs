using RapChieuPhim.Dao;
using RapChieuPhim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RapChieuPhim.Controllers
{
    public class TaiKhoanController : Controller
    {
        // GET: TaiKhoan
       [HttpPost]
        public bool Login(string username,string password)
        {
            var dao = new TaiKhoanDao();
            
                TaiKhoan taiKhoan = dao.checkTaikhoan(username,password);
            if (taiKhoan != null)
            {
                Session.Add("USERSESSIO",taiKhoan);
                return true;

            }
            return false;
        }
        [HttpPost]
        public bool Register(string username,string email, string password)
        {
            Boolean check = true;
          
                var dao = new TaiKhoanDao();
            var daoTT = new ThongTinDao();
          
            TaiKhoan taiKhoan = new TaiKhoan();
            ThongTin thongTin = new ThongTin();
            thongTin.TenNguoiDung = username;
            thongTin.NgaySinh = DateTime.Now;
            thongTin.Email = email;
          ThongTin ttsave=  daoTT.SaveTT(thongTin);
                taiKhoan.TenDangNhap = email;
                taiKhoan.MatKhau = password;
                taiKhoan.TinhTrang = true;
                taiKhoan.NgayDangKy = DateTime.Now;
                taiKhoan.PhanQuyen = "USER";
                taiKhoan.id_ThongTin= ttsave.ThongTin_id;
            dao.SaveTaiKhoan(taiKhoan);




            return check;
       
        }
        public ActionResult Logout(string username, string email, string password)
        {

            Session.RemoveAll();

            return Redirect("/Home");

        }

    }
}
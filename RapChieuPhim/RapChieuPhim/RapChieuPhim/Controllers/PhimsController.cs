using RapChieuPhim.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using RapChieuPhim.Models;

namespace RapChieuPhim.Controllers
{
    public class PhimsController : Controller
    {
        // GET: Phims
        public ActionResult Index()
        {
           
            var dao = new PhimDao();
            List<Phim> model = (List<Phim>)dao.GetPhims();
            ViewData["pagelist"] = model;
            return View();
        }
        public ActionResult DetatilPhims(int? id)
        {
            var dao = new PhimDao();
            var phims = dao.getPhimFindbyId(id);
            Session.Add("PHIM", phims);
            ViewData["phimview"] = phims;
            return View();
        }
    }
}
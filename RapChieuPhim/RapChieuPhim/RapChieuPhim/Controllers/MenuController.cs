using RapChieuPhim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RapChieuPhim.Controllers
{
    public class MenuController : Controller
    {
        private DBcontext db = new DBcontext();
        // GET: Menu
        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            var data = db.LoaiPhims.ToList();
            return PartialView(data);
        }
    }
}
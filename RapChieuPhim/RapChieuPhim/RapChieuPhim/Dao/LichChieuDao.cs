using RapChieuPhim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RapChieuPhim.Dao
{
    public class LichChieuDao
    {
        private DBcontext db = new DBcontext();
        public LichChieu GetLichChieuFindByID(int id)
        {
            return db.LichChieux.Find(id);
        }

        public LichChieu UpdateLichChieu(LichChieu lichChieu)
        { 
           LichChieu lich=  db.LichChieux.Add(lichChieu);
            db.SaveChanges();
            return lich;
        }
    }
}
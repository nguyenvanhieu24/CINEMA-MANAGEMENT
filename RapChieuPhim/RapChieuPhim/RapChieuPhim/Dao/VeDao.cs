using RapChieuPhim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RapChieuPhim.Dao
{
    public class VeDao
    {
        private DBcontext db = new DBcontext();
        public Ve GetLoaiPhimFindByID(int id)
        {
            return db.Ves.Find(id);
        }
        public Ve AddVe(Ve ve)
        {
            return null;
        }

        public Ve SaveVe(Ve ve)
        {
            try
            {
               Ve ves= db.Ves.Add(ve);
                db.SaveChanges();
                return ves;
            }
            catch(Exception e) {
                Console.WriteLine(e);
                return null;
            }
          
        }
    }
}
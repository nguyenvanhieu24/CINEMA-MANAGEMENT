using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using RapChieuPhim.Models;
using RapChieuPhim.ViewModel;
using PagedList;

namespace RapChieuPhim.Dao
{
    public class PhimDao

    {
        private DBcontext db = new DBcontext();

       

        public List<PhimViewModel> GetListPhims()
        {
            List<Phim> phims = db.Phims.Include(p => p.LoaiPhim).ToList();
            List<PhimViewModel> list = new List<PhimViewModel>();
            foreach(var phim in phims)
            {
                PhimViewModel phimView = new PhimViewModel();
                phimView.Id = phim.Id;
                phimView.TenPhim = phim.TenPhim;
                phimView.AnhPhim = phim.AnhPhim;
                phimView.DaoDien = phim.DaoDien;
                phimView.DienVien = phim.DienVien;
                phimView.ChatLuong = phim.ChatLuong;
                phimView.NgayCongChieu = phim.NgayCongChieu;
                phimView.NamPhatHanh = phim.NamPhatHanh;
                phimView.NgayKetThuc = phim.NgayKetThuc;
                phimView.TenLoai = phim.LoaiPhim.TenLoai;
                phimView.ThoiLuong = phim.ThoiLuong;
                phimView.TinhTrang = phim.TinhTrang;
                phimView.MoTa = phim.MoTa;
                list.Add(phimView);
            }
            return list;

        }

        public PhimViewModel getPhimFindbyId(int? id)
        {
            Phim phim= db.Phims.Find(id);
            PhimViewModel phimView = new PhimViewModel();
            phimView.Id = phim.Id;
            phimView.TenPhim = phim.TenPhim;
            phimView.AnhPhim = phim.AnhPhim;
            phimView.DaoDien = phim.DaoDien;
            phimView.DienVien = phim.DienVien;
            phimView.ChatLuong = phim.ChatLuong;
            phimView.NgayCongChieu = phim.NgayCongChieu;
            phimView.NamPhatHanh = phim.NamPhatHanh;
            phimView.NgayKetThuc = phim.NgayKetThuc;
            phimView.TenLoai = phim.LoaiPhim.TenLoai;
            phimView.ThoiLuong = phim.ThoiLuong;
            phimView.TinhTrang = phim.TinhTrang;
            phimView.MoTa = phim.MoTa;
            return phimView;

        }

        public List<PhimViewModel> GetListPhimsByHanhDong()
        {
            List<Phim> phims = db.Phims.Include(p => p.LoaiPhim).Where(l=>l.IdLoaiPhim==1).ToList();
            List<PhimViewModel> list = new List<PhimViewModel>();
            foreach (var phim in phims)
            {
                PhimViewModel phimView = new PhimViewModel();
                phimView.Id = phim.Id;
                phimView.TenPhim = phim.TenPhim;
                phimView.AnhPhim = phim.AnhPhim;
                phimView.DaoDien = phim.DaoDien;
                phimView.DienVien = phim.DienVien;
                phimView.ChatLuong = phim.ChatLuong;
                phimView.NgayCongChieu = phim.NgayCongChieu;
                phimView.NamPhatHanh = phim.NamPhatHanh;
                phimView.NgayKetThuc = phim.NgayKetThuc;
                phimView.TenLoai = phim.LoaiPhim.TenLoai;
                phimView.ThoiLuong = phim.ThoiLuong;
                phimView.TinhTrang = phim.TinhTrang;
                phimView.MoTa = phim.MoTa;
                list.Add(phimView);
            }
            return list;

        }
        public List<PhimViewModel> GetListPhimsByDC()
        {
            List<Phim> phims = db.Phims.Include(p => p.LoaiPhim).Where(l => l.IdLoaiPhim == 2).ToList();
            List<PhimViewModel> list = new List<PhimViewModel>();
            foreach (var phim in phims)
            {
                PhimViewModel phimView = new PhimViewModel();
                phimView.Id = phim.Id;
                phimView.TenPhim = phim.TenPhim;
                phimView.AnhPhim = phim.AnhPhim;
                phimView.DaoDien = phim.DaoDien;
                phimView.DienVien = phim.DienVien;
                phimView.ChatLuong = phim.ChatLuong;
                phimView.NgayCongChieu = phim.NgayCongChieu;
                phimView.NamPhatHanh = phim.NamPhatHanh;
                phimView.NgayKetThuc = phim.NgayKetThuc;
                phimView.TenLoai = phim.LoaiPhim.TenLoai;
                phimView.ThoiLuong = phim.ThoiLuong;
                phimView.TinhTrang = phim.TinhTrang;
                phimView.MoTa = phim.MoTa;
                list.Add(phimView);
            }
            return list;

        }
        public List<PhimViewModel> GetListPhimsByHoatHinh()
        {
            List<Phim> phims = db.Phims.Include(p => p.LoaiPhim).Where(l => l.IdLoaiPhim == 3).ToList();
            List<PhimViewModel> list = new List<PhimViewModel>();
            foreach (var phim in phims)
            {
                PhimViewModel phimView = new PhimViewModel();
                phimView.Id = phim.Id;
                phimView.TenPhim = phim.TenPhim;
                phimView.AnhPhim = phim.AnhPhim;
                phimView.DaoDien = phim.DaoDien;
                phimView.DienVien = phim.DienVien;
                phimView.ChatLuong = phim.ChatLuong;
                phimView.NgayCongChieu = phim.NgayCongChieu;
                phimView.NamPhatHanh = phim.NamPhatHanh;
                phimView.NgayKetThuc = phim.NgayKetThuc;
                phimView.TenLoai = phim.LoaiPhim.TenLoai;
                phimView.ThoiLuong = phim.ThoiLuong;
                phimView.TinhTrang = phim.TinhTrang;
                phimView.MoTa = phim.MoTa;
                list.Add(phimView);
            }
            return list;

        }
        public List<PhimViewModel> GetListPhimsByKinhDi()
        {
            List<Phim> phims = db.Phims.Include(p => p.LoaiPhim).Where(l => l.IdLoaiPhim == 3).ToList();
            List<PhimViewModel> list = new List<PhimViewModel>();
            foreach (var phim in phims)
            {
                PhimViewModel phimView = new PhimViewModel();
                phimView.Id = phim.Id;
                phimView.TenPhim = phim.TenPhim;
                phimView.AnhPhim = phim.AnhPhim;
                phimView.DaoDien = phim.DaoDien;
                phimView.DienVien = phim.DienVien;
                phimView.ChatLuong = phim.ChatLuong;
                phimView.NgayCongChieu = phim.NgayCongChieu;
                phimView.NamPhatHanh = phim.NamPhatHanh;
                phimView.NgayKetThuc = phim.NgayKetThuc;
                phimView.TenLoai = phim.LoaiPhim.TenLoai;
                phimView.ThoiLuong = phim.ThoiLuong;
                phimView.TinhTrang = phim.TinhTrang;
                phimView.MoTa = phim.MoTa;
                list.Add(phimView);
            }
            return list;

        }
        public List<PhimViewModel> GetListPhimsByHanhDongSC()
        {
            List<Phim> phims = db.Phims.Include(p => p.LoaiPhim).Where(l => l.IdLoaiPhim == 1 && l.TinhTrang==false).ToList();
            List<PhimViewModel> list = new List<PhimViewModel>();
            foreach (var phim in phims)
            {
                PhimViewModel phimView = new PhimViewModel();
                phimView.Id = phim.Id;
                phimView.TenPhim = phim.TenPhim;
                phimView.AnhPhim = phim.AnhPhim;
                phimView.DaoDien = phim.DaoDien;
                phimView.DienVien = phim.DienVien;
                phimView.ChatLuong = phim.ChatLuong;
                phimView.NgayCongChieu = phim.NgayCongChieu;
                phimView.NamPhatHanh = phim.NamPhatHanh;
                phimView.NgayKetThuc = phim.NgayKetThuc;
                phimView.TenLoai = phim.LoaiPhim.TenLoai;
                phimView.ThoiLuong = phim.ThoiLuong;
                phimView.TinhTrang = phim.TinhTrang;
                phimView.MoTa = phim.MoTa;
                list.Add(phimView);
            }
            return list;

        }
        public List<PhimViewModel> GetListPhimsByDCSC()
        {
            List<Phim> phims = db.Phims.Include(p => p.LoaiPhim).Where(l => l.IdLoaiPhim == 2 && l.TinhTrang == false).ToList();
            List<PhimViewModel> list = new List<PhimViewModel>();
            foreach (var phim in phims)
            {
                PhimViewModel phimView = new PhimViewModel();
                phimView.Id = phim.Id;
                phimView.TenPhim = phim.TenPhim;
                phimView.AnhPhim = phim.AnhPhim;
                phimView.DaoDien = phim.DaoDien;
                phimView.DienVien = phim.DienVien;
                phimView.ChatLuong = phim.ChatLuong;
                phimView.NgayCongChieu = phim.NgayCongChieu;
                phimView.NamPhatHanh = phim.NamPhatHanh;
                phimView.NgayKetThuc = phim.NgayKetThuc;
                phimView.TenLoai = phim.LoaiPhim.TenLoai;
                phimView.ThoiLuong = phim.ThoiLuong;
                phimView.TinhTrang = phim.TinhTrang;
                phimView.MoTa = phim.MoTa;
                list.Add(phimView);
            }
            return list;

        }
        public List<PhimViewModel> GetListPhimsByHoatHinhSC()
        {
            List<Phim> phims = db.Phims.Include(p => p.LoaiPhim).Where(l => l.IdLoaiPhim == 3 && l.TinhTrang == false).ToList();
            List<PhimViewModel> list = new List<PhimViewModel>();
            foreach (var phim in phims)
            {
                PhimViewModel phimView = new PhimViewModel();
                phimView.Id = phim.Id;
                phimView.TenPhim = phim.TenPhim;
                phimView.AnhPhim = phim.AnhPhim;
                phimView.DaoDien = phim.DaoDien;
                phimView.DienVien = phim.DienVien;
                phimView.ChatLuong = phim.ChatLuong;
                phimView.NgayCongChieu = phim.NgayCongChieu;
                phimView.NamPhatHanh = phim.NamPhatHanh;
                phimView.NgayKetThuc = phim.NgayKetThuc;
                phimView.TenLoai = phim.LoaiPhim.TenLoai;
                phimView.ThoiLuong = phim.ThoiLuong;
                phimView.TinhTrang = phim.TinhTrang;
                phimView.MoTa = phim.MoTa;
                list.Add(phimView);
            }
            return list;

        }
        public List<PhimViewModel> GetListPhimsByKinhDiSC()
        {
            List<Phim> phims = db.Phims.Include(p => p.LoaiPhim).Where(l => l.IdLoaiPhim == 3 && l.TinhTrang == false).ToList();
            List<PhimViewModel> list = new List<PhimViewModel>();
            foreach (var phim in phims)
            {
                PhimViewModel phimView = new PhimViewModel();
                phimView.Id = phim.Id;
                phimView.TenPhim = phim.TenPhim;
                phimView.AnhPhim = phim.AnhPhim;
                phimView.DaoDien = phim.DaoDien;
                phimView.DienVien = phim.DienVien;
                phimView.ChatLuong = phim.ChatLuong;
                phimView.NgayCongChieu = phim.NgayCongChieu;
                phimView.NamPhatHanh = phim.NamPhatHanh;
                phimView.NgayKetThuc = phim.NgayKetThuc;
                phimView.TenLoai = phim.LoaiPhim.TenLoai;
                phimView.ThoiLuong = phim.ThoiLuong;
                phimView.TinhTrang = phim.TinhTrang;
                phimView.MoTa = phim.MoTa;
                list.Add(phimView);
            }
            return list;

        }
        public IEnumerable<Phim> GetListPageListPhims(int page, int pageSize)
        {

            return db.Phims.OrderByDescending(p => p.Id).ToPagedList(page, pageSize);

        }
        public IEnumerable<Phim> GetPhims()
        {
            return db.Phims.ToList();
        }
    }
}
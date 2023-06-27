using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace RapChieuPhim.Models
{
    public partial class DBcontext : DbContext
    {
        public DBcontext()
            : base("name=DBcontext")
        {
        }

        public virtual DbSet<BinhLuan> BinhLuans { get; set; }
        public virtual DbSet<DanhMuc> DanhMucs { get; set; }
        public virtual DbSet<Ghe> Ghes { get; set; }
        public virtual DbSet<LichChieu> LichChieux { get; set; }
        public virtual DbSet<LoaiGhe> LoaiGhes { get; set; }
        public virtual DbSet<LoaiPhim> LoaiPhims { get; set; }
        public virtual DbSet<NoiDung> NoiDungs { get; set; }
        public virtual DbSet<Phim> Phims { get; set; }
        public virtual DbSet<Phong> Phongs { get; set; }
        public virtual DbSet<RapPhim> RapPhims { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<ThongTin> ThongTins { get; set; }
        public virtual DbSet<Ve> Ves { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BinhLuan>()
                .HasMany(e => e.NoiDungs)
                .WithOptional(e => e.BinhLuan)
                .HasForeignKey(e => e.Id_binhLuan);

            modelBuilder.Entity<DanhMuc>()
                .Property(e => e.TenDanhMuc)
                .IsUnicode(false);

            modelBuilder.Entity<LichChieu>()
                .Property(e => e.GioBatDau)
                .IsUnicode(false);

            modelBuilder.Entity<LichChieu>()
                .Property(e => e.GioKetThuc)
                .IsUnicode(false);

            modelBuilder.Entity<LichChieu>()
                .HasMany(e => e.Ves)
                .WithOptional(e => e.LichChieu)
                .HasForeignKey(e => e.Id_LichChieu);

            modelBuilder.Entity<LoaiGhe>()
                .HasMany(e => e.Ghes)
                .WithOptional(e => e.LoaiGhe)
                .HasForeignKey(e => e.Loai_id);

            modelBuilder.Entity<LoaiPhim>()
                .HasMany(e => e.Phims)
                .WithRequired(e => e.LoaiPhim)
                .HasForeignKey(e => e.IdLoaiPhim)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Phim>()
                .Property(e => e.DaoDien)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .Property(e => e.NamPhatHanh)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .Property(e => e.ChatLuong)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .HasMany(e => e.BinhLuans)
                .WithOptional(e => e.Phim)
                .HasForeignKey(e => e.IdPhim);

            modelBuilder.Entity<Phim>()
                .HasMany(e => e.DanhMucs)
                .WithOptional(e => e.Phim)
                .HasForeignKey(e => e.id_Phim);

            modelBuilder.Entity<Phim>()
                .HasMany(e => e.LichChieux)
                .WithOptional(e => e.Phim)
                .HasForeignKey(e => e.IdPhim);

            modelBuilder.Entity<Phong>()
                .HasMany(e => e.Ghes)
                .WithOptional(e => e.Phong)
                .HasForeignKey(e => e.Id_phong);

            modelBuilder.Entity<Phong>()
                .HasMany(e => e.LichChieux)
                .WithOptional(e => e.Phong)
                .HasForeignKey(e => e.IdPhong);

            modelBuilder.Entity<RapPhim>()
                .HasMany(e => e.Phongs)
                .WithOptional(e => e.RapPhim)
                .HasForeignKey(e => e.IdRapChieu);

            modelBuilder.Entity<RapPhim>()
                .HasMany(e => e.Ves)
                .WithOptional(e => e.RapPhim)
                .HasForeignKey(e => e.IdRap);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.PhanQuyen)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .HasMany(e => e.NoiDungs)
                .WithOptional(e => e.TaiKhoan)
                .HasForeignKey(e => e.Id_TaiKhoan);

            modelBuilder.Entity<TaiKhoan>()
                .HasMany(e => e.Ves)
                .WithOptional(e => e.TaiKhoan)
                .HasForeignKey(e => e.IdTaiKhoan);

            modelBuilder.Entity<ThongTin>()
                .Property(e => e.DiaChi)
                .IsUnicode(false);

            modelBuilder.Entity<ThongTin>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<ThongTin>()
                .HasMany(e => e.TaiKhoans)
                .WithOptional(e => e.ThongTin)
                .HasForeignKey(e => e.id_ThongTin);

            modelBuilder.Entity<Ve>()
                .HasMany(e => e.Ghes)
                .WithOptional(e => e.Ve)
                .HasForeignKey(e => e.Id_Ve);

        }

        public System.Data.Entity.DbSet<RapChieuPhim.ViewModel.VeViewModel> VeViewModels { get; set; }
    }
}

namespace RapChieuPhim.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Phim")]
    public partial class Phim
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Phim()
        {
            BinhLuans = new HashSet<BinhLuan>();
            DanhMucs = new HashSet<DanhMuc>();
            LichChieux = new HashSet<LichChieu>();
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public string TenPhim { get; set; }

        public string AnhPhim { get; set; }

        public int ThoiLuong { get; set; }

        public string MoTa { get; set; }


        public bool TinhTrang { get; set; }

        public int IdLoaiPhim { get; set; }

        public string DienVien { get; set; }

        public string DaoDien { get; set; }

        public DateTime NgayCongChieu { get; set; }

        public DateTime NgayKetThuc { get; set; }

        [StringLength(50)]
        public string NamPhatHanh { get; set; }

        [StringLength(50)]
        public string ChatLuong { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BinhLuan> BinhLuans { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhMuc> DanhMucs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LichChieu> LichChieux { get; set; }

        public virtual LoaiPhim LoaiPhim { get; set; }
    }
}

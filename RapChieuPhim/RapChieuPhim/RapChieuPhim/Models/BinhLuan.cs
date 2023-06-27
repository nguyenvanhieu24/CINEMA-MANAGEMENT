namespace RapChieuPhim.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BinhLuan")]
    public partial class BinhLuan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BinhLuan()
        {
            NoiDungs = new HashSet<NoiDung>();
        }

        public int Id { get; set; }

        public int? IdPhim { get; set; }

        [Required]
        public string NoiDung { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayDang { get; set; }

        public bool TinhTrang { get; set; }

        public int DanhGia { get; set; }

        public virtual Phim Phim { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NoiDung> NoiDungs { get; set; }
    }
}

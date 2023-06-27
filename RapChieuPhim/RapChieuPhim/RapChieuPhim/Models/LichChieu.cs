namespace RapChieuPhim.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LichChieu")]
    public partial class LichChieu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LichChieu()
        {
            Ves = new HashSet<Ve>();
        }

        public int Id { get; set; }

        public int? IdPhong { get; set; }

        public DateTime NgayChieu { get; set; }

        [Required]
        [StringLength(50)]
        public string GioBatDau { get; set; }

        [Required]
        [StringLength(50)]
        public string GioKetThuc { get; set; }

        public int? IdPhim { get; set; }

        public virtual Phim Phim { get; set; }

        public virtual Phong Phong { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ve> Ves { get; set; }
    }
}

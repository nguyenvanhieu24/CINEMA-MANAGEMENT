namespace RapChieuPhim.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("RapPhim")]
    public partial class RapPhim
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RapPhim()
        {
            Phongs = new HashSet<Phong>();
            Ves = new HashSet<Ve>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string TenRapChieu { get; set; }

        public int TongSoPhong { get; set; }

        public string ThanhPho { get; set; }

        public string QuanHuyen { get; set; }

        public string PhuongXa { get; set; }

        public string KhungGio { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Phong> Phongs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ve> Ves { get; set; }
    }
}

namespace RapChieuPhim.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NoiDung")]
    public partial class NoiDung
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id { get; set; }

        public int? Id_binhLuan { get; set; }

        public int? Id_TaiKhoan { get; set; }

        public virtual BinhLuan BinhLuan { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Autorizacion_Ingreso_UPTC.Models.ViewModels
{
    public class InformacionViewModel
    {
        public int Id { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name= "TipoVinculacion")]
        public string TipoVinculacion { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "Nombre")]
        public string Nombre { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "TipoIdentificacion")]
        public string TipoIdentificacion { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "NumeroIdentificacion")]
        public string NumeroIdentificacion { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "Ciudad")]
        public string Ciudad { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "DireccionResidencia")]
        public string DireccionResidencia { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "CuidadSede")]
        public string CuidadSede { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "NumeroCelular")]
        public string NumeroCelular { get; set; }
        [Required]
        [Display(Name = "Edad")]
        public int Edad { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "InstalacionDestino")]
        public string InstalacionDestino { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "TipoIngreso")]
        public string TipoIngreso { get; set; }
        [Required]
        [DataType(DataType.Date)]
        [Display(Name = "FechaIngreso")]
        [DisplayFormat(DataFormatString ="{0:yyyy-MM-dd}",ApplyFormatInEditMode =true)]
        public DateTime FechaIngreso { get; set; }
        [Required]
        [Display(Name = "HoraIngreso")]
        public string HoraIngreso { get; set; }
        [Required]
        [Display(Name = "HolaSalida")]
        public string HolaSalida { get; set; }


    }
}
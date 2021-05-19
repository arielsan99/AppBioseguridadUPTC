using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using System.TimeSpan;

namespace Autorizacion_Ingreso_UPTC.Models.ViewModels
{
    public class ListInformacionViewModel
    {
        public int Id { get; set; }
        public string TipoVinculacion { get; set; }

        public string Nombre { get; set; }
        public string TipoIdentificacion { get; set; }
        public string NumeroIdentificacion { get; set; }
        public string Ciudad { get; set; }
        public string DireccionResidencia { get; set; }
        public string CuidadSede { get; set; }
        public string NumeroCelular { get; set; }
        public int Edad { get; set; }
        public string InstalacionDestino { get; set; }
        public string TipoIngreso { get; set; }
        public DateTime FechaIngreso { get; set; }
        public string HoraIngreso { get; set; }
        public string HolaSalida { get; set;}

        
    }
}
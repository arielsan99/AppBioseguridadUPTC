//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Autorizacion_Ingreso_UPTC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Informacion
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
        public Nullable<int> Edad { get; set; }
        public string Temperatura { get; set; }
        public Nullable<bool> Tos { get; set; }
        public Nullable<bool> DificultadRespiratoria { get; set; }
        public Nullable<bool> MalestarGeneral { get; set; }
        public Nullable<bool> CongestionNasal { get; set; }
        public Nullable<bool> PerdidaOlfatoGusto { get; set; }
        public Nullable<bool> ContactoCovid { get; set; }
        public string InstalacionDestino { get; set; }
        public string TipoIngreso { get; set; }
        public Nullable<System.DateTime> FechaIngreso { get; set; }
        public string HoraIngreso { get; set; }
        public string HolaSalida { get; set; }
    }
}

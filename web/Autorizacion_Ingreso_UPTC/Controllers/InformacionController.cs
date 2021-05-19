using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Autorizacion_Ingreso_UPTC.Models;
using Autorizacion_Ingreso_UPTC.Models.ViewModels;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace Autorizacion_Ingreso_UPTC.Controllers
{
    public class InformacionController : Controller
    {
        // GET: Informacion
        public ActionResult Index()
        {
            List<ListInformacionViewModel> lst;
            using (AutorizacionEntities2 db = new AutorizacionEntities2())
            {
                lst = (from d in db.Informacion
                       select new ListInformacionViewModel
                       {
                           Id = d.Id,
                           TipoVinculacion = d.TipoVinculacion,
                           Nombre = d.Nombre,
                           TipoIdentificacion = d.TipoIdentificacion,
                           NumeroIdentificacion = d.NumeroIdentificacion,
                           Ciudad = d.Ciudad,
                           DireccionResidencia = d.DireccionResidencia,
                           CuidadSede = d.CuidadSede,
                           NumeroCelular = d.NumeroCelular,
                           Edad = (int)d.Edad,
                           InstalacionDestino = d.InstalacionDestino,
                           TipoIngreso = d.TipoIngreso,
                           FechaIngreso = (DateTime)d.FechaIngreso,
                           HoraIngreso = d.HoraIngreso,
                           HolaSalida = d.HolaSalida
                       }).ToList();
            }

            return View(lst);
        }

        public ActionResult Nuevo()
        {
            return View();

        }
        [HttpPost]
        public ActionResult Nuevo(InformacionViewModel model)
        {
            try
            {

                if (ModelState.IsValid)
                {
                    using (AutorizacionEntities2 db = new AutorizacionEntities2())
                    {
                        var informacion = new Informacion();
                        //informacion.Id = model.Id;
                        informacion.TipoVinculacion = model.TipoVinculacion;
                        informacion.Nombre = model.Nombre;
                        informacion.TipoIdentificacion = model.TipoIdentificacion;
                        informacion.NumeroIdentificacion = model.NumeroIdentificacion;
                        informacion.Ciudad = model.Ciudad;
                        informacion.DireccionResidencia = model.DireccionResidencia;
                        informacion.CuidadSede = model.CuidadSede;
                        informacion.NumeroCelular = model.NumeroCelular;
                        informacion.Edad = model.Edad;
                        informacion.InstalacionDestino = model.InstalacionDestino;
                        informacion.TipoIngreso = model.TipoIngreso;
                        informacion.FechaIngreso = model.FechaIngreso;
                        informacion.HoraIngreso = model.HoraIngreso;
                        informacion.HolaSalida = model.HolaSalida;

                        db.Informacion.Add(informacion);
                        db.SaveChanges();
                    }
                    return Redirect("/Informacion");
                }
                return View(model);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }

        public ActionResult Editar(int Id)
        {
            InformacionViewModel model = new InformacionViewModel();
            using (AutorizacionEntities2 db = new AutorizacionEntities2())
            {
                var informacion = db.Informacion.Find(Id);
                model.TipoVinculacion = informacion.TipoVinculacion;
                model.Nombre = informacion.Nombre;
                model.TipoIdentificacion = informacion.TipoIdentificacion;
                model.NumeroIdentificacion = informacion.NumeroIdentificacion;
                model.Ciudad = informacion.Ciudad;
                model.DireccionResidencia = informacion.DireccionResidencia;
                model.CuidadSede = informacion.CuidadSede;
                model.NumeroCelular = informacion.NumeroCelular;
                model.Edad = (int)informacion.Edad;
                model.InstalacionDestino = informacion.InstalacionDestino;
                model.TipoIngreso = informacion.TipoIngreso;
                model.FechaIngreso = (DateTime)informacion.FechaIngreso;
                model.HoraIngreso = informacion.HoraIngreso;
                model.HolaSalida = informacion.HolaSalida;
                model.Id = informacion.Id;

            }

            return View(model);

        }
        [HttpPost]
        public ActionResult Editar(InformacionViewModel model)
        {
            try
            {

                if (ModelState.IsValid)
                {
                    using (AutorizacionEntities2 db = new AutorizacionEntities2())
                    {
                        var informacion = db.Informacion.Find(model.Id);

                        informacion.TipoVinculacion = model.TipoVinculacion;
                        informacion.Nombre = model.Nombre;
                        informacion.TipoIdentificacion = model.TipoIdentificacion;
                        informacion.NumeroIdentificacion = model.NumeroIdentificacion;
                        informacion.Ciudad = model.Ciudad;
                        informacion.DireccionResidencia = model.DireccionResidencia;
                        informacion.CuidadSede = model.CuidadSede;
                        informacion.NumeroCelular = model.NumeroCelular;
                        informacion.Edad = model.Edad;
                        informacion.InstalacionDestino = model.InstalacionDestino;
                        informacion.TipoIngreso = model.TipoIngreso;
                        informacion.FechaIngreso = model.FechaIngreso;
                        informacion.HoraIngreso = model.HoraIngreso;
                        informacion.HolaSalida = model.HolaSalida;

                        db.Entry(informacion).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }
                    return Redirect("/Informacion");
                }
                return View(model);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        [HttpGet]
        public ActionResult Eliminar(int Id)
        {
            
            using (AutorizacionEntities2 db = new AutorizacionEntities2())
            {
                
                var informacion = db.Informacion.Find(Id);
                db.Informacion.Remove(informacion);
                db.SaveChanges();

                return Redirect("/Informacion");

            }

            //return Redirect("/Informacion");

        }
        [HttpGet]
        public ActionResult PDF(int Id)
        {
            InformacionViewModel model = new InformacionViewModel();
            using (AutorizacionEntities2 db = new AutorizacionEntities2())
            {
                var informacion = db.Informacion.Find(Id);
                model.TipoVinculacion = informacion.TipoVinculacion;
                model.Nombre = informacion.Nombre;
                model.TipoIdentificacion = informacion.TipoIdentificacion;
                model.NumeroIdentificacion = informacion.NumeroIdentificacion;
                model.Ciudad = informacion.Ciudad;
                model.DireccionResidencia = informacion.DireccionResidencia;
                model.CuidadSede = informacion.CuidadSede;
                model.NumeroCelular = informacion.NumeroCelular;
                model.Edad = (int)informacion.Edad;
                model.InstalacionDestino = informacion.InstalacionDestino;
                model.TipoIngreso = informacion.TipoIngreso;
                model.FechaIngreso = (DateTime)informacion.FechaIngreso;
                model.HoraIngreso = informacion.HoraIngreso;
                model.HolaSalida = informacion.HolaSalida;
                model.Id = informacion.Id;

            }


            Document doc = new Document(PageSize.A4);
            PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(@"C:\Users\garci\OneDrive\Escritorio\Trabajo de Campo\QR\" + model.Nombre + ".pdf", FileMode.Create));
            doc.Open();
            BarcodeQRCode barcodeQRCode = new BarcodeQRCode("Tipo de vinculación: " + model.TipoVinculacion + " Nombres: " + model.Nombre + " # Identificación " + model.NumeroIdentificacion + " Tipo de Ingreso: " + model.TipoIngreso + " Fecha Ingreso: " + model.FechaIngreso + " Hora Ingreso: " + model.HoraIngreso + " Hora Salida: " + model.HolaSalida, 1000, 1000, null);
            Image codeQRimage = barcodeQRCode.GetImage();
            codeQRimage.ScaleAbsolute(350, 350);
            doc.AddTitle("Mi primer PDF");
            doc.AddCreator("Roberto Torres");
            doc.Add(codeQRimage);

            //doc.Add(new Paragraph("Autorización Para El Ingreso a las Instalaciones del Sistema"));
            //doc.Add(Chunk.NEWLINE);

            //iTextSharp.text.Font _standardFont = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 8, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);
            //PdfPTable tblPrueba = new PdfPTable(6);
            //tblPrueba.WidthPercentage = 100;

            //PdfPCell clVinculacion = new PdfPCell(new Phrase("Vinculación", _standardFont));
            //clVinculacion.BorderWidth = 0;
            //clVinculacion.BorderWidthBottom = 0.75f;

            //PdfPCell clNombre = new PdfPCell(new Phrase("Nombre", _standardFont));
            //clNombre.BorderWidth = 0;
            //clNombre.BorderWidthBottom = 0.75f;

            //PdfPCell clInstalacionDestino = new PdfPCell(new Phrase("Instalación Destino", _standardFont));
            //clInstalacionDestino.BorderWidth = 0;
            //clInstalacionDestino.BorderWidthBottom = 0.75f;

            //PdfPCell clFechaIngreso = new PdfPCell(new Phrase("Fecha Ingreso", _standardFont));
            //clFechaIngreso.BorderWidth = 0;
            //clFechaIngreso.BorderWidthBottom = 0.75f;


            //PdfPCell clHoraIngreso = new PdfPCell(new Phrase("Hora Ingreso", _standardFont));
            //clHoraIngreso.BorderWidth = 0;
            //clHoraIngreso.BorderWidthBottom = 0.75f;

            //PdfPCell clHoraSalida = new PdfPCell(new Phrase("Hora Salida", _standardFont));
            //clHoraIngreso.BorderWidth = 0;
            //clHoraIngreso.BorderWidthBottom = 0.75f;


            //tblPrueba.AddCell(clVinculacion);
            //tblPrueba.AddCell(clNombre);
            //tblPrueba.AddCell(clInstalacionDestino);
            //tblPrueba.AddCell(clFechaIngreso);
            //tblPrueba.AddCell(clHoraIngreso);
            //tblPrueba.AddCell(clHoraSalida);

            //clVinculacion = new PdfPCell(new Phrase(model.TipoVinculacion, _standardFont));
            //clVinculacion.BorderWidth = 0;

            //clNombre = new PdfPCell(new Phrase(model.Nombre, _standardFont));
            //clNombre.BorderWidth = 0;

            //clInstalacionDestino = new PdfPCell(new Phrase(model.InstalacionDestino ,_standardFont));
            //clInstalacionDestino.BorderWidth = 0;

            //clFechaIngreso = new PdfPCell(new Phrase(Convert.ToString(model.FechaIngreso), _standardFont));
            //clFechaIngreso.BorderWidth = 0;

            //clHoraIngreso = new PdfPCell(new Phrase(model.HoraIngreso, _standardFont));
            //clHoraIngreso.BorderWidth = 0;

            //clHoraSalida = new PdfPCell(new Phrase(model.HolaSalida, _standardFont));
            //clHoraSalida.BorderWidth = 0;

            //tblPrueba.AddCell(clVinculacion);
            //tblPrueba.AddCell(clNombre);
            //tblPrueba.AddCell(clInstalacionDestino);
            //tblPrueba.AddCell(clFechaIngreso);
            //tblPrueba.AddCell(clHoraIngreso);
            
            //doc.Add(tblPrueba);

            doc.Close();
            writer.Close();
            return Redirect("/Informacion");
        }
    }
}
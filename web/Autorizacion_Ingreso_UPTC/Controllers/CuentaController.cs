using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using Autorizacion_Ingreso_UPTC.Models;

namespace Autorizacion_Ingreso_UPTC.Controllers
{
    public class CuentaController : Controller
    {
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;
       
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        void connectionString()
        {
            con.ConnectionString = "Data Source=LAPTOP-L3NKCONE;Initial Catalog=Autorizacion;User ID=sa;Password=1234;Integrated Security=False;";
        }
        [HttpPost]
        public ActionResult Verificar(Login login)
        {
            connectionString();
            con.Open();
            com.Connection = con;
            com.CommandText = "SELECT * FROM Usuario WHERE usuario='" + login.usuario + "' AND contrasena='" + login.contrasena + "' ";

            dr = com.ExecuteReader();

            //file.SaveLog("[Inicio de Sesión: ]" + "[Usuario: ]" + Convert.ToString(login.nom_usu));

            if (dr.Read())
            {
                con.Close();
                return Redirect("~/Informacion/Index/");
            }
            else
            {
                con.Close();
                return View();
            }

            //return Redirect("~/Informacion/Index/");
        }

        public ActionResult Logoff()
        {

            con.Close();
            //file.SaveLog("[Sesión Terminada]");
            return Redirect("~/Cuenta/Login");

        }

    }
}
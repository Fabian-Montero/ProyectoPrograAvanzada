using ProyectoWebGrupo6.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoWebGrupo6.Controllers
{
    public class UsuarioController : Controller
    {

        //Inyectar modelo
       
        public ActionResult Login()
        {
            return View();
        }
        [HttpGet]
        public ActionResult RegistrarUsuario()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RegistrarUsuario(Usuario usuario)
        {
            //Llamada al api
            ViewBag.msjPantalla = "Llamada al modelo";
            return View();
            
        }

        public ActionResult OlvidarContrasenna()
        {
            return View();
        }

        public ActionResult Error401()
        {
            return View();
        }
        public ActionResult Error404()
        {
            return View();
        }

        public ActionResult Error500()
        {
            return View();
        }
    }
}
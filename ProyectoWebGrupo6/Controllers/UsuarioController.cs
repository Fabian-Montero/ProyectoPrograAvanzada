using ProyectoWebGrupo6.Entidades;
using ProyectoWebGrupo6.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Mvc;

namespace ProyectoWebGrupo6.Controllers
{
    public class UsuarioController : Controller
    {
        UsuarioModel usuarioModel = new UsuarioModel();

        [HttpGet]
        public ActionResult IniciarSesionUsuario()
        {
            return View();
        }

        [HttpPost]
        public ActionResult IniciarSesionUsuario(Usuario usuario)
        {
            var respuesta = usuarioModel.IniciarSesionUsuario(usuario);

            if (respuesta.Codigo == 0)
                return RedirectToAction("Inicio", "Inicio");
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }

        [HttpGet]
        public ActionResult RegistrarUsuario()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RegistrarUsuario(Usuario usuario)
        {
            var respuesta = usuarioModel.RegistrarUsuario(usuario);

            if (respuesta.Codigo == 0)
            {
                return RedirectToAction("IniciarSesionUsuario", "Usuario");
            }
            else
            {
                ViewBag.msjPantalla = respuesta.Detalle;
                return View();
            }
            
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

        /*
         * 
         * Este Metodo puede servir mas adelante
        [HttpPost]
        public Usuario EncontrarPorCorreo(Usuario usuario)
        {
            
            var respuesta = usuarioModel.encontrarPorCorreo(usuario);

            if (respuesta.Codigo != 0)
            {
                return respuesta.usuario;
                //ViewBag.errorEncontarPorCorreo = respuesta.Detalle;
                //return RedirectToAction("RegistrarUsuario", "Usuario");
            }
            else
            {
                //return RedirectToAction("Login", "Usuario");
                return null;
            }
        }

        */
        [HttpGet]
        public ActionResult EnvioCodigoAcceso()
        {
            return View();
        }

        [HttpPost]
        public ActionResult EnvioCodigoAcceso(Usuario usuario)
        {
            var respuesta = usuarioModel.EnvioCodigoAcceso(usuario);
            if (respuesta.Codigo == 0)
            {
                return RedirectToAction("RegistrarNuevaContrasenna", "Usuario");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }

        [HttpGet]
        public ActionResult RegistrarNuevaContrasenna()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RegistrarNuevaContrasenna(Usuario usuario)
        {
            var respuesta = usuarioModel.RegistrarNuevaContrasenna(usuario);
            if (respuesta.Codigo == 0)
            {
                return RedirectToAction("IniciarSesionUsuario", "Usuario");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }


    }
}
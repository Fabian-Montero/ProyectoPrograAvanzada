using ProyectoWebGrupo6.Entidades;
using ProyectoWebGrupo6.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace ProyectoWebGrupo6.Controllers
{
    [FiltroSeguridad]
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class CarritoController : Controller
    {
        CarritoModel Carritomodel = new CarritoModel();

        [HttpPost]
        public ActionResult AgregarCarrito(long idProducto, int cantProducto) 
        {
            Carrito entidad = new Carrito();
            entidad.Usuarioid = long.Parse(Session["UsuarioId"].ToString());
            entidad.Productoid = idProducto;
            entidad.Cantidad = cantProducto;

            var respuesta = Carritomodel.AgregarCarrito(entidad);

            if (respuesta.Codigo == 0)
            {
                ActualizarCarrito();
                return Json("OK", JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(respuesta.Detalle, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult ConsultaCarrito()
        {
            var respuesta = Carritomodel.ConsultarCarrito(long.Parse(Session["UsuarioId"].ToString()));

            if (respuesta.Codigo == 0)
                return View(respuesta.Datos);
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View(new List<Carrito>());
            }
        }

        [HttpPost]
        public ActionResult EliminarCarrito(Carrito entidad)
        {
            var respuesta = Carritomodel.EliminarCarrito(entidad.Carritoid);
            
            if (respuesta.Codigo == 0)
            {
                ActualizarCarrito();
                return RedirectToAction("ConsultaCarrito", "Carrito");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }

        private void ActualizarCarrito()
        {
            var datos = Carritomodel.ConsultarCarrito(long.Parse(Session["UsuarioId"].ToString()));

            if (datos.Codigo == 0)
            {
                Session["Cantidad"] = datos.Datos.AsEnumerable().Sum(x => x.Cantidad);
                Session["SubTotal"] = datos.Datos.AsEnumerable().Sum(x => x.SubTotal);
                Session["Total"] = datos.Datos.AsEnumerable().Sum(x => x.Total);
            }
            
            else
            {
                Session["Cantidad"] = 0;
                Session["SubTotal"] = 0;
                Session["Total"] = 0;
            }
            
        }
    }
}
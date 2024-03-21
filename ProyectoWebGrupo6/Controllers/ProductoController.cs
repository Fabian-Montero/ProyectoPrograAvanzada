using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProyectoWebGrupo6.Models;

namespace ProyectoWebGrupo6.Controllers
{
    [FiltroSeguridad]
    public class ProductoController : Controller
    {
        // GET: Inicio
        public ActionResult ConsultarProducto()
        {
            return View();
        }

        [FiltroAdmin]
        // GET: Inicio
        public ActionResult ActualizarProducto()
        {
            return View();
        }
    }
}
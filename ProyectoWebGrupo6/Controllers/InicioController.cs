using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProyectoWebGrupo6.Models;

namespace ProyectoWebGrupo6.Controllers
{
    [FiltroSeguridad]
    [OutputCache(NoStore = true, Duration = 0)]
    public class InicioController : Controller
    {
        // GET: Inicio
        public ActionResult Inicio()
        {
            return View();
        }
    }
}
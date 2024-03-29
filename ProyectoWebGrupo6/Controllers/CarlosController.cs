using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoWebGrupo6.Controllers
{
    public class CarlosController : Controller
    {
        [HttpGet] 
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Prueba()
        {
            return View();
        }
    }
}
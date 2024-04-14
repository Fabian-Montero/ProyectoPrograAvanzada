using ProyectoApiGupo6.Entidades;
using ProyectoApiGupo6.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ProyectoApiGupo6.Controllers
{
    public class CarritoController : ApiController
    {
        [HttpPost]
        [Route("Carrito/AgregarCarrito")]
        public Confirmacion AgregarCarrito(Carrito entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new MordidaDivinaEntities())
                {
                    var resp = db.AgregarCarrito(entidad.Usuarioid, entidad.Productoid, entidad.Cantidad);


                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se pudo agregar los datos al carrito";
                    }
                }
            }
            catch (Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Error de sistema";
            }

            return respuesta;
        }


        [HttpGet]
        [Route("Carrito/ConsultarCarrito")]
        public ConfirmacionCarrito ConsultarCarrito(long usuarioid)
        {
            var respuesta = new ConfirmacionCarrito();

            try
            {
                using (var db = new MordidaDivinaEntities())
                {

                    var datos = db.ConsultarCarrito(usuarioid).ToList();
                    if (datos.Count > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.Datos = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "Carrito Vacío";
                    }
                }
            }
            catch (Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Error de sistema";
            }

            return respuesta;
        }

        [HttpDelete]
        [Route("Carrito/EliminarCarrito")]
        public Confirmacion EliminarCarrito(long carritoid)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new MordidaDivinaEntities())
                {
                    var resp = db.EliminarCarrito(carritoid);

                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "El carrito no se pudo eliminar";
                    }
                }
            }
            catch (Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema";
            }
            return respuesta;
        }
    }
}

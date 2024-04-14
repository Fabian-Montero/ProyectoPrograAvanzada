using ProyectoWebGrupo6.Entidades;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Web;

namespace ProyectoWebGrupo6.Models
{
    public class CarritoModel
    {
        public Confirmacion AgregarCarrito(Carrito entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Carrito/AgregarCarrito";

                JsonContent jsonEntidad = JsonContent.Create(entidad);

                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                }
                else
                {
                    return null;
                }
            }
        }

        public ConfirmacionCarrito ConsultarCarrito(long usuarioid)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Carrito/ConsultarCarrito?usuarioid=" + usuarioid;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionCarrito>().Result;
                else
                    return null;
            }
        }

        public Confirmacion EliminarCarrito(long carritoid)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Carrito/EliminarCarrito?carritoid=" + carritoid;
                var respuesta = client.DeleteAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                }
                else
                {
                    return null;
                }
            }
        }
    }
}
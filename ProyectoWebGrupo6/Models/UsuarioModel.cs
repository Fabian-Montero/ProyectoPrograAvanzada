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
    public class UsuarioModel

    {
        public string url = ConfigurationManager.AppSettings["urlWebApi"];

        public Confirmacion RegistrarUsuario(Usuario usuario)
        {

            using (var client = new HttpClient())
            {
                url += "Usuario/RegistrarUsuario";

                JsonContent jsonEntidad = JsonContent.Create(usuario);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;
                Console.WriteLine(respuesta);
                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            } 
        }

        public ConfirmacionUsuario IniciarSesionUsuario(Usuario usuario)
        {

            using (var client = new HttpClient())
            {
                url += "Usuario/IniciarSesionUsuario";

                JsonContent jsonEntidad = JsonContent.Create(usuario);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionUsuario>().Result;
                else
                    return null;
            }
        }
    /*
     * Este metodo puede servir mas adelante
        public ConfirmacionUsuario encontrarPorCorreo(Usuario usuario)
        {

            using (var client = new HttpClient())
            {
                url += "Usuario/encontrarPorCorreo";

                JsonContent jsonEntidad = JsonContent.Create(usuario);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionUsuario>().Result;
                else
                    return null;
            }
        }

        */
        public Confirmacion EnvioCodigoAcceso(Usuario usuario)
        {
            using (var client = new HttpClient())
            {
                url += "Usuario/EnvioCodigoAcceso";

                JsonContent jsonEntidad = JsonContent.Create(usuario);

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

        public Confirmacion RegistrarNuevaContrasenna(Usuario usuario)
        {
            using (var client = new HttpClient())
            {
                url += "Usuario/RegistrarNuevaContrasenna";

                JsonContent jsonEntidad = JsonContent.Create(usuario);

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
    }
}
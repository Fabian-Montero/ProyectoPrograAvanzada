﻿using ProyectoApiGupo6.Entidades;
using ProyectoApiGupo6.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Http;


namespace ProyectoApiGupo6.Controllers
{
    public class UsuarioController : ApiController
    {
        UtilitariosModel utilitariosModel = new UtilitariosModel();

        [HttpPost]
        [Route("Usuario/RegistrarUsuario")]
        public Confirmacion RegistrarUsuario(Usuario usuario)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new MordidaDivinaEntities())
                {
                    var resp = db.RegistrarUsuario(usuario.Nombre, usuario.Apellidos, usuario.Email, usuario.Contrasenna);

                    if (resp > 0)
                    {
                        var usuarioEncontrado = EncontrarPorCorreo(usuario).UsuarioEncontrado;
                        Usuario usuarioCreado = ConvertirAUsuario(usuarioEncontrado);
                        var respuestaDireccion = RegistrarDireccion(usuarioCreado, usuario.Direccion);
                        if (respuestaDireccion.Codigo == 0)
                        {
                            respuesta.Codigo = 0;
                            respuesta.Detalle = string.Empty;
                        }
                        else
                        {
                            respuesta.Codigo = -1;
                            respuesta.Detalle = respuestaDireccion.Detalle;
                        }
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "Su información ya se encuentra registrada";
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

        public Confirmacion RegistrarDireccion(Usuario usuario, Direccion direccion)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new MordidaDivinaEntities())
                {
                    var resp = db.RegistrarDireccion(usuario.Id, direccion.Provincia, direccion.Canton, direccion.Distrito, direccion.DireccionExacta);

                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "Ocurrió un error a la hora de guardar su direccións";
                    }
                }
            }
            catch (Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema a la hora de guardar su dirección";
            }

            return respuesta;
        }

        [HttpPost]
        [Route("Usuario/IniciarSesionUsuario")]
        public ConfirmacionUsuario IniciarSesionUsuario(Usuario usuario)
        {
            var respuesta = new ConfirmacionUsuario();

            try
            {
                using (var db = new MordidaDivinaEntities())
                {
                    var dato = db.IniciarSesionUsuario(usuario.Email, usuario.Contrasenna).FirstOrDefault();

                    if (dato != null)
                    {

                        if (dato.temporal == true && DateTime.Now > dato.vencimiento)
                        {
                            respuesta.Codigo = -1;
                            respuesta.Detalle = "Su contraseña temporal ha caducado";
                        }
                        else
                        {
                            respuesta.Codigo = 0;
                            respuesta.Detalle = string.Empty;
                            respuesta.Usuario = dato;
                        }

                        /*respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.Usuario = dato;*/
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se pudo validar su información";
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

        public ConfirmacionUsuario EncontrarPorCorreo(Usuario usuario)
        {

            var respuesta = new ConfirmacionUsuario();
            {

                try {
                    using (var db = new MordidaDivinaEntities())
                    {
                        var usuarioCreado = db.EncontrarPorCorreo(usuario.Email).FirstOrDefault();

                        if (usuarioCreado != null)
                        {
                            respuesta.Codigo = 0;
                            respuesta.Detalle = string.Empty;
                            respuesta.UsuarioEncontrado = usuarioCreado;

                        }
                        else
                        {
                            respuesta.Codigo = -1;
                            respuesta.Detalle = "No se pudo validar su información";
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

        private Usuario ConvertirAUsuario(EncontrarPorCorreo_Result resultado)
        {

            return new Usuario
            {
                Id = resultado.id,
                Nombre = resultado.nombre,
                Apellidos = resultado.apellidos,
                Email = resultado.email,
                Contrasenna = resultado.contrasenna,
                Activo = resultado.activo
            };
        }

        [HttpPost]
        [Route("Usuario/EnvioCodigoAcceso")]
        public Confirmacion EnvioCodigoAcceso(Usuario usuario)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new MordidaDivinaEntities())
                {

                    var datos = db.EnvioCodigoAcceso(usuario.Email).FirstOrDefault();
                    if (datos != null)
                    {
                        string ruta = AppDomain.CurrentDomain.BaseDirectory + "MensajeCorreo.html";

                        string contenido = File.ReadAllText(ruta);

                        contenido = contenido.Replace("@@Nombre", datos.nombre);
                        contenido = contenido.Replace("@@Contrasenna", datos.contrasenna);
                        contenido = contenido.Replace("@@Vencimiento", datos.vencimiento.ToString("dd/MM/yyyy hh:mm:ss tt"));


                        utilitariosModel.EnviarCorreo(datos.email, "Acceso Temporal", contenido);

                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontro el usuario";
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

        [HttpPost]
        [Route("Usuario/RegistrarNuevaContrasenna")]
        public Confirmacion RegistrarNuevaContrasenna(Usuario usuario)
        {
            var respuesta = new Confirmacion();
            try
            {
                using(var db = new MordidaDivinaEntities())
                {
                    var datos = db.RegistrarNuevaContrasenna(usuario.Contrasenna, usuario.NuevaContrasenna, usuario.ConfirmacionContrasenna);
                    if(datos != null)
                    {
                        if(usuario.NuevaContrasenna == usuario.ConfirmacionContrasenna)
                        {
                            respuesta.Codigo = 0;
                            respuesta.Detalle = string.Empty;
                        }
                        else
                        {
                            respuesta.Codigo = 1;
                            respuesta.Detalle = "Contraseñadas ingresadas no coinciden entre si";
                        }
                    }
                    else
                    {
                        respuesta.Codigo = 1;
                        respuesta.Detalle = "El codigo de acceso es incorrecto";
                    }
                }
            }
            catch(Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema";
            }

            return respuesta;
        }

    }
}
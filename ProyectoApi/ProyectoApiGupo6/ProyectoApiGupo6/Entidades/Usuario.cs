using ProyectoApiGupo6.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoApiGupo6.Entidades
{
    public class Usuario
    {
        public Direccion Direccion { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Email { get; set; }
        public string Contrasenna { get; set; }

        public string ConfirmacionContrasenna { get; set; }
        public bool Activo { get; set; }
        public long Id { get; set; }

    }

    public class ConfirmacionUsuario
    {
        public int Codigo { get; set; }
        public String Detalle { get; set; }
        public IniciarSesionUsuario_Result Usuario { get; set; }

        public EncontrarPorCorreo_Result UsuarioEncontrado { get; set; }

        public List<IniciarSesionUsuario_Result> Usuarios { get; set; }

    }

    /*
    public class UsuarioEncontrado
    {
        public int codigo { get; set; }
        public String detalle { get; set; }
       

        public EncontrarPorCorreo_Result usuarioEncontrado { get; set; }

    }
    */
}
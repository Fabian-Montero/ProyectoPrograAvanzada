using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoWebGrupo6.Entidades
{
    public class Usuario
    {
        public int direccionId {get; set;} 

        public Direccion direccion { get; set;}
        public string nombre { get; set; }
        public string apellidos { get; set; }
        public string email { get; set; }
        public string contrasenna { get; set; }

        public string confirmacionContrasenna { get; set; }
        public int activo { get; set; }

    }

    public class Confirmacion 
    { 
        public int Codigo { get; set; }
        public String Detalle { get; set; }
        public Usuario usuario { get; set; }

        public List<Usuario> usuarios { get; set; }
    
    }
}
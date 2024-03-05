using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoWebGrupo6.Entidades
{
    public class Direccion
    {
        public string provincia {  get; set; }
        public string canton { get; set; }
        public string distrito {  get; set; }
        public string direccionExacta { get; set; }
    }
}
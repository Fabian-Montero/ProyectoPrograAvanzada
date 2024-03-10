﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoApiGupo6.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class MordidaDivinaEntities : DbContext
    {
        public MordidaDivinaEntities()
            : base("name=MordidaDivinaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
    
        public virtual ObjectResult<EncontrarPorCorreo_Result> EncontrarPorCorreo(string email)
        {
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EncontrarPorCorreo_Result>("EncontrarPorCorreo", emailParameter);
        }
    
        public virtual ObjectResult<EnvioCodigoAcceso_Result> EnvioCodigoAcceso(string email)
        {
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EnvioCodigoAcceso_Result>("EnvioCodigoAcceso", emailParameter);
        }
    
        public virtual ObjectResult<IniciarSesionUsuario_Result> IniciarSesionUsuario(string email, string contrasenna)
        {
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var contrasennaParameter = contrasenna != null ?
                new ObjectParameter("Contrasenna", contrasenna) :
                new ObjectParameter("Contrasenna", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<IniciarSesionUsuario_Result>("IniciarSesionUsuario", emailParameter, contrasennaParameter);
        }
    
        public virtual int RegistrarDireccion(Nullable<long> usuarioId, string provincia, string canton, string distrito, string direccionExacta)
        {
            var usuarioIdParameter = usuarioId.HasValue ?
                new ObjectParameter("UsuarioId", usuarioId) :
                new ObjectParameter("UsuarioId", typeof(long));
    
            var provinciaParameter = provincia != null ?
                new ObjectParameter("Provincia", provincia) :
                new ObjectParameter("Provincia", typeof(string));
    
            var cantonParameter = canton != null ?
                new ObjectParameter("Canton", canton) :
                new ObjectParameter("Canton", typeof(string));
    
            var distritoParameter = distrito != null ?
                new ObjectParameter("Distrito", distrito) :
                new ObjectParameter("Distrito", typeof(string));
    
            var direccionExactaParameter = direccionExacta != null ?
                new ObjectParameter("DireccionExacta", direccionExacta) :
                new ObjectParameter("DireccionExacta", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RegistrarDireccion", usuarioIdParameter, provinciaParameter, cantonParameter, distritoParameter, direccionExactaParameter);
        }
    
        public virtual ObjectResult<RegistrarNuevaContrasenna_Result> RegistrarNuevaContrasenna(string codigoAcceso, string nuevaContrasenna, string confirmacionContrasenna)
        {
            var codigoAccesoParameter = codigoAcceso != null ?
                new ObjectParameter("CodigoAcceso", codigoAcceso) :
                new ObjectParameter("CodigoAcceso", typeof(string));
    
            var nuevaContrasennaParameter = nuevaContrasenna != null ?
                new ObjectParameter("NuevaContrasenna", nuevaContrasenna) :
                new ObjectParameter("NuevaContrasenna", typeof(string));
    
            var confirmacionContrasennaParameter = confirmacionContrasenna != null ?
                new ObjectParameter("ConfirmacionContrasenna", confirmacionContrasenna) :
                new ObjectParameter("ConfirmacionContrasenna", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RegistrarNuevaContrasenna_Result>("RegistrarNuevaContrasenna", codigoAccesoParameter, nuevaContrasennaParameter, confirmacionContrasennaParameter);
        }
    
        public virtual int RegistrarUsuario(string nombre, string apellidos, string email, string contrasenna)
        {
            var nombreParameter = nombre != null ?
                new ObjectParameter("Nombre", nombre) :
                new ObjectParameter("Nombre", typeof(string));
    
            var apellidosParameter = apellidos != null ?
                new ObjectParameter("Apellidos", apellidos) :
                new ObjectParameter("Apellidos", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var contrasennaParameter = contrasenna != null ?
                new ObjectParameter("Contrasenna", contrasenna) :
                new ObjectParameter("Contrasenna", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RegistrarUsuario", nombreParameter, apellidosParameter, emailParameter, contrasennaParameter);
        }
    }
}
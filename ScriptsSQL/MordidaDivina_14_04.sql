USE [master]
GO
/****** Object:  Database [MordidaDivina]    Script Date: 14/4/2024 15:45:44 ******/
CREATE DATABASE [MordidaDivina]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MordidaDivina', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MordidaDivina.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MordidaDivina_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MordidaDivina_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MordidaDivina] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MordidaDivina].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MordidaDivina] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MordidaDivina] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MordidaDivina] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MordidaDivina] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MordidaDivina] SET ARITHABORT OFF 
GO
ALTER DATABASE [MordidaDivina] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MordidaDivina] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MordidaDivina] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MordidaDivina] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MordidaDivina] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MordidaDivina] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MordidaDivina] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MordidaDivina] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MordidaDivina] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MordidaDivina] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MordidaDivina] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MordidaDivina] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MordidaDivina] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MordidaDivina] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MordidaDivina] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MordidaDivina] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MordidaDivina] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MordidaDivina] SET RECOVERY FULL 
GO
ALTER DATABASE [MordidaDivina] SET  MULTI_USER 
GO
ALTER DATABASE [MordidaDivina] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MordidaDivina] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MordidaDivina] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MordidaDivina] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MordidaDivina] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MordidaDivina] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MordidaDivina', N'ON'
GO
ALTER DATABASE [MordidaDivina] SET QUERY_STORE = ON
GO
ALTER DATABASE [MordidaDivina] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MordidaDivina]
GO
/****** Object:  Table [dbo].[carrito]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carrito](
	[carritoid] [bigint] IDENTITY(1,1) NOT NULL,
	[usuarioid] [bigint] NOT NULL,
	[productoid] [bigint] NOT NULL,
	[fechaCarrito] [datetime] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_carrito] PRIMARY KEY CLUSTERED 
(
	[carritoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detallePedido]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallePedido](
	[pedidoId] [bigint] NOT NULL,
	[productoId] [bigint] NOT NULL,
	[cantidad] [int] NOT NULL,
	[total] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[direcciones]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direcciones](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[usuarioId] [bigint] NOT NULL,
	[provincia] [varchar](255) NOT NULL,
	[canton] [varchar](255) NOT NULL,
	[distrito] [varchar](255) NOT NULL,
	[direccionExacta] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[errores]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[errores](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](255) NOT NULL,
	[descripcion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[usuarioID] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[categoriaId] [bigint] NOT NULL,
	[nombre] [varchar](255) NULL,
	[descripcion] [varchar](255) NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[rutaImagen] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[rolId] [bigint] NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[apellidos] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[contrasenna] [varchar](255) NOT NULL,
	[activo] [bit] NOT NULL,
	[temporal] [bit] NOT NULL,
	[vencimiento] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[carrito] ON 
GO
INSERT [dbo].[carrito] ([carritoid], [usuarioid], [productoid], [fechaCarrito], [cantidad]) VALUES (21, 4, 5, CAST(N'2024-04-14T15:38:14.227' AS DateTime), 3)
GO
SET IDENTITY_INSERT [dbo].[carrito] OFF
GO
SET IDENTITY_INSERT [dbo].[categorias] ON 
GO
INSERT [dbo].[categorias] ([id], [nombre]) VALUES (1, N'Pan dulce')
GO
INSERT [dbo].[categorias] ([id], [nombre]) VALUES (2, N'Pan salado')
GO
INSERT [dbo].[categorias] ([id], [nombre]) VALUES (3, N'Pastelería y repostería')
GO
INSERT [dbo].[categorias] ([id], [nombre]) VALUES (4, N'Galletas')
GO
SET IDENTITY_INSERT [dbo].[categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[direcciones] ON 
GO
INSERT [dbo].[direcciones] ([id], [usuarioId], [provincia], [canton], [distrito], [direccionExacta]) VALUES (2, 2, N'Barrio el Carmen Somarol #2 casa #13', N'Barrio el Carmen Somarol #2 casa #13', N'Barrio el Carmen Somarol #2 casa #13', N'Barrio el Carmen Somarol #2 casa #13')
GO
INSERT [dbo].[direcciones] ([id], [usuarioId], [provincia], [canton], [distrito], [direccionExacta]) VALUES (4, 4, N'San José', N'Aserrí', N'Vuelta De Jorco', N'350 metros norte del banco de Costa Rica')
GO
INSERT [dbo].[direcciones] ([id], [usuarioId], [provincia], [canton], [distrito], [direccionExacta]) VALUES (5, 5, N'Heredia', N'Heredia', N'Mercedes Norte', N'Heredia, Mercedes Norte, Real España')
GO
SET IDENTITY_INSERT [dbo].[direcciones] OFF
GO
SET IDENTITY_INSERT [dbo].[productos] ON 
GO
INSERT [dbo].[productos] ([id], [categoriaId], [nombre], [descripcion], [precio], [rutaImagen]) VALUES (4, 3, N'Pan ', N'Un rico pan ', CAST(12000.00 AS Decimal(10, 2)), N'https://micnqvjrnzhesjgnogsc.supabase.co/storage/v1/object/public/imagenes-producto/producto-4.png?timestamp=638480190627181966')
GO
INSERT [dbo].[productos] ([id], [categoriaId], [nombre], [descripcion], [precio], [rutaImagen]) VALUES (5, 1, N'Pan 2', N'Pan duce ', CAST(3000.00 AS Decimal(10, 2)), N'https://micnqvjrnzhesjgnogsc.supabase.co/storage/v1/object/public/imagenes-producto/producto-5.png?timestamp=638487021865017273')
GO
INSERT [dbo].[productos] ([id], [categoriaId], [nombre], [descripcion], [precio], [rutaImagen]) VALUES (6, 2, N'Pan 3', N'pan salado', CAST(5000.00 AS Decimal(10, 2)), N'https://micnqvjrnzhesjgnogsc.supabase.co/storage/v1/object/public/imagenes-producto/producto-6.png?timestamp=638487022177400670')
GO
INSERT [dbo].[productos] ([id], [categoriaId], [nombre], [descripcion], [precio], [rutaImagen]) VALUES (7, 3, N'Pan 4', N'Pan 4', CAST(7000.00 AS Decimal(10, 2)), N'https://micnqvjrnzhesjgnogsc.supabase.co/storage/v1/object/public/imagenes-producto/producto-7.png?timestamp=638487022807594864')
GO
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 
GO
INSERT [dbo].[roles] ([id], [nombre]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[roles] ([id], [nombre]) VALUES (2, N'Cliente')
GO
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 
GO
INSERT [dbo].[usuarios] ([id], [rolId], [nombre], [apellidos], [email], [contrasenna], [activo], [temporal], [vencimiento]) VALUES (2, 1, N'Fabian', N'Montero Madrigal', N'fabianja0477@gmail.com', N'1234', 1, 0, CAST(N'2024-03-24T21:51:00.937' AS DateTime))
GO
INSERT [dbo].[usuarios] ([id], [rolId], [nombre], [apellidos], [email], [contrasenna], [activo], [temporal], [vencimiento]) VALUES (4, 2, N'Carlos', N'Calderon', N'CharlieCalderon003@gmail.com', N'4567', 1, 0, CAST(N'2024-04-06T16:23:00.000' AS DateTime))
GO
INSERT [dbo].[usuarios] ([id], [rolId], [nombre], [apellidos], [email], [contrasenna], [activo], [temporal], [vencimiento]) VALUES (5, 1, N'Melissa', N'Vargas Gómez', N'mv213845@gmail.com', N'789', 1, 0, CAST(N'2024-04-06T19:50:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuarios__AB6E6164D1923CB0]    Script Date: 14/4/2024 15:45:45 ******/
ALTER TABLE [dbo].[usuarios] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[carrito]  WITH CHECK ADD  CONSTRAINT [FK_ProductoCarrito] FOREIGN KEY([productoid])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[carrito] CHECK CONSTRAINT [FK_ProductoCarrito]
GO
ALTER TABLE [dbo].[carrito]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioCarrito] FOREIGN KEY([usuarioid])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[carrito] CHECK CONSTRAINT [FK_UsuarioCarrito]
GO
ALTER TABLE [dbo].[detallePedido]  WITH CHECK ADD  CONSTRAINT [FK_PedidoId] FOREIGN KEY([pedidoId])
REFERENCES [dbo].[pedido] ([id])
GO
ALTER TABLE [dbo].[detallePedido] CHECK CONSTRAINT [FK_PedidoId]
GO
ALTER TABLE [dbo].[detallePedido]  WITH CHECK ADD  CONSTRAINT [FK_ProductoIdPedido] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[detallePedido] CHECK CONSTRAINT [FK_ProductoIdPedido]
GO
ALTER TABLE [dbo].[direcciones]  WITH CHECK ADD  CONSTRAINT [FK_DireccionUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[direcciones] CHECK CONSTRAINT [FK_DireccionUsuario]
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD  CONSTRAINT [FK_PedidoUsuario] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[pedido] CHECK CONSTRAINT [FK_PedidoUsuario]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaProducto] FOREIGN KEY([categoriaId])
REFERENCES [dbo].[categorias] ([id])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [FK_CategoriaProducto]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_RolUsuario] FOREIGN KEY([rolId])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_RolUsuario]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarCategoria]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarCategoria]
	@Id	BIGINT,
	@Nombre	VARCHAR(255)
AS
BEGIN

	UPDATE	categorias
	SET		nombre = @Nombre
	
	WHERE	id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarDireccionMantenimiento]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarDireccionMantenimiento]
  @Id  BIGINT,
  @Provincia VARCHAR(255),
  @Canton VARCHAR(255),
  @Distrito VARCHAR(255),
  @DireccionExacta VARCHAR(255)
AS
BEGIN
 
  UPDATE  direcciones
  SET    provincia = @Provincia,
      canton = @Canton,
      distrito = @Distrito,
      direccionExacta = @DireccionExacta
  WHERE  usuarioid = @Id
 
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarImagenProducto]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarImagenProducto]
	@ProductoId	BIGINT,
	@RutaImagen		VARCHAR(200)
AS
BEGIN

	UPDATE productos
	SET rutaImagen = @RutaImagen
	WHERE id = @ProductoId

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ActualizarProducto]
	@ProductoId	BIGINT,
	@CategoriaId	BIGINT,
	@NombreProducto	VARCHAR(255),
	@Descripcion VARCHAR(255),
	@Precio DECIMAL(10,2)
AS
BEGIN

	UPDATE	productos
	SET		categoriaId = @CategoriaId,
			nombre = @NombreProducto,
			descripcion = @Descripcion,
			precio = @Precio
	WHERE	id = @ProductoId

END

GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuarioMantenimiento]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarUsuarioMantenimiento]
	@Id	BIGINT,
	@rolId	BIGINT,
	@Nombre	VARCHAR(255),
	@Apellidos VARCHAR(255),
	@Email VARCHAR(255),
	@Activo BIT,
	@Temporal  BIT,
	@Vencimiento DATETIME
AS
BEGIN

	UPDATE	usuarios
	SET		rolId = @rolId,
			nombre = @Nombre,
			apellidos = @Apellidos,
			email = @Email,
			activo = @Activo,
			temporal = @Temporal,
			vencimiento = @Vencimiento
	
	WHERE	id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[AgregarCarrito]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AgregarCarrito]
	@usuarioid BIGINT,
	@productoid BIGINT,
	@cantidad INT
AS
BEGIN
	IF NOT EXISTS( SELECT * FROM carrito
					WHERE usuarioid = @usuarioid
					AND productoid = @productoid)
	BEGIN
		INSERT INTO carrito(usuarioid,productoid,fechaCarrito,cantidad)
		VALUES(@usuarioid,@productoid,GETDATE(),@cantidad)
	END
	ELSE
	BEGIN
		UPDATE carrito
		SET fechaCarrito = GETDATE(),
			cantidad = @cantidad,
			usuarioid = @usuarioid,
			productoid = @productoid
		WHERE usuarioid = @usuarioid 
		AND	productoid = @productoid
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCarrito]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarCarrito]
	@usuarioid BIGINT
AS
BEGIN
	SELECT 
	carritoid,
	usuarioid,
	productoid,
	fechaCarrito,
	cantidad, 
	precio,
	cantidad * precio 'SubTotal',
	(Cantidad * Precio) * 0.13 'Impuesto',
	(Cantidad * Precio) + (Cantidad * Precio) * 0.13 'Total',
	Nombre
	FROM carrito C
	INNER JOIN productos P ON C.productoid = P.id
	WHERE usuarioid = @usuarioid
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCategoria]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarCategoria]
	@id BIGINT
AS
BEGIN
 
	SELECT	id as 'CategoriaId',nombre as 'NombreCategoria'
	FROM	categorias
	WHERE	id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProducto]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarProducto]
	@ProductoId BIGINT
AS
BEGIN
	SELECT P.id AS 'ProductoId' , categoriaId, P.nombre as 'NombreProducto', descripcion, precio, C.nombre as 'NombreCategoria', rutaImagen
	FROM productos P
	INNER JOIN categorias C
	ON P.categoriaId = C.id
	WHERE	P.id = @ProductoId
END

GO
/****** Object:  StoredProcedure [dbo].[ConsultarProductos]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarProductos]
AS
BEGIN
	
	SELECT P.id AS 'ProductoId' , categoriaId, P.nombre as 'NombreProducto', descripcion, precio, C.nombre as 'NombreCategoria', rutaImagen
	FROM productos P
	INNER JOIN categorias C
	ON P.categoriaId = C.id
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTiposCategoria]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarTiposCategoria]

AS
BEGIN

	SELECT	id as 'categoriaId', nombre as 'NombreCategoria'
	FROM	categorias

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTiposRoles]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarTiposRoles]

AS
BEGIN

	SELECT	id as 'RolId', nombre as 'NombreRol'
	FROM	roles

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[ConsultarUsuario]
	@id BIGINT
AS
BEGIN
 
	SELECT	id ,nombre ,apellidos,email,activo,temporal,vencimiento
	FROM	usuarios 
	WHERE	id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarioMantenimiento]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarUsuarioMantenimiento]
	@UsuarioId BIGINT
AS
	BEGIN
		SELECT U.id ,U.rolId ,U.nombre ,U.apellidos ,U.email ,U.activo, U.temporal, U.vencimiento, R.nombre as 'NombreRol',D.provincia, D.canton, D.distrito, D.direccionExacta
		FROM usuarios U
		INNER JOIN roles R
		ON U.rolId = R.id
		INNER JOIN direcciones D
		ON D.usuarioId = U.id
		WHERE U.id = @UsuarioId
		
	END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarUsuarios]
	
AS
	BEGIN
		SELECT U.id ,U.rolId ,U.nombre ,U.apellidos ,U.email,U.activo, U.temporal, U.vencimiento, R.nombre as 'NombreRol'
		FROM usuarios U
		INNER JOIN roles R
		ON U.rolId = R.id
		
	END
GO
/****** Object:  StoredProcedure [dbo].[EliminarCarrito]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[EliminarCarrito]
	@carritoid BIGINT
AS
BEGIN
	DELETE FROM carrito
	WHERE carritoid  = @carritoid 
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarCategoria]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarCategoria]
	@CategoriaId	BIGINT
AS
BEGIN

	DELETE 
	from categorias
	WHERE id = @CategoriaId

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarProducto]
	@ProductoId	BIGINT
AS
BEGIN

	DELETE 
	from productos
	WHERE id = @ProductoId

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuarioMantenimiento]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarUsuarioMantenimiento]
	@UsuarioId BIGINT
	AS
	BEGIN 
		DELETE FROM direcciones
			WHERE usuarioId = @UsuarioId
		DELETE FROM usuarios
			  WHERE Id = @UsuarioId
	END
GO
/****** Object:  StoredProcedure [dbo].[EncontrarPorCorreo]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EncontrarPorCorreo]
	@Email 		varchar(200)

AS
BEGIN
	SELECT id ,rolId ,nombre ,apellidos ,email ,contrasenna ,activo
	FROM usuarios
	WHERE email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[EnvioCodigoAcceso]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[EnvioCodigoAcceso]
	@email varchar(255)
AS
BEGIN
	DECLARE @id BIGINT
		SELECT @id = id 
		FROM dbo.usuarios WHERE email = @email And activo = 1

		IF @id IS NOT NULL
		BEGIN 
			UPDATE dbo.usuarios
			set contrasenna = LEFT(NEWID(),8),
			temporal = 1,
			vencimiento = DATEADD(MINUTE,30,GETDATE())
			WHERE id = @id
		END

	SELECT id,rolId,nombre,apellidos,email,contrasenna,activo,temporal,vencimiento
	From dbo.usuarios
	WHERE id  = @id
END	
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesionUsuario]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IniciarSesionUsuario]
	@Email 		varchar(200),
    @Contrasenna		varchar(200)

AS
BEGIN
	SELECT U.id ,U.rolId ,U.nombre ,U.apellidos ,U.email ,U.contrasenna ,U.activo, U.temporal, U.vencimiento, R.nombre as 'NombreRol'
	FROM usuarios U
	INNER JOIN roles R
	ON U.rolId = R.id
	WHERE contrasenna = @Contrasenna
		AND email = @Email
		AND activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarUsuario]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarUsuario]
	@id BIGINT,
	@contrasenna VARCHAR(255),
	@nombre VARCHAR(255),
	@apellidos VARCHAR(255),
	@email	VARCHAR(255)
AS
BEGIN
	UPDATE dbo.usuarios
	   SET contrasenna = (CASE WHEN @contrasenna IS NULL THEN contrasenna ELSE @contrasenna END),
		   nombre = @nombre,
		   apellidos = @apellidos,
		   email = @email
	 WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCategoria]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarCategoria]
	@NombreCategoria VARCHAR(255)
AS
BEGIN

	IF NOT EXISTS(SELECT 1 FROM categorias WHERE nombre = @NombreCategoria)
	BEGIN

		INSERT INTO categorias(nombre)
		VALUES (@NombreCategoria)

		SELECT CONVERT(BIGINT,@@IDENTITY) idCategoria

	END
	ELSE
	BEGIN
		SELECT CONVERT(BIGINT,-1) idCategoria
	END

END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarDireccion]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarDireccion]
	@UsuarioId 		bigint,
    @Provincia		varchar(200),
    @Canton				varchar(200),
    @Distrito	varchar(200) ,
	@DireccionExacta varchar(200)
AS
BEGIN

	INSERT INTO direcciones(usuarioId,provincia,canton,distrito, direccionExacta)
	VALUES (@UsuarioId,@Provincia,@Canton,@Distrito,@DireccionExacta)
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarNuevaContrasenna]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RegistrarNuevaContrasenna]
	@CodigoAcceso varchar(255),
	@NuevaContrasenna varchar(255),
	@ConfirmacionContrasenna varchar(255)
AS
BEGIN
	DECLARE @id BIGINT
		SELECT @id = id 
		FROM dbo.usuarios 
		WHERE contrasenna = @CodigoAcceso And activo = 1

	DECLARE @codigo varchar(255)
		SELECT  @codigo = contrasenna 
		FROM dbo.usuarios 
		WHERE id = @id 
		AND temporal = 1 
		AND activo = 1

	IF (@CodigoAcceso = @codigo AND @NuevaContrasenna = @ConfirmacionContrasenna)
	BEGIN
		UPDATE dbo.usuarios
			set contrasenna = @ConfirmacionContrasenna,
			temporal = 0,
			vencimiento = GETDATE()
			WHERE id = @id
	END

	SELECT id,rolId,nombre,apellidos,email,contrasenna,activo,temporal,vencimiento
	From dbo.usuarios
	WHERE id  = @id
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarProducto]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarProducto]
	@CategoriaId 	bigint,
	@NombreProducto			VARCHAR(255),
	@Descripcion			VARCHAR(255),
	@Precio decimal(10,2)  
AS
BEGIN

	IF NOT EXISTS(SELECT 1 FROM productos WHERE nombre = @NombreProducto)
	BEGIN

		INSERT INTO productos(categoriaId,nombre,descripcion,precio)
		VALUES (@CategoriaId, @NombreProducto,@Descripcion, @Precio)

		SELECT CONVERT(BIGINT,@@IDENTITY) idProducto

	END
	ELSE
	BEGIN
		SELECT CONVERT(BIGINT,-1) idProducto
	END

END

GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 14/4/2024 15:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarUsuario]
	@Nombre		varchar(200),
    @Apellidos		varchar(200),
    @Email				varchar(200),
    @Contrasenna	varchar(200)    
AS
BEGIN

	IF NOT EXISTS(SELECT 1 FROM usuarios WHERE email = @Email)
	BEGIN

		INSERT INTO usuarios(rolId,nombre,apellidos,email,contrasenna,activo,temporal,vencimiento)
		VALUES (2,@Nombre,@Apellidos,@Email,@Contrasenna,1,0,GETDATE())
	END

END
GO
USE [master]
GO
ALTER DATABASE [MordidaDivina] SET  READ_WRITE 
GO
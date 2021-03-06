USE [master]
GO
/****** Object:  Database [SeguimientoEgresados]    Script Date: 10/09/2014 01:43:02 a.m. ******/
CREATE DATABASE [SeguimientoEgresados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SeguimientoEgresados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\SeguimientoEgresados.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SeguimientoEgresados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\SeguimientoEgresados_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SeguimientoEgresados] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SeguimientoEgresados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SeguimientoEgresados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET ARITHABORT OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SeguimientoEgresados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SeguimientoEgresados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SeguimientoEgresados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SeguimientoEgresados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SeguimientoEgresados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET RECOVERY FULL 
GO
ALTER DATABASE [SeguimientoEgresados] SET  MULTI_USER 
GO
ALTER DATABASE [SeguimientoEgresados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SeguimientoEgresados] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SeguimientoEgresados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SeguimientoEgresados] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SeguimientoEgresados]
GO
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarEgresado]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Create date: 28/08/2014
-- Description:	SP para actualizar a un egresado por su codigo
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_actualizarEgresado]
	@idegresado int,
	@nombrecompletoegresado varchar(100),
	@edadegresado tinyint,
	@sexoegresado char(1),
	@telefonoprinegresado varchar(9),
	@telefonoaltegresado varchar(9),
	@dniegresado varchar(8),
	@correoegresado varchar(50),
	@correoaltegresado varchar(50),
	@direccionegresado varchar(100),
	@distritoegresado varchar(50),
	@departamentoegresado varchar(50),
	@perfillinkedinegresado varchar(50),
	@perfilfacebookegresado varchar(50),
	@fechanacimientoegresado date,
	@tipoegresado char(1),
	@fotoegresado varchar(1000)
AS
BEGIN
	SET NOCOUNT OFF;
  
	UPDATE
      Egresado
	SET
		NombreCompleto = @nombrecompletoegresado,
		Edad = @edadegresado,
		Sexo = @sexoegresado,
		TelefonoPrincipal = @telefonoprinegresado,
		TelefonoAlternativo = @telefonoaltegresado,
		DNI = @dniegresado,
		Correo = @correoegresado,
		CorreoAlternativo = @correoaltegresado,
		Direccion = @direccionegresado,
		Distrito = @distritoegresado,
		Departamento = @departamentoegresado,
		PerfilLinkedIn = @perfillinkedinegresado,
		PerfilFacebook = @perfilfacebookegresado,
		FechaNacimiento = @fechanacimientoegresado,
		TipoEgresado = @tipoegresado,
		Foto = @fotoegresado

	WHERE
		EgregadoID = @idegresado
END



GO
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarHistorialDatosEgresado]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Create date: 01/09/2014
-- Description:	SP para insertar un nuevo historial de datos del egresado
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_insertarHistorialDatosEgresado]
	@egresadoid int,
	@campoactualizado varchar(30),
	@valornuevo varchar(500),
	@fechaactualizacion datetime,
	@origen char(1)
AS
BEGIN
	INSERT INTO
		HistorialDatosEgresado(EgresadoID,CampoActualizado,ValorNuevo,FechaActualizacion,Origen)
	VALUES
		(@egresadoid,@campoactualizado,@valornuevo,@fechaactualizacion,@origen)
	RETURN
		@@IDENTITY
END


GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresado]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Create date: 28/08/2014
-- Description:	SP para obtener un egresado mediante su id
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_obtenerEgresado]
	@idegresado int
AS
BEGIN
	SELECT 
		EgregadoID, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(Edad,'') AS Edad, ISNULL(Sexo,'') AS Sexo,
		ISNULL(TelefonoPrincipal,'') AS TelefonoPrincipal, ISNULL(TelefonoAlternativo,'') AS TelefonoAlternativo,
		ISNULL(DNI,'') AS DNI, ISNULL(Correo,'') AS Correo,ISNULL(CorreoAlternativo,'') AS CorreoAlternativo, 
		ISNULL(Direccion,'') AS Direccion, ISNULL(Distrito,'') AS Distrito, ISNULL(Departamento,'') AS Departamento, 
		ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(Foto,'') AS Foto
	FROM
		Egresado
	WHERE
		EgregadoID = @idegresado;
END



GO
/****** Object:  Table [dbo].[Aptitud]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Aptitud](
	[AptitudID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Aptitud] PRIMARY KEY CLUSTERED 
(
	[AptitudID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AptitudxEgresado]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AptitudxEgresado](
	[EgresadoID] [int] NULL,
	[AptitudID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Egresado]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Egresado](
	[EgresadoID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](100) NULL,
	[Edad] [tinyint] NULL,
	[Sexo] [char](1) NULL,
	[TelefonoPrincipal] [varchar](9) NULL,
	[TelefonoAlternativo] [varchar](9) NULL,
	[DNI] [varchar](8) NULL,
	[Correo] [varchar](50) NULL,
	[CorreoAlternativo] [varchar](50) NULL,
	[Direccion] [varchar](100) NULL,
	[Distrito] [varchar](50) NULL,
	[Departamento] [varchar](50) NULL,
	[PerfilLinkedIn] [varchar](50) NULL,
	[PerfilFacebook] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[TipoEgresado] [char](1) NULL,
	[Foto] [varchar](1000) NULL,
 CONSTRAINT [PK_Egresado] PRIMARY KEY CLUSTERED 
(
	[EgresadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EgresadoDesvinculado]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EgresadoDesvinculado](
	[CodigoUniversitario] [varchar](10) NOT NULL,
	[NombreCompleto] [varchar](100) NULL,
 CONSTRAINT [PK_EgresadoDesvinculado] PRIMARY KEY CLUSTERED 
(
	[CodigoUniversitario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EgresadoDetalle]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EgresadoDetalle](
	[EgresadoID] [int] NULL,
	[CicloEgreso] [varchar](10) NULL,
	[TieneTrabajo] [bit] NULL,
	[CodigoUniversitario] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistorialDatosEgresado]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistorialDatosEgresado](
	[ActualizacionID] [int] IDENTITY(1,1) NOT NULL,
	[EgresadoID] [int] NULL,
	[CampoActualizado] [varchar](30) NULL,
	[ValorNuevo] [varchar](500) NULL,
	[FechaActualizacion] [datetime] NULL,
	[Origen] [char](1) NULL,
 CONSTRAINT [PK_HistorialDatosEgresado] PRIMARY KEY CLUSTERED 
(
	[ActualizacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Interes]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Interes](
	[InteresesID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Intereses] PRIMARY KEY CLUSTERED 
(
	[InteresesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InteresxEgresado]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InteresxEgresado](
	[EgresadoID] [int] NULL,
	[InteresesID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegistroAcademico]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegistroAcademico](
	[RegistroAcademicoID] [int] IDENTITY(1,1) NOT NULL,
	[EgresadoID] [int] NULL,
	[NombreInstitucion] [varchar](100) NULL,
	[Nombre] [varchar](50) NULL,
	[Duracion] [varchar](30) NULL,
	[Descripcion] [varchar](500) NULL,
	[TipoEstudio] [varchar](100) NULL,
 CONSTRAINT [PK_RegistroAcademico] PRIMARY KEY CLUSTERED 
(
	[RegistroAcademicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistroLaboral]    Script Date: 10/09/2014 01:43:02 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegistroLaboral](
	[RegistroLaboralID] [int] IDENTITY(1,1) NOT NULL,
	[EgresadoID] [int] NULL,
	[NombreTrabajo] [varchar](100) NULL,
	[Cargo] [varchar](50) NULL,
	[Duracion] [varchar](50) NULL,
	[Descripcion] [varchar](500) NULL,
 CONSTRAINT [PK_RegistroLaboral] PRIMARY KEY CLUSTERED 
(
	[RegistroLaboralID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Egresado] ON 

INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (1, N'Luis Lopez', 20, N'M', N'012234567', N'987654321', N'45780324', N'luis@gmail.com', N'luis@hotmail.com', N'Av. Callejones rojos 450', N'San Isidro', N'Lima', N'https://pe.linkedin.com/luislopez', N'luislopez@facebook.com', CAST(0x221C0B00 AS Date), N'G', N'')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (2, N'Carlos Castañeda', 25, N'M', N'015502323', N'97513153', N'78342105', N'carlosc@gmail.com', NULL, NULL, NULL, N'Lima', NULL, NULL, CAST(0xA5140B00 AS Date), N'E', NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (3, N'Jose Arellano', 23, N'M', NULL, NULL, NULL, NULL, N'jose@gmail.com', N'Av. Los barracones 330', N'San borja', NULL, NULL, NULL, CAST(0x39180B00 AS Date), N'E', NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (4, N'Lucia Paredes', 26, N'F', N'012504647', N'94693728', N'56205087', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0xAB130B00 AS Date), N'E', NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (5, N'Maria Gonzales', 22, N'F', NULL, NULL, NULL, N'maria@gmail.com', NULL, N'Av. Rocas 550', NULL, N'Lima', NULL, NULL, CAST(0xF9180B00 AS Date), N'G', NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (6, N'Natalie Mendoza', NULL, N'F', N'013506789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x811D0B00 AS Date), N'G', NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (7, N'Jesus Rodriguez', NULL, N'M', NULL, N'96345098', NULL, NULL, N'jesus@gmail.com', NULL, N'Jesus Maria', N'Lima', NULL, NULL, CAST(0x2D130B00 AS Date), N'E', NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (8, N'Patricia Berdejo', NULL, N'F', NULL, NULL, NULL, N'paty@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x3A160B00 AS Date), N'E', NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (9, N'a', 12, N'F', N'123456789', N'987654321', N'15478542', N'w', N'w', N'w', N'w', N'La Libertad', N'w', N'j', CAST(0x5B950A00 AS Date), N'G', N'')
SET IDENTITY_INSERT [dbo].[Egresado] OFF
SET IDENTITY_INSERT [dbo].[HistorialDatosEgresado] ON 

INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (1, 1, N'q', N'q', NULL, N'q')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (2, 9, N'PerfilFacebook', N'j', CAST(0x0000A39900408EB3 AS DateTime), N'P')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (3, 1, N'TelefonoPrincipal', N'012234567', CAST(0x0000A3A0001F9A08 AS DateTime), N'U')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (4, 1, N'PerfilLinkedIn', N'https://pe.linkedin.com/luislopez', CAST(0x0000A3A0001F9A2A AS DateTime), N'U')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (5, 1, N'PerfilFacebook', N'luislopez@facebook.com', CAST(0x0000A3A0001F9A2C AS DateTime), N'U')
SET IDENTITY_INSERT [dbo].[HistorialDatosEgresado] OFF
ALTER TABLE [dbo].[AptitudxEgresado]  WITH CHECK ADD  CONSTRAINT [FK_AptitudxEgresado_Aptitud] FOREIGN KEY([AptitudID])
REFERENCES [dbo].[Aptitud] ([AptitudID])
GO
ALTER TABLE [dbo].[AptitudxEgresado] CHECK CONSTRAINT [FK_AptitudxEgresado_Aptitud]
GO
ALTER TABLE [dbo].[AptitudxEgresado]  WITH CHECK ADD  CONSTRAINT [FK_AptitudxEgresado_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgresadoID])
GO
ALTER TABLE [dbo].[AptitudxEgresado] CHECK CONSTRAINT [FK_AptitudxEgresado_Egresado]
GO
ALTER TABLE [dbo].[EgresadoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_EgresadoDetalle_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgresadoID])
GO
ALTER TABLE [dbo].[EgresadoDetalle] CHECK CONSTRAINT [FK_EgresadoDetalle_Egresado]
GO
ALTER TABLE [dbo].[InteresxEgresado]  WITH CHECK ADD  CONSTRAINT [FK_InteresxEgresado_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgresadoID])
GO
ALTER TABLE [dbo].[InteresxEgresado] CHECK CONSTRAINT [FK_InteresxEgresado_Egresado]
GO
ALTER TABLE [dbo].[InteresxEgresado]  WITH CHECK ADD  CONSTRAINT [FK_InteresxEgresado_Interes] FOREIGN KEY([InteresesID])
REFERENCES [dbo].[Interes] ([InteresesID])
GO
ALTER TABLE [dbo].[InteresxEgresado] CHECK CONSTRAINT [FK_InteresxEgresado_Interes]
GO
ALTER TABLE [dbo].[RegistroAcademico]  WITH CHECK ADD  CONSTRAINT [FK_RegistroAcademico_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgresadoID])
GO
ALTER TABLE [dbo].[RegistroAcademico] CHECK CONSTRAINT [FK_RegistroAcademico_Egresado]
GO
ALTER TABLE [dbo].[RegistroLaboral]  WITH CHECK ADD  CONSTRAINT [FK_RegistroLaboral_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgresadoID])
GO
ALTER TABLE [dbo].[RegistroLaboral] CHECK CONSTRAINT [FK_RegistroLaboral_Egresado]
GO
USE [master]
GO
ALTER DATABASE [SeguimientoEgresados] SET  READ_WRITE 
GO

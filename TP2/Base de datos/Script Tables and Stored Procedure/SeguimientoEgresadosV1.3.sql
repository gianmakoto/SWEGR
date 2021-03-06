USE [master]
GO
/****** Object:  Database [SeguimientoEgresados]    Script Date: 14/09/2014 03:29:17 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarEgresado]    Script Date: 14/09/2014 03:29:17 a.m. ******/
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
		EgresadoID = @idegresado
END





GO
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarHistorialDatosEgresado]    Script Date: 14/09/2014 03:29:17 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresado]    Script Date: 14/09/2014 03:29:17 a.m. ******/
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
		EgresadoID, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(Edad,'') AS Edad, ISNULL(Sexo,'') AS Sexo,
		ISNULL(TelefonoPrincipal,'') AS TelefonoPrincipal, ISNULL(TelefonoAlternativo,'') AS TelefonoAlternativo,
		ISNULL(DNI,'') AS DNI, ISNULL(Correo,'') AS Correo,ISNULL(CorreoAlternativo,'') AS CorreoAlternativo, 
		ISNULL(Direccion,'') AS Direccion, ISNULL(Distrito,'') AS Distrito, ISNULL(Departamento,'') AS Departamento, 
		ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(Foto,'') AS Foto
	FROM
		Egresado
	WHERE
		EgresadoID = @idegresado;
END





GO
/****** Object:  Table [dbo].[Aptitud]    Script Date: 14/09/2014 03:29:17 a.m. ******/
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
/****** Object:  Table [dbo].[AptitudxEgresado]    Script Date: 14/09/2014 03:29:17 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AptitudxEgresado](
	[EgresadoID] [int] NULL,
	[AptitudID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Egresado]    Script Date: 14/09/2014 03:29:17 a.m. ******/
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
	[TelefonoPrincipal] [varchar](15) NULL,
	[TelefonoAlternativo] [varchar](15) NULL,
	[DNI] [varchar](8) NULL,
	[Correo] [varchar](50) NULL,
	[CorreoAlternativo] [varchar](50) NULL,
	[Direccion] [varchar](100) NULL,
	[Distrito] [varchar](50) NULL,
	[Departamento] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[PerfilLinkedIn] [varchar](50) NULL,
	[PerfilFacebook] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[TipoEgresado] [char](1) NULL,
	[Foto] [varchar](1000) NULL,
	[Contrasena] [varchar](50) NULL,
 CONSTRAINT [PK_Egresado] PRIMARY KEY CLUSTERED 
(
	[EgresadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EgresadoDesvinculado]    Script Date: 14/09/2014 03:29:17 a.m. ******/
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
/****** Object:  Table [dbo].[EgresadoDetalle]    Script Date: 14/09/2014 03:29:17 a.m. ******/
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
/****** Object:  Table [dbo].[HistorialDatosEgresado]    Script Date: 14/09/2014 03:29:17 a.m. ******/
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
/****** Object:  Table [dbo].[Interes]    Script Date: 14/09/2014 03:29:17 a.m. ******/
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
/****** Object:  Table [dbo].[InteresxEgresado]    Script Date: 14/09/2014 03:29:17 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InteresxEgresado](
	[EgresadoID] [int] NULL,
	[InteresesID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegistroAcademico]    Script Date: 14/09/2014 03:29:17 a.m. ******/
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
/****** Object:  Table [dbo].[RegistroLaboral]    Script Date: 14/09/2014 03:29:17 a.m. ******/
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
	[NombreJefe] [varchar](50) NULL,
	[JefeCargo] [varchar](50) NULL,
	[TelefonoContacto] [varchar](15) NULL,
	[CorreoJefe] [varchar](50) NULL,
 CONSTRAINT [PK_RegistroLaboral] PRIMARY KEY CLUSTERED 
(
	[RegistroLaboralID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
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

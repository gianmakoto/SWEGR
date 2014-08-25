USE [SeguimientoEgresados]
GO
/****** Object:  Table [dbo].[Aptitud]    Script Date: 08/24/2014 22:46:12 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EgresadoDesvinculado]    Script Date: 08/24/2014 22:46:13 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Egresado]    Script Date: 08/24/2014 22:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Egresado](
	[EgregadoID] [int] IDENTITY(1,1) NOT NULL,
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
	[EgregadoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Interes]    Script Date: 08/24/2014 22:46:13 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 08/24/2014 22:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[TipoUsuarioID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[TipoUsuarioID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoEstudio]    Script Date: 08/24/2014 22:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoEstudio](
	[TipoEstudioID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_TipoEstudio] PRIMARY KEY CLUSTERED 
(
	[TipoEstudioID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistroLaboral]    Script Date: 08/24/2014 22:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegistroLaboral](
	[RegistroLaboralID] [int] IDENTITY(1,1) NOT NULL,
	[EgregadoID] [int] NULL,
	[NombreTrabajo] [varchar](50) NULL,
	[Cargo] [varchar](30) NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[Descripcion] [varchar](500) NULL,
 CONSTRAINT [PK_RegistroLaboral] PRIMARY KEY CLUSTERED 
(
	[RegistroLaboralID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistroAcademico]    Script Date: 08/24/2014 22:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegistroAcademico](
	[RegistroAcademicoID] [int] IDENTITY(1,1) NOT NULL,
	[EgregadoID] [int] NULL,
	[NombreInstitucion] [varchar](50) NULL,
	[TipoEstudioID] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[Descripcion] [varchar](500) NULL,
 CONSTRAINT [PK_RegistroAcademico] PRIMARY KEY CLUSTERED 
(
	[RegistroAcademicoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InteresxEgresado]    Script Date: 08/24/2014 22:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InteresxEgresado](
	[EgresadoID] [int] NULL,
	[InteresesID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialDatosEgresado]    Script Date: 08/24/2014 22:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistorialDatosEgresado](
	[ActualizacionID] [int] NOT NULL,
	[EgresadoID] [int] NULL,
	[CampoActualizado] [varchar](30) NULL,
	[ValorNuevo] [varchar](500) NULL,
	[FechaActualizacion] [datetime] NULL,
	[Origen] [char](1) NULL,
 CONSTRAINT [PK_HistorialDatosEgresado] PRIMARY KEY CLUSTERED 
(
	[ActualizacionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EgresadoDetalle]    Script Date: 08/24/2014 22:46:13 ******/
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
	[CodigoUniversitario] [varchar](10) NULL,
	[Contrasena] [varchar](50) NULL,
	[CodigoEgresado] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AptitudxEgresado]    Script Date: 08/24/2014 22:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AptitudxEgresado](
	[EgresadoID] [int] NULL,
	[AptitudID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_AptitudxEgresado_Aptitud]    Script Date: 08/24/2014 22:46:13 ******/
ALTER TABLE [dbo].[AptitudxEgresado]  WITH CHECK ADD  CONSTRAINT [FK_AptitudxEgresado_Aptitud] FOREIGN KEY([AptitudID])
REFERENCES [dbo].[Aptitud] ([AptitudID])
GO
ALTER TABLE [dbo].[AptitudxEgresado] CHECK CONSTRAINT [FK_AptitudxEgresado_Aptitud]
GO
/****** Object:  ForeignKey [FK_AptitudxEgresado_Egresado]    Script Date: 08/24/2014 22:46:13 ******/
ALTER TABLE [dbo].[AptitudxEgresado]  WITH CHECK ADD  CONSTRAINT [FK_AptitudxEgresado_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgregadoID])
GO
ALTER TABLE [dbo].[AptitudxEgresado] CHECK CONSTRAINT [FK_AptitudxEgresado_Egresado]
GO
/****** Object:  ForeignKey [FK_EgresadoDetalle_Egresado]    Script Date: 08/24/2014 22:46:13 ******/
ALTER TABLE [dbo].[EgresadoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_EgresadoDetalle_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgregadoID])
GO
ALTER TABLE [dbo].[EgresadoDetalle] CHECK CONSTRAINT [FK_EgresadoDetalle_Egresado]
GO
/****** Object:  ForeignKey [FK_HistorialDatosEgresado_Egresado]    Script Date: 08/24/2014 22:46:13 ******/
ALTER TABLE [dbo].[HistorialDatosEgresado]  WITH CHECK ADD  CONSTRAINT [FK_HistorialDatosEgresado_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgregadoID])
GO
ALTER TABLE [dbo].[HistorialDatosEgresado] CHECK CONSTRAINT [FK_HistorialDatosEgresado_Egresado]
GO
/****** Object:  ForeignKey [FK_InteresxEgresado_Egresado]    Script Date: 08/24/2014 22:46:13 ******/
ALTER TABLE [dbo].[InteresxEgresado]  WITH CHECK ADD  CONSTRAINT [FK_InteresxEgresado_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgregadoID])
GO
ALTER TABLE [dbo].[InteresxEgresado] CHECK CONSTRAINT [FK_InteresxEgresado_Egresado]
GO
/****** Object:  ForeignKey [FK_InteresxEgresado_Interes]    Script Date: 08/24/2014 22:46:13 ******/
ALTER TABLE [dbo].[InteresxEgresado]  WITH CHECK ADD  CONSTRAINT [FK_InteresxEgresado_Interes] FOREIGN KEY([InteresesID])
REFERENCES [dbo].[Interes] ([InteresesID])
GO
ALTER TABLE [dbo].[InteresxEgresado] CHECK CONSTRAINT [FK_InteresxEgresado_Interes]
GO
/****** Object:  ForeignKey [FK_RegistroAcademico_Egresado]    Script Date: 08/24/2014 22:46:13 ******/
ALTER TABLE [dbo].[RegistroAcademico]  WITH CHECK ADD  CONSTRAINT [FK_RegistroAcademico_Egresado] FOREIGN KEY([EgregadoID])
REFERENCES [dbo].[Egresado] ([EgregadoID])
GO
ALTER TABLE [dbo].[RegistroAcademico] CHECK CONSTRAINT [FK_RegistroAcademico_Egresado]
GO
/****** Object:  ForeignKey [FK_RegistroAcademico_TipoEstudio]    Script Date: 08/24/2014 22:46:13 ******/
ALTER TABLE [dbo].[RegistroAcademico]  WITH CHECK ADD  CONSTRAINT [FK_RegistroAcademico_TipoEstudio] FOREIGN KEY([TipoEstudioID])
REFERENCES [dbo].[TipoEstudio] ([TipoEstudioID])
GO
ALTER TABLE [dbo].[RegistroAcademico] CHECK CONSTRAINT [FK_RegistroAcademico_TipoEstudio]
GO
/****** Object:  ForeignKey [FK_RegistroLaboral_Egresado]    Script Date: 08/24/2014 22:46:13 ******/
ALTER TABLE [dbo].[RegistroLaboral]  WITH CHECK ADD  CONSTRAINT [FK_RegistroLaboral_Egresado] FOREIGN KEY([EgregadoID])
REFERENCES [dbo].[Egresado] ([EgregadoID])
GO
ALTER TABLE [dbo].[RegistroLaboral] CHECK CONSTRAINT [FK_RegistroLaboral_Egresado]
GO

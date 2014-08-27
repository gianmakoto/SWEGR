USE [SeguimientoEgresados]
GO
/****** Object:  Table [dbo].[Aptitud]    Script Date: 27/08/2014 11:27:46 p.m. ******/
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
/****** Object:  Table [dbo].[AptitudxEgresado]    Script Date: 27/08/2014 11:27:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AptitudxEgresado](
	[EgresadoID] [int] NULL,
	[AptitudID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Egresado]    Script Date: 27/08/2014 11:27:46 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EgresadoDesvinculado]    Script Date: 27/08/2014 11:27:46 p.m. ******/
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
/****** Object:  Table [dbo].[EgresadoDetalle]    Script Date: 27/08/2014 11:27:46 p.m. ******/
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
/****** Object:  Table [dbo].[HistorialDatosEgresado]    Script Date: 27/08/2014 11:27:46 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Interes]    Script Date: 27/08/2014 11:27:46 p.m. ******/
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
/****** Object:  Table [dbo].[InteresxEgresado]    Script Date: 27/08/2014 11:27:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InteresxEgresado](
	[EgresadoID] [int] NULL,
	[InteresesID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegistroAcademico]    Script Date: 27/08/2014 11:27:46 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistroLaboral]    Script Date: 27/08/2014 11:27:46 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoEstudio]    Script Date: 27/08/2014 11:27:46 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 27/08/2014 11:27:46 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Egresado] ON 

INSERT [dbo].[Egresado] ([EgregadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (1, N'Luis Lopez', 20, N'M', N'014563456', N'987654321', N'45780324', N'luis@gmail.com', N'luis@hotmail.com', N'Av. Callejones rojos 450', N'San Isidro', N'Lima', NULL, NULL, CAST(0x221C0B00 AS Date), N'G', NULL)
INSERT [dbo].[Egresado] ([EgregadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (2, N'Carlos Castañeda', 25, N'M', N'015502323', N'97513153', N'78342105', N'carlosc@gmail.com', NULL, NULL, NULL, N'Lima', NULL, NULL, CAST(0xA5140B00 AS Date), N'E', NULL)
INSERT [dbo].[Egresado] ([EgregadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (3, N'Jose Arellano', 23, N'M', NULL, NULL, NULL, NULL, N'jose@gmail.com', N'Av. Los barracones 330', N'San borja', NULL, NULL, NULL, CAST(0x39180B00 AS Date), N'E', NULL)
INSERT [dbo].[Egresado] ([EgregadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (4, N'Lucia Paredes', 26, N'F', N'012504647', N'94693728', N'56205087', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0xAB130B00 AS Date), N'E', NULL)
INSERT [dbo].[Egresado] ([EgregadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (5, N'Maria Gonzales', 22, N'F', NULL, NULL, NULL, N'maria@gmail.com', NULL, N'Av. Rocas 550', NULL, N'Lima', NULL, NULL, CAST(0xF9180B00 AS Date), N'G', NULL)
INSERT [dbo].[Egresado] ([EgregadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (6, N'Natalie Mendoza', NULL, N'F', N'013506789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x811D0B00 AS Date), N'G', NULL)
INSERT [dbo].[Egresado] ([EgregadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (7, N'Jesus Rodriguez', NULL, N'M', NULL, N'96345098', NULL, NULL, N'jesus@gmail.com', NULL, N'Jesus Maria', N'Lima', NULL, NULL, CAST(0x2D130B00 AS Date), N'E', NULL)
INSERT [dbo].[Egresado] ([EgregadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (8, N'Patricia Berdejo', NULL, N'F', NULL, NULL, NULL, N'paty@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x3A160B00 AS Date), N'E', NULL)
INSERT [dbo].[Egresado] ([EgregadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Surco', N'Lima', NULL, NULL, CAST(0x341B0B00 AS Date), N'G', NULL)
SET IDENTITY_INSERT [dbo].[Egresado] OFF
ALTER TABLE [dbo].[AptitudxEgresado]  WITH CHECK ADD  CONSTRAINT [FK_AptitudxEgresado_Aptitud] FOREIGN KEY([AptitudID])
REFERENCES [dbo].[Aptitud] ([AptitudID])
GO
ALTER TABLE [dbo].[AptitudxEgresado] CHECK CONSTRAINT [FK_AptitudxEgresado_Aptitud]
GO
ALTER TABLE [dbo].[AptitudxEgresado]  WITH CHECK ADD  CONSTRAINT [FK_AptitudxEgresado_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgregadoID])
GO
ALTER TABLE [dbo].[AptitudxEgresado] CHECK CONSTRAINT [FK_AptitudxEgresado_Egresado]
GO
ALTER TABLE [dbo].[EgresadoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_EgresadoDetalle_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgregadoID])
GO
ALTER TABLE [dbo].[EgresadoDetalle] CHECK CONSTRAINT [FK_EgresadoDetalle_Egresado]
GO
ALTER TABLE [dbo].[HistorialDatosEgresado]  WITH CHECK ADD  CONSTRAINT [FK_HistorialDatosEgresado_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgregadoID])
GO
ALTER TABLE [dbo].[HistorialDatosEgresado] CHECK CONSTRAINT [FK_HistorialDatosEgresado_Egresado]
GO
ALTER TABLE [dbo].[InteresxEgresado]  WITH CHECK ADD  CONSTRAINT [FK_InteresxEgresado_Egresado] FOREIGN KEY([EgresadoID])
REFERENCES [dbo].[Egresado] ([EgregadoID])
GO
ALTER TABLE [dbo].[InteresxEgresado] CHECK CONSTRAINT [FK_InteresxEgresado_Egresado]
GO
ALTER TABLE [dbo].[InteresxEgresado]  WITH CHECK ADD  CONSTRAINT [FK_InteresxEgresado_Interes] FOREIGN KEY([InteresesID])
REFERENCES [dbo].[Interes] ([InteresesID])
GO
ALTER TABLE [dbo].[InteresxEgresado] CHECK CONSTRAINT [FK_InteresxEgresado_Interes]
GO
ALTER TABLE [dbo].[RegistroAcademico]  WITH CHECK ADD  CONSTRAINT [FK_RegistroAcademico_Egresado] FOREIGN KEY([EgregadoID])
REFERENCES [dbo].[Egresado] ([EgregadoID])
GO
ALTER TABLE [dbo].[RegistroAcademico] CHECK CONSTRAINT [FK_RegistroAcademico_Egresado]
GO
ALTER TABLE [dbo].[RegistroAcademico]  WITH CHECK ADD  CONSTRAINT [FK_RegistroAcademico_TipoEstudio] FOREIGN KEY([TipoEstudioID])
REFERENCES [dbo].[TipoEstudio] ([TipoEstudioID])
GO
ALTER TABLE [dbo].[RegistroAcademico] CHECK CONSTRAINT [FK_RegistroAcademico_TipoEstudio]
GO
ALTER TABLE [dbo].[RegistroLaboral]  WITH CHECK ADD  CONSTRAINT [FK_RegistroLaboral_Egresado] FOREIGN KEY([EgregadoID])
REFERENCES [dbo].[Egresado] ([EgregadoID])
GO
ALTER TABLE [dbo].[RegistroLaboral] CHECK CONSTRAINT [FK_RegistroLaboral_Egresado]
GO
USE [master]
GO
ALTER DATABASE [SeguimientoEgresados] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [SeguimientoEgresados]    Script Date: 10/25/2014 11:05:06 AM ******/
CREATE DATABASE [SeguimientoEgresados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SeguimientoEgresados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\SeguimientoEgresados.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SeguimientoEgresados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\SeguimientoEgresados_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
EXEC sys.sp_db_vardecimal_storage_format N'SeguimientoEgresados', N'ON'
GO
USE [SeguimientoEgresados]
GO
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarAptitud]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 25/09/2014
-- Description:	SP para actualizar una Aptitud
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_actualizarAptitud]
	@idaptitud int,
	@nombre varchar(50)
AS
BEGIN
	SET NOCOUNT OFF;
		
	UPDATE
		Aptitud
	SET
		Nombre = @nombre

	WHERE
		AptitudID = @idaptitud
END









GO
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 28/08/2014
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
	@idpaisegresado int,
	@perfillinkedinegresado varchar(50),
	@perfilfacebookegresado varchar(50),
	@fechanacimientoegresado date,
	@tipoegresado char(1),
	@idfotoegresado int,
	@contrasenaegresado varchar(50),
	@contrasenadinamicaegresado varchar(50),
	@cambiocontrasenaegresado bit,
	@cicloegresado varchar(10),
	@codigouniversitarioegresado varchar(10),
	@carrera varchar(50)
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
		PaisID = @idpaisegresado,
		PerfilLinkedIn = @perfillinkedinegresado,
		PerfilFacebook = @perfilfacebookegresado,
		FechaNacimiento = @fechanacimientoegresado,
		TipoEgresado = @tipoegresado,
		FotoID = @idfotoegresado,
		Contrasena = @contrasenaegresado,
		ContrasenaDinamica = @contrasenadinamicaegresado,
		CambioContrasena = @cambiocontrasenaegresado,
		CicloEgresado = @cicloegresado,
		CodigoUniversitario = @codigouniversitarioegresado,
		Carrera = @carrera
	WHERE
		EgresadoID = @idegresado
END

























GO
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarEgresadoDesvinculado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 11/10/2014
-- Description:	SP para actualizar a un egresadodesvinculado por su codigo universitario
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_actualizarEgresadoDesvinculado]
	@nombrecompleto varchar(100),
	@codigo varchar(10),
	@carrera varchar(50),
	@cicloegreso varchar(10),
	@contrasenadinamica varchar(100),
	@cambiocontrasena bit,
	@estaregistrado bit
AS
BEGIN
	SET NOCOUNT OFF;
  
	UPDATE
      EgresadoDesvinculado
	SET
		NombreCompleto = @nombrecompleto,
		ContrasenaDinamica = @contrasenadinamica,
		CambioContrasena = @cambiocontrasena,
		CicloEgreso = @cicloegreso,
		CodigoUniversitario = @codigo,
		Carrera = @carrera,
		EstaRegistrado = @estaregistrado
	WHERE
		CodigoUniversitario = @codigo
END






GO
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarFoto]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 25/09/2014
-- Description:	SP para actualizar una Aptitud
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_actualizarFoto]
	@idfoto int,
	@foto binary(8000)
AS
BEGIN
	SET NOCOUNT OFF;
		
	UPDATE
		Foto
	SET
		Foto = @foto

	WHERE
		FotoID = @idfoto
END




GO
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarInteres]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 25/09/2014
-- Description:	SP para actualizar un Interes
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_actualizarInteres]
	@idinteres int,
	@nombre varchar(50)
AS
BEGIN
	SET NOCOUNT OFF;
		
	UPDATE
		Interes
	SET
		Nombre = @nombre

	WHERE
		InteresesID = @idinteres
END















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarRegistroAcademico]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 23/09/2014
-- Description:	SP para actualizar un registro acadÃ©mico
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_actualizarRegistroAcademico]
	@idregistroacademico int,
	@idegresado int,
	@nombreinstitucion varchar(100),
	@nombre varchar(50),
	@duracion varchar(30),
	@descripcion varchar(500),
	@tipoestudio varchar(100),
	@idpais int

AS
BEGIN
	SET NOCOUNT OFF;
		
	UPDATE
		RegistroAcademico
	SET
		NombreInstitucion = @nombreinstitucion,
		Nombre = @nombre,
		Duracion = @duracion,
		Descripcion	= @descripcion,
		TipoEstudio = @tipoestudio,
		PaisID = @idpais

	WHERE
		RegistroAcademicoID = @idregistroacademico;
END

















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarRegistroLaboral]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 23/09/2014
-- Description:	SP para actualizar un registro laboral
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_actualizarRegistroLaboral]
	@idregistrolaboral int,
	@idegresado int,
	@nombretrabajo varchar(100),
	@cargo varchar(50),
	@duracion varchar(50),
	@descripcion varchar(500),
	@nombrejefe varchar(50),
	@cargojefe varchar(50),
	@telefonojefe varchar(15),
	@correojefe varchar(50),
	@idpais int,
	@trabajoactual bit

AS
BEGIN
	SET NOCOUNT OFF;
		
	UPDATE
		RegistroLaboral
	SET
		NombreTrabajo = @nombrejefe,
		Cargo = @cargo,
		Duracion = @duracion,
		Descripcion	= @descripcion,
		NombreJefe = @nombrejefe,
		JefeCargo = @cargojefe,
		TelefonoContacto = @telefonojefe,
		CorreoJefe = @correojefe,
		PaisID = @idpais,
		TrabajoActual = @trabajoactual

	WHERE
		RegistroLaboralID = @idregistrolaboral;
END
















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarAptitud]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 25/09/2014
-- Description:	SP para eliminar una Aptitud
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_eliminarAptitud]
	@idaptitud int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM
		Aptitud
	WHERE
		AptitudID = @idaptitud
END















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarAptitudxEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 25/09/2014
-- Description:	SP para eliminar una AptitudxEgresado
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_eliminarAptitudxEgresado]
	@idegresado int,
	@idaptitud int
AS
BEGIN
	DELETE FROM
		AptitudxEgresado
	WHERE
		EgresadoID = @idegresado
		AND
		AptitudID = @idaptitud
END


















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarFoto]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 25/09/2014
-- Description:	SP para eliminar una Aptitud
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_eliminarFoto]
	@idfoto int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM
		Foto
	WHERE
		FotoID = @idfoto
END





GO
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarFotoxEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 25/09/2014
-- Description:	SP para eliminar una FotoxEgresado
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_eliminarFotoxEgresado]
	@idegresado int,
	@idfoto int
AS
BEGIN
	DELETE FROM
		FotoxEgresado
	WHERE
		EgresadoID = @idegresado
		AND
		FotoID = @idfoto  
END


















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarInteres]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 25/09/2014
-- Description:	SP para eliminar un Interes
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_eliminarInteres]
	@idinteres int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM
		Interes
	WHERE
		InteresesID = @idinteres  
END


















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarInteresxEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 25/09/2014
-- Description:	SP para eliminar un InteresxEgresado
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_eliminarInteresxEgresado]
	@idegresado int,
	@idinteres int
AS
BEGIN
	DELETE FROM
		InteresxEgresado
	WHERE
		EgresadoID = @idegresado
		AND
		InteresesID = @idinteres  
END


















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarAptitud]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 23/09/2014
-- Description:	SP para insertar una nueva aptitud
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_insertarAptitud]
	@nombre varchar(50)
AS
BEGIN
	INSERT INTO
		Aptitud(Nombre)
	VALUES
		(@nombre)
	RETURN
		@@IDENTITY
END
















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarAptitudxEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 25/09/2014
-- Description:	SP para insertar una nueva AptitudxEgresado
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_insertarAptitudxEgresado]
	@idegresado int,
	@idaptitud int
AS
BEGIN
	INSERT INTO
		AptitudxEgresado(EgresadoID, AptitudID)
	VALUES
		(@idegresado,@idaptitud)
END
















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarEgresadodesdeEgresadoDesv]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 11/10/2014
-- Description:	SP para insertar un nuevo egresado desde egresado desvinculado
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_insertarEgresadodesdeEgresadoDesv]
	@nombrecompleto varchar(100),
	@correo varchar(50),
	@codigo varchar(10),
	@contrasena varchar(50),
	@carrera varchar(50),
	@cicloegreso varchar(10),
	@contrasenadinamica varchar(100),
	@cambiocontrasena bit,
	@tipoegresado char(1),
	@idfotoegresado int
AS
BEGIN
	INSERT INTO
		Egresado(NombreCompleto,Correo,CodigoUniversitario,Contrasena,Carrera,CicloEgresado,ContrasenaDinamica,CambioContrasena,TipoEgresado,FotoID)
	VALUES
		(@nombrecompleto,@correo,@codigo,@contrasena,@carrera,@cicloegreso,@contrasenadinamica,@cambiocontrasena,@tipoegresado,@idfotoegresado)
	RETURN
		@@IDENTITY
END






GO
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarFoto]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 23/09/2014
-- Description:	SP para insertar una nueva aptitud
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_insertarFoto]
	@foto binary(8000)
AS
BEGIN
	INSERT INTO dbo.Foto
		(Foto)
	OUTPUT
		inserted.FotoID
	VALUES
		(@foto)
END




GO
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarFotoxEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 25/09/2014
-- Description:	SP para insertar una nueva AptitudxEgresado
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_insertarFotoxEgresado]
	@idegresado int,
	@idfoto int
AS
BEGIN
	INSERT INTO
		FotoxEgresado(EgresadoID, FotoID)
	VALUES
		(@idegresado,@idfoto)
END




GO
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarHistorialDatosEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 01/09/2014
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarInteres]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 23/09/2014
-- Description:	SP para insertar una nueva interes
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_insertarInteres]
	@nombre varchar(50)
AS
BEGIN
	INSERT INTO
		Interes(Nombre)
	VALUES
		(@nombre)
	RETURN
		@@IDENTITY
END
















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarInteresxEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 25/09/2014
-- Description:	SP para insertar un nuevo InteresxEgresado
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_insertarInteresxEgresado]
	@idegresado int,
	@idinteres int
AS
BEGIN
	INSERT INTO
		InteresxEgresado(EgresadoID, InteresesID)
	VALUES
		(@idegresado,@idinteres)
END
















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroAcademico]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 23/09/2014
-- Description:	SP para insertar un nuevo registro acadÃ©mico
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_insertarRegistroAcademico]
	@idegresado int,
	@nombreinstitucion varchar(100),
	@nombre varchar(50),
	@duracion varchar(30),
	@descripcion varchar(500),
	@tipoestudio varchar(100),
	@idpais int
AS
BEGIN
	INSERT INTO
		RegistroAcademico(EgresadoID,NombreInstitucion,Nombre,Duracion,Descripcion,TipoEstudio,PaisID)
	VALUES
		(@idegresado,@nombreinstitucion,@nombre,@duracion,@descripcion,@tipoestudio,@idpais)
	RETURN
		@@IDENTITY
END
















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroLaboral]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 23/09/2014
-- Description:	SP para insertar un nuevo registro laboral
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_insertarRegistroLaboral]
	@idegresado int,
	@nombretrabajo varchar(100),
	@cargo varchar(50),
	@duracion varchar(50),
	@descripcion varchar(500),
	@nombrejefe varchar(50),
	@cargojefe varchar(50),
	@telefonojefe varchar(15),
	@correojefe varchar(50),
	@idpais int,
	@trabajoactual bit
AS
BEGIN
	INSERT INTO
		RegistroLaboral(EgresadoID,NombreTrabajo,Cargo,Duracion,Descripcion,NombreJefe,JefeCargo,TelefonoContacto,CorreoJefe,PaisID,TrabajoActual)
	VALUES
		(@idegresado,@nombretrabajo,@cargo,@duracion,@descripcion,@nombrejefe,@cargojefe,@telefonojefe,@correojefe,@idpais,@trabajoactual)
	RETURN
		@@IDENTITY
END
















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 10/10/2014
-- Description:	SP para listar los egresados
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarEgresado]
AS
BEGIN
	SELECT 
		EgresadoID, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(Edad,'') AS Edad, ISNULL(Sexo,'') AS Sexo,
		ISNULL(TelefonoPrincipal,'') AS TelefonoPrincipal, ISNULL(TelefonoAlternativo,'') AS TelefonoAlternativo,
		ISNULL(DNI,'') AS DNI, ISNULL(Correo,'') AS Correo,ISNULL(CorreoAlternativo,'') AS CorreoAlternativo, 
		ISNULL(Direccion,'') AS Direccion, ISNULL(Distrito,'') AS Distrito, ISNULL(Departamento,'') AS Departamento, 
		ISNULL(PaisID,'') AS Pais, ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(FotoID,'') AS FotoID,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado = 'E'
END















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresado_Lista]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Giancarlo Martinez
-- Alter date: 15/10/2014
-- Description:	SP para listar los egresados
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarEgresado_Lista]
@nombre varchar(50),
@codigoUniversitario varchar(10),
@anioinicio int,
@aniofin int,
@Carrera varchar(50)

AS
BEGIN


if(@anioinicio != 0 and @aniofin != 0)
begin

     select e.EgresadoID as EgresadoID, e.CodigoUniversitario as Codigo, e.NombreCompleto as Nombre,
	 e.Carrera as Carrera, e.CicloEgresado as CicloEgreso
     from Egresado e
     where (e.TipoEgresado = 'E') and (e.NombreCompleto like '%' +  @nombre + '%' or e.NombreCompleto = '' or e.CodigoUniversitario like '%' +  @codigoUniversitario +  '%' or e.CodigoUniversitario = '') and 
      (convert(int ,SUBSTRING(e.CicloEgresado,0,5), 0) >= @anioinicio)  and 
	  (convert(int ,SUBSTRING(e.CicloEgresado,0,5), 0) <= @aniofin) and
	  (e.Carrera like '%' +  @Carrera + '%' or e.Carrera = '') 
	  
end

if(@anioinicio = 0 and @aniofin != 0)
begin
     select e.EgresadoID as EgresadoID, e.CodigoUniversitario as Codigo, e.NombreCompleto as Nombre,
	 e.Carrera as Carrera, e.CicloEgresado as CicloEgreso
    from Egresado e
    where (e.TipoEgresado = 'E') and (e.NombreCompleto like '%' +  @nombre + '%' or e.NombreCompleto = '' or e.CodigoUniversitario like '%' +  @codigoUniversitario +  '%' or e.CodigoUniversitario = '') and 
	  (convert(int ,SUBSTRING(e.CicloEgresado,0,5), 0) <= @aniofin or e.CicloEgresado is null) and 
	  (e.Carrera like '%' +  @Carrera + '%' or e.Carrera = '') 

end

if(@aniofin = 0 and @anioinicio != 0)
 begin
     select e.EgresadoID as EgresadoID, e.CodigoUniversitario as Codigo, e.NombreCompleto as Nombre,
	 e.Carrera as Carrera, e.CicloEgresado as CicloEgreso
    from Egresado e
    where (e.TipoEgresado = 'E') and (e.NombreCompleto like '%' +  @nombre + '%' or e.NombreCompleto = '' or e.CodigoUniversitario like '%' +  @codigoUniversitario +  '%' or e.CodigoUniversitario = '') and 
	  (convert(int ,SUBSTRING(e.CicloEgresado,0,5), 0) >= @anioinicio or e.CicloEgresado is null)  and 
	  (e.Carrera like '%' +  @Carrera + '%' or e.Carrera = '') 

 end


if(@anioinicio = 0 and @aniofin = 0)
 begin

     select e.EgresadoID as EgresadoID, e.CodigoUniversitario as Codigo, e.NombreCompleto as Nombre,
	 e.Carrera as Carrera, e.CicloEgresado as CicloEgreso
    from Egresado e
    where (e.TipoEgresado = 'E') and (e.NombreCompleto like '%' +  @nombre + '%' or e.NombreCompleto = '' or e.CodigoUniversitario like '%' +  @codigoUniversitario +  '%' or e.CodigoUniversitario = '') and 
	  (e.Carrera like '%' +  @Carrera + '%' or e.Carrera = '') 


 end

END












GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresado_Lista2]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SWEGR_listarEgresado_Lista2]
@nombre varchar(50),
@codigoUniversitario varchar(10),
@Carrera varchar(50)

AS
BEGIN


   select e.EgresadoID as EgresadoID, e.CodigoUniversitario as Codigo, e.NombreCompleto as Nombre,
	 e.Carrera as Carrera, e.CicloEgresado as CicloEgreso, r.NombreTrabajo as Trabajoactual, r.NombreJefe as NombreJefe,
	 r.JefeCargo as CargoJefe, r.TelefonoContacto as TelefonoJefe, r.CorreoJefe as CorreoJefe
     from Egresado e, RegistroLaboral r
     where 
	 
	 (e.TipoEgresado = 'E') and (e.NombreCompleto like '%' +  @nombre + '%' or e.NombreCompleto = '')
	 -- and (convert(int ,SUBSTRING(e.CicloEgresado,0,5), 0) >= @anioinicio) 
	  and (e.CodigoUniversitario like '%' +  @codigoUniversitario +  '%' or e.CodigoUniversitario = '') 
	 -- and (convert(int ,SUBSTRING(e.CicloEgresado,0,5), 0) <= @aniofin) 
	and (e.Carrera like '%' +  @Carrera + '%' or e.Carrera = '')

END








GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoAnios]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Giancarlo Martinez
-- Alter date: 15/10/2014
-- Description:	SP para listar los egresados
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarEgresadoAnios]

AS
BEGIN

select distinct convert(int ,SUBSTRING(CicloEgresado,0,5), 0) 'CicloEgreso'
from Egresado
where TipoEgresado = 'E'
order by convert(int ,SUBSTRING(CicloEgresado,0,5), 0) 

END








GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxCarrera]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 10/10/2014
-- Description:	SP para listar los egresados por carrera
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarEgresadoxCarrera]
		@busqueda varchar(50)
AS
BEGIN
	SELECT 
		EgresadoID, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(Edad,'') AS Edad, ISNULL(Sexo,'') AS Sexo,
		ISNULL(TelefonoPrincipal,'') AS TelefonoPrincipal, ISNULL(TelefonoAlternativo,'') AS TelefonoAlternativo,
		ISNULL(DNI,'') AS DNI, ISNULL(Correo,'') AS Correo,ISNULL(CorreoAlternativo,'') AS CorreoAlternativo, 
		ISNULL(Direccion,'') AS Direccion, ISNULL(Distrito,'') AS Distrito, ISNULL(Departamento,'') AS Departamento, 
		ISNULL(PaisID,'') AS Pais, ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(FotoID,'') AS FotoID,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado='E' AND Carrera=@busqueda;
END















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxCiclo]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 10/10/2014
-- Description:	SP para listar los egresados por ciclo
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarEgresadoxCiclo]
		@busqueda varchar(10)
AS
BEGIN
	SELECT 
		EgresadoID, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(Edad,'') AS Edad, ISNULL(Sexo,'') AS Sexo,
		ISNULL(TelefonoPrincipal,'') AS TelefonoPrincipal, ISNULL(TelefonoAlternativo,'') AS TelefonoAlternativo,
		ISNULL(DNI,'') AS DNI, ISNULL(Correo,'') AS Correo,ISNULL(CorreoAlternativo,'') AS CorreoAlternativo, 
		ISNULL(Direccion,'') AS Direccion, ISNULL(Distrito,'') AS Distrito, ISNULL(Departamento,'') AS Departamento, 
		ISNULL(PaisID,'') AS Pais, ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(FotoID,'') AS FotoID,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado='E' AND CicloEgresado=@busqueda;
END















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxCicloyCarrera]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 10/10/2014
-- Description:	SP para listar los egresados por ciclo y carrera
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarEgresadoxCicloyCarrera]
		@ciclo varchar(10),
		@carrera varchar(50)
AS
BEGIN
	SELECT 
		EgresadoID, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(Edad,'') AS Edad, ISNULL(Sexo,'') AS Sexo,
		ISNULL(TelefonoPrincipal,'') AS TelefonoPrincipal, ISNULL(TelefonoAlternativo,'') AS TelefonoAlternativo,
		ISNULL(DNI,'') AS DNI, ISNULL(Correo,'') AS Correo,ISNULL(CorreoAlternativo,'') AS CorreoAlternativo, 
		ISNULL(Direccion,'') AS Direccion, ISNULL(Distrito,'') AS Distrito, ISNULL(Departamento,'') AS Departamento, 
		ISNULL(PaisID,'') AS Pais, ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(FotoID,'') AS FotoID,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera	
	FROM
		Egresado
	WHERE
		TipoEgresado='E' AND CicloEgresado=@ciclo AND Carrera=@carrera;
END












GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigo]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 10/10/2014
-- Description:	SP para listar los egresados por nombre o codigo
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarEgresadoxNombreoCodigo]
		@nombre varchar(100)
AS
BEGIN
	SELECT 
		EgresadoID, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(Edad,'') AS Edad, ISNULL(Sexo,'') AS Sexo,
		ISNULL(TelefonoPrincipal,'') AS TelefonoPrincipal, ISNULL(TelefonoAlternativo,'') AS TelefonoAlternativo,
		ISNULL(DNI,'') AS DNI, ISNULL(Correo,'') AS Correo,ISNULL(CorreoAlternativo,'') AS CorreoAlternativo, 
		ISNULL(Direccion,'') AS Direccion, ISNULL(Distrito,'') AS Distrito, ISNULL(Departamento,'') AS Departamento, 
		ISNULL(PaisID,'') AS Pais, ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(FotoID,'') AS FotoID,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado = 'E' AND NombreCompleto = @nombre OR TipoEgresado = 'E' AND CodigoUniversitario = @nombre;
END















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCarrera]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 10/10/2014
-- Description:	SP para listar los egresados por nombre/codigo y carrera
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCarrera]
		@busqueda varchar(100),
		@carrera varchar(50)
AS
BEGIN
	SELECT 
		EgresadoID, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(Edad,'') AS Edad, ISNULL(Sexo,'') AS Sexo,
		ISNULL(TelefonoPrincipal,'') AS TelefonoPrincipal, ISNULL(TelefonoAlternativo,'') AS TelefonoAlternativo,
		ISNULL(DNI,'') AS DNI, ISNULL(Correo,'') AS Correo,ISNULL(CorreoAlternativo,'') AS CorreoAlternativo, 
		ISNULL(Direccion,'') AS Direccion, ISNULL(Distrito,'') AS Distrito, ISNULL(Departamento,'') AS Departamento, 
		ISNULL(PaisID,'') AS Pais, ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(FotoID,'') AS FotoID,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera	
	FROM
		Egresado
	WHERE
		TipoEgresado='E' AND NombreCompleto=@busqueda AND Carrera=@carrera OR TipoEgresado='E' AND CodigoUniversitario=@busqueda AND Carrera=@carrera;
END












GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCiclo]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 10/10/2014
-- Description:	SP para listar los egresados por nombre/codigo y ciclo
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCiclo]
		@busqueda varchar(100),
		@ciclo varchar(10)
AS
BEGIN
	SELECT 
		EgresadoID, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(Edad,'') AS Edad, ISNULL(Sexo,'') AS Sexo,
		ISNULL(TelefonoPrincipal,'') AS TelefonoPrincipal, ISNULL(TelefonoAlternativo,'') AS TelefonoAlternativo,
		ISNULL(DNI,'') AS DNI, ISNULL(Correo,'') AS Correo,ISNULL(CorreoAlternativo,'') AS CorreoAlternativo, 
		ISNULL(Direccion,'') AS Direccion, ISNULL(Distrito,'') AS Distrito, ISNULL(Departamento,'') AS Departamento, 
		ISNULL(PaisID,'') AS Pais, ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(FotoID,'') AS FotoID,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado='E' AND NombreCompleto=@busqueda AND CicloEgresado=@ciclo OR TipoEgresado='E' AND CodigoUniversitario=@busqueda AND CicloEgresado=@ciclo;
END















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCicloyCarrera]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 10/10/2014
-- Description:	SP para listar los egresados por nombre/codigo, ciclo y carrera
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCicloyCarrera]
		@busqueda varchar(100),
		@ciclo varchar(10),
		@carrera varchar(50)
AS
BEGIN
	SELECT 
		EgresadoID, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(Edad,'') AS Edad, ISNULL(Sexo,'') AS Sexo,
		ISNULL(TelefonoPrincipal,'') AS TelefonoPrincipal, ISNULL(TelefonoAlternativo,'') AS TelefonoAlternativo,
		ISNULL(DNI,'') AS DNI, ISNULL(Correo,'') AS Correo,ISNULL(CorreoAlternativo,'') AS CorreoAlternativo, 
		ISNULL(Direccion,'') AS Direccion, ISNULL(Distrito,'') AS Distrito, ISNULL(Departamento,'') AS Departamento, 
		ISNULL(PaisID,'') AS Pais, ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(FotoID,'') AS FotoID,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado='E' AND NombreCompleto=@busqueda AND CicloEgresado=@ciclo AND Carrera=@carrera OR TipoEgresado='E' AND CodigoUniversitario=@busqueda AND CicloEgresado=@ciclo AND Carrera=@carrera;
END















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarGraduando]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 23/10/2014
-- Description:	SP para listar los graduandos
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarGraduando]
AS
BEGIN
	SELECT 
		EgresadoID, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(Edad,'') AS Edad, ISNULL(Sexo,'') AS Sexo,
		ISNULL(TelefonoPrincipal,'') AS TelefonoPrincipal, ISNULL(TelefonoAlternativo,'') AS TelefonoAlternativo,
		ISNULL(DNI,'') AS DNI, ISNULL(Correo,'') AS Correo,ISNULL(CorreoAlternativo,'') AS CorreoAlternativo, 
		ISNULL(Direccion,'') AS Direccion, ISNULL(Distrito,'') AS Distrito, ISNULL(Departamento,'') AS Departamento, 
		ISNULL(PaisID,'') AS Pais, ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(FotoID,'') AS FotoID,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado = 'G'
END















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarGraduando_Lista]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 23/10/2014
-- Description:	SP para listar los graduandos
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarGraduando_Lista]
@nombre varchar(50),
@codigoUniversitario varchar(10),
@Carrera varchar(50)

AS
BEGIN

     select e.EgresadoID as EgresadoID, e.CodigoUniversitario as Codigo, e.NombreCompleto as Nombre,
	 e.Carrera as Carrera, e.CicloEgresado as CicloEgreso
     from Egresado e
     where (e.TipoEgresado = 'G') and (e.NombreCompleto like '%' +  @nombre + '%' or e.NombreCompleto = '' or e.CodigoUniversitario like '%' +  @codigoUniversitario +  '%' or e.CodigoUniversitario = '') and 
	  (e.Carrera like '%' +  @Carrera + '%' or e.Carrera = '') 

END












GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarPais]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 17/09/2014
-- Description:	SP para obtener todos los paises
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarPais]
AS
BEGIN
	SELECT 
		*
	FROM
		Pais
	ORDER BY 
	   Nombre
END


















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarRegistroAcademico]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 21/09/2014
-- Description:	SP para listar el Registro Academico mediante el id del egresado
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarRegistroAcademico]
	@idegresado int
AS
BEGIN
	SELECT 
		RegistroAcademicoID, ISNULL(NombreInstitucion,'') AS NombreInstitucion,
		ISNULL(Nombre,'') AS Nombre, ISNULL(Duracion,'') AS Duracion, 
		ISNULL(Descripcion,'') AS Descripcion, ISNULL(TipoEstudio, '') AS TipoEstudio, 
		ISNULL(PaisID,'') AS PaisID
	FROM
		RegistroAcademico
	WHERE
		EgresadoID = @idegresado ;
END



















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarRegistroLaboral]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 21/09/2014
-- Description:	SP para listar el Registro Laboral mediante el id del egresado
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_listarRegistroLaboral]
	@idegresado int
AS
BEGIN
	SELECT 
		RegistroLaboralID, ISNULL(NombreTrabajo,'') AS NombreTrabajo, 
		ISNULL(Cargo,'') AS Cargo, ISNULL(Duracion,'') AS Duracion,
		ISNULL(Descripcion,'') AS Descripcion, ISNULL (NombreJefe,'') AS NombreJefe, 
		ISNULL(JefeCargo,'') AS JefeCargo, ISNULL(TelefonoContacto,'') AS TelefonoContacto, 
		ISNULL(CorreoJefe,'') AS CorreoJefe, ISNULL(PaisID,'') AS PaisID, 
		ISNULL(TrabajoActual,'') AS TrabajoActual
	FROM
		RegistroLaboral
	WHERE
		EgresadoID = @idegresado ;
END



















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerAptitud]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 17/09/2014
-- Description:	SP para obtener una aptitud mediante su id
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_obtenerAptitud]
	@idaptitud int
AS
BEGIN
	SELECT 
		AptitudID, ISNULL(Nombre,'') AS Nombre
	FROM
		Aptitud
	WHERE
		AptitudID= @idaptitud ;
END



















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerAptitudxEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 28/08/2014
-- Description:	SP para obtener el codigo del pais por alumno
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_obtenerAptitudxEgresado]
	@idegresado int
AS
BEGIN
	SELECT
		distinct AptitudID
	FROM
		AptitudxEgresado
	WHERE
		EgresadoID = @idegresado;
END


















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 28/08/2014
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
		ISNULL(PaisID,'') AS Pais, ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(FotoID,'') AS FotoID,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		EgresadoID = @idegresado;
END












GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresadoDesvinculado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 11/10/2014
-- Description:	SP para obtener un egresadodesvinculado mediante su codigo universitario
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_obtenerEgresadoDesvinculado]
	@codigoegresado varchar(10)
AS
BEGIN
	SELECT 
		CodigoUniversitario, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(Carrera, '') AS Carrera, ISNULL(CicloEgreso, '') AS CicloEgreso,
		ISNULL(EstaRegistrado,'') AS EstaRegistrado
	FROM
		EgresadoDesvinculado
	WHERE
		CodigoUniversitario = @codigoegresado;
END






GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresadoxCodigoUniv]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 13/10/2014
-- Description:	SP para obtener un egresado mediante su codigo universitario
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_obtenerEgresadoxCodigoUniv]
	@codigouniversitario varchar(10)
AS
BEGIN
	SELECT 
		EgresadoID, ISNULL(NombreCompleto,'') AS NombreCompleto, ISNULL(Edad,'') AS Edad, ISNULL(Sexo,'') AS Sexo,
		ISNULL(TelefonoPrincipal,'') AS TelefonoPrincipal, ISNULL(TelefonoAlternativo,'') AS TelefonoAlternativo,
		ISNULL(DNI,'') AS DNI, ISNULL(Correo,'') AS Correo,ISNULL(CorreoAlternativo,'') AS CorreoAlternativo, 
		ISNULL(Direccion,'') AS Direccion, ISNULL(Distrito,'') AS Distrito, ISNULL(Departamento,'') AS Departamento, 
		ISNULL(PaisID,'') AS Pais, ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook,
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(FotoID,'') AS FotoID,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		CodigoUniversitario = @codigouniversitario;
END











GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerFoto]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 17/10/2014
-- Description:	SP para obtener una foto mediante su id
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_obtenerFoto]
	@idfoto int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT f.Foto
	FROM dbo.Foto f
	WHERE f.FotoID= @idfoto ;
END



















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerInteres]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 17/09/2014
-- Description:	SP para obtener un interes mediante su id
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_obtenerInteres]
	@idinteres int
AS
BEGIN
	SELECT 
		InteresesID, ISNULL(Nombre,'') AS Nombre
	FROM
		Interes
	WHERE
		InteresesID = @idinteres;
END



















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerInteresxEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 28/08/2014
-- Description:	SP para obtener el codigo del pais por alumno
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_obtenerInteresxEgresado]
	@idegresado int
AS
BEGIN
	SELECT
		distinct InteresesID
	FROM
		InteresxEgresado
	WHERE
		EgresadoID = @idegresado;
END


















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerLinksEgresado]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Magah
-- Alter date: 13/10/2014
-- Description:	SP para obtener un egresado mediante su codigo universitario
-- =============================================

CREATE PROCEDURE [dbo].[SWEGR_obtenerLinksEgresado]
		@idegresado int
	AS
	BEGIN
		SELECT 
			ISNULL(PerfilLinkedIn,'') AS PerfilLinkedIn, ISNULL(PerfilFacebook,'') AS PerfilFacebook		
		FROM
			Egresado
		WHERE
			EgresadoID = @idegresado;
	END












GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerPais]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 23/09/2014
-- Description:	SP para obtener un pais mediante su id
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_obtenerPais]
	@idpais int
AS
BEGIN
	SELECT 
		Nombre
	FROM
		Pais
	WHERE
		PaisID = @idpais;
END
















GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerPaisID]    Script Date: 10/25/2014 11:05:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christian Llamoga
-- Alter date: 23/09/2014
-- Description:	SP para obtener un id de pais mediante su nombre
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_obtenerPaisID]
	@nombre varchar(80)
AS
BEGIN
	SELECT 
		PaisID
	FROM
		Pais
	WHERE
		Nombre = @nombre;
END














GO
/****** Object:  Table [dbo].[Aptitud]    Script Date: 10/25/2014 11:05:06 AM ******/
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
/****** Object:  Table [dbo].[AptitudxEgresado]    Script Date: 10/25/2014 11:05:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AptitudxEgresado](
	[EgresadoID] [int] NULL,
	[AptitudID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Egresado]    Script Date: 10/25/2014 11:05:07 AM ******/
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
	[PaisID] [int] NULL,
	[PerfilLinkedIn] [varchar](50) NULL,
	[PerfilFacebook] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[TipoEgresado] [char](1) NULL,
	[FotoID] [int] NOT NULL,
	[Contrasena] [varchar](50) NULL,
	[ContrasenaDinamica] [varchar](50) NULL,
	[CambioContrasena] [bit] NULL,
	[CicloEgresado] [varchar](10) NULL,
	[CodigoUniversitario] [varchar](10) NULL,
	[Carrera] [varchar](50) NULL,
 CONSTRAINT [PK_Egresado] PRIMARY KEY CLUSTERED 
(
	[EgresadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EgresadoDesvinculado]    Script Date: 10/25/2014 11:05:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EgresadoDesvinculado](
	[CodigoUniversitario] [varchar](10) NOT NULL,
	[NombreCompleto] [varchar](100) NULL,
	[ContrasenaDinamica] [varchar](100) NULL,
	[CambioContrasena] [bit] NULL,
	[Carrera] [varchar](50) NULL,
	[CicloEgreso] [varchar](10) NULL,
	[EstaRegistrado] [bit] NULL,
 CONSTRAINT [PK_EgresadoDesvinculado] PRIMARY KEY CLUSTERED 
(
	[CodigoUniversitario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Foto]    Script Date: 10/25/2014 11:05:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Foto](
	[FotoID] [int] IDENTITY(1,1) NOT NULL,
	[Foto] [binary](8000) NULL,
 CONSTRAINT [PK_Foto] PRIMARY KEY CLUSTERED 
(
	[FotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FotoxEgresado]    Script Date: 10/25/2014 11:05:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FotoxEgresado](
	[EgresadoID] [int] NULL,
	[FotoID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistorialDatosEgresado]    Script Date: 10/25/2014 11:05:07 AM ******/
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
/****** Object:  Table [dbo].[Interes]    Script Date: 10/25/2014 11:05:07 AM ******/
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
/****** Object:  Table [dbo].[InteresxEgresado]    Script Date: 10/25/2014 11:05:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InteresxEgresado](
	[EgresadoID] [int] NULL,
	[InteresesID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pais]    Script Date: 10/25/2014 11:05:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pais](
	[PaisID] [int] NOT NULL,
	[Nombre] [varchar](80) NOT NULL,
 CONSTRAINT [PK_DIC_Pais] PRIMARY KEY CLUSTERED 
(
	[PaisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistroAcademico]    Script Date: 10/25/2014 11:05:07 AM ******/
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
	[PaisID] [int] NULL,
 CONSTRAINT [PK_RegistroAcademico] PRIMARY KEY CLUSTERED 
(
	[RegistroAcademicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistroLaboral]    Script Date: 10/25/2014 11:05:07 AM ******/
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
	[PaisID] [int] NULL,
	[TrabajoActual] [bit] NULL,
 CONSTRAINT [PK_RegistroLaboral] PRIMARY KEY CLUSTERED 
(
	[RegistroLaboralID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Aptitud] ON 

INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (1, N'Responsable')
INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (2, N'Puntual')
INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (3, N'Honesto')
INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (4, N'SQL Server Management...')
INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (5, N'MySQL')
INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (6, N'Windows Phone')
INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (7, N'.NET')
INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (8, N'Windows')
INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (9, N'JSON')
INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (10, N'ETL')
INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (11, N'Windows 8 Development')
INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (12, N'Visual Basic')
INSERT [dbo].[Aptitud] ([AptitudID], [Nombre]) VALUES (13, N'Adecuada')
SET IDENTITY_INSERT [dbo].[Aptitud] OFF
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (2, 1)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (2, 2)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (2, 3)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (3, 1)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (3, 3)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (7, 3)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (4, 2)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (2, 1)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (2, 2)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (2, 3)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (3, 1)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (3, 3)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (7, 3)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (4, 2)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (2, 12)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (2, 13)
SET IDENTITY_INSERT [dbo].[Egresado] ON 

INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (1, N'Luis Lopez', 20, N'M', N'011111111', N'964406650', N'45780324', N'luis@gmail.com', N'luis@hotmail.com', N'Av. Callejones rojos 4500', N'San Isidro', N'Lima', 173, N'https://pe.linkedin.com/luislopez55', N'', CAST(0x221C0B00 AS Date), N'G', 1, N'qwerty', N'', 0, N'201201', N'u199820242', N'Ingeniería de Sistemas de Información')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (2, N'Carlos Castañeda', 25, N'M', N'015502323', N'97513153', N'78342105', N'luis@gmail.com', N'', N'Av. Los barracones 330', N'', N'Lima', 173, N'https://pe.linkedin.com/luislopez55', N'', CAST(0xA5140B00 AS Date), N'E', 2, N'', N'', 0, N'201302', N'u201510001', N'Ingeniería de Sistemas de Información')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (3, N'Jose Arellano', 23, N'M', NULL, NULL, N'12345678', NULL, N'jose@gmail.com', N'Av. Los barracones 330', N'San borja', NULL, 173, NULL, NULL, CAST(0x39180B00 AS Date), N'E', 1, NULL, NULL, NULL, N'201301', N'u200712823', N'Ingeniería de Sistemas de Información')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (4, N'Lucia Paredes', 26, N'F', N'012504647', N'94693728', N'56205087', NULL, NULL, NULL, NULL, NULL, 173, NULL, NULL, CAST(0xAB130B00 AS Date), N'E', 1, NULL, NULL, NULL, N'201201', N'u200912345', N'Ingeniería de Sistemas de Información')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (5, N'Maria Gonzales', 22, N'F', NULL, NULL, N'56675787', N'maria@gmail.com', NULL, N'Av. Rocas 550', NULL, N'Lima', 173, NULL, NULL, CAST(0xF9180B00 AS Date), N'G', 1, NULL, NULL, NULL, N'201201', N'u200618754', N'Ingeniería de Sistemas de Información')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (6, N'Natalie Mendoza', 24, N'F', N'013506789', NULL, N'23424243', NULL, NULL, NULL, NULL, NULL, 173, NULL, NULL, CAST(0x811D0B00 AS Date), N'G', 1, NULL, NULL, NULL, N'201301', N'u200518904', N'Ingeniería de Sistemas de Información')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (7, N'Jesus Rodriguez', 25, N'M', NULL, N'96345098', N'56756756', NULL, N'jesus@gmail.com', NULL, N'Jesus Maria', N'Lima', 173, NULL, NULL, CAST(0x2D130B00 AS Date), N'E', 1, NULL, NULL, NULL, N'201202', N'u200128764', N'Ingeniería de Sistemas de Información')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (8, N'Patricia Berdejo', 26, N'F', NULL, NULL, N'13286784', N'paty@gmail.com', NULL, NULL, NULL, NULL, 173, NULL, NULL, CAST(0x3A160B00 AS Date), N'E', 1, NULL, NULL, NULL, N'201201', N'200428054', N'Ingeniería de Sistemas de Información')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (9, N'Jeanmarco Martinez', 19, N'F', N'123456789', N'987654321', N'15478542', N'w', N'w', N'w', N'w', N'La Libertad', 173, N'w', N'j', CAST(0x5B950A00 AS Date), N'G', 1, NULL, NULL, NULL, N'201201', N'u199520221', N'Ingeniería de Sistemas de Información')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (11, N'Claudia Amaya Montes', 27, N'F', NULL, NULL, N'55675674', N'claudiaeylin@gmail.com', NULL, NULL, NULL, NULL, 173, N'https://www.linkedin.com/profile/view?id=227759043', NULL, CAST(0xF6110B00 AS Date), N'E', 1, N'admin123', NULL, NULL, N'201001', N'u199017242', N'Ingeniería de Sistemas de Información')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (12, N'Luis Fernando Ramos Castillo', 23, N'M', NULL, NULL, N'32424234', NULL, NULL, NULL, NULL, NULL, 173, N'https://www.linkedin.com/profile/view?id=130139652', NULL, CAST(0x30170B00 AS Date), N'E', 1, NULL, NULL, NULL, N'201101', N'u199520242', N'Ingeniería de Software')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (14, N'karen Ivone Farroñay Rivero', 31, N'F', NULL, NULL, N'90845659', NULL, NULL, NULL, NULL, NULL, 173, N'https://www.linkedin.com/profile/view?id=101434525', NULL, CAST(0xE51C0B00 AS Date), N'E', 1, NULL, NULL, NULL, N'201101', N'u200410201', N'Ingeniería de Software')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (16, N'Cai Toninho Aguayo Mendoza', 23, N'M', NULL, NULL, N'02245456', NULL, NULL, NULL, NULL, NULL, 173, N'https://www.linkedin.com/profile/view?id=196080485', NULL, CAST(0x8DEB0A00 AS Date), N'E', 1, NULL, NULL, NULL, N'201101', N'u200410923', N'Ingeniería de Software')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (17, N'Carlos Enrique Castañeda Gutierrez ', 21, N'M', NULL, NULL, N'06456787', NULL, NULL, NULL, NULL, NULL, 173, N'https://www.linkedin.com/profile/view?id=104096210', NULL, CAST(0xBA070B00 AS Date), N'E', 1, NULL, NULL, NULL, N'201301', N'u200420146', N'Ingeniería de Software')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (18, N'Marco Bruggmann Gisler', 21, N'M', NULL, NULL, N'04578878', NULL, NULL, NULL, NULL, NULL, 173, N'https://www.linkedin.com/profile/view?id=176713759', NULL, CAST(0xB1DC0A00 AS Date), N'E', 1, NULL, NULL, NULL, N'201101', N'u200511477', N'Ingeniería de Software')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (19, N'Daniel Walter  Tipismana de la Cruz', 28, N'M', NULL, NULL, N'09789898', NULL, NULL, NULL, NULL, NULL, 173, N'https://www.linkedin.com/profile/view?id=76413068', NULL, CAST(0x58140B00 AS Date), N'E', 1, NULL, NULL, NULL, N'201201', N'u200710494', N'Ingeniería de Software')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (20, N'Arturo Cecilio  Balbin Rojas', 23, N'M', NULL, NULL, N'01238658', NULL, NULL, NULL, NULL, NULL, 173, N'https://www.linkedin.com/profile/view?id=140488145', NULL, CAST(0xDDC50A00 AS Date), N'E', 1, NULL, NULL, NULL, N'201201', N'u200710937', N'Ingeniería de Software')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (21, N'Carlos Antonio  Vertiz Bernaola', 21, N'M', NULL, NULL, N'45648987', NULL, NULL, NULL, NULL, NULL, 173, N'https://www.linkedin.com/profile/view?id=173385221', NULL, CAST(0x11060B00 AS Date), N'E', 1, NULL, NULL, NULL, N'201201', N'u200711650', N'Ingeniería de Software')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (22, N'Luis Alberto Rodriguez Martel', 23, N'M', NULL, NULL, N'78954564', NULL, NULL, NULL, NULL, NULL, 173, N'https://www.linkedin.com/profile/view?id=98390158', NULL, CAST(0xC3150B00 AS Date), N'E', 1, NULL, NULL, NULL, N'201201', N'u200711974', N'Ingeniería de Software')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (23, N'Christian Torrico', 30, N'M', NULL, NULL, N'2376788', NULL, NULL, NULL, NULL, NULL, 173, N'https://www.linkedin.com/profile/view?id=157600229', NULL, CAST(0xA1A30A00 AS Date), N'E', 1, NULL, NULL, NULL, N'201201', N'u200720444', N'Ingeniería de Software')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [FotoID], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (24, N'Alejandro Carrascal', NULL, NULL, NULL, NULL, NULL, N'acarrascal@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', 1, N'12345', N'147', 0, N'201601', N'u2010001', N'Ingeniería de Software')
SET IDENTITY_INSERT [dbo].[Egresado] OFF
INSERT [dbo].[EgresadoDesvinculado] ([CodigoUniversitario], [NombreCompleto], [ContrasenaDinamica], [CambioContrasena], [Carrera], [CicloEgreso], [EstaRegistrado]) VALUES (N'u2010001', N'Alejandro Carrascal', N'147', 0, N'Ingeniería de Software', N'201601', 1)
SET IDENTITY_INSERT [dbo].[Foto] ON 

INSERT [dbo].[Foto] ([FotoID], [Foto]) VALUES (1, 0x075BCD1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
INSERT [dbo].[Foto] ([FotoID], [Foto]) VALUES (2, 0xFFD8FFE000104A46494600010200000100010000FFED003650686F746F73686F7020332E30003842494D04040000000000191C02670014514768486E727265635069676D373961396A472D00FFE2021C4943435F50524F46494C450001010000020C6C636D73021000006D6E74725247422058595A2007DC00010019000300290039616373704150504C0000000000000000000000000000000000000000000000000000F6D6000100000000D32D6C636D7300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A64657363000000FC0000005E637072740000015C0000000B777470740000016800000014626B70740000017C000000147258595A00000190000000146758595A000001A4000000146258595A000001B80000001472545243000001CC0000004067545243000001CC0000004062545243000001CC0000004064657363000000000000000363320000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074657874000000004642000058595A20000000000000F6D6000100000000D32D58595A20000000000000031600000333000002A458595A200000000000006FA2000038F50000039058595A2000000000000062990000B785000018DA58595A2000000000000024A000000F840000B6CF63757276000000000000001A000000CB01C903630592086B0BF6103F15511B3421F1299032183B92460551775DED6B707A0589B19A7CAC69BF7DD3C3E930FFFFFFDB004300090607080706090808080A0A090B0E170F0E0D0D0E1C14151117221E2323211E2020252A352D2527322820202E3F2F3237393C3C3C242D4246413A46353B3C39FFDB0043010A0A0A0E0C0E1B0F0F1B392620263939393939393939393939393939393939393939393939393939393939393939393939393939393939393939393939393939FFC200110800E6014003002200011101021101FFC4001B00010002030101000000000000000000000005060304070102FFC400190101010101010100000000000000000000000102030405FFC400190101010101010100000000000000000000000102030405FFDA000C03000001110211000001A300000000000000000000000000000000000003DE8BCF7AE9CBEFBB388A95B3EA965DF9FDAE38AC757E4FD70D0A55CA3891FA848D3EE7FEBC2BF55E83CF80000000000000000335EA8036EC94FF0049FB57351D1687AFE1B17FE73F437B47E0E92E6E252DDCF3D27646A1E96BD28112914000000000000000003DDBBD155B15972919B3B8347565F1955AF743C4728F3A0D1CD6000000000000000000024353A619653DC87CFDE947CDCEA04D4F2025D8D9D4FAD8B985D79C8939BE9F4BE6E7C000000000000000007D16BBCD66D4993DF742585D0B1B3ECAE2C7B2D40E19BA42CCDCF98DD9899D5D9F77E381A95CE0CA13DF00000000000000006D6AEEA5D6D957B59AF41E8944CFAE336F66DD9F4D26E7F75FBE7899885B54EB0D178F03AF4FCB51B6EFE6E957ED54CBCE99836B554000000000000001BDA3B69D06C95AB21094BBAE376A7AE5F13B54174F8362561316BC7608CD0CC52BA1456C3A4D52AD9509CEABA9B3AC0280000000000000CD84744B2F3FBEA437CE4C5D3962F37E6E5AFF008C6CE3C5258F4D8DCD7DAC6EBBB9AB9F59DEA84ED3B9F58CF8140000000000000000DEE99C9ADA977DBD1FB5DBF7E7E8F1E8F00F9F311EC67D6A246D3E6AB40280000000000000064FB93DD2BF8FA7F2D2F964D5854B1E7FBD15907BA66D7C65D43E35243224340CD6FD728FABAD8E5E49E66C20000000000000007AF3D3A8F2D97893AC53E3F01D0A97AB147648BA0EA9D422293A875350B016996E7BE969B4F33F82420E6614C600000000000326CE1E9A738D3E8198E7F96C168399AF10E41FC758A315AD8E83E9CE7358A78E679ACB6239BE795BA9CBF0DE254E6FE5A260E77F76EC456FEBA1C115BD2BAD280000000005E28FB848DFB967D13D6DE75E9708583F0EB74D81C25E65796E32D167E67B65DBEB9C48162B2F2EDA347A872BDE31F45E67B0744F7996D17E87ACF868FC800000000000000000000000000000000001FFC4002E1000020202000502040603010000000000030401020005111213144015210610343520222330323324315060FFDA0008010000010502FF00CDBBAAA314815C2CEE694AEBF55AEEEE4A5411CA8D37C3B15654617FEF63A200D4293E0AEBAF6D87452D7040649DCDB6BA016575405C7B665538FC7A7BD9B3F6ABCC2DB016EFEDBA4E1E9DB9E68D87C3D4B407E22B44B0BFF7B41EE17E75B54BE90DDC1FE238B71D152D2F6F6FC896BF69567374987B7F1C7EC4D9BEA9D201C8BDDCD9D1AD7EB76129CDDFD69E0DB85854316C62067815DD92D7567DF1366EA9ABB444E3F52417A3CE5DC20B648843B0D8DDCC92A1E9BAA223406BEEB55BD8D8376BCC8ACE709FF88B6B4E6C0EA97A65014A670B670BE5C23BE1756B5F19D730BF9EB808C113D7881903CE19CB9D38CE9C648A72D598C8E35C6B5E16B0C1B82FE5AAB5D9228B54038C88FC77145B2DFED8051C1B00BAE5F26959BD905217167FAC60F55E9EA62CF530E7AA073D5039624546225494CBD2B7ADAB35B38B77CBCC709F234808E239FCB11C3E4E81939BB0673B0673B0671246F52ED18E6B6AD8E427C8C3EA529798CDD022A7F1E3DF168E4A523E466C21B7A82D9EA0B67A82F816067C798E806226F7B56697D733DC0BE4C5794CF579C1E3AF1C4DAEFCEC563D8B69AD0F43F3676C7CED98C5C555C0D9FB836A97CD9C8092A9E57352D17AE371C40E7FA2C70278CB7F3D447E9E4E6C59EB1F5F41C97B9067720CD9B5C61504B067AD612FD0365EB6A669D9F95A38C33EE9B1FD9E32DFCB55F499B33D861E4BE725F392D9C96CE4BE20BF403F27568643152D2EA1BAE19C67E918FE7E32FF00CF553FE2630E4D0A176D2761C20CE27AD2661C91144EDA4CCB9709C4FDFAC67CE2B2CD98D79D85ED759CB1E6F7E50B9ED43FF678C39E5BE9ADEE39FCA719C6E50F366D827476536B36DC7DE1CFB837791ECB9EEE39B5FA253E94746D4BA268230E4F1A364E73DA78DBC7D59F90D3F96E78646D528C1DB915FD4F1911E8DD68C1DA20893B3304837B634B1145AB355A9DF2B74846EE18361E7969E42D7E5BAC483AE2B4FE3E1F399C609332CC4CC9EFD4BF93AA6FDE7F52284E33C7F0F1CE39338537BF0E9C6C5AF22B59B4F25A33A76E11ED3AE766F13CA48E620F284ADA38E71CE39CD842C522D62133DA90FB36AC656B36C9F1B546A2EE32E50BAE3FD9716BD87AB3ED2F424DBF4B80C9688E5AD79FADC7F3145D4BDAD4056B6A96899AD3B2AB5367DD5024DB13826224F1BF8E7FB2E29CFE9BBB1B1CDB099AEA81B2622C1EAF2D1D091F71F02765B6C32B7B20B068417EC97D5160DB61355AECF648DEAE2FD6A84E2979FBD6696F1A760CC8729B26C7461C3B304D83441E19E64D012DC046192B36C1EC5B1D5870EC62EC956B158298A770C6299C60F9AF76A98ED69B4F8111C67B5633B63C464D2D5885CD35A0EE49B8EC39ED8F922BD6D31C32802922A3B5E7B63F0CAD2D7CAD66F30AB13914B4C64D26B9CB3C32D1CB34096F1601699DB9A3F7857E9975CFF7B9B1D9F4EE8EBC2A876EF81AA23136D4E9D13AA6DF7DC5A21863BD8A7DCEC3574673482B817F87BEB5F61BA46A35D0C432FA8A4693EE4D9DB1DF467056B5D586AE6F1801A7569D675DAFD65FBDDFAFC87D2F18D66CD9666A4D98A4BFBDF0D66DA786D2D02D826FEABB40A16E5D56A1F3B6CEFBEE0782CD2E225379B474899D5702D0FE1EFAD702D16BA42D2E927AD85CC188AFC44C519B4922426D912D4D72A196187DB847362EC2AB1EB1B0D6E938FA6EE42CCAFF00BE060A0C292C5B84E50C95C60B4ABACD0613901629886BFA8B99668F629D829F284B0E427202DEA2E656F349F51732182C1BD45CCB5A6F6BBAC9294258766192B396BDAD10E1EA11BAC0A85718357FE87FFFC400281100010400030607000000000000000000010002031104122110131431406122304142516070FFDA0008010211013F01FAC36273B5016E24F84E639BCFA102F9264B2B05008E2A51E8A10643BC7AC545EF1D0612F368A69CB4D3422E7CC694CE0D1BB6A6B1B932DA91991D5E7C58911E8171FD971DD93A5B3AA1251D1493893A00DBD994AAF121CFF00FFFC400221100020005030500000000000000000000000102101112211330404251607071FFDA0008010111013F01F18A955C3A22D43C6085F022123085DE4B7DC069B34CB5969635BFF4714AE4748FD01FFFC4003E10000201020304060706040701000000000102000311122131132241510410324061912333425271728114303462A1B15092C1E12024435360738283FFDA0008010000063F02FF008DED29592A5BE862A545C2D8864654215469C3C61A950DA90FD6042AA0F20B732EA8ACBF0B110A6ABAA994FE611AAB52042F84C6B4D483C6D62237455392EADE13132AFC48B930AA229E60AC57A2371CDADC8CC75C0A8DA9BE8220A1AA9F76DDE00F186A5AE16D9457166B6878ACA9F4FDE53B78FEF2A62F0B7C25573D96394A6A350B9CA7F308F4AF6C43598317D3899D2EAB76988940FB39C0C34506F067BD8C5A2D2A82D57F431BA42AE171ADB8F785274BCA94E9D5BB1E16331D26B18508C35491942A462A4DC3941B52A7E6498680C7C85AC235473766884E8184A8B4AB6F91958199C1513EA39CB55DDFCACB79E87C916D313640764452AA0391BC11261B61A6387398373ED183DDCEF1BED5831E2CAEB7950F48C3B3B1B5C5E31E8F6D9E5A0B77DD0CD0FF0004B9F46BCDA6F06A87C7213728D35FFCCFED3FB4F49429B7D26E16A2DE39898B0E34F797BFE0A6B7FE901B63A9EF1973325F39AF94E3E7356F399379CDE5FA8974394BD31B2ADFA1852A2E161DF0227D4F2829A8CB8F8CB0FB8B8DD6E730B0B370E466CAA64E3B2F0D3A8331DE828199D204199F68CB0EAC4DFA4D1FCA68FE5347F29A3F94C6D90B5E075D0F5616194C0DAF03CE11FEBA68658F796AEFC3259975DC28C034CE76079CEC8F39D81E731D5192E9362BA0ED4D8B1DD6D3E3D76D0EA0CC7A119309B741BAFAFC7BCD3A4BF09F0CBAB0BBD8CF593B73B70ECDAF6971DA39096D598C2A726133EDAE47AC370A997D6327D4778585BDD17EA2C14B11C04352AD322FC4F57A969EA9A5B9664C2DECFB336EC3E598E9D45C6322207E1C6061983D4C78AEF08AC230F1EF155B9903AF0AF6126D2A3280BA5CCF5A9E73D6279CD9536BDF52204E1ED4C145092D964349EA9FCA6F295F889F6763F2F511CE27D3BC187FECEAC080E37E5C2761BCA761BCA761BCA761BCA761BCA67DB3AF595F6866B2E11C329E503DAC788EA4F133E9DE2A783756CA9D2351B8C14AAD234CB6936494B1E5169D5A3B3C5A4D953A78DA0A7569602DA4D9252C66D169D6A269E2D235FA36E83DA8A1BA39543ED46147A397038C64D961A8BC2F0B916B09469F25BC3DDC19569F31796E59435E9263B888BD2282ABFB2663C25AC3412895A6CA175BC3F2CE8D15C296217494BD1E1D9EB78F297CB2A0A74438637BCA98E884ADC6D053FF0070DA3B7084F78A6FFF00932FC1BF786AD252EA46978956A53C0120A984E0B6BD5B7A498F294EA55A780244A814E0B6B12BD252CA7B568CA8311E529AB0B10B1D453DAA93706F2A57AAB84BF08F5796E27F532DCFBCD8E86616D7430A37687EBF77B243BC753EE896C36A682C25F870EF5818E7FBCB83661A198586171C3EE7026F54FD17E30E7727366E7364A7E6EF1602F2F84DA5F035BE132811C1C7CEDACB37D0F11378635F7975F29BAC0FF86EC6D32BD25E67B466141FDE14A61B17136D3AB204F775A950D96C61A43B66A9623C21FF00A47EDD549D50B914C594718ABD23A31A7973CE621CA6F2E7CF432C276970F2B672D06FB28E4B2C04D256E8F6B2A0F3953A31A7928BE29469801438BBDA7A0E8C580E0918DAD9E9DE3FF88FDBAA8ECED8F662D7D253AB5F6798C2304620D8E11029B3FC67A5C37F0305246B9F0D2015316223808010CA1B204F08BF6770ADC631ACE311DE769D22A0D1972FD257E8ED962B153F4895A8BDB68F6CCE867F9974C438895CF45008D61522C46BDDF646A7A3B61B5869D4A8956CAA2C32100ACF880F09B27A974395AC3AACF59ADCA0A94CD986903566C4465A75615AC6DE39CB55AACC3942D49B09D26D5DAEE38C151DB7974E427A4ACC472E12BE4768C374CB9D4EBDC6C27A8ABFCA65CD1A961F97A812A403A1B6B316C6A61E786591198F80BCC2EACA79113D4D4FE5981918372B755D29BB0F012C8A58F84BEC6A5BE5EA38549B6B612CA0B1F09EA2AFF2C2429CB5F0EA17522FA426C6C3AAC458CBAD3723C04DEA4EB7E6211B1A97199DDFBE47F74DE54F47830F8CADD17644E586F7E626DABE12F6B927458A94C31C27B46201A9A71DEA80015B6B07CA2034296D1AFA5E53DAA8470C3286A53B255FD0CA94EA290C2A1957E5FEB2B05E8E0D10BDBBCDB56F56341CE1A2067A6141A44B7232D47A38A896B96263D3636AB51B8E861AF61878278C45A6713A6A78422A0F5D99F8708DB61B948FF3415C68FAFC62DB3D651FB45014C62C4339D2985ECF4C2A65F7F5FE92A9F11FB4B06DC7E5C21ABB5C401D2D29B0D425E32D423085BD8083E513D0950DF984A26AB2967CF76512B9A90712F39B446D0660EA255F93FACA888F4853616CC6705307793512A3161515B4C423002C3FB4B517A6AA46788465BE6865571AE194E97BC6501EC93623F2CC4A4177EC4CB565C43E3179DCC5A959E99C07D91DC0ECAA14BEB685DDB131D4CBD3764F81982A55665E5366B55825AD685A93943E131D462CDCE7E21E2D53558D45D0C1B572F6E72E8C54F842693943E13F10F312920F313F10F36C2A1DA7BD3F10F0B13727330A35562A7840CA4861C445DAB62C22C228637B643C26C56A154E4260A75595790982A55665E5FC47FFC4002B100100020103020505000301010000000001001121314151617110408191A1B1C1D1F0F12030E15060FFDA0008010000013F21FF00E6F462F657F389FC2EEE47365E40E12E41758D5F109AFDF5C32C3262CB0FB4B5361D413F45CC60ABB40DCD006A97132A96F82110634CED2E330D1DA88BA4EA1125B976087A836EB43CC0B6D110DFC611DEA654188EB4F97F4A6CEE5DED066D9B7A109840F75469327DCCFD373389FB0BA802F33395BC4A48ED7067FE4D61D2F5C4249CD61D0A2F631D41F83F8C18079B19F98668405864AB550DE1967C6F78FF006E0347AC5A6CB772E48B541A0CA7C4CED82828CBBB2B584FA905F59A7E6543F48D5695E65683B268389BA76AA8BD32DF5A86C8C71DA06C8E1B3516D59617E5312314FCDA8381ABE52A8E92ECCF43AEF12AAB5A6269C794B97E16E9E37E29D1BD227A97A78665BE17E172D96BE6AA0018BDD7B1289EB77C043EBB0471E3B43B8D9D63EDE56077B70804B0EE247CF1AB0DDD8759E8A83076201961F9917DDFA2A59ABEF476C3D73F07DCE2DEEC781BBB8960086D5360F9CA28E5B4139695265F2C15CBCF10CCEAF2FF009E72E83EFCC09D7A1F0782D55533E6EBE6AF2CF425706AF2303EF300182679D5D50CBFE1CA13FE1CAFC4597B4572CECF075622E1DEBE3FE6154065E6E919029309E66AD7DD6ECD835C1285783CD093F5FF0080090122320BBB667BDFEA789F86460F0BEBD2F44C40A5AE81DE10A1B2F300A03566E2B1EA8260D317850353753A0F667E927EB19DE87884DC13D60417EE0C2C6CD4A1BFE8DF8D71A56EDD3E25F7AD7A9E6331D9B99068F14184C031A8C4AED6604DFF008608819F9203B853AA8FB0B03A4D6DB57E500B3893AC36E749E488480B1F0AD3F0115694BE6080C9E9E2E5A1ACCD19B1D59B01B3519B1F067F1904C03266DC4EF32BA43C4AAED67F6F298BED304CEF55F8C19D242476F7C20CFB797F89304FD69E1725C023443FECE7F6B3FBD9FDECD83DFCAF29AAFED2A54EB9238614D522F865F4F4D0D18B331FDDCB34FCB9D5792587D7FA4BB253712E3916923B3AA3AE624658650CA6BB48EB6400B058CE621ECE94B94C612D30680DE78893FEB28E65A8E28B65554E23E5AE477D2C797EE941B9B03E91AAB5CD0F10AAA34A1DD26DB0F26917A8DA13F43A415FA6F318B41DF5855B2ECAC93E51F587DACABE35682A1CCF7129AD4576D581638347627501F316238FAB157D1C53C1DB47832F7064F1D25626A3CA571078408242AEDDE62B2261FF00AA509520413881177620542944E97A0EFBFA7B45E663E64F4DC6F49B411FF48AEE7E8E7C2BC2A54AF05468F0B02877F33DF8820610F497A34E3CD293812BB200E25DD2351F71C901FE348F8762B9469F27E100213EC6AE5CBDF3EDE62C09701712586D57511EA8B8492A91D48599B3426A0513218EC4DEDC17CBF096A07A3E3B2C6381EF06C383FB06D0CF6176EEAEB3AB84552E5980ED05C14F96C601178C45834C1A2575F151C93D003C6DB7D277C04894874FEA422B1AF79ABD5BA948D4F3256F0994AB80B57A06F110F423B4A414F376E47E63E5AF4BD0D7DE549106FD62EC4487FEC232853D1E586A5B35FF006C3C0E13D6356F28486813B677EF1470569DC8C2DED0EBF7883A01D68853296326B98672B41B5324F030214856038B3BC47F25874F584DD25ECB82684B946988F3115BB1FA419C7A395D61B97DA3A0FCC54CBA0ECF97D6D52CDE6122069135C4D3022BA2AD10E65B7F4D307C4DF27D5752A62A8D0C7A421EA76943EA81FB003DA5C8D2CD0E2197D2A2569177D835FA10D4EB257B2340C6368EF193AB5A77F22C40AB8037894A580C2D5589BCD7AF6508A6511745551D0916926FD6F098368FEB84D0F474658AF79526B0AE91A166C2E672AD95BC60C8B179152DBCEC2D9A237AE2A89AE1F2842D166EC559042A516D69E0A8C0D449D55D2B0612951696C58C0345B075FF007620BA69D986E8B0EB6BB82932F4FC4F586843B058CBCBC2A2A6BAD03E6574D0A2EF3F65D61347038B1CCA0D6D2DD56677207EACC14D07B13E5FE89AC7B0DB59C4A31928F7FE206046468A7130FB32A6A621A7899C2461D82585AB7460E7DA3B05A01A27EF6A3F284E055E8B694D76FB11A42C3539CCA6D78D75AFECEE4260E75F7FF7EBFDF79D224F84488435595168E41A2E626B863E6609D2A19B27EEFAC0C5FB5B8A8981868A34AFB4D7FB84208ACE49CAFA2605052C651BA6F65BB87D8F0B53300305E025DD0A875B9B315B3919AACC1EF8FBC32F03D0DE0C41DA807F214307ABACBE695D11FB505331837DE10BE9073596FF00BFEAF291716A8DE5899D88B92B36860228E98D0094BC2620555A7F626AA60F689A734F098AC356A346252F09FD995D6F44A498ABE58F817EA84868CBB1DD825DA95BCD3AE981228AF58545420E574710BDE2BA1F3030EE90DE2959FF00D1FFDA000C0300000111021100001000000000C208000100308000000000000000018130C1C100A34300000000000000000C2C514908E384080000000000000001186AE18230800000000000000000030467DFDD39400000000000000001C6FB8F8E462128000000000000000318D0DFFA8D08750000000000000002DD5DF38BAAF6BF40000000000000004872B87D2B622A00000000000000014460A30210DC7800000000000000000D3508CA8BA5080000000000000001041033A20EE30700000000000014804A08228F0833C004A00000000004D0CC2832CE14F0C92C200000000000000000000000000000000000FFC4001F1101000202020301010000000000000000010011213130412060617151FFDA0008010211013F10F582ED24FB628029888D3CFDC5742D83714F90EB407E4E8E1A802697996886A2351FACCDE56F10932880317F66721888E366A1AE3750310842D66D489834084EACACA9564801664EE3A86B907A8D8E2F71137AB88E4AEE36DF570C8D62A040171DD736FC581CC15E35EB1FFFC4001F1101010100020203010100000000000000011100213031411060612040FFDA0008010111013F10FA2DD743FC2837ED847C6B8E749DCB32CD5C2FBCC1191E1EF7CE89CE34AB8390C6D595B4CA970F73257715D72E254F1972A71805C1DC44F0F180087ADFB7D6000F732F02F3701159AF1DD3F89833DF3E0F8BF58FFFC400291001010002020202010402020300000000011100213141516171819140A1C1D1B1F0103050E1F1FFDA0008010000013F10FF00CA4FFC31C3FDE10AC40859D872F67D9DE18E941C93B3A47C94715491064BD8171A8138E0630F414AFD1E446628243C92C672BBCADBEB9625280A29FB7262DD5EBCBB37EC447F3DE387A88B4F5CA2AAEE8A1AA05DF9C116198B3928089F67C996776B39C114ED44279F58A91A40F04517DC2061B52C3EC4A09B2CE1D64400A4AD3805DC77CF09ECC2B30C51854ED0DED15F0623F0146B26985D87EA0065113C8A6B122AD04510A3E41BF590E81680118F671B1D3F8710B3CBC9E70E4D575EBD8F7263BC0B2F7108F8A27C8E1500DBC20D4F5B0BE6F8C318B80E4285FC2E7FB9F1C442B4F01478D5E306FB5D65FB871745D0018411043BD301F000BEB21144B720EBF286BE1C6C478780480FB578F4BD61652B1CD4B4F89FE30F2B42CA0551394163AF78E6BF4602044E2EED37CDBFF33F4A9045D96022B971AD2B215DA0702E1F2DA66C7941C27ACD8E8A490D43E35C3B29CF38031A24248D74A80232C38C5727E3B3A53E9994A8C5253E419E8335F81443C00740001E0CB52C2E802BF831CBB0899A70C4EFB32B62E52ABF6E7024AB45ED5F811E9314501120BE9047D3A7E3194C6EAD269540FB6E14335BA15AABDAEABE8C4E25D012A2A04B4B5C3446DD0AE97DA741A2BCF389D9ED6B44BD579DDFBC50C0572F3050A3AC2C0A82822C00A32F5832A08A50031026EF5FA4117DE579EA7FC6AD99E30538C55EF2BCE47C3F8C14E3367F14DCBBA8E6A260A3ACABCE8990EF1572A4B8B72B169EB1E637F54366F9C16994040F4EDFB8600428AEF3D6C9F2E0014709AFE5173495010009F831021372123F498420CBB67F311C70B1B45DFBD87DE301BE1923CA727D9304EC7E3F5C01395F5DC5747FA6)
SET IDENTITY_INSERT [dbo].[Foto] OFF
SET IDENTITY_INSERT [dbo].[HistorialDatosEgresado] ON 

INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (1, 1, N'q', N'q', NULL, N'q')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (2, 9, N'PerfilFacebook', N'j', CAST(0x0000A39900408EB3 AS DateTime), N'P')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (3, 1, N'TelefonoPrincipal', N'012234567', CAST(0x0000A3A0001F9A08 AS DateTime), N'U')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (4, 1, N'PerfilLinkedIn', N'https://pe.linkedin.com/luislopez', CAST(0x0000A3A0001F9A2A AS DateTime), N'U')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (5, 1, N'PerfilFacebook', N'luislopez@facebook.com', CAST(0x0000A3A0001F9A2C AS DateTime), N'U')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (6, 1, N'TelefonoAlternativo', N'964406650', CAST(0x0000A3A30111C74F AS DateTime), N'U')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (7, 1, N'Direccion', N'Av. Callejones rojos 4500', CAST(0x0000A3A30111C753 AS DateTime), N'U')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (8, 1, N'PerfilLinkedIn', N'https://pe.linkedin.com/luislopez55', CAST(0x0000A3A30111C755 AS DateTime), N'U')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (9, 1, N'TelefonoPrincipal', N'011111111', CAST(0x0000A3A40153A28D AS DateTime), N'U')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (10, 1, N'PerfilFacebook', N'', CAST(0x0000A3A601773CA1 AS DateTime), N'U')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (11, 2, N'Correo', N'luis@gmail.com', CAST(0x0000A3C9014C23D3 AS DateTime), N'U')
INSERT [dbo].[HistorialDatosEgresado] ([ActualizacionID], [EgresadoID], [CampoActualizado], [ValorNuevo], [FechaActualizacion], [Origen]) VALUES (12, 2, N'PerfilLinkedIn', N'https://pe.linkedin.com/luislopez55', CAST(0x0000A3C9014C23E3 AS DateTime), N'U')
SET IDENTITY_INSERT [dbo].[HistorialDatosEgresado] OFF
SET IDENTITY_INSERT [dbo].[Interes] ON 

INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (1, N'Realidad Aumentada')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (2, N'Unity')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (3, N'Cinema 3D')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (4, N'Seguridad2')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (5, N'Animación 3D')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (6, N'Activismo')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (7, N'Veganismo')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (8, N'Carnivorismo')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (9, N'Consultoría')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (10, N'Realidad Virtual')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (11, N'Game Design')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (12, N'Carne')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (13, N'Yogurt2')
SET IDENTITY_INSERT [dbo].[Interes] OFF
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (2, 1)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (2, 2)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (2, 4)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (2, 6)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (3, 2)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (3, 4)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (4, 7)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (4, 6)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (7, 7)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (8, 1)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (8, 2)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (2, 1)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (2, 2)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (2, 4)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (2, 6)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (3, 2)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (3, 4)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (4, 7)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (4, 6)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (7, 7)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (8, 1)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (8, 2)
INSERT [dbo].[InteresxEgresado] ([EgresadoID], [InteresesID]) VALUES (2, 13)
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (1, N'Afganistán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (2, N'Islas Gland')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (3, N'Albania')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (4, N'Alemania')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (5, N'Andorra')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (6, N'Angola')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (7, N'Anguilla')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (8, N'Antártida')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (9, N'Antigua y Barbuda')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (10, N'Antillas Holandesas')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (11, N'Arabia Saudí')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (12, N'Argelia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (13, N'Argentina')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (14, N'Armenia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (15, N'Aruba')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (16, N'Australia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (17, N'Austria')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (18, N'Azerbaiyán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (19, N'Bahamas')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (20, N'Bahréin')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (21, N'Bangladesh')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (22, N'Barbados')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (23, N'Bielorrusia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (24, N'Bélgica')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (25, N'Belice')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (26, N'Benin')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (27, N'Bermudas')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (28, N'Bhután')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (29, N'Bolivia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (30, N'Bosnia y Herzegovina')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (31, N'Botsuana')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (32, N'Isla Bouvet')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (33, N'Brasil')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (34, N'Brunéi')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (35, N'Bulgaria')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (36, N'Burkina Faso')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (37, N'Burundi')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (38, N'Cabo Verde')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (39, N'Islas Caimán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (40, N'Camboya')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (41, N'Camerún')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (42, N'Canadá')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (43, N'República Centroafricana')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (44, N'Chad')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (45, N'República Checa')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (46, N'Chile')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (47, N'China')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (48, N'Chipre')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (49, N'Isla de Navidad')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (50, N'Ciudad del Vaticano')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (51, N'Islas Cocos')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (52, N'Colombia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (53, N'Comoras')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (54, N'República Democrática del Congo')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (55, N'Congo')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (56, N'Islas Cook')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (57, N'Corea del Norte')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (58, N'Corea del Sur')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (59, N'Costa de Marfil')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (60, N'Costa Rica')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (61, N'Croacia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (62, N'Cuba')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (63, N'Dinamarca')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (64, N'Dominica')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (65, N'República Dominicana')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (66, N'Ecuador')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (67, N'Egipto')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (68, N'El Salvador')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (69, N'Emiratos Árabes Unidos')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (70, N'Eritrea')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (71, N'Eslovaquia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (72, N'Eslovenia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (73, N'España')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (74, N'Islas ultramarinas de Estados Unidos')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (75, N'Estados Unidos')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (76, N'Estonia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (77, N'Etiopía')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (78, N'Islas Feroe')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (79, N'Filipinas')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (80, N'Finlandia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (81, N'Fiyi')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (82, N'Francia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (83, N'Gabón')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (84, N'Gambia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (85, N'Georgia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (86, N'Islas Georgias del Sur y Sandwich del Sur')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (87, N'Ghana')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (88, N'Gibraltar')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (89, N'Granada')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (90, N'Grecia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (91, N'Groenlandia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (92, N'Guadalupe')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (93, N'Guam')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (94, N'Guatemala')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (95, N'Guayana Francesa')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (96, N'Guinea')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (97, N'Guinea Ecuatorial')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (98, N'Guinea-Bissau')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (99, N'Guyana')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (100, N'Haití')
GO
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (101, N'Islas Heard y McDonald')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (102, N'Honduras')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (103, N'Hong Kong')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (104, N'Hungría')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (105, N'India')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (106, N'Indonesia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (107, N'Irán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (108, N'Iraq')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (109, N'Irlanda')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (110, N'Islandia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (111, N'Israel')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (112, N'Italia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (113, N'Jamaica')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (114, N'Japón')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (115, N'Jordania')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (116, N'Kazajstán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (117, N'Kenia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (118, N'Kirguistán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (119, N'Kiribati')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (120, N'Kuwait')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (121, N'Laos')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (122, N'Lesotho')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (123, N'Letonia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (124, N'Líbano')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (125, N'Liberia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (126, N'Libia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (127, N'Liechtenstein')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (128, N'Lituania')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (129, N'Luxemburgo')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (130, N'Macao')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (131, N'ARY Macedonia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (132, N'Madagascar')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (133, N'Malasia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (134, N'Malawi')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (135, N'Maldivas')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (136, N'Malí')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (137, N'Malta')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (138, N'Islas Malvinas')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (139, N'Islas Marianas del Norte')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (140, N'Marruecos')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (141, N'Islas Marshall')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (142, N'Martinica')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (143, N'Mauricio')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (144, N'Mauritania')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (145, N'Mayotte')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (146, N'México')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (147, N'Micronesia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (148, N'Moldavia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (149, N'Mónaco')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (150, N'Mongolia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (151, N'Montserrat')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (152, N'Mozambique')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (153, N'Myanmar')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (154, N'Namibia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (155, N'Nauru')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (156, N'Nepal')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (157, N'Nicaragua')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (158, N'Níger')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (159, N'Nigeria')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (160, N'Niue')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (161, N'Isla Norfolk')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (162, N'Noruega')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (163, N'Nueva Caledonia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (164, N'Nueva Zelanda')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (165, N'Omán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (166, N'Países Bajos')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (167, N'Pakistán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (168, N'Palau')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (169, N'Palestina')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (170, N'Panamá')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (171, N'Papúa Nueva Guinea')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (172, N'Paraguay')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (173, N'Perú')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (174, N'Islas Pitcairn')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (175, N'Polinesia Francesa')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (176, N'Polonia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (177, N'Portugal')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (178, N'Puerto Rico')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (179, N'Qatar')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (180, N'Reino Unido')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (181, N'Reunión')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (182, N'Ruanda')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (183, N'Rumania')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (184, N'Rusia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (185, N'Sahara Occidental')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (186, N'Islas Salomón')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (187, N'Samoa')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (188, N'Samoa Americana')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (189, N'San Cristóbal y Nevis')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (190, N'San Marino')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (191, N'San Pedro y Miquelón')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (192, N'San Vicente y las Granadinas')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (193, N'Santa Helena')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (194, N'Santa Lucía')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (195, N'Santo Tomé y Príncipe')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (196, N'Senegal')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (197, N'Serbia y Montenegro')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (198, N'Seychelles')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (199, N'Sierra Leona')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (200, N'Singapur')
GO
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (201, N'Siria')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (202, N'Somalia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (203, N'Sri Lanka')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (204, N'Suazilandia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (205, N'Sudáfrica')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (206, N'Sudán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (207, N'Suecia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (208, N'Suiza')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (209, N'Surinam')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (210, N'Svalbard y Jan Mayen')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (211, N'Tailandia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (212, N'Taiwán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (213, N'Tanzania')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (214, N'Tayikistán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (215, N'Territorio Británico del Océano Índico')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (216, N'Territorios Australes Franceses')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (217, N'Timor Oriental')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (218, N'Togo')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (219, N'Tokelau')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (220, N'Tonga')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (221, N'Trinidad y Tobago')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (222, N'Túnez')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (223, N'Islas Turcas y Caicos')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (224, N'Turkmenistán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (225, N'Turquía')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (226, N'Tuvalu')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (227, N'Ucrania')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (228, N'Uganda')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (229, N'Uruguay')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (230, N'Uzbekistán')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (231, N'Vanuatu')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (232, N'Venezuela')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (233, N'Vietnam')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (234, N'Islas Vírgenes Británicas')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (235, N'Islas Vírgenes de los Estados Unidos')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (236, N'Wallis y Futuna')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (237, N'Yemen')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (238, N'Yibuti')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (239, N'Zambia')
INSERT [dbo].[Pais] ([PaisID], [Nombre]) VALUES (240, N'Zimbabue')
SET IDENTITY_INSERT [dbo].[RegistroAcademico] ON 

INSERT [dbo].[RegistroAcademico] ([RegistroAcademicoID], [EgresadoID], [NombreInstitucion], [Nombre], [Duracion], [Descripcion], [TipoEstudio], [PaisID]) VALUES (1, 2, N'UPC', N'Ingeniería Software', N'5 años', N'Una larga carrera universitaria', N'Pregrado', 173)
INSERT [dbo].[RegistroAcademico] ([RegistroAcademicoID], [EgresadoID], [NombreInstitucion], [Nombre], [Duracion], [Descripcion], [TipoEstudio], [PaisID]) VALUES (2, 2, N'Cibertec', N'Ciencias de la compuación', N'1 - actualmente', N'Interesante', N'Técnica', 173)
INSERT [dbo].[RegistroAcademico] ([RegistroAcademicoID], [EgresadoID], [NombreInstitucion], [Nombre], [Duracion], [Descripcion], [TipoEstudio], [PaisID]) VALUES (3, 3, N'Britanico', N'Ingles', N'2 años', N'Muy bueno', N'Técnica', 173)
INSERT [dbo].[RegistroAcademico] ([RegistroAcademicoID], [EgresadoID], [NombreInstitucion], [Nombre], [Duracion], [Descripcion], [TipoEstudio], [PaisID]) VALUES (4, 3, N'Sistemas UNI', N'Curso de Android', N'4 meses', N'Dificil', N'Ténica', 173)
INSERT [dbo].[RegistroAcademico] ([RegistroAcademicoID], [EgresadoID], [NombreInstitucion], [Nombre], [Duracion], [Descripcion], [TipoEstudio], [PaisID]) VALUES (5, 4, N'San Martin de Porres', N'Seguridad de la informacion', N'2 años', N'Dificil', N'Maestria', 173)
INSERT [dbo].[RegistroAcademico] ([RegistroAcademicoID], [EgresadoID], [NombreInstitucion], [Nombre], [Duracion], [Descripcion], [TipoEstudio], [PaisID]) VALUES (6, 8, N'ICPNA', N'Ingles', N'2 años', N'Facil', N'Técnica', 173)
INSERT [dbo].[RegistroAcademico] ([RegistroAcademicoID], [EgresadoID], [NombreInstitucion], [Nombre], [Duracion], [Descripcion], [TipoEstudio], [PaisID]) VALUES (7, 8, N'Universidad San marcos', N'Ingeniería de sistemas', N'6 meses', N'Dificil', N'Titulo', 173)
INSERT [dbo].[RegistroAcademico] ([RegistroAcademicoID], [EgresadoID], [NombreInstitucion], [Nombre], [Duracion], [Descripcion], [TipoEstudio], [PaisID]) VALUES (8, 2, N'Sistemas UNI', N'SQL Server', N'3 meses', N'Divertido', N'Ténica', 15)
INSERT [dbo].[RegistroAcademico] ([RegistroAcademicoID], [EgresadoID], [NombreInstitucion], [Nombre], [Duracion], [Descripcion], [TipoEstudio], [PaisID]) VALUES (9, 2, N'ICPNA', N'Ingles', N'2 años', N'Dificil', N'Ténica', 15)
SET IDENTITY_INSERT [dbo].[RegistroAcademico] OFF
SET IDENTITY_INSERT [dbo].[RegistroLaboral] ON 

INSERT [dbo].[RegistroLaboral] ([RegistroLaboralID], [EgresadoID], [NombreTrabajo], [Cargo], [Duracion], [Descripcion], [NombreJefe], [JefeCargo], [TelefonoContacto], [CorreoJefe], [PaisID], [TrabajoActual]) VALUES (1, 2, N'BigData', N'Desarrollador', N'Diciembre 2014 - Enero 2015', N'Desc 1', N'Jefe Supremo', N'Gerente general', N'98545163', N'jefe.supremo@gmail.com', 173, 1)
INSERT [dbo].[RegistroLaboral] ([RegistroLaboralID], [EgresadoID], [NombreTrabajo], [Cargo], [Duracion], [Descripcion], [NombreJefe], [JefeCargo], [TelefonoContacto], [CorreoJefe], [PaisID], [TrabajoActual]) VALUES (2, 2, N'ReallyDev', N'Master Scrum', N'4 meses', N'Buena', N'Elio Navarrete', N'Analista ', N'5555555', N'elio@ra.com', 173, 0)
INSERT [dbo].[RegistroLaboral] ([RegistroLaboralID], [EgresadoID], [NombreTrabajo], [Cargo], [Duracion], [Descripcion], [NombreJefe], [JefeCargo], [TelefonoContacto], [CorreoJefe], [PaisID], [TrabajoActual]) VALUES (3, 3, N'RC', N'Desarrollador', N'1 año', N'Buena', N'Carlos Cruz', N'Jefe de área', N'2333455', N'ccruz@gmail.com', 173, 1)
INSERT [dbo].[RegistroLaboral] ([RegistroLaboralID], [EgresadoID], [NombreTrabajo], [Cargo], [Duracion], [Descripcion], [NombreJefe], [JefeCargo], [TelefonoContacto], [CorreoJefe], [PaisID], [TrabajoActual]) VALUES (4, 4, N'UPC', N'Profesor', N'5 meses', N'Interesante', N'Jose Anti', N'Jefe de área', N'4244543', N'janti@gmail.com', 173, 0)
INSERT [dbo].[RegistroLaboral] ([RegistroLaboralID], [EgresadoID], [NombreTrabajo], [Cargo], [Duracion], [Descripcion], [NombreJefe], [JefeCargo], [TelefonoContacto], [CorreoJefe], [PaisID], [TrabajoActual]) VALUES (5, 4, N'Nextel', N'Administrador de base de datos', N'3 años', N'Interesante', N'Rodrigo Zuñiga', N'Jefe de área', N'984454234', N'rzuñiga@gmail.com', 173, 1)
INSERT [dbo].[RegistroLaboral] ([RegistroLaboralID], [EgresadoID], [NombreTrabajo], [Cargo], [Duracion], [Descripcion], [NombreJefe], [JefeCargo], [TelefonoContacto], [CorreoJefe], [PaisID], [TrabajoActual]) VALUES (6, 8, N'Claro', N'Analista', N'9 meses', N'Buena', N'Jose Barco', N'Jefe de área', N'983432422', N'jbarco@gmail.com', 173, 1)
INSERT [dbo].[RegistroLaboral] ([RegistroLaboralID], [EgresadoID], [NombreTrabajo], [Cargo], [Duracion], [Descripcion], [NombreJefe], [JefeCargo], [TelefonoContacto], [CorreoJefe], [PaisID], [TrabajoActual]) VALUES (7, 7, N'Movistar', N'Consultor', N'10 meses', N'Interesante', N'Cesar Marcial', N'Jefe de área', N'2334455', N'cmarcial@gmail.com', 173, 1)
SET IDENTITY_INSERT [dbo].[RegistroLaboral] OFF
ALTER TABLE [dbo].[Pais] ADD  CONSTRAINT [DF__DIC_Pais__NOMBRE__3BCADD1B]  DEFAULT ('') FOR [Nombre]
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
ALTER TABLE [dbo].[Egresado]  WITH CHECK ADD  CONSTRAINT [FK_Egresado_Foto] FOREIGN KEY([FotoID])
REFERENCES [dbo].[Foto] ([FotoID])
GO
ALTER TABLE [dbo].[Egresado] CHECK CONSTRAINT [FK_Egresado_Foto]
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

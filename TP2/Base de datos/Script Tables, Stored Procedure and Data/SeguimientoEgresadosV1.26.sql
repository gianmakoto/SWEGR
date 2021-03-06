USE [master]
GO
/****** Object:  Database [SeguimientoEgresados]    Script Date: 28/10/2014 05:58:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarAptitud]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarEgresado_DatosExtraidos]    Script Date: 28/10/2014 05:58:12 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Magah Suarez
-- Alter date: 28/08/2014
-- Description:	SP para actualizar los datos que se han extraido de los egresado por su codigo 
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_actualizarEgresado_DatosExtraidos]
	@idegresado int,
	@telefonoprinegresado varchar(15),
	@telefonoaltegresado varchar(15),
	@correoegresado varchar(50),
	@correoaltegresado varchar(50),
	@direccionegresado varchar(100)
AS
BEGIN
	SET NOCOUNT OFF;
  
	UPDATE
      Egresado
	SET
		TelefonoPrincipal = @telefonoprinegresado,
		Correo = @correoegresado,
		CorreoAlternativo = @correoaltegresado,
		Direccion = @direccionegresado,	
		TelefonoAlternativo = @telefonoaltegresado
	WHERE
		EgresadoID = @idegresado
END












GO
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarEgresadoDesvinculado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarFoto]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarInteres]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarRegistroAcademico]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarRegistroLaboral]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarAptitud]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarAptitudxEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarFoto]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarFotoxEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarInteres]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarInteresxEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarAptitud]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarAptitudxEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarEgresadodesdeEgresadoDesv]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarFoto]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarFotoxEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarHistorialDatosEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarInteres]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarInteresxEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroAcademico]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroAcademico_DatosExtraidos]    Script Date: 28/10/2014 05:58:12 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Magah Suarez
-- Alter date: 27/10/2014
-- Description:	SP para insertar un nuevo registro acadÃ©mico
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_insertarRegistroAcademico_DatosExtraidos]
	@idegresado int,
	@nombreinstitucion varchar(100),
	@nombre varchar(50),
	@duracion varchar(30),
	@descripcion varchar(500),
	@tipoestudio varchar(100),
	@idpais int
AS
BEGIN

if not exists(select * from RegistroAcademico where NombreInstitucion=@nombreinstitucion AND Nombre=@nombre AND EgresadoID=@idegresado)
BEGIN

	INSERT INTO
		RegistroAcademico(EgresadoID,NombreInstitucion,Nombre,Duracion,Descripcion,TipoEstudio,PaisID)
	VALUES
		(@idegresado,@nombreinstitucion,@nombre,@duracion,@descripcion,@tipoestudio,@idpais)
	RETURN
		@@IDENTITY

END

ELSE
BEGIN
	RETURN	-1
END
END












GO
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroLaboral]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroLaboral_DatosExtraidos]    Script Date: 28/10/2014 05:58:12 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Magah Suarez
-- Alter date: 27/10/2014
-- Description:	SP para insertar un nuevo registro laboral
-- =============================================
CREATE PROCEDURE [dbo].[SWEGR_insertarRegistroLaboral_DatosExtraidos]
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
if not exists(select * from RegistroLaboral where NombreTrabajo=@nombretrabajo AND Cargo=@cargo AND EgresadoID=@idegresado)
BEGIN
	INSERT INTO
		RegistroLaboral(EgresadoID,NombreTrabajo,Cargo,Duracion,Descripcion,NombreJefe,JefeCargo,TelefonoContacto,CorreoJefe,PaisID,TrabajoActual)
	VALUES
		(@idegresado,@nombretrabajo,@cargo,@duracion,@descripcion,@nombrejefe,@cargojefe,@telefonojefe,@correojefe,@idpais,@trabajoactual)
	RETURN
		@@IDENTITY
END
ELSE
BEGIN
RETURN -1
END
END









GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresado_Lista]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresado_Lista2]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoAnios]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxCarrera]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxCiclo]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxCicloyCarrera]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigo]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCarrera]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCiclo]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCicloyCarrera]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarGraduando]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarGraduando_Lista]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarPais]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarRegistroAcademico]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarRegistroLaboral]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerAptitud]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerAptitudxEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresadoDesvinculado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresadoxCodigoUniv]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerFoto]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerInteres]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerInteresxEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerLinksEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerPais]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerPaisID]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  Table [dbo].[Aptitud]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  Table [dbo].[AptitudxEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AptitudxEgresado](
	[EgresadoID] [int] NULL,
	[AptitudID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Egresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  Table [dbo].[EgresadoDesvinculado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  Table [dbo].[Foto]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  Table [dbo].[FotoxEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FotoxEgresado](
	[EgresadoID] [int] NULL,
	[FotoID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistorialDatosEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  Table [dbo].[Interes]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  Table [dbo].[InteresxEgresado]    Script Date: 28/10/2014 05:58:12 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InteresxEgresado](
	[EgresadoID] [int] NULL,
	[InteresesID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pais]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  Table [dbo].[RegistroAcademico]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
/****** Object:  Table [dbo].[RegistroLaboral]    Script Date: 28/10/2014 05:58:12 p.m. ******/
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
INSERT [dbo].[Foto] ([FotoID], [Foto]) VALUES (2, 0xFFD8FFE000104A46494600010200000100010000FFED003650686F746F73686F7020332E30003842494D04040000000000191C02670014545A61522D6B6633644C6D55325F5135416D455300FFE2021C4943435F50524F46494C450001010000020C6C636D73021000006D6E74725247422058595A2007DC00010019000300290039616373704150504C0000000000000000000000000000000000000000000000000000F6D6000100000000D32D6C636D7300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A64657363000000FC0000005E637072740000015C0000000B777470740000016800000014626B70740000017C000000147258595A00000190000000146758595A000001A4000000146258595A000001B80000001472545243000001CC0000004067545243000001CC0000004062545243000001CC0000004064657363000000000000000363320000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074657874000000004642000058595A20000000000000F6D6000100000000D32D58595A20000000000000031600000333000002A458595A200000000000006FA2000038F50000039058595A2000000000000062990000B785000018DA58595A2000000000000024A000000F840000B6CF63757276000000000000001A000000CB01C903630592086B0BF6103F15511B3421F1299032183B92460551775DED6B707A0589B19A7CAC69BF7DD3C3E930FFFFFFDB004300090607080706090808080A0A090B0E170F0E0D0D0E1C14151117221E2323211E2020252A352D2527322820202E3F2F3237393C3C3C242D4246413A46353B3C39FFDB0043010A0A0A0E0C0E1B0F0F1B392620263939393939393939393939393939393939393939393939393939393939393939393939393939393939393939393939393939FFC2001108039001F403002200011101021101FFC4001B00010002030101000000000000000000000003050104060207FFC4001801010101010100000000000000000000000001020304FFC4001801010101010100000000000000000000000001020304FFDA000C03000001110211000001E988F87595A9A565C2B222E04A000061E7D1900C1900000000000000003477B4669EEBB1CFA59C5ABE4B2861816CBC6812CA2AADF367357BAAF7A9AC96736848BB106BFB2DFD6BECEF9E2392A77CF4A8FA0AAE98B0B4ADE831AE7A6B9153E6E635A9CDBFB29BCDD8A09EE055417998A39ED4644A000000733D2D64400000023923CEA21CFA800319D73C6DE96BD96BE2B7259E29FDADBABBC966C25DB923937CA21BC00000000000000000000071B675DE2DECC480018354DB031911A44BE1E8797AC9E1EC78C4983C3D97C3DE523482348319C132280000000000000000000472569CF47B2CF6E976692EF7C02501CAF55C359DCA3925000000000000000C032000000000000000000001417FC9818F46EDF73DD0F4F3E44018F9EF69C95BD8EDD7D848000000000000001806400000000000188C9400000018E2BAEE41ADB18EDB1D2739D1F4F38401CF68653A5ED95758DE600030685872FD3D99128000000180640000000000062B6CC7256FB9CBD7639E5AFA5DB080014F53BFA4D863AEDF43417DD3CF9108A5A128F67DF9CF6BDB3AAB5DF1080315D63CE578E9E86F90250000000300C80000000000001A3BC38B9ACAAA74B7B9E4B66E7A579F4C81CEEAC91CE98CE319E96577538E9E6B76BEC4B9E43A6E4576E3923C77B8B8AAB5E9E6352196C40E2AF2816F6EEBEC2E4250000000300C800000000000000723D744730D5DACF7F5D372FEAF3EA9E3DDC72F1EC6BCE88A58B3BBCAEDFA7E9C37FA0E4BAD4E735B5B673D9ADB3A32F5FB78AAD70D8A4D9BCD24F1EB9CCDD08377CBA75BE873000000000C0320000000000000000A9A2ECF95B7CB19E7DDD3F319DF2DAD4B5A78F71C98CF5B7A8B1AFE9E7C5DD36C5684CD6E7DF675E1F1AC77557CD763796D9E65D2E7134E8D9AEEA536C5C00000000060190000000000102C9FC25D48BDE61256A6DE348E41C5EC5C504E93E32CF4C6BBCF4E1B6C679F7D98FCD375F345EEDBD67AD4FBB2D3487727B44B39465CE58D02C99478EFE7B2A3BCE9E708000000000C03200000001833AFB14565EC5163AE21B1864B22D492289B76297974095CAF5511CC35B673DDABB50A45B7E7C5CFAAAB3A7D67ADF1E669AAEAAB5AE976BABE57B2B86BEC724CC7298EED7F773AC5BE4BCC0000000000C03200000286B77F86EFCE6DDAB75CFD5A5E4BADF2F54333374A3B1114A0000050D775FC72CA31DE5820EAF7C399AAB0D6B76767525C748BCEC696B377D1EBC579D7D747363A88DA97AB8E4D70000000000000C032000002A780FAAF0DDB1CEE5B1DF17FD9F29D5F97A143679BB625000000C6AED0E367B6A29D269A2D33B8E0FB9E1AE36A6D2DDCF5835F125CF5DCBC8B9F4C419EB9EAFC6DEB8000000000000018064000002A6DAB352B2E2DBD7A39F31BDB7B5CEF3DBD8D9C6A55568E6F4625000000739D18E1F62C79E6EF29E0D8D67D6EE9EE73EB5FEB1E778C6DEBDA241D57BCCC8000000000000006019000000A5BAAFB2D65F15FE8E7AF152CF9AC5C5973D56587B6684A000000022947191EFEA5DC5B95D639DE83D62E7CF73CA75D7984000000000000000601900001E6B8B3A7ACF7BCE8D7D5F9F4E3A4ECF97EA386E51CB4000000000001CFD6CB5B6CD2E37E6ABF5B6335717D417EC040000000000000006019000045A564B3C7B25F99F9BBD1EDCFBD923938F400000000000003C47308E508E40000000000000000000C02B10E752544244793DBC0F4F23528FA8591CB84A6000000CE065819C64619187A2797A1E5ECBE3121234A58B1308536ACB263CC99D793D1E59183D1E124465EE3093C18499227BC165B7ADB173800000000000000000000030640000000029EE34B1BA89ECF39E955258A2BE2B5157EACB056F8B098AAD9DC1570DA4B5A9A7708ABCD989A48E4D6703A72000000000000A5B9E23B8B025000031536FAC9B19E5BA9A09400000147791E7541B16CCEE1CCC975FD4C21F33E489208D208D208D208D20F52479D67D0DF3000000000000F9FF6DCC6ED7482000000384ECE87DD9D189400000000056166A2BD000000000300C8000000000000393836E39D3A4D8E53ABBCC0000039FADB6AB6FAFCD758B0000000023D4E68DAF12F4B59F4400000000060190000000003C99403611C873DA7D1F28DFBBCA9D797B46A6DDE6000053D5DAD54E9B7D0F1FD7DC64200008C928F4A06A3DBF3D31EBD8C80060D736514A00001806400000018D6D9C9CEE8762B38797B2A69BA697CC937615ED667651C99EB075DCC637CBAD632C00054555956CE90F4DCFEF25F0B80306B9E797CCCDBCF8E8E59A72F3C830406C555346B8966EA3590CD0000300C800000000000D6E67AE84E691C98EF143B71D9263576D7CF55CB6B6B976AD6D96720A1D1DAD5CF5491C55D88BC8783C72A91B1E73D37AFD9D70005593726DE6F1179EA0DBC8C0000006019000000000000068F39D8D1AD7BCFAC778E2D986E66C433CBA9D4D0E8EF9F74AAB563988BC7BCF66AED699DBB576B5C5CA59D4B5EB263B477BCECDD3875ED2D566DC8A5D5E5B3B6DB19D5CEECFA3F1EF5C40000000C03200000000000000392CDF7393A4A33D34775A773BA26B4BA8A4D5DF2F5B1ADB39DB4F734CB8BDE56D77C69E4C679F778F7AF5698DF87A79B668A4E849F93BAE773B9F263BE376A3B3DF1903200000006019000000000000000E5FA8D22810CD8F434B771678928EEECC8CEAB2CE18B58DBD3DCD4976A48E2D7398D7C76D89AA66DF2BF8287AFD72DD2BB3AA3CC3367B08A6B67A8ADB2E9E70800001E2BB613702E01900000000001ABEEC9D17BB3D3C78266ACF2F33E3A0E673D6619E9A50ECDE74E15AABB4C75686FC6B268FBABD63DCD69E8ABCD969A6BEEC57F736B292398E9F8D59863BB5F636358E8F25E4018AD2CF1CCE89D051E3C5D7AECE295809700C8000000005778F5ACECC5167A62CB5D8AD2E9E8638B4D0C6EF3DB97EA3433AA2452E3D09A1D6D73E9B96EE3575CF9CCD5DA63BE9E96FE974E5D3F9F136755D4779532EC75FCA76B79E4268F3B65A137969789BDBB8E766D62EA2D0F71B1AD935AB24C9A1AA67A8F3BFAE000180640000050D6EFF0DDF9CDBB56EB9FAB4BC975BE5EAF1ED9B06270C800072BE6EE8274921999E97565CC74FD3CFC2FBDCD56E7A5BAAE8DAD9D4973B8BCEC68EB36FD46B4F797AD6A5AD9A78DC4E98C99D8000849A386EB5CE97AADBCEB984000601900000153C07D5786ED8E772D8EF8BFECF94EAFCBD0A1B3CDDB1280000E53ABAF28D1C98F46A767CB4BBE3B5A1D4F20BE229A05DA9B4B773A835F125CF5BCF6AEC5CE73147373C51CCB0F9F5D55C72F9ED0CF1AEC872B6D679B02000000300C80000054DB566A565C5B7AF473E637B6F6B9DE7B7B1B38D4AAAD1CDE8C4A000072DE3A3E5E6E5D2DD4E9D057D2767BE1C6453C375EB774F739F4AFF7E7CEF12F4543DA338E26C35625F2F39EBEFAD8E4DF1080000000000300C80000052DD57D96B2F8AFF473D78A967CD62E2CB9EAB2C3DB342500001A1BD938E97A4A29BD7F3E3D351C70EDDCC5B95D6337A0F58B9F1715D3DC78C6CDBCD55F4EC3190000000000000601900001E6B8B3A7ACF7BCE8D7D5F9F4E3A4ECF97EA386E51CB40000000000788368737A1356DB37AF5BB35A1AFB19B2E2FA82FD908000000000000000C03200008B4ACB09E7D8BF33F377A3DB9F7B247271E80000000000000788E611CA11C800000000000000000018051F9B8C5950B75542DC542DC542DC73747F40251CB6E96A16EAA85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B8A85B88B6BCFA8F6250000000000003C7B0000000464800000000000000000000000300C800000000000039BE9382EF7503340000535C783CCDC5F69604A00000000000000000000180640000000000001C1F554535BD489000000389E9EAFC574C20000000000F3CF55F4B4B75000000000180640000000000001CA41B714E97BBFC7761AE7910000050D4DD55CDF57EEA2DEE0000000057E8D452DB37C0400000000060190000000018CE340B05460B854EF1555DD4F1ED4FB9AB0CDF64A9B6BC80000A8AAB6A99D27E978DEC6E72190001A06DF31148DC5631F4880C80011D3A5E229540000C032783D2B3C596EA7C96EAB168AEF51BFADE275A3C5FACE635BAE866B9E8A5C67ACB0FA8AE65413E77074D411EB1D8635F66F3000A8AAB2AD9D23BEA5DB4E845C018CAB4F14399A74661EA925F45C002A8B1E7EB656B4BA4C5DDC84000018066A2DEBB52DE96EB4BA73F5EA1CD43B706D1AFEE3DE2BA1F534574D6B29CFF008BCA996DF96EA5CBA727933DF1A5BD819D2DD20E968752F3EDD516F70050696CEB67ABD7986BB217960D622E77CCF3A3CFAF735656C6B8E4039C25A6CED4E98F7ABD7DCCA19000000C033A3BDA1ACCD9DDD5EB86CD6EE9E21D1B336BCE2223D8D5C1B13E9EC161C9F59C9C5D8E3D61E57B0AD5A5452E3BE353723B246A6D9AB73A1AB71DB39AE975CF978E2971D9ABB5A276FEF437F5C7C72163A6D6463B45D2D2F4DBE008348D1A78F6E74452C33573738CEB8800000018067437F4B59B3CD555F5C7579A294B2F757A85E34F60DCF3511179EB9ABA2C393EB3948BA1C7A81CCC3D2F28DCC31D74F624D1B9DE135AD71A1AFAE6D8D4DB9A6A6DE91697FCBD96F8D54A73F4219A2B9E8B7F19D71031C6DC553520C76F16D47DA6F8E43200000006019AEB1A6B3A0CD36B76E7D5E8F3B766E6CD6D31D5E855D819C348DC530BFA1DDD3CDBA1CBA018E7BA284E6504F8EED5DA1ABB54771ACC833BADB1C69EB1BDA7B9A92ED238B7CF69E75B1D76B768F5F7CBE859E0BB46368A6969A6F1EF3DC6BCB61D26A6DEFCE00000F07B879EBEB3644B80229456CDBAD6753DEC78D4831B4268AA7D6A6F41BAC6B473BA8ADB16650940039DD5E9F919B9C67AEA45B575D3854FAAEDFCF4F5A5BB89A56CD5BAE73CF629AACCEE6A5CC37959D15CDC091CB74DC72EC0C77452EEEB9DF8BCC602BEB6BA3D4E6239AB0AADE8CDCE94640C0320000028763760B9B056C73ADB3C7B60000001CEF45AE736827C777AF3A9AC765C9F5F8D73E53D52DCE3B6A6AEED774E7D92AFD675ABCF5FE86F9EC767C97678A095949B956DED63499DE2D74E5B993CE04706DA6A1989A3CC373EBAEC4BAE2001806400000735CF751C1FA39CB36ACF7B7D02CB8EEC7CF024000000E6A0E8B979B9A3919EB6971CA757D3CFC479DCD76F62A2CB523D6F78F39DEB6776B759BDE8A38AF2D8A7AAF337AF3CACF409A0003CEBD9B5A9B9D0EB9F3FD3FB5C0400060190000015BF3FFA9727D73C867361E8E76FD9731D3F97A31CA5EE6EF8940000C735D36B1CE219B1E8D4EB79DF1BE36955D7F1E6B799236A6DAD2DD9AD58FCC973D152C1224FE67D388F1B799BD293C763AE7CE67A933CCBA6550DD4880000000300C800000555A566B33584BEFD18E7362C36F169A783C6356515378CBA119D00001CEEAF53C9B7EF57698E96BEF9BEAFA70E2A6D88AEB3B9A7B9CFA57E73E35893B2E43B5B98F89D9965CC2B09B7445E4000000000018CAE02640000029AE746CB492BEB3D3CF3A3AB69CED4DADBCDCF5ABB467400000188A51C9BADA66AB229E29AD747B5A906E5659E77A0F58B9F1BD9D9B8D5D7B9BA96AEE06400000000004716BF2EBBBEF576F59C0DE320000C662A6B2D69A3DAB39AD0D5F3EAC5FF006B4BD0F0DE472D0000000000007355F65576FBD5DFBA979FD5B0D8A97A2ABB499000000000000034FD798FCFE9D8D88E4EDC30359C80003CC3B000F9D79B8A7EBCFE8CD7D8E5D3200000000000000000000000002B7D9BE8BCEB136796B39AB6128F2AD3D9AEE3D6C65D4DADE0378DBCCAEBCE24A224A224A224B935342E966BFA952C4944494449444944494449444944494449444944494449443E25D7AF59F03DE3C8F798FD88FD0E12C7A2E6F1B9F5AD20F4F9AA772CE0E5D3760F5AD9CCD8F1874DD8F1131BBEF48EB772EA6DDCFF00FFC4002F100002020103030205050101000300000002030104000512131011151430202122314023323334502435254260FFDA0008010000010502FF002DCE85B37FD7B873BC60340C7019045B8737467788C26409F7C92881537920D91192D089EF9BA339C6707E638662186E5ED55F0918BC99992B5C9EC1140C7E6397B9B283C5D6F9C28F9B826172A9F4B09646056EF855E48981D89EAE422AE7B78FFE734CEC5AF90C11DB2C2A5B89410E0D7F9560DA8C648C09A6BB1788A3BC6DC9293CEF1CB2F213735BCE4F2DA6E3E38336CB4C85B69A507719BB1AC2F501332C6B1BC8D69C930775CFC72F6267B40B5647D20A24BE4511111F0AFF006E5E431D915191546B38A5A1612C8EFDB60E6C1EFB63BB150CC15844768CED19DA3BF689CED19DA33B477ED19DA3BFB4CBEC5D989EF1ED97B0F1935772698A9915FB1ECE33E685B6408190295949239227BFCFBE2FF6FE73C60EDE94E990F6FB77CDB19B6336C66D8CDB19B6336C66D8CDB19B6336C66D8CDB19B6336C66D8CDB19B633EDF9FF7B0B2E1BFF1CB3B58FF0050E768A7E616A3BA6BB3951F15C748EA9FEA6A27B2A0C76128EE3A3977A5F15E2EF6173DD7FE9EA93DE7A691F20F87ED853BD1527BD5FF004ED16FD43A6953FABF0DE6715410ED4E87F4BFD35CEF6F4D2FF9FE1D5CBB89FECD3BFA5F1A1BC8FF00CEFB60B00BDBB05B115A3B23A695FCBF0D92E5D44BF6E9FF00D2F8A67B468A5BCBF3DF4D6CC863ABB1572273BF7F63552DB4863B0F4D23E161C2D757BC8B3F669BFD2F8B5167153D1076C7F816101617F5A5AB61A651601DF1EAF3F475D1FF0083E0D5D9D9031B459FC7A67F4BE2D58B7168FF0034FF00836EB8D952C8BBCC657B9F3F87549FD6EBA3FF004BE0B07CF7F19FB34A9EF47E233E56E8F1DA8FF85A8D693859C18CC41422C957C19828EBA9FF0073A4FDB4A8ED475474A6AD73E446586F0A2B0F6561FECD323B50CB16555E2BDD4582E9A9BB629DFA75A80ECA7FE1DD57A47F44B4AB4ACC583D352FEEF467F1E97FD0D4A792D68CCDD5B3563DE5D2C4F64D41DB5B1C84118EDB5A8611408C1CBDB6FEA118DA3FE1B562D58C1219D12C94189410E6A91FAFD1BFC7A57F45D3DF51D1E7B59C83E7B1D2DFCD711DA350B535D63418FC00158E6A0DE5662479750FF1750ADEA16A3DE3D16C3412D90C0D5E3E5D19FB34AFE8BFFF00474EF96A3A8B7869A4762FA6DE4B665B4512AB65D2ED8F4E950ED1CD247717F8DA827D3B7AA9F354F508875119DC3D3479FF008EDFCB51A3FF00A3AA96E2C27AC7399939FF0040346DDC6B2B4361793303127365D8F2DABAAAE147F81B87370FC263061B0ABBBA4C778A4DE334C4875D1E7B66ADD96D896399E99B1244CEC3610112E69E52A5EA0D6B058F4D41DCA5F6E8A0E7BBF9C6CDB30979E7A256454AF19352BCE7A318C0338675BF5BD42547BC3A3C3709337F5D3E76DFBAC9B57846063A27B0B334B8FF009BA5DB3C0003B630CB606949D88FCD7B38935036A93DFD6DA89375A1DC14D9314683E5967BF2DEF835057A7775018172A640B04B8ACD41DD66C56E115D6362F23FBCF2DAAAE1C68C7B450B8DC67D38FD4D8EDDBF3AC725B6733518A3AC4C1A892C6A40A4EC564C6E738D6B158FC0D58B56BDCA3E8D1DE0E09B15D670C160EE0A65B2C3AC1B842D902B151BACEDE5B3D1EDF54EE8C385869A8952BF25DA84D66D9D5B709B587352EB2B9AD82D0E84A5961554167A1AD80B05FB1AA224804A0C7A533E2B576BCD4601418DB5ED24361A38E64C62238F34C0DE79A83F062063A544FA97FE56AE530AEBA1B27DF72BD258E8FEF00931B35ECD465462A799D298DDB4BB000865889862150955B7C57500CC75002B4C001587E56A00F70343899D3438FD5F7AD222C2424A273EF9A3B36CE549DD027B99867B4AEFF0259135E5B369DD220AC310A142FF0032ED394A7054539A10FD396EE928EA494D6F72F56E680641F422E0B1DFB852FE24FF002E5BFB5BFEBBDB3E3C6204667B600B2DCD740570FCDBDDDD9574A8959E9EA22AE3141C6D9615BACB40D3592AB7BBA8D399C4BE19863BC685981555FBA3F932E7ECB9FC0A601B1AD15C56A6CB3802203F9D5E775B89EF19D9764400422F16E363017056FBE193377B97B4E8766E7A663B3AC87D1643FB396BF6DDFB5BFA62856E52FF0000FF0041AAFE2C160D7BAFD51413CCE925AE592157206063DD358321EB14EA0EF9327E56B1DF379FD56AD7D7831B47FC0BDF3AF13138EBC954DC3F50C45664E2E9AC7F0B568D8E70EE599771C8FAADA7E6FD3D7CF6FF00C1B3680818D850FABED945C524B3860FE16A6C02CDDC6B10DCA59FE900C8C2E6615A5B0043F3A6606196F0C8DE4EA8EF4DD34AAE455406023F0AE0CA2DB183CDCD139E38CEBC3607012C6BA9D56F37E73439161523B08C0C65B4F1DBA69F516006007F0E620A214B8115807490029FF13590ED6B4A7250D02831FF004BC854CF23533C8D4CF23533C8D4CF23533C8D4CF23533C954CF254F2CD8A16738287755EA2A0F254F3C953CF274F3C9D3CF274F3C9D3CF274F3C9D3CF274F3C9D3CF274F3C9D3CF274F3C9D3CF274F3C9D3CF274F3C9D3CF274F3C9D3CF274F3CA53CF294F3CA53CF274F3CA53CF294F3CA53CF294F3CA53CF29533CA54CF2B533CAD4CF2B533CAD4CF2B533CAD4CF2B533CAD4CF2B533CAD4CF2B533CAD4CF2B533CAD4CF2D533CB54CF2D532B386CAFC5D3CF174F3C5D3CF174F3C653CF194F3C653CF194F3C653CF194F3C653CF194F3C653CF194F3C653CF194F3C653CF194F3C653CF194F3C653CF194F3C653CF194F3C653CF194F3C653CF1B4F3C6D3CF1B4F3C6D3CF1B4F3C6D3CF1B533C754CF1D533C754CF1D533C754CF1D533C754CF1F533C7D4C1AB50E42A5531F455B269D58CF455B269D5888A7564669D688F455B3D156C8AB5673D1D6C3AD54222A569C8AD564E2A559CF475B3D2D5C8AD5A65002A0FF002E16513B5B01C47C4624D1913F51660A6661919C67C3B59C95B772F19EE88672B97BD8507802C2152F6B5C2FDCC54947194383EDFE5EF093F60162BF818B1667DBE11FB7E169AF977B774E6B944C4C7B8225C80E3205B0F77788CEF1DF70EDEF119DE3BEE1DBED07DBF0B4F3E1BBED585732349B3DBDDDB9B736E6DCDB9B736E6DCDB9B736E6DCDB9B736E6DCDB9B736E76FC321FA6AB7991ED5A095D8AED8727FD1FB59D38F8DDED5E1FF00B34B2D87EFD9BAA4655E6B2CFF0001FF002D41BBA310D172BD9D4A3B3F7F0BBDD618AC5D799632A55DE511031FE06A11B6F65167A7B1ECEA9FB4C778D067256F6ED5A0AC27BEC95754D8911801FF0007581FD3C686F1D3ECF307B1AA7F5F2816DB1ED5ABDDA417F5293364C46047F366623399590E5166F1E9657CC844F7561C109D678D957C7A9FF5F24B8D9EC198AC5F68ECE088842D64F3001587C6C7A958B3860FE1B9D0AC6B2FB726ADBEE5D979B1651C2BC0E4562EFF006C68C058E904559AB31607C5A97F0E363BAEA3396B7C561E15D672CB259D8986850A57F158BCA4E3ECD938A343927F1FEF8ED3C273EA02E84BC82EA86CD3389828F8753FDBD3482FD2F85EE042FEB7330CBB6544702FE1734120CB4DB79022B1A55BD417E53D20E0313433A18C1C43244BA25E54E40C4C7E0D47F97A509D97BE06B4521245619D34F56F3F86D5A5D609DF68F14BF56F88888FCB7281EBEC6A674318315948167DF16C652243C1E1D6F4F7B5D22765CEA45022D64DB6740097BA22223E0BB706A80AC9878D99CAA88AE9FCDB75E2C28667A98C18ACE7BF4883AC756D2EC874B33DEE74B1F25FDFADB74D96FDBA196C1A08E14FC16EC8D6502E48F267B46989DD3F9FA8A27B44C4C74606E85337C7435901D1B836473BEE674B65D9354B7D6CD41D22203003D2458D65A41540B3655586A5F55A3C618AC224ACB7A10CB9A23023FE0397E9AC757471944F78E8C0913A76A2C2D3FB7A3237BF4566EAC53023DE)
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

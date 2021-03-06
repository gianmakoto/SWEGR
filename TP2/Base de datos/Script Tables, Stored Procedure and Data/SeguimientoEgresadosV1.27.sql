USE [master]
GO
/****** Object:  Database [SeguimientoEgresados]    Script Date: 03/11/2014 9:10:55 PM ******/
CREATE DATABASE [SeguimientoEgresados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SeguimientoEgresados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SeguimientoEgresados.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SeguimientoEgresados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SeguimientoEgresados_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarAptitud]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarEgresado]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarEgresado_DatosExtraidos]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarEgresadoDesvinculado]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarFoto]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarInteres]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarRegistroAcademico]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarRegistroLaboral]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarAptitud]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarAptitudxEgresado]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarFoto]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarFotoxEgresado]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarInteres]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarInteresxEgresado]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarAptitud]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarAptitudxEgresado]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarEgresadodesdeEgresadoDesv]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarFoto]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarFotoxEgresado]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarHistorialDatosEgresado]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarInteres]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarInteresxEgresado]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroAcademico]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroAcademico_DatosExtraidos]    Script Date: 03/11/2014 9:10:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroLaboral]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroLaboral_DatosExtraidos]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresado]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresado_Lista]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresado_Lista2]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoAnios]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarPais]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarRegistroAcademico]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarRegistroLaboral]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerAptitud]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerAptitudxEgresado]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresado]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresadoDesvinculado]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresadoxCodigoUniv]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerFoto]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerInteres]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerInteresxEgresado]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerLinksEgresado]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerPais]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerPaisID]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  Table [dbo].[Aptitud]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  Table [dbo].[AptitudxEgresado]    Script Date: 03/11/2014 9:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AptitudxEgresado](
	[EgresadoID] [int] NULL,
	[AptitudID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Egresado]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  Table [dbo].[EgresadoDesvinculado]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  Table [dbo].[Foto]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  Table [dbo].[FotoxEgresado]    Script Date: 03/11/2014 9:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FotoxEgresado](
	[EgresadoID] [int] NULL,
	[FotoID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistorialDatosEgresado]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  Table [dbo].[Interes]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  Table [dbo].[InteresxEgresado]    Script Date: 03/11/2014 9:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InteresxEgresado](
	[EgresadoID] [int] NULL,
	[InteresesID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pais]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  Table [dbo].[RegistroAcademico]    Script Date: 03/11/2014 9:10:56 PM ******/
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
/****** Object:  Table [dbo].[RegistroLaboral]    Script Date: 03/11/2014 9:10:56 PM ******/
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
INSERT [dbo].[Foto] ([FotoID], [Foto]) VALUES (2, 0xFFD8FFE1001845786966000049492A00080000000000000000000000FFEC00114475636B7900010004000000280000FFE1032B687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F726520352E302D633036312036342E3134303934392C20323031302F31322F30372D31303A35373A30312020202020202020223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D222220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75726365526566232220786D703A43726561746F72546F6F6C3D2241646F62652050686F746F73686F70204353352E312057696E646F77732220786D704D4D3A496E7374616E636549443D22786D702E6969643A31303334343432373037324131314532383444334538433644414343353339352220786D704D4D3A446F63756D656E7449443D22786D702E6469643A3130333434343238303732413131453238344433453843364441434335333935223E203C786D704D4D3A4465726976656446726F6D2073745265663A696E7374616E636549443D22786D702E6969643A3130333434343235303732413131453238344433453843364441434335333935222073745265663A646F63756D656E7449443D22786D702E6469643A3130333434343236303732413131453238344433453843364441434335333935222F3E203C2F7264663A4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F787061636B657420656E643D2272223F3EFFEE000E41646F62650064C000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F15181313151313181712141414141217171B1C1E1C1B1724242727242435333333353B3B3B3B3B3B3B3B3B3B010D0B0B0D0E0D100E0E10140E0F0E141410111110141D14141514141D251A171717171A2520231E1E1E232028282525282832323032323B3B3B3B3B3B3B3B3B3BFFC000110800E900EB03012200021101031101FFC400A10001000105010100000000000000000000000102030506070408010101010101010000000000000000000000010203040510000201030203050406070607000000000001021103042105311206415161130771819122B1C132422314A1526272823315E192A2C22444F0D1B2435363341101010002010105050509000000000000000111020321314171120451619142138122325223A1B1D1627282923314FFDA000C03010002110311003F00EAA00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008004820012080048200120800482001208150241000904540120800482001208004820012080048205400000000000000000031FBB6FFB46CF6BCCDC72A1634AA83759BF6456A681BE7AB77A7CD6764C7F2E3C164DF5597B630FF98C0E9395998D8769DECABB0B16A3AB9DC928AF8B34DDEBD56D9B139AD6D76E59F7968A7F62D57DAF57EE3976E3BAEE3B9DE77B3F26E644DFEB3745EC8F0478CD606C9B97A83D539F7B9FF38F1209FCB6B1BE44978BE2CF347AD7AAE1C374BFEF69FD28C20F12A36187A81D5F0E1B8CDFEF420FFCA5E87A99D5F0FF00770B9E12B50FAA86AFC470F0183AB73B5EAC754429E6471EEAF1838FFD2CF7D9F58B725FCFDBAD4D77C2728FD3539ED1F11C09832EA367D63C27FF00D1B6DD8F8C27197D3432363D59E98B9FCD8E4587FB56EABFC2D9C753FEC03065DD31FD42E90C8D16E10B6DF65C5287D28CAE36F7B3E5A5F96CDB176BC146E45BF854F9D5D08D13AAD3C49832FA5D34D556ABBD127CE989BDEEF84D3C4CDBF669C14672A7C3819FC1F543AAF128AE5EB79905C55E82AFF7A1463065DB01CE36FF0058F12494772C0B969FDE9D8929AFEECA8CD976EEBFE94DC291B59D1B571FDCBC9DB7FE2D09856C40A2D5DB57A0AE5A9C6E425C2706A49FBD15D4000000000005339C2DC1CE72518C757293A25EF60540D5778F51364C1E6B587CFB9E4AD1431D5615EE77387C0D2377EA8EB6DF6B6ACD8BB898D71B8AB5622E35A764AE4B564BB6B3B7693C6ACD76BD92D744DEFAD360D96B0C9C85772170C7B3F3CFDF4D17BCE7BBDFAA3BD67735ADB60B6FB0F4E65F35E6BF7B847DC60E1D2FBBCFE7BB185AE68B9D6EDC8A6E9C7B5EA552E9DB369FFA8DCF1A114A327CADC9F2BEEA76A31FF470CF9E5F0EBFB9A9C3C97BB1E2C4DFBF7B22E4AF5F9CAEDD93ACAE4DB949BF6B2DF619AFC874DDA972DDDC6E5EA49C5AB56E8A9D8D3752DF9BD336E3F2D8C8BF2E57572928A52EC6924B88FF00A27CBA6F7FB7F8AFD1BDFB6B3ED61EA4D1BD229C9F72332F7ADBECBFF47B5DA8B4E32E6BAF9F55C56B5D087D4FB92D2CC6CD88C5C9C542DAE12FBBEC1F5796F6717F96D83C9A4EDDFE118EB7B76E177F978B765C35517DBC0F543A6F7C9FFB57055E5ACE518EBE35651777ADDAEA6AE655CA35CB44E9A56BD8796EE564DDAF997AE4EAEBAC997F5EFE4D7E34FD1FE6BFB1E9C9D9B3F12DC6777CBA49B5485C8B69AEFD7431772F25C532EB4BB7B7DE52E28DEB3693EF59B784C33B797E59678DCBCEEFDD6E908B2F5B57695932BE54B51A1A60A768248E01441A04041D48258F604529343DA488D6E4E36EDC6572E4DD236E09CA4DF72482BD385BA6E5813E7C1CABB8F25AFE1CDC57E8361C4F54FAA70E8AE5FB7971FD5BD0557FC51A33D1D3FE966F9B9F2DEDCDFF004CC596BCAD735E6BF77847DE747D9BA17A67678C5E3E1C2EDE8FFB8BFF008971BEFACB45EE43307B7A6F75C8DDF65C5DC7271DE2DEC88F34ECBAE9AD2AABAD1F132642492A2E049950B195936F1ACCAECF84568BB5F817D9A97526E0EF5E78E9C236EC4ABF3A6DB7DF1A7138FA8E5FA7A5B3F15E9AF8BA7169E7DA4EEEF61B7BF52E766FCEC625BE7E4972C9A692F1D59AE67F5DEE59D076EF598DC8B4D4A371B945F77CBA237BD8B60E92DE71659FFD2EDC6EDC9B8DF84AAE935DDAD15789E9BDE9D748DDFF0065E5B7FF008E738FF9869C5A6DACBB6DB6F6CEDF35C7C176E4B2D924D71D3B1CA2EF52EEF34E31B90B1169271B708C7ECF6FB4F3DCDF777BB5E7CBBBABE66AB4555EC3A8DEF4ABA6E75F2EE64DA7E171497F8A2CF15EF48B05AFC1DC6EC7B94E1197D14373878A7C93E1966F2EFF009AB97CE772E3ACE7293F16FB7894512EC4744BDE90E6AFE46E16A5FBF0947E86CF0DCF4A3A8E1F62E635CF64E4BE989D24D6767467CD6F6DAD2A9A510A1B65DF4CBAAE1C2C5A9FEEDD5F59E7B9E9FF0056417FF04A5FBB38BFACD66235B0D7B8BFB962646D7972C3DC20F1F22094A56E54AA52555C0F2FE62C7EBA02AA1015DB4F84913F2BE0D7B8829F69054E12229440471141A21D9DE51018A0208D7B452A8AA9DC532928F1F876813CB4D389094A77236ADC1DCBB27485B82E6937E096A6CFD3BE9E6FBBDF264642FE9D812D7CDBABF124BF62DF1F89D47A77A4B62E9E82FC8D853C87F6F2AED2575FBFB3DC329873BE9FF4AF7BDCF96FEEB2FE9B8AF5F2DAE6BF25FBBC23EF3A56C3D21B16C105FD3F1A2AF5292C89FCF75FF1BFA8CBA9A6568CA800000000687D4F19C770C8B7069C1FCD36DD29CC93A237C39C75949C779C88A6D6906D7B524793D6CCE9AFF53BFA6FC77C1B3F43DEC6BBB05AF2128CA139C2F2EDE752EDFE1A1B01CDFD3EDCBF2DBBDFC0B92A5BCC5CD08F679905F5C4E9077E1DA5D27BA61CF9259BDF88003A3000000000E0DEA5CBCDEB2CF7C793CB87C208D51DBD4DA3AE7F13AB77497FEF6BE092301E5575343CBE585192E1A1E976FC08F2FC0605853BB1E126571CBBF1D1BAA2B76CA256D017566AE1387C0AE391665DB47E278DC487108C924A5F65A624A8AAF87798C52945D62DAF6173F337B95C5CAA9855EB9934AF2E9E25DD973BF2BBCE165CD2946D5FB729296AA9CCABC7C0F0F10BC38F6047D2CEED754EB5E0FC0798CC46C79DF9CD9B07293ABBB62DB6FC6947F41EDE732AF62BA5C85F31FE612AE819685C522B3196F228F8990B53E7881580001CEBAEED726F5CDD97AD47EB4745345F51ADA8DEC4BD4E3171AFB1FF0069C3D4CCF1FDAEDE9EFEA4F7B49B5957B0F2EC66D97F898D3525E3CAF87C0ED181996B3B0ECE5D975B77E0A71F7F61C56F41B725C6BF2FD553A27A6F9FE7ECD3C39BFC4C49D29DD19EABF4A673F4DB75C7B5D3D469D3CDEC6DC003D6F280000014DC9724253FD54DFC101C07AA66AEF51EE7722EA9E4DCA3F64A862E87A326E3BB7EEDC9719DC9C9FB5C9B2CD0D8A394729590C8AA1C4B52897DFF00C32DC902AC38EA5325A32F3896DC6A1161A142E496A5344114A249A0A01D5FD33CF95FD8258B3955E1DD718F8466B99236EAD4E71E93DD979FB8D9FBBCB6E74F14DA3A3233555020900B8992C29368C6A5A992C38D00F600001A4FA8F16E188FB3E75F41BB1ABF5ED853DBF1EE35A5BBB46FC248E5EA3FD5B7B9D386E393573AB89D5A5C5B747E0D7319DE85CFFCA750792DD2DE5C5DB7DDCDF6A1FA4C6BC3BB2BAA2BB22A4FC25C3E82B9635CC4DC6376D554ED7CF07FB56DF3E87874E4936972F6726BE6D6C75F40B38B911C9C6B5910FB376119AFE2552F1F4A5CCCBE7800EC2814CD29C5C1F09269FBF425B286C0F9F372C3BB83B864E2DD4D4EC5D9425EE7A3F81E5D2B53A77A8BD25732EBBDE0439EF4234CBB515ACA31E1723E2BB4E66E3DDA3EE34B14E852D1577D486053DA52D153296114345342A7C48D1016668A285D9D59404AA482A21293694555B7449716C0E81E93D89F36E390FECD2DDBAF8D5C99D112309D1BB23D9B62B362EAA64DEFC6C8EF529708FF000AD0CE19509A6BA10550B6E4C0AED5BE668CA58B7CB12CE363D1559EB5A000000311D518EAFED1723DB17192F8D3EB32E79B71873E15E4D57E46E8FC3539F2CB78F693BE56B4B8DA5F7B40946DDA9354554E2BDC8F1E46542795092E31E6AAEFABA2FA4C76F1BD5C776E72D2296892EC6CC25CCCBF26E556A4B5D3C11F378F86DEB7A3E85E8EBDD2FB9DB7B35BB727F3D893B74F0FB51FD0CCAC32DDC7F2EA73DE82BFF9EC89E34A7495C519F23FD95491D2ECD8B76A2A315C3B4FA5C3F8267BBA3C1CB31BDF8A20A6D6BA15F2BED6540E8C239552847222A0053C88D27AB3D38C6DC5CF3B68E5C6CC7573B2F4B571FF0095B3780323E78CEC0CBC0C8962E6D9958BD0E309AA3F6A7DA79A516B55AAFD277DDE762DB777B1E4E7D88DE8AFB12E138BFD992D51CE37AF4CF70C594A7B55D595696AAD5C6A1717BF833591A2D0891EBCCC2CAC3BAED66D99D8B8BEECD51FBBBCF338AECF8016994B2E389449E805B9A2D971BA94D12D584C28F1EC37CF4FFA45DEBB0DEF70852CDB75C4B525F6E4BFEE35DCBB0F3747F44CF3670DC3758386245F35AC77A3B8D70725D91FA4E9D1828C54629462B4514A892EEA12D22AAB1AF04550B5291EBB38ADBD5115E7B56A526642C6324AAD176DD88C1702ED008492544480000000A6E463284A32FB324D3F63E2547977495C8EDB952B55771599F2A5C6BCAC94711DD6DC2DE764DB84F9EDDAB928C67FAD46CF0AA4A546E8FB970F12F64B55518EB55CCDBE2EA5BB493873F1D5D3DDA33C7DD97BFB7A32DD37B8FF004BDE7172FEEDB9A8DC5FB13F96476D84A328A71754D553EF47CF8A55B8970D154E9FD09D4F0BB62DED39D77F1E297E5272FBF0EC8D7BD1D7877C5F2DEF70E6D33F7A773750103D0F380000000059B96148BC00C3E7ED38D976DDBC9B30BD0EE9C53354DCFD38D9AFB72C7F33124F8723E68FF764742693E2512B10971038D677A71BB59ABC5C8B79115C149384BEB461723A5F7FC76FCCC2B924BEF5BA4D7E83BC4F02122D3DAE05C8E0D67A7F7ACABAACD9C2BDCCFB671718AF6B91BB74E740636138656E14CACB5AA8B5F8707E0BB59D123B6413D4BD0C1B71EC1918AB3872A2D29D87AED613ED47BE3663145C49220B16F1A312F28A5C09000000000000000A6745175E14D7D8545BBF6637ED4AD4EBCB35474747414713EA3C456774CB8DB4A317272B697EA4B554F654C7D94A31515172515E62A777DED4DF777F4FF79DC33EEE479B6256E4F9A29B69B49FCB1D381E4C3F4CF78BEE0B3EFDAB10E66AE2B6F9DF22E0D705A9E4FA7B5F971D5EC9C9A492DDBB3D8D2A4EDC66E52F95425AC5F16E955CA657176EDDEFC613C1C6BF2CAB74B92B71B725CB59523CB374E2B53A374FF406CFB44A77AF2FCFE4DCAA772FA4E2A2DD7E583AA46CEA118A514A892A24B4D0E9383DB5CB6E7FCB3E2C674DDCDDEE6D36BFABC3CBCB8B7192ED714E9193F1328280ED262385B9A000A0000000000000000000000000000000000000000028480228284802282848020120080480201200804802012008048020120080480201200804802012008142400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FFFD900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
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

INSERT [dbo].[RegistroLaboral] ([RegistroLaboralID], [EgresadoID], [NombreTrabajo], [Cargo], [Duracion], [Descripcion], [NombreJefe], [JefeCargo], [TelefonoContacto], [CorreoJefe], [PaisID], [TrabajoActual]) VALUES (1, 2, N'Jefe Supremo', N'Desarrollador', N'Diciembre 2014 - Enero 2015', N'Desc 1', N'Jefe Supremo', N'Gerente general', N'98545163', N'jefe.supremo@gmail.com', 173, 1)
INSERT [dbo].[RegistroLaboral] ([RegistroLaboralID], [EgresadoID], [NombreTrabajo], [Cargo], [Duracion], [Descripcion], [NombreJefe], [JefeCargo], [TelefonoContacto], [CorreoJefe], [PaisID], [TrabajoActual]) VALUES (2, 2, N'Elio Navarrete', N'Master Scrum', N'4 meses', N'Buena', N'Elio Navarrete', N'Analista ', N'5555555', N'elio@ra.com', 173, 0)
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

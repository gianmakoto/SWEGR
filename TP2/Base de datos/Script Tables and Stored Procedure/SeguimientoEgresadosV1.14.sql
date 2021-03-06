USE [master]
GO
/****** Object:  Database [SeguimientoEgresados]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarAptitud]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
	@fotoegresado image,
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
		Foto = @fotoegresado,
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarInteres]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarRegistroAcademico]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarRegistroLaboral]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarAptitud]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarAptitudxEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarInteres]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarInteresxEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarAptitud]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarAptitudxEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarHistorialDatosEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarInteres]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarInteresxEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroAcademico]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroLaboral]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(Foto,'') AS Foto,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado = 'E'
END




GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxCarrera]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(Foto,'') AS Foto,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado='E' AND Carrera=@busqueda;
END




GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxCiclo]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(Foto,'') AS Foto,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado='E' AND CicloEgresado=@busqueda;
END




GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigo]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(Foto,'') AS Foto,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado = 'E' AND NombreCompleto = @nombre OR TipoEgresado = 'E' AND CodigoUniversitario = @nombre;
END




GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCarrera]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(Foto,'') AS Foto,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera	
	FROM
		Egresado
	WHERE
		TipoEgresado='E' AND NombreCompleto=@busqueda AND Carrera=@carrera OR TipoEgresado='E' AND CodigoUniversitario=@busqueda AND Carrera=@carrera;
END

GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCiclo]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(Foto,'') AS Foto,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado='E' AND NombreCompleto=@busqueda AND CicloEgresado=@ciclo OR TipoEgresado='E' AND CodigoUniversitario=@busqueda AND CicloEgresado=@ciclo;
END




GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCicloyCarrera]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(Foto,'') AS Foto,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		TipoEgresado='E' AND NombreCompleto=@busqueda AND CicloEgresado=@ciclo AND Carrera=@carrera OR TipoEgresado='E' AND CodigoUniversitario=@busqueda AND CicloEgresado=@ciclo AND Carrera=@carrera;
END




GO
/****** Object:  StoredProcedure [dbo].[SWEGR_listarPais]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarRegistroAcademico]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarRegistroLaboral]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerAptitud]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerAptitudxEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
		AptitudID
	FROM
		AptitudxEgresado
	WHERE
		EgresadoID = @idegresado;
END







GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
		ISNULL(FechaNacimiento,'') AS FechaNacimiento, ISNULL(TipoEgresado,'') AS TipoEgresado, ISNULL(Foto,'') AS Foto,
		ISNULL(Contrasena,'') AS Contrasena, ISNULL(ContrasenaDinamica,'') AS ContrasenaDinamica, 
		ISNULL(CambioContrasena,'') AS CambioContrasena, ISNULL(CicloEgresado,'') AS CicloEgresado,
		ISNULL(CodigoUniversitario,'') AS CodigoUniversitario, ISNULL(Carrera, '') AS Carrera
	FROM
		Egresado
	WHERE
		EgresadoID = @idegresado;
END








GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerInteres]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerInteresxEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
		InteresesID
	FROM
		InteresxEgresado
	WHERE
		EgresadoID = @idegresado;
END







GO
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerPais]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerPaisID]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  Table [dbo].[Aptitud]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  Table [dbo].[AptitudxEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AptitudxEgresado](
	[EgresadoID] [int] NULL,
	[AptitudID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Egresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
	[Foto] [image] NULL,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EgresadoDesvinculado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  Table [dbo].[HistorialDatosEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  Table [dbo].[Interes]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  Table [dbo].[InteresxEgresado]    Script Date: 13/10/2014 01:15:44 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InteresxEgresado](
	[EgresadoID] [int] NULL,
	[InteresesID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pais]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  Table [dbo].[RegistroAcademico]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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
/****** Object:  Table [dbo].[RegistroLaboral]    Script Date: 13/10/2014 01:15:44 a.m. ******/
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

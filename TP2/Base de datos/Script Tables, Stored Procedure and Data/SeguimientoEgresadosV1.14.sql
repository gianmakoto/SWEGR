USE [master]
GO
/****** Object:  Database [SeguimientoEgresados]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarAptitud]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarInteres]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarRegistroAcademico]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_actualizarRegistroLaboral]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarAptitud]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarAptitudxEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarInteres]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_eliminarInteresxEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarAptitud]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarAptitudxEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarHistorialDatosEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarInteres]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarInteresxEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroAcademico]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_insertarRegistroLaboral]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxCarrera]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxCiclo]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigo]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCarrera]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCiclo]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarEgresadoxNombreoCodigoyCicloyCarrera]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarPais]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarRegistroAcademico]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_listarRegistroLaboral]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerAptitud]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerAptitudxEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerInteres]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerInteresxEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerPais]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  StoredProcedure [dbo].[SWEGR_obtenerPaisID]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  Table [dbo].[Aptitud]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  Table [dbo].[AptitudxEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AptitudxEgresado](
	[EgresadoID] [int] NULL,
	[AptitudID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Egresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  Table [dbo].[EgresadoDesvinculado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  Table [dbo].[HistorialDatosEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  Table [dbo].[Interes]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  Table [dbo].[InteresxEgresado]    Script Date: 13/10/2014 01:15:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InteresxEgresado](
	[EgresadoID] [int] NULL,
	[InteresesID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pais]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  Table [dbo].[RegistroAcademico]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
/****** Object:  Table [dbo].[RegistroLaboral]    Script Date: 13/10/2014 01:15:06 a.m. ******/
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
SET IDENTITY_INSERT [dbo].[Aptitud] OFF
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (2, 1)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (2, 2)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (2, 3)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (3, 1)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (3, 3)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (7, 3)
INSERT [dbo].[AptitudxEgresado] ([EgresadoID], [AptitudID]) VALUES (4, 2)
SET IDENTITY_INSERT [dbo].[Egresado] ON 

INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (1, N'Luis Lopez', 20, N'M', N'011111111', N'964406650', N'45780324', N'luis@gmail.com', N'luis@hotmail.com', N'Av. Callejones rojos 4500', N'San Isidro', N'Lima', 173, N'https://pe.linkedin.com/luislopez55', N'', CAST(0x221C0B00 AS Date), N'G', 0x, N'', N'', 0, N'', N'', NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (2, N'Carlos Castañeda', 25, N'M', N'015502323', N'97513153', N'78342105', N'carlosc@gmail.com', NULL, NULL, NULL, N'Lima', 173, NULL, NULL, CAST(0xA5140B00 AS Date), N'E', NULL, NULL, NULL, NULL, NULL, N'u201510001', NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (3, N'Jose Arellano', 23, N'M', NULL, NULL, N'12345678', NULL, N'jose@gmail.com', N'Av. Los barracones 330', N'San borja', NULL, 173, NULL, NULL, CAST(0x39180B00 AS Date), N'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (4, N'Lucia Paredes', 26, N'F', N'012504647', N'94693728', N'56205087', NULL, NULL, NULL, NULL, NULL, 173, NULL, NULL, CAST(0xAB130B00 AS Date), N'E', NULL, NULL, NULL, NULL, NULL, NULL, N'Medicina')
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (5, N'Maria Gonzales', 22, N'F', NULL, NULL, N'56675787', N'maria@gmail.com', NULL, N'Av. Rocas 550', NULL, N'Lima', 173, NULL, NULL, CAST(0xF9180B00 AS Date), N'G', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (6, N'Natalie Mendoza', NULL, N'F', N'013506789', NULL, N'23424243', NULL, NULL, NULL, NULL, NULL, 173, NULL, NULL, CAST(0x811D0B00 AS Date), N'G', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (7, N'Jesus Rodriguez', NULL, N'M', NULL, N'96345098', N'56756756', NULL, N'jesus@gmail.com', NULL, N'Jesus Maria', N'Lima', 173, NULL, NULL, CAST(0x2D130B00 AS Date), N'E', NULL, NULL, NULL, NULL, N'2012', NULL, NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (8, N'Patricia Berdejo', NULL, N'F', NULL, NULL, N'13286784', N'paty@gmail.com', NULL, NULL, NULL, NULL, 173, NULL, NULL, CAST(0x3A160B00 AS Date), N'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (9, N'a', 12, N'F', N'123456789', N'987654321', N'15478542', N'w', N'w', N'w', N'w', N'La Libertad', 173, N'w', N'j', CAST(0x5B950A00 AS Date), N'G', 0x, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Egresado] ([EgresadoID], [NombreCompleto], [Edad], [Sexo], [TelefonoPrincipal], [TelefonoAlternativo], [DNI], [Correo], [CorreoAlternativo], [Direccion], [Distrito], [Departamento], [PaisID], [PerfilLinkedIn], [PerfilFacebook], [FechaNacimiento], [TipoEgresado], [Foto], [Contrasena], [ContrasenaDinamica], [CambioContrasena], [CicloEgresado], [CodigoUniversitario], [Carrera]) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Egresado] OFF
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
SET IDENTITY_INSERT [dbo].[HistorialDatosEgresado] OFF
SET IDENTITY_INSERT [dbo].[Interes] ON 

INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (1, N'Realidad Aumentada')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (2, N'Unity')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (3, N'Cinema 3D')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (4, N'Seguridad')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (5, N'Animación 3D')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (6, N'Activismo')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (7, N'Veganismo')
INSERT [dbo].[Interes] ([InteresesID], [Nombre]) VALUES (8, N'Carnivorismo')
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
INSERT [dbo].[RegistroAcademico] ([RegistroAcademicoID], [EgresadoID], [NombreInstitucion], [Nombre], [Duracion], [Descripcion], [TipoEstudio], [PaisID]) VALUES (8, 2, N'ffdgdfgf', N'dfgfdg', N'gdfgdfg', N'dfgdfgfd', N'dfgdfg', 15)
INSERT [dbo].[RegistroAcademico] ([RegistroAcademicoID], [EgresadoID], [NombreInstitucion], [Nombre], [Duracion], [Descripcion], [TipoEstudio], [PaisID]) VALUES (9, 2, N'gdfh', N'df', N'df', N'dfd', N'df', 15)
SET IDENTITY_INSERT [dbo].[RegistroAcademico] OFF
SET IDENTITY_INSERT [dbo].[RegistroLaboral] ON 

INSERT [dbo].[RegistroLaboral] ([RegistroLaboralID], [EgresadoID], [NombreTrabajo], [Cargo], [Duracion], [Descripcion], [NombreJefe], [JefeCargo], [TelefonoContacto], [CorreoJefe], [PaisID], [TrabajoActual]) VALUES (1, 2, N'BigData', N'Desarrollador', N'Diciembre 2014 - Enero 2015', N'Desc 1', N'Jefe Supremo', N'Gerente general', N'98545163', N'jefe.supremo@gmail.com', 173, 1)
INSERT [dbo].[RegistroLaboral] ([RegistroLaboralID], [EgresadoID], [NombreTrabajo], [Cargo], [Duracion], [Descripcion], [NombreJefe], [JefeCargo], [TelefonoContacto], [CorreoJefe], [PaisID], [TrabajoActual]) VALUES (2, 2, N'ReallyDev', N'MasterScrum', N'4 meses', N'Buena', N'Elio Navarrete', N'RA', N'5555555', N'elio@ra.com', 173, 1)
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

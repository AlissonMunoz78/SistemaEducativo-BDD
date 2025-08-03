-- -----------------------------------------------------------------------------------
-- Configuración de seguridad y roles 
-- -----------------------------------------------------------------------------------
USE SistemaEducativo;
GO

-- Crear roles
CREATE ROLE rol_administrador;
CREATE ROLE rol_docente;
CREATE ROLE rol_estudiante;
CREATE ROLE rol_responsable;
CREATE ROLE rol_auditor;
GO

-- 1. Permisos para rol_administrador
GRANT CONTROL ON SCHEMA::dbo TO rol_administrador;
GRANT EXECUTE ON SCHEMA::dbo TO rol_administrador;
GO

-- 2. Permisos para rol_docente
GRANT SELECT ON Estudiantes TO rol_docente;
GRANT SELECT ON Cursos TO rol_docente;
GRANT SELECT ON Materias TO rol_docente;
GRANT SELECT, INSERT, UPDATE ON Asistencias TO rol_docente;
GRANT SELECT, INSERT, UPDATE ON Calificaciones TO rol_docente;
GRANT EXECUTE ON sp_ActualizarCalificacionesMasiva TO rol_docente;
GRANT EXECUTE ON sp_GenerarReporteCurso TO rol_docente;
GRANT SELECT ON v_ReporteCalificaciones TO rol_docente;
GRANT SELECT ON v_AsistenciasEstudiantes TO rol_docente;
GO

-- 3. Permisos para rol_estudiante
-- Primero creamos las vistas específicas para estudiantes
IF NOT EXISTS (SELECT 1 FROM sys.views WHERE name = 'v_EstudianteDatosPropios')
EXEC('
CREATE VIEW v_EstudianteDatosPropios
AS
SELECT estudiante_id, cedula, nombres, apellidos, fecha_nacimiento, genero, direccion, telefono, email
FROM Estudiantes
WHERE estudiante_id = USER_ID();
');
GO

IF NOT EXISTS (SELECT 1 FROM sys.views WHERE name = 'v_EstudianteCalificaciones')
EXEC('
CREATE VIEW v_EstudianteCalificaciones
AS
SELECT rc.* 
FROM v_ReporteCalificaciones rc
JOIN Estudiantes e ON rc.estudiante_id = e.estudiante_id
WHERE e.estudiante_id = USER_ID();
');
GO

IF NOT EXISTS (SELECT 1 FROM sys.views WHERE name = 'v_EstudianteAsistencias')
EXEC('
CREATE VIEW v_EstudianteAsistencias
AS
SELECT ae.* 
FROM v_AsistenciasEstudiantes ae
WHERE ae.estudiante_id = USER_ID();
');
GO

-- Ahora asignamos permisos
GRANT SELECT ON v_EstudianteDatosPropios TO rol_estudiante;
GRANT SELECT ON v_EstudianteCalificaciones TO rol_estudiante;
GRANT SELECT ON v_EstudianteAsistencias TO rol_estudiante;
GO

-- 4. Permisos para rol_responsable
-- Creamos vistas específicas para responsables
IF NOT EXISTS (SELECT 1 FROM sys.views WHERE name = 'v_ResponsableDatosEstudiantes')
EXEC('
CREATE VIEW v_ResponsableDatosEstudiantes
AS
SELECT e.estudiante_id, e.cedula, e.nombres, e.apellidos, e.fecha_nacimiento, e.genero, c.nombre AS curso
FROM Estudiantes e
JOIN Estudiante_Responsable er ON e.estudiante_id = er.estudiante_id
JOIN Responsables r ON er.responsable_id = r.responsable_id
JOIN Matriculas m ON e.estudiante_id = m.estudiante_id
JOIN Cursos c ON m.curso_id = c.curso_id
WHERE r.cedula = USER_NAME();
');
GO

IF NOT EXISTS (SELECT 1 FROM sys.views WHERE name = 'v_ResponsableCalificaciones')
EXEC('
CREATE VIEW v_ResponsableCalificaciones
AS
SELECT rc.* 
FROM v_ReporteCalificaciones rc
JOIN Estudiantes e ON rc.estudiante_id = e.estudiante_id
JOIN Estudiante_Responsable er ON e.estudiante_id = er.estudiante_id
JOIN Responsables r ON er.responsable_id = r.responsable_id
WHERE r.cedula = USER_NAME();
');
GO

IF NOT EXISTS (SELECT 1 FROM sys.views WHERE name = 'v_ResponsableAsistencias')
EXEC('
CREATE VIEW v_ResponsableAsistencias
AS
SELECT ae.* 
FROM v_AsistenciasEstudiantes ae
JOIN Estudiantes e ON ae.estudiante_id = e.estudiante_id
JOIN Estudiante_Responsable er ON e.estudiante_id = er.estudiante_id
JOIN Responsables r ON er.responsable_id = r.responsable_id
WHERE r.cedula = USER_NAME();
');
GO

-- Asignamos permisos
GRANT SELECT ON v_ResponsableDatosEstudiantes TO rol_responsable;
GRANT SELECT ON v_ResponsableCalificaciones TO rol_responsable;
GRANT SELECT ON v_ResponsableAsistencias TO rol_responsable;
GO

-- 5. Permisos para rol_auditor
GRANT SELECT ON SCHEMA::dbo TO rol_auditor;
GRANT SELECT ON Log_Auditoria TO rol_auditor;
DENY INSERT, UPDATE, DELETE ON SCHEMA::dbo TO rol_auditor;
GO

-- Crear usuarios de ejemplo
-- 1. Usuario administrador
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'admin_login')
    CREATE LOGIN admin_login WITH PASSWORD = 'Admin@1234!';
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'admin_user')
    CREATE USER admin_user FOR LOGIN admin_login;
ALTER ROLE rol_administrador ADD MEMBER admin_user;
GO

-- 2. Usuario docente
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'docente_login')
    CREATE LOGIN docente_login WITH PASSWORD = 'Docente@1234!';
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'docente_user')
    CREATE USER docente_user FOR LOGIN docente_login;
ALTER ROLE rol_docente ADD MEMBER docente_user;
GO

-- 3. Usuario estudiante
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'estudiante_login')
    CREATE LOGIN estudiante_login WITH PASSWORD = 'Estudiante@1234!';
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'estudiante_user')
    CREATE USER estudiante_user FOR LOGIN estudiante_login;
ALTER ROLE rol_estudiante ADD MEMBER estudiante_user;
GO

-- 4. Usuario responsable
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'responsable_login')
    CREATE LOGIN responsable_login WITH PASSWORD = 'Responsable@1234!';
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'responsable_user')
    CREATE USER responsable_user FOR LOGIN responsable_login;
ALTER ROLE rol_responsable ADD MEMBER responsable_user;
GO

-- 5. Usuario auditor
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'auditor_login')
    CREATE LOGIN auditor_login WITH PASSWORD = 'Auditor@1234!';
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'auditor_user')
    CREATE USER auditor_user FOR LOGIN auditor_login;
ALTER ROLE rol_auditor ADD MEMBER auditor_user;
GO

-- Asignar permisos adicionales para vistas creadas
GRANT SELECT ON v_ResumenAcademico TO rol_administrador;
GRANT SELECT ON v_ResumenAcademico TO rol_docente;
GO

PRINT 'Configuración de seguridad completada exitosamente';
GO
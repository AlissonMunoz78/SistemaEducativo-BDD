-- -----------------------------------------------------------------------------------
-- Configuración de seguridad y roles
-- Cumple con: Creación de roles personalizados, gestión de privilegios
-- -----------------------------------------------------------------------------------

-- Crear roles
CREATE ROLE rol_administrador;
CREATE ROLE rol_docente;
CREATE ROLE rol_estudiante;
CREATE ROLE rol_responsable;
CREATE ROLE rol_auditor;

-- Asignar permisos a administrador (acceso completo)
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::dbo TO rol_administrador;

-- Asignar permisos a docente
GRANT SELECT ON Estudiantes TO rol_docente;
GRANT SELECT, INSERT, UPDATE ON Asistencias TO rol_docente;
GRANT SELECT, INSERT, UPDATE ON Calificaciones TO rol_docente;
GRANT EXECUTE ON sp_ActualizarCalificacionesMasiva TO rol_docente;
GRANT SELECT ON v_ReporteCalificaciones TO rol_docente;

-- Asignar permisos a estudiante (solo consulta propia)
GRANT SELECT ON v_EstudianteDatosPropios TO rol_estudiante;
GRANT SELECT ON v_EstudianteCalificaciones TO rol_estudiante;
GRANT SELECT ON v_EstudianteAsistencias TO rol_estudiante;

-- Asignar permisos a responsable (solo consulta de sus estudiantes)
GRANT SELECT ON v_ResponsableDatosEstudiantes TO rol_responsable;
GRANT SELECT ON v_ResponsableCalificaciones TO rol_responsable;
GRANT SELECT ON v_ResponsableAsistencias TO rol_responsable;

-- Asignar permisos a auditor (solo lectura y logs)
GRANT SELECT ON ALL TABLES TO rol_auditor;
GRANT SELECT ON SCHEMA::dbo TO rol_auditor;
DENY INSERT, UPDATE, DELETE ON SCHEMA::dbo TO rol_auditor;

-- Crear usuarios de ejemplo
CREATE LOGIN admin_login WITH PASSWORD = 'Admin@123';
CREATE USER admin_user FOR LOGIN admin_login;
ALTER ROLE rol_administrador ADD MEMBER admin_user;

CREATE LOGIN docente_login WITH PASSWORD = 'Docente@123';
CREATE USER docente_user FOR LOGIN docente_login;
ALTER ROLE rol_docente ADD MEMBER docente_user;

-- ... continuar con otros usuarios ...
-- -----------------------------------------------------------------------------------
-- Script de creación de base de datos y tablas para Sistema de Gestión Educativa
-- Modelo en 3FN para SQL Server
-- -----------------------------------------------------------------------------------
CREATE DATABASE SistemaEducativo;
GO

USE SistemaEducativo;
GO



-- Tabla de Instituciones educativas
CREATE TABLE Instituciones (
    institucion_id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE CHECK (email LIKE '%@%.%'),
    fecha_creacion DATE DEFAULT GETDATE(),
    activo BIT DEFAULT 1
);

-- Tabla de Estudiantes
CREATE TABLE Estudiantes (
    estudiante_id INT PRIMARY KEY IDENTITY(1,1),
    cedula VARCHAR(20) UNIQUE NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    genero CHAR(1) CHECK (genero IN ('M', 'F', 'O')),
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    email VARCHAR(100) CHECK (email LIKE '%@%.%'),
    institucion_id INT NOT NULL FOREIGN KEY REFERENCES Instituciones(institucion_id),
    fecha_ingreso DATE DEFAULT GETDATE(),
    activo BIT DEFAULT 1
);

-- Tabla de Responsables (padres/tutores)
CREATE TABLE Responsables (
    responsable_id INT PRIMARY KEY IDENTITY(1,1),
    cedula VARCHAR(20) UNIQUE NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    parentesco VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) CHECK (email LIKE '%@%.%'),
    direccion VARCHAR(200)
);

-- Tabla de relación Estudiante-Responsable
CREATE TABLE Estudiante_Responsable (
    estudiante_id INT NOT NULL,
    responsable_id INT NOT NULL,
    fecha_asignacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_Estudiante_Responsable PRIMARY KEY (estudiante_id, responsable_id),
    CONSTRAINT FK_Estudiante FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(estudiante_id),
    CONSTRAINT FK_Responsable FOREIGN KEY (responsable_id) REFERENCES Responsables(responsable_id)
);
PRINT 'Tabla recreada exitosamente';
GO

BEGIN TRY
    BEGIN TRANSACTION;
    
    -- Verificación crítica de datos fuente
    DECLARE @EstudiantesDisponibles INT = (SELECT COUNT(*) FROM Estudiantes);
    DECLARE @ResponsablesDisponibles INT = (SELECT COUNT(*) FROM Responsables);
    
    IF @EstudiantesDisponibles = 0 OR @ResponsablesDisponibles < 2
    BEGIN
        RAISERROR('Datos insuficientes: Se requieren estudiantes y al menos 2 responsables', 16, 1);
    END
    
    -- Inserción directa con JOIN (método más confiable)
    INSERT INTO Estudiante_Responsable (estudiante_id, responsable_id)
    SELECT 
        e.estudiante_id,
        r.responsable_id
    FROM 
        (SELECT estudiante_id, ROW_NUMBER() OVER (ORDER BY estudiante_id) AS rn FROM Estudiantes) e
    JOIN 
        (SELECT responsable_id, ROW_NUMBER() OVER (ORDER BY responsable_id) AS rn FROM Responsables) r
    ON 
        r.rn BETWEEN (e.rn*2)-1 AND (e.rn*2)
    WHERE 
        e.estudiante_id <= 150;
    
    -- Verificación post-inserción
    DECLARE @RegistrosInsertados INT = @@ROWCOUNT;
    
    IF @RegistrosInsertados = 0
    BEGIN
        RAISERROR('No se insertaron registros - Verifique coincidencia de IDs', 16, 1);
    END
    
    COMMIT TRANSACTION;
    
    PRINT CONCAT('Inserción exitosa: ', @RegistrosInsertados, ' relaciones creadas');
    
    -- Mostrar resumen
    SELECT 
        @RegistrosInsertados AS Relaciones_Creadas,
        COUNT(DISTINCT estudiante_id) AS Estudiantes_Asignados,
        COUNT(DISTINCT responsable_id) AS Responsables_Utilizados
    FROM Estudiante_Responsable;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    
    PRINT 'ERROR: ' + ERROR_MESSAGE();
    PRINT 'Detalles:';
    
    -- Diagnóstico avanzado
    IF NOT EXISTS (SELECT 1 FROM Estudiantes WHERE estudiante_id <= 150)
        PRINT '- No hay estudiantes con ID <= 150';
    
    IF (SELECT COUNT(*) FROM Responsables) < 300
        PRINT '- Insuficientes responsables (se necesitan al menos 300)';
    
    IF EXISTS (
        SELECT 1 
        FROM Estudiantes e 
        CROSS JOIN (SELECT TOP 2 responsable_id FROM Responsables ORDER BY responsable_id) r
        WHERE NOT EXISTS (
            SELECT 1 
            FROM Responsables 
            WHERE responsable_id = r.responsable_id
        )
    )
        PRINT '- Existen inconsistencias en las claves foráneas';
END CATCH;
GO
    
-- Tabla de Docentes
CREATE TABLE Docentes (
    docente_id INT PRIMARY KEY IDENTITY(1,1),
    cedula VARCHAR(20) UNIQUE NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    titulo VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE CHECK (email LIKE '%@%.%'),
    institucion_id INT NOT NULL FOREIGN KEY REFERENCES Instituciones(institucion_id),
    activo BIT DEFAULT 1
);

-- Tabla de Cursos
CREATE TABLE Cursos (
    curso_id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    nivel VARCHAR(50) NOT NULL,
    institucion_id INT NOT NULL FOREIGN KEY REFERENCES Instituciones(institucion_id)
);

-- Tabla de Materias
CREATE TABLE Materias (
    materia_id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    horas_semanales INT NOT NULL CHECK (horas_semanales > 0),
    curso_id INT NOT NULL FOREIGN KEY REFERENCES Cursos(curso_id)
);

-- Tabla de Asignación Docente-Materia
CREATE TABLE Docente_Materia (
    docente_materia_id INT PRIMARY KEY IDENTITY(1,1),
    docente_id INT NOT NULL FOREIGN KEY REFERENCES Docentes(docente_id),
    materia_id INT NOT NULL FOREIGN KEY REFERENCES Materias(materia_id),
    periodo VARCHAR(20) NOT NULL,
    UNIQUE (docente_id, materia_id, periodo)
);

-- Tabla de Matrículas
CREATE TABLE Matriculas (
    matricula_id INT PRIMARY KEY IDENTITY(1,1),
    estudiante_id INT NOT NULL FOREIGN KEY REFERENCES Estudiantes(estudiante_id),
    curso_id INT NOT NULL FOREIGN KEY REFERENCES Cursos(curso_id),
    fecha_matricula DATE DEFAULT GETDATE(),
    periodo VARCHAR(20) NOT NULL,
    estado VARCHAR(20) DEFAULT 'Activo' CHECK (estado IN ('Activo', 'Inactivo', 'Graduado', 'Retirado')),
    UNIQUE (estudiante_id, curso_id, periodo)
);

-- Tabla de Asistencias
CREATE TABLE Asistencias (
    asistencia_id INT PRIMARY KEY IDENTITY(1,1),
    estudiante_id INT NOT NULL FOREIGN KEY REFERENCES Estudiantes(estudiante_id),
    materia_id INT NOT NULL FOREIGN KEY REFERENCES Materias(materia_id),
    fecha DATE NOT NULL DEFAULT GETDATE(),
    estado CHAR(1) NOT NULL CHECK (estado IN ('P', 'A', 'T')) -- P=Presente, A=Ausente, T=Tardanza
);

-- Tabla de Calificaciones
CREATE TABLE Calificaciones (
    calificacion_id INT PRIMARY KEY IDENTITY(1,1),
    estudiante_id INT NOT NULL FOREIGN KEY REFERENCES Estudiantes(estudiante_id),
    materia_id INT NOT NULL FOREIGN KEY REFERENCES Materias(materia_id),
    periodo VARCHAR(20) NOT NULL,
    parcial1 DECIMAL(5,2) CHECK (parcial1 BETWEEN 0 AND 10),
    parcial2 DECIMAL(5,2) CHECK (parcial2 BETWEEN 0 AND 10),
    parcial3 DECIMAL(5,2) CHECK (parcial3 BETWEEN 0 AND 10),
    promedio DECIMAL(5,2) CHECK (promedio BETWEEN 0 AND 10),
    observaciones VARCHAR(200),
    UNIQUE (estudiante_id, materia_id, periodo)
);

-- Tabla de Auditoría
CREATE TABLE Log_Auditoria (
    log_id INT PRIMARY KEY IDENTITY(1,1),
    usuario VARCHAR(100) NOT NULL,
    ip VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT GETDATE(),
    accion VARCHAR(20) NOT NULL,
    tabla_afectada VARCHAR(50) NOT NULL,
    id_afectado INT,
    datos_anteriores VARCHAR(MAX),
    datos_nuevos VARCHAR(MAX)
);
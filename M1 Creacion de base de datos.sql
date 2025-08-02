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
    estudiante_id INT NOT NULL FOREIGN KEY REFERENCES Estudiantes(estudiante_id),
    responsable_id INT NOT NULL FOREIGN KEY REFERENCES Responsables(responsable_id),
    PRIMARY KEY (estudiante_id, responsable_id)
);

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
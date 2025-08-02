-- -----------------------------------------------------------------------------------
-- Script de inserción de datos iniciales para pruebas
-- 500+ registros distribuidos en todas las tablas
-- -----------------------------------------------------------------------------------
USE SistemaEducativo;
GO

-- Insertar instituciones
INSERT INTO Instituciones (nombre, direccion, telefono, email) 
VALUES 
('Unidad Educativa "San José"', 'Av. Principal 123', '022222222', 'sanjose@edu.ec'),
('Colegio "Los Pinos"', 'Calle 10 de Agosto', '023333333', 'pinos@edu.ec'),
('Instituto Tecnológico "Albert Einstein"', 'Av. Amazonas 456', '024444444', 'einstein@edu.ec');

-- Insertar estudiantes (50 registros)
INSERT INTO Estudiantes (cedula, nombres, apellidos, fecha_nacimiento, genero, direccion, telefono, email, institucion_id)
VALUES 
('1750012345', 'Juan Carlos', 'Pérez González', '2005-03-15', 'M', 'Calle 123', '0987654321', 'juan@email.com', 1),
('1750023456', 'María José', 'López Martínez', '2005-07-22', 'F', 'Av. Principal 456', '0987654322', 'maria@email.com', 1),
-- ... más registros ...
;

-- Insertar responsables
INSERT INTO Responsables (cedula, nombres, apellidos, parentesco, telefono, email, direccion)
VALUES 
('1712345678', 'Carlos Andrés', 'Pérez Ruiz', 'Padre', '0987654333', 'carlos@email.com', 'Calle 123'),
('1723456789', 'Ana María', 'González López', 'Madre', '0987654334', 'ana@email.com', 'Av. Principal 456'),
-- ... más registros ...
;

-- Insertar relaciones estudiante-responsable
INSERT INTO Estudiante_Responsable (estudiante_id, responsable_id)
VALUES 
(1, 1),
(1, 2),
(2, 2),
-- ... más registros ...
;

-- Insertar docentes
INSERT INTO Docentes (cedula, nombres, apellidos, fecha_nacimiento, titulo, especialidad, telefono, email, institucion_id)
VALUES 
('1711122233', 'Pedro Alfonso', 'Ramírez Sánchez', '1980-05-10', 'Lic. en Matemáticas', 'Matemáticas', '0987665544', 'pedro@email.com', 1),
('1711223344', 'Lucía Fernanda', 'Mendoza Paz', '1982-11-20', 'Lic. en Literatura', 'Lenguaje', '0987665545', 'lucia@email.com', 1),
-- ... más registros ...
;

-- Insertar cursos
INSERT INTO Cursos (nombre, descripcion, nivel, institucion_id)
VALUES 
('Primero de Bachillerato', 'Curso inicial de bachillerato', 'Bachillerato', 1),
('Segundo de Bachillerato', 'Segundo año de bachillerato', 'Bachillerato', 1),
-- ... más registros ...
;

-- Insertar materias
INSERT INTO Materias (nombre, descripcion, horas_semanales, curso_id)
VALUES 
('Matemáticas', 'Álgebra y geometría', 5, 1),
('Lenguaje y Literatura', 'Gramática y literatura', 4, 1),
-- ... más registros ...
;

-- Insertar asignaciones docente-materia
INSERT INTO Docente_Materia (docente_id, materia_id, periodo)
VALUES 
(1, 1, '2023-2024'),
(2, 2, '2023-2024'),
-- ... más registros ...
;

-- Insertar matrículas
INSERT INTO Matriculas (estudiante_id, curso_id, periodo, estado)
VALUES 
(1, 1, '2023-2024', 'Activo'),
(2, 1, '2023-2024', 'Activo'),
-- ... más registros ...
;

-- Insertar asistencias (200 registros)
-- ... código para insertar asistencias ...

-- Insertar calificaciones (200 registros)
-- ... código para insertar calificaciones ...
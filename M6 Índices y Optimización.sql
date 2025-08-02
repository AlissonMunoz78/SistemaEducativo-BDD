-- -----------------------------------------------------------------------------------
-- Creación de índices para optimización
-- Cumple con: Índices simples y compuestos para campos clave
-- -----------------------------------------------------------------------------------

-- Índices para tablas principales
CREATE INDEX idx_Estudiantes_Cedula ON Estudiantes(cedula);
CREATE INDEX idx_Estudiantes_Institucion ON Estudiantes(institucion_id);
CREATE INDEX idx_Docentes_Cedula ON Docentes(cedula);
CREATE INDEX idx_Docentes_Institucion ON Docentes(institucion_id);

-- Índices para tablas de relación
CREATE INDEX idx_EstudianteResponsable_Estudiante ON Estudiante_Responsable(estudiante_id);
CREATE INDEX idx_EstudianteResponsable_Responsable ON Estudiante_Responsable(responsable_id);
CREATE INDEX idx_DocenteMateria_Docente ON Docente_Materia(docente_id);
CREATE INDEX idx_DocenteMateria_Materia ON Docente_Materia(materia_id);

-- Índices para consultas frecuentes
CREATE INDEX idx_Matriculas_Estudiante ON Matriculas(estudiante_id);
CREATE INDEX idx_Matriculas_Curso ON Matriculas(curso_id);
CREATE INDEX idx_Asistencias_EstudianteMateria ON Asistencias(estudiante_id, materia_id);
CREATE INDEX idx_Calificaciones_EstudianteMateria ON Calificaciones(estudiante_id, materia_id);

-- Índice compuesto para reportes
CREATE INDEX idx_Calificaciones_PeriodoPromedio ON Calificaciones(periodo, promedio) INCLUDE (estudiante_id, materia_id);

-- Ejemplo de análisis de rendimiento
-- Antes de crear índices adicionales, ejecutar:
-- SET STATISTICS IO, TIME ON;
-- SELECT * FROM Calificaciones WHERE periodo = '2023-2024' AND promedio > 8.5;
-- SET STATISTICS IO, TIME OFF;
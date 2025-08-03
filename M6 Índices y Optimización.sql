-- -----------------------------------------------------------------------------------
-- Creación de índices para optimización
-- Cumple con: Índices simples y compuestos para campos clave
-- -----------------------------------------------------------------------------------
USE SistemaEducativo;
GO

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

-- Para v er todos los indices
SELECT 
    t.name AS Tabla,
    i.name AS Indice,
    i.type_desc AS Tipo,
    i.is_primary_key AS PK,
    i.is_unique AS Unico,
    i.is_unique_constraint AS UniqueConstraint,
    COUNT(ic.index_column_id) AS Columnas
FROM sys.tables t
JOIN sys.indexes i ON t.object_id = i.object_id
JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
WHERE i.type_desc <> 'HEAP'
GROUP BY t.name, i.name, i.type_desc, i.is_primary_key, i.is_unique, i.is_unique_constraint
ORDER BY t.name, i.name;


SELECT 
    log_id,
    fecha,
    usuario,
    ip,
    accion,
    tabla_afectada,
    id_afectado,
    datos_anteriores,
    datos_nuevos
FROM Log_Auditoria
ORDER BY fecha DESC;
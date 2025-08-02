-- -----------------------------------------------------------------------------------
-- Vistas y consultas frecuentes
-- Cumple con: Joins, reportes complejos
-- -----------------------------------------------------------------------------------
USE SistemaEducativo;
GO

-- Vista 1: Reporte de calificaciones por estudiante
CREATE OR ALTER VIEW v_ReporteCalificaciones AS
SELECT 
    e.estudiante_id,
    e.cedula,
    e.nombres + ' ' + e.apellidos AS estudiante,
    c.nombre AS curso,
    m.nombre AS materia,
    cal.periodo,
    cal.parcial1,
    cal.parcial2,
    cal.parcial3,
    cal.promedio,
    CASE 
        WHEN cal.promedio >= 7 THEN 'Aprobado'
        WHEN cal.promedio IS NULL THEN 'Sin calificar'
        ELSE 'Reprobado'
    END AS estado
FROM Estudiantes e
JOIN Matriculas mat ON e.estudiante_id = mat.estudiante_id
JOIN Cursos c ON mat.curso_id = c.curso_id
JOIN Materias m ON c.curso_id = m.curso_id
JOIN Calificaciones cal ON e.estudiante_id = cal.estudiante_id AND m.materia_id = cal.materia_id;
GO

-- Consulta 1: Estudiantes con bajo rendimiento (promedio < 6.5)
SELECT 
    estudiante,
    curso,
    materia,
    periodo,
    promedio
FROM v_ReporteCalificaciones
WHERE promedio < 6.5
ORDER BY promedio ASC;
GO

-- ... continuar con las otras 4 consultas requeridas ...
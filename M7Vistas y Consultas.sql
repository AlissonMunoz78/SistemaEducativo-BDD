-- -----------------------------------------------------------------------------------
-- Vistas y consultas frecuentes
-- Cumple con: Joins, reportes complejos
-- -----------------------------------------------------------------------------------
USE SistemaEducativo;
GO

-- -----------------------------------------------------------------------------------
-- Consulta 1: Estudiantes con bajo rendimiento (promedio < 6.5)
-- -----------------------------------------------------------------------------------
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


-- -----------------------------------------------------------------------------------
-- Consulta 2: Porcentaje de asistencia por curso
-- -----------------------------------------------------------------------------------
SELECT 
    c.nombre AS curso,
    m.nombre AS materia,
    COUNT(CASE WHEN a.estado = 'P' THEN 1 END) AS presentes,
    COUNT(CASE WHEN a.estado = 'A' THEN 1 END) AS ausentes,
    COUNT(CASE WHEN a.estado = 'T' THEN 1 END) AS tardanzas,
    COUNT(*) AS total_clases,
    ROUND(COUNT(CASE WHEN a.estado IN ('P', 'T') THEN 1 END) * 100.0 / COUNT(*), 2) AS porcentaje_asistencia
FROM Cursos c
JOIN Materias m ON c.curso_id = m.curso_id
JOIN Asistencias a ON m.materia_id = a.materia_id
GROUP BY c.nombre, m.nombre
ORDER BY c.nombre, porcentaje_asistencia DESC;
GO

-- -----------------------------------------------------------------------------------
-- Consulta 3: Docentes y las materias que imparten
-- -----------------------------------------------------------------------------------
SELECT 
    d.nombres + ' ' + d.apellidos AS docente,
    i.nombre AS institucion,
    c.nombre AS curso,
    m.nombre AS materia,
    dm.periodo,
    COUNT(DISTINCT mat.estudiante_id) AS estudiantes_asignados
FROM Docentes d
JOIN Instituciones i ON d.institucion_id = i.institucion_id
JOIN Docente_Materia dm ON d.docente_id = dm.docente_id
JOIN Materias m ON dm.materia_id = m.materia_id
JOIN Cursos c ON m.curso_id = c.curso_id
JOIN Matriculas mat ON c.curso_id = mat.curso_id AND mat.periodo = dm.periodo
GROUP BY d.nombres, d.apellidos, i.nombre, c.nombre, m.nombre, dm.periodo
ORDER BY docente, periodo;
GO

-- -----------------------------------------------------------------------------------
-- Consulta 4: Responsables y sus estudiantes
-- -----------------------------------------------------------------------------------
SELECT 
    r.nombres + ' ' + r.apellidos AS responsable,
    r.parentesco,
    r.telefono,
    e.nombres + ' ' + e.apellidos AS estudiante,
    c.nombre AS curso,
    mat.periodo
FROM Responsables r
JOIN Estudiante_Responsable er ON r.responsable_id = er.responsable_id
JOIN Estudiantes e ON er.estudiante_id = e.estudiante_id
JOIN Matriculas mat ON e.estudiante_id = mat.estudiante_id
JOIN Cursos c ON mat.curso_id = c.curso_id
ORDER BY responsable, estudiante;
GO

-- -----------------------------------------------------------------------------------
-- Consulta 5: Histórico de cambios en calificaciones
-- -----------------------------------------------------------------------------------
SELECT 
    l.fecha,
    l.usuario,
    e.nombres + ' ' + e.apellidos AS estudiante,
    m.nombre AS materia,
    l.datos_anteriores,
    l.datos_nuevos
FROM Log_Auditoria l
JOIN Estudiantes e ON l.id_afectado = e.estudiante_id
JOIN Materias m ON l.datos_nuevos LIKE '%Materia: ' + CAST(m.materia_id AS VARCHAR) + '%'
WHERE l.tabla_afectada = 'Calificaciones'
ORDER BY l.fecha DESC;
GO



-- -----------------------------------------------------------------------------------
-- Vista 1: Reporte de calificaciones por estudiante (VERSIÓN CORREGIDA)
-- -----------------------------------------------------------------------------------
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
JOIN Calificaciones cal ON (e.estudiante_id = cal.estudiante_id AND m.materia_id = cal.materia_id AND mat.periodo = cal.periodo);
GO

-- -----------------------------------------------------------------------------------
-- Vista 2: Asistencias por estudiante y materia
-- -----------------------------------------------------------------------------------
CREATE OR ALTER VIEW v_AsistenciasEstudiantes AS
SELECT 
    e.estudiante_id,
    e.cedula,
    e.nombres + ' ' + e.apellidos AS estudiante,
    c.nombre AS curso,
    m.nombre AS materia,
    a.fecha,
    CASE a.estado
        WHEN 'P' THEN 'Presente'
        WHEN 'A' THEN 'Ausente'
        WHEN 'T' THEN 'Tardanza'
        ELSE a.estado
    END AS estado_asistencia,
    YEAR(a.fecha) AS año,
    MONTH(a.fecha) AS mes
FROM Estudiantes e
JOIN Matriculas mat ON e.estudiante_id = mat.estudiante_id
JOIN Cursos c ON mat.curso_id = c.curso_id
JOIN Materias m ON c.curso_id = m.curso_id
JOIN Asistencias a ON (e.estudiante_id = a.estudiante_id AND m.materia_id = a.materia_id);
GO

-- -----------------------------------------------------------------------------------
-- Vista 3: Resumen académico por estudiante
-- -----------------------------------------------------------------------------------
CREATE OR ALTER VIEW v_ResumenAcademico AS
SELECT 
    e.estudiante_id,
    e.nombres + ' ' + e.apellidos AS estudiante,
    c.nombre AS curso_actual,
    COUNT(DISTINCT cal.materia_id) AS materias_cursadas,
    AVG(cal.promedio) AS promedio_general,
    SUM(CASE WHEN cal.promedio >= 7 THEN 1 ELSE 0 END) AS materias_aprobadas,
    SUM(CASE WHEN cal.promedio < 7 THEN 1 ELSE 0 END) AS materias_reprobadas,
    dbo.fn_EstadoAcademico(e.estudiante_id, mat.periodo) AS estado_academico
FROM Estudiantes e
JOIN Matriculas mat ON e.estudiante_id = mat.estudiante_id
JOIN Cursos c ON mat.curso_id = c.curso_id
JOIN Calificaciones cal ON e.estudiante_id = cal.estudiante_id
WHERE mat.estado = 'Activo'
GROUP BY e.estudiante_id, e.nombres, e.apellidos, c.nombre, mat.periodo;
GO
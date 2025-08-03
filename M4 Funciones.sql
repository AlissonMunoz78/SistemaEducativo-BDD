-- -----------------------------------------------------------------------------------
-- Función 1: Calcular edad a partir de fecha de nacimiento
-- Cumple con: Funciones que devuelven edad, duración, porcentajes o indicadores
-- -----------------------------------------------------------------------------------
USE SistemaEducativo;
GO

CREATE OR ALTER FUNCTION fn_CalcularEdad(@fecha_nacimiento DATE)
RETURNS INT
AS
BEGIN
    DECLARE @edad INT;
    
    SET @edad = DATEDIFF(YEAR, @fecha_nacimiento, GETDATE());
    
    -- Ajustar si aún no ha pasado el cumpleaños este año
    IF DATEADD(YEAR, @edad, @fecha_nacimiento) > GETDATE()
        SET @edad = @edad - 1;
        
    RETURN @edad;
END;
GO

-- -----------------------------------------------------------------------------------
-- Función 2: Calcular porcentaje de asistencia por estudiante y materia
-- Cumple con: Cálculos agregados personalizados
-- -----------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION fn_PorcentajeAsistencia(@estudiante_id INT, @materia_id INT, @periodo VARCHAR(20))
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @total_clases INT;
    DECLARE @asistencias INT;
    DECLARE @porcentaje DECIMAL(5,2);
    
    -- Contar total de clases registradas
    SELECT @total_clases = COUNT(*) 
    FROM Asistencias 
    WHERE materia_id = @materia_id 
    AND estudiante_id = @estudiante_id
    AND YEAR(fecha) = LEFT(@periodo, 4);
    
    -- Contar asistencias (Presente o Tardanza)
    SELECT @asistencias = COUNT(*) 
    FROM Asistencias 
    WHERE materia_id = @materia_id 
    AND estudiante_id = @estudiante_id
    AND YEAR(fecha) = LEFT(@periodo, 4)
    AND estado IN ('P', 'T');
    
    -- Calcular porcentaje
    IF @total_clases > 0
        SET @porcentaje = (@asistencias * 100.0) / @total_clases;
    ELSE
        SET @porcentaje = 0;
        
    RETURN @porcentaje;
END;
GO

-- -----------------------------------------------------------------------------------
-- Función 3: Determinar el estado académico del estudiante
-- Cumple con: Estados condicionales basados en lógica SQL
-- -----------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION fn_EstadoAcademico(
    @estudiante_id INT, 
    @periodo VARCHAR(20)
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @promedio_general DECIMAL(5,2);
    DECLARE @porcentaje_asistencia DECIMAL(5,2);
    DECLARE @materias_reprobadas INT;
    DECLARE @estado VARCHAR(50);
    
    -- Calcular promedio general
    SELECT @promedio_general = AVG(promedio)
    FROM Calificaciones
    WHERE estudiante_id = @estudiante_id AND periodo = @periodo;
    
    -- Calcular porcentaje de asistencia promedio
    SELECT @porcentaje_asistencia = AVG(dbo.fn_PorcentajeAsistencia(@estudiante_id, materia_id, @periodo))
    FROM Calificaciones
    WHERE estudiante_id = @estudiante_id AND periodo = @periodo;
    
    -- Contar materias reprobadas
    SELECT @materias_reprobadas = COUNT(*)
    FROM Calificaciones
    WHERE estudiante_id = @estudiante_id 
    AND periodo = @periodo
    AND promedio < 7;
    
    -- Determinar estado académico
    IF @promedio_general >= 8 AND @porcentaje_asistencia >= 90 AND @materias_reprobadas = 0
        SET @estado = 'Excelente';
    ELSE IF @promedio_general >= 7 AND @porcentaje_asistencia >= 80 AND @materias_reprobadas <= 1
        SET @estado = 'Bueno';
    ELSE IF @promedio_general >= 6 AND @porcentaje_asistencia >= 70
        SET @estado = 'Regular';
    ELSE IF @materias_reprobadas >= 3 OR @porcentaje_asistencia < 60
        SET @estado = 'En riesgo académico';
    ELSE
        SET @estado = 'Necesita mejorar';
    
    RETURN @estado;
END;
GO
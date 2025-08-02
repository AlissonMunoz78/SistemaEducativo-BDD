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

-- ... continuar con la tercera función requerida ...
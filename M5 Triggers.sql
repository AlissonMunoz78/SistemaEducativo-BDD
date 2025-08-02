-- -----------------------------------------------------------------------------------
-- Trigger 1: Auditoría para cambios en calificaciones
-- Cumple con: Auditoría con tabla de log, Registro histórico de cambios relevantes
-- -----------------------------------------------------------------------------------
CREATE OR ALTER TRIGGER tr_AuditoriaCalificaciones
ON Calificaciones
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO Log_Auditoria (usuario, ip, accion, tabla_afectada, id_afectado, datos_anteriores, datos_nuevos)
    SELECT 
        SUSER_NAME(),
        CONNECTIONPROPERTY('client_net_address'),
        'UPDATE',
        'Calificaciones',
        i.calificacion_id,
        CONCAT('Estudiante: ', i.estudiante_id, ', Materia: ', i.materia_id, 
               ', P1: ', d.parcial1, ', P2: ', d.parcial2, ', P3: ', d.parcial3, ', Prom: ', d.promedio),
        CONCAT('Estudiante: ', i.estudiante_id, ', Materia: ', i.materia_id, 
               ', P1: ', i.parcial1, ', P2: ', i.parcial2, ', P3: ', i.parcial3, ', Prom: ', i.promedio)
    FROM inserted i
    JOIN deleted d ON i.calificacion_id = d.calificacion_id
    WHERE i.parcial1 <> d.parcial1 OR i.parcial2 <> d.parcial2 OR i.parcial3 <> d.parcial3 OR i.promedio <> d.promedio;
END;
GO

-- ... continuar con los otros 2 triggers requeridos ...
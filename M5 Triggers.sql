-- -----------------------------------------------------------------------------------
-- Trigger 1: Auditoría para cambios en calificaciones
-- Cumple con: Auditoría con tabla de log, Registro histórico de cambios relevantes
-- -----------------------------------------------------------------------------------
USE SistemaEducativo;
GO

-- -----------------------------------------------------------------------------------
-- Trigger 1 CORREGIDO: Auditoría para cambios en calificaciones
-- -----------------------------------------------------------------------------------
CREATE OR ALTER TRIGGER tr_AuditoriaCalificaciones
ON Calificaciones
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO Log_Auditoria (
        usuario, 
        ip, 
        accion, 
        tabla_afectada, 
        id_afectado, 
        datos_anteriores, 
        datos_nuevos,
        fecha
    )
    SELECT 
        CONVERT(VARCHAR(100), SUSER_NAME()),
        CONVERT(VARCHAR(50), CONNECTIONPROPERTY('client_net_address')),
        'UPDATE',
        'Calificaciones',
        i.calificacion_id,
        CONVERT(VARCHAR(MAX), 
            CONCAT('Estudiante: ', i.estudiante_id, 
                   ', Materia: ', i.materia_id, 
                   ', P1: ', ISNULL(CONVERT(VARCHAR, d.parcial1), 'NULL'), 
                   ', P2: ', ISNULL(CONVERT(VARCHAR, d.parcial2), 'NULL'), 
                   ', P3: ', ISNULL(CONVERT(VARCHAR, d.parcial3), 'NULL'), 
                   ', Prom: ', ISNULL(CONVERT(VARCHAR, d.promedio), 'NULL'))),
        CONVERT(VARCHAR(MAX), 
            CONCAT('Estudiante: ', i.estudiante_id, 
                   ', Materia: ', i.materia_id, 
                   ', P1: ', ISNULL(CONVERT(VARCHAR, i.parcial1), 'NULL'), 
                   ', P2: ', ISNULL(CONVERT(VARCHAR, i.parcial2), 'NULL'), 
                   ', P3: ', ISNULL(CONVERT(VARCHAR, i.parcial3), 'NULL'), 
                   ', Prom: ', ISNULL(CONVERT(VARCHAR, i.promedio), 'NULL'))),
        GETDATE()
    FROM inserted i
    JOIN deleted d ON i.calificacion_id = d.calificacion_id
    WHERE i.parcial1 <> d.parcial1 
       OR i.parcial2 <> d.parcial2 
       OR i.parcial3 <> d.parcial3 
       OR i.promedio <> d.promedio
       OR (i.parcial1 IS NULL AND d.parcial1 IS NOT NULL)
       OR (i.parcial1 IS NOT NULL AND d.parcial1 IS NULL)
       OR (i.parcial2 IS NULL AND d.parcial2 IS NOT NULL)
       OR (i.parcial2 IS NOT NULL AND d.parcial2 IS NULL)
       OR (i.parcial3 IS NULL AND d.parcial3 IS NOT NULL)
       OR (i.parcial3 IS NOT NULL AND d.parcial3 IS NULL)
       OR (i.promedio IS NULL AND d.promedio IS NOT NULL)
       OR (i.promedio IS NOT NULL AND d.promedio IS NULL);
END;
GO

-- -----------------------------------------------------------------------------------
-- Trigger 2 CORREGIDO: Validación de asignación docente-materia
-- -----------------------------------------------------------------------------------
CREATE OR ALTER TRIGGER tr_ValidarAsignacionDocente
ON Docente_Materia
INSTEAD OF INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar todas las asignaciones primero
        IF EXISTS (
            SELECT 1
            FROM inserted i
            JOIN Docentes d ON i.docente_id = d.docente_id
            JOIN Materias m ON i.materia_id = m.materia_id
            JOIN Cursos c ON m.curso_id = c.curso_id
            WHERE d.institucion_id <> c.institucion_id
        )
        BEGIN
            RAISERROR('No se puede asignar un docente a materias de otra institución', 16, 1);
            ROLLBACK;
            RETURN;
        END
        
        -- Verificar límite de materias por docente
        IF EXISTS (
            SELECT i.docente_id, i.periodo
            FROM inserted i
            JOIN Docente_Materia dm ON i.docente_id = dm.docente_id AND i.periodo = dm.periodo
            GROUP BY i.docente_id, i.periodo
            HAVING COUNT(*) >= 5
        )
        BEGIN
            RAISERROR('Un docente no puede tener más de 5 materias asignadas en el mismo período', 16, 1);
            ROLLBACK;
            RETURN;
        END
        
        -- Si es una actualización, eliminar los registros antiguos primero
        IF EXISTS (SELECT 1 FROM deleted)
        BEGIN
            DELETE FROM Docente_Materia
            WHERE docente_materia_id IN (SELECT docente_materia_id FROM deleted);
        END
        
        -- Insertar los nuevos registros
        INSERT INTO Docente_Materia (docente_id, materia_id, periodo)
        SELECT docente_id, materia_id, periodo
        FROM inserted;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
        
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO

-- -----------------------------------------------------------------------------------
-- Trigger 3 CORREGIDO: Notificación de cambios en datos de estudiantes
-- -----------------------------------------------------------------------------------
CREATE OR ALTER TRIGGER tr_NotificarCambiosEstudiante
ON Estudiantes
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Registrar cambios en datos sensibles
    INSERT INTO Log_Auditoria (
        usuario,
        ip,
        accion,
        tabla_afectada,
        id_afectado,
        datos_anteriores,
        datos_nuevos,
        fecha
    )
    SELECT 
        CONVERT(VARCHAR(100), SUSER_NAME()),
        CONVERT(VARCHAR(50), CONNECTIONPROPERTY('client_net_address')),
        'UPDATE',
        'Estudiantes',
        i.estudiante_id,
        CONVERT(VARCHAR(MAX),
            CASE 
                WHEN i.cedula <> d.cedula THEN CONCAT('Cédula: ', d.cedula, ' → ', i.cedula)
                WHEN i.nombres <> d.nombres THEN CONCAT('Nombres: ', d.nombres, ' → ', i.nombres)
                WHEN i.apellidos <> d.apellidos THEN CONCAT('Apellidos: ', d.apellidos, ' → ', i.apellidos)
                WHEN i.direccion <> d.direccion THEN 'Dirección modificada'
                WHEN i.telefono <> d.telefono THEN CONCAT('Teléfono: ', d.telefono, ' → ', i.telefono)
                WHEN i.email <> d.email THEN CONCAT('Email: ', d.email, ' → ', i.email)
                ELSE 'Datos modificados'
            END),
        CONVERT(VARCHAR(MAX),
            CONCAT('Estudiante ID: ', i.estudiante_id,
                   ', Institución: ', i.institucion_id)),
        GETDATE()
    FROM inserted i
    JOIN deleted d ON i.estudiante_id = d.estudiante_id
    WHERE i.cedula <> d.cedula
       OR i.nombres <> d.nombres
       OR i.apellidos <> d.apellidos
       OR i.direccion <> d.direccion
       OR i.telefono <> d.telefono
       OR i.email <> d.email
       OR (i.cedula IS NULL AND d.cedula IS NOT NULL)
       OR (i.cedula IS NOT NULL AND d.cedula IS NULL)
       OR (i.email IS NULL AND d.email IS NOT NULL)
       OR (i.email IS NOT NULL AND d.email IS NULL);
    
    -- Simular envío de notificación para cambios críticos
    IF UPDATE(cedula) OR UPDATE(nombres) OR UPDATE(apellidos)
    BEGIN
        -- Registrar notificación especial para cambios de identidad
        INSERT INTO Log_Auditoria (
            usuario,
            ip,
            accion,
            tabla_afectada,
            id_afectado,
            datos_anteriores,
            datos_nuevos,
            fecha
        )
        SELECT 
            CONVERT(VARCHAR(100), 'Sistema'),
            CONVERT(VARCHAR(50), '0.0.0.0'),
            'NOTIFY',
            'Estudiantes',
            i.estudiante_id,
            CONVERT(VARCHAR(MAX), 'Cambio de datos de identidad'),
            CONVERT(VARCHAR(MAX), 
                   CONCAT('Se modificaron datos críticos del estudiante: ', 
                          i.nombres, ' ', i.apellidos, 
                          ' (ID: ', i.estudiante_id, ')')),
            GETDATE()
        FROM inserted i
        JOIN deleted d ON i.estudiante_id = d.estudiante_id
        WHERE i.cedula <> d.cedula OR i.nombres <> d.nombres OR i.apellidos <> d.apellidos;
    END
END;
GO


SELECT 
    name AS TriggerName,
    OBJECT_NAME(parent_id) AS TableName,
    OBJECT_DEFINITION(object_id) AS TriggerDefinition,
    create_date,
    modify_date
FROM sys.triggers
WHERE type = 'TR';
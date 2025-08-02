-- -----------------------------------------------------------------------------------
-- Procedimiento 1: Registrar nuevo estudiante con responsable
-- Cumple con: Registro de estudiantes y responsables con validaciones
-- Transacciones, Inserciones con validaciones cruzadas
-- -----------------------------------------------------------------------------------
USE SistemaEducativo;
GO

CREATE OR ALTER PROCEDURE sp_RegistrarEstudianteCompleto
    @cedula_estudiante VARCHAR(20),
    @nombres_estudiante VARCHAR(100),
    @apellidos_estudiante VARCHAR(100),
    @fecha_nacimiento DATE,
    @genero CHAR(1),
    @direccion_estudiante VARCHAR(200),
    @telefono_estudiante VARCHAR(20),
    @email_estudiante VARCHAR(100),
    @institucion_id INT,
    @cedula_responsable VARCHAR(20),
    @nombres_responsable VARCHAR(100),
    @apellidos_responsable VARCHAR(100),
    @parentesco VARCHAR(50),
    @telefono_responsable VARCHAR(20),
    @email_responsable VARCHAR(100),
    @direccion_responsable VARCHAR(200),
    @usuario VARCHAR(100),
    @ip VARCHAR(50)
AS
BEGIN
    DECLARE @estudiante_id INT;
    DECLARE @responsable_id INT;
    DECLARE @existe_estudiante INT;
    DECLARE @existe_responsable INT;
    
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Verificar si el estudiante ya existe
        SELECT @existe_estudiante = COUNT(*) FROM Estudiantes WHERE cedula = @cedula_estudiante;
        
        IF @existe_estudiante > 0
        BEGIN
            RAISERROR('El estudiante con esta cédula ya está registrado', 16, 1);
            ROLLBACK;
            RETURN;
        END
        
        -- Verificar si el responsable ya existe
        SELECT @existe_responsable = COUNT(*) FROM Responsables WHERE cedula = @cedula_responsable;
        
        -- Insertar estudiante
        INSERT INTO Estudiantes (cedula, nombres, apellidos, fecha_nacimiento, genero, 
                                direccion, telefono, email, institucion_id)
        VALUES (@cedula_estudiante, @nombres_estudiante, @apellidos_estudiante, @fecha_nacimiento, 
                @genero, @direccion_estudiante, @telefono_estudiante, @email_estudiante, @institucion_id);
                
        SET @estudiante_id = SCOPE_IDENTITY();
        
        -- Insertar o actualizar responsable
        IF @existe_responsable = 0
        BEGIN
            INSERT INTO Responsables (cedula, nombres, apellidos, parentesco, telefono, email, direccion)
            VALUES (@cedula_responsable, @nombres_responsable, @apellidos_responsable, @parentesco, 
                    @telefono_responsable, @email_responsable, @direccion_responsable);
                    
            SET @responsable_id = SCOPE_IDENTITY();
        END
        ELSE
        BEGIN
            SELECT @responsable_id = responsable_id FROM Responsables WHERE cedula = @cedula_responsable;
        END
        
        -- Relacionar estudiante con responsable
        INSERT INTO Estudiante_Responsable (estudiante_id, responsable_id)
        VALUES (@estudiante_id, @responsable_id);
        
        -- Registrar en log
        INSERT INTO Log_Auditoria (usuario, ip, accion, tabla_afectada, id_afectado, datos_nuevos)
        VALUES (@usuario, @ip, 'INSERT', 'Estudiantes', @estudiante_id, 
                CONCAT('Nuevo estudiante: ', @nombres_estudiante, ' ', @apellidos_estudiante));
                
        COMMIT;
        
        SELECT 'Éxito' AS Resultado, 'Estudiante y responsable registrados correctamente' AS Mensaje;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SELECT 'Error' AS Resultado, ERROR_MESSAGE() AS Mensaje;
    END CATCH
END;
GO

-- -----------------------------------------------------------------------------------
-- Procedimiento 2: Actualización masiva de calificaciones por curso y materia
-- Cumple con: Actualizaciones masivas por condición
-- -----------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_ActualizarCalificacionesMasiva
    @curso_id INT,
    @materia_id INT,
    @periodo VARCHAR(20),
    @parcial_num INT, -- 1, 2 o 3
    @nueva_nota DECIMAL(5,2),
    @usuario VARCHAR(100),
    @ip VARCHAR(50)
AS
BEGIN
    DECLARE @contador INT = 0;
    
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Validar que la nota esté en rango
        IF @nueva_nota < 0 OR @nueva_nota > 10
        BEGIN
            RAISERROR('La nota debe estar entre 0 y 10', 16, 1);
            RETURN;
        END
        
        -- Actualizar calificaciones según el parcial especificado
        IF @parcial_num = 1
        BEGIN
            UPDATE c
            SET c.parcial1 = @nueva_nota,
                c.promedio = (ISNULL(@nueva_nota, 0) + ISNULL(c.parcial2, 0) + ISNULL(c.parcial3, 0)) / 3
            FROM Calificaciones c
            JOIN Matriculas m ON c.estudiante_id = m.estudiante_id
            WHERE m.curso_id = @curso_id 
            AND c.materia_id = @materia_id
            AND c.periodo = @periodo;
            
            SET @contador = @@ROWCOUNT;
        END
        ELSE IF @parcial_num = 2
        BEGIN
            UPDATE c
            SET c.parcial2 = @nueva_nota,
                c.promedio = (ISNULL(c.parcial1, 0) + ISNULL(@nueva_nota, 0) + ISNULL(c.parcial3, 0)) / 3
            FROM Calificaciones c
            JOIN Matriculas m ON c.estudiante_id = m.estudiante_id
            WHERE m.curso_id = @curso_id 
            AND c.materia_id = @materia_id
            AND c.periodo = @periodo;
            
            SET @contador = @@ROWCOUNT;
        END
        ELSE IF @parcial_num = 3
        BEGIN
            UPDATE c
            SET c.parcial3 = @nueva_nota,
                c.promedio = (ISNULL(c.parcial1, 0) + ISNULL(c.parcial2, 0) + ISNULL(@nueva_nota, 0)) / 3
            FROM Calificaciones c
            JOIN Matriculas m ON c.estudiante_id = m.estudiante_id
            WHERE m.curso_id = @curso_id 
            AND c.materia_id = @materia_id
            AND c.periodo = @periodo;
            
            SET @contador = @@ROWCOUNT;
        END
        ELSE
        BEGIN
            RAISERROR('Número de parcial inválido (debe ser 1, 2 o 3)', 16, 1);
            RETURN;
        END
        
        -- Registrar en log
        INSERT INTO Log_Auditoria (usuario, ip, accion, tabla_afectada, datos_nuevos)
        VALUES (@usuario, @ip, 'UPDATE', 'Calificaciones', 
                CONCAT('Actualización masiva: ', @contador, ' registros afectados. Curso: ', @curso_id, 
                       ', Materia: ', @materia_id, ', Parcial: ', @parcial_num));
        
        COMMIT;
        
        SELECT 'Éxito' AS Resultado, CONCAT(@contador, ' calificaciones actualizadas') AS Mensaje;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SELECT 'Error' AS Resultado, ERROR_MESSAGE() AS Mensaje;
    END CATCH
END;
GO

-- ... continuar con los otros 3 procedimientos requeridos ...
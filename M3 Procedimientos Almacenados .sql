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

-- -----------------------------------------------------------------------------------
-- Procedimiento 3: Generar reporte de estudiantes por curso con estadísticas
-- Cumple con: Generación de reportes con cálculos estadísticos
-- -----------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_GenerarReporteCurso
    @curso_id INT,
    @periodo VARCHAR(20)
AS
BEGIN
    BEGIN TRY
        -- Información básica del curso
        SELECT 
            c.curso_id,
            c.nombre AS nombre_curso,
            g.nombre AS grado,
            COUNT(DISTINCT m.estudiante_id) AS total_estudiantes,
            COUNT(DISTINCT CASE WHEN e.genero = 'M' THEN e.estudiante_id END) AS hombres,
            COUNT(DISTINCT CASE WHEN e.genero = 'F' THEN e.estudiante_id END) AS mujeres,
            AVG(DATEDIFF(YEAR, e.fecha_nacimiento, GETDATE())) AS edad_promedio
        FROM 
            Cursos c
            JOIN Grados g ON c.grado_id = g.grado_id
            JOIN Matriculas m ON c.curso_id = m.curso_id
            JOIN Estudiantes e ON m.estudiante_id = e.estudiante_id
        WHERE 
            c.curso_id = @curso_id
            AND m.periodo = @periodo
        GROUP BY 
            c.curso_id, c.nombre, g.nombre;
        
        -- Rendimiento académico por materia
        SELECT 
            mat.materia_id,
            mat.nombre AS materia,
            COUNT(DISTINCT cal.estudiante_id) AS estudiantes_evaluados,
            AVG(cal.promedio) AS promedio_general,
            MAX(cal.promedio) AS nota_maxima,
            MIN(cal.promedio) AS nota_minima,
            COUNT(CASE WHEN cal.promedio >= 7 THEN 1 END) AS aprobados,
            COUNT(CASE WHEN cal.promedio < 7 THEN 1 END) AS reprobados
        FROM 
            Materias mat
            JOIN Calificaciones cal ON mat.materia_id = cal.materia_id
            JOIN Matriculas m ON cal.estudiante_id = m.estudiante_id
        WHERE 
            m.curso_id = @curso_id
            AND cal.periodo = @periodo
        GROUP BY 
            mat.materia_id, mat.nombre
        ORDER BY 
            mat.nombre;
        
        -- Listado completo de estudiantes con sus promedios
        SELECT 
            e.estudiante_id,
            e.cedula,
            e.nombres + ' ' + e.apellidos AS estudiante,
            e.genero,
            DATEDIFF(YEAR, e.fecha_nacimiento, GETDATE()) AS edad,
            AVG(cal.promedio) AS promedio_general,
            RANK() OVER (ORDER BY AVG(cal.promedio) DESC) AS ranking_curso
        FROM 
            Estudiantes e
            JOIN Matriculas m ON e.estudiante_id = m.estudiante_id
            JOIN Calificaciones cal ON e.estudiante_id = cal.estudiante_id
        WHERE 
            m.curso_id = @curso_id
            AND cal.periodo = @periodo
        GROUP BY 
            e.estudiante_id, e.cedula, e.nombres, e.apellidos, e.genero, e.fecha_nacimiento
        ORDER BY 
            promedio_general DESC;
    END TRY
    BEGIN CATCH
        SELECT 'Error' AS Resultado, ERROR_MESSAGE() AS Mensaje;
    END CATCH
END;
GO

-- -----------------------------------------------------------------------------------
-- Procedimiento 4: Asignación masiva de docentes a materias (ajustado para tu esquema)
-- Cumple con: Asignaciones masivas con validaciones complejas
-- -----------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_AsignarDocenteMasivo
    @docente_id INT,
    @materias_lista VARCHAR(MAX), -- Lista separada por comas de IDs de materias
    @periodo VARCHAR(20),
    @usuario VARCHAR(100),
    @ip VARCHAR(50)
AS
BEGIN
    DECLARE @contador INT = 0;
    DECLARE @error_msg VARCHAR(500);
    
    -- Convertir la lista de materias a una tabla temporal
    DECLARE @materias TABLE (materia_id INT);
    
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Verificar que el docente existe
        IF NOT EXISTS (SELECT 1 FROM Docentes WHERE docente_id = @docente_id)
        BEGIN
            SET @error_msg = 'El docente especificado no existe';
            RAISERROR(@error_msg, 16, 1);
        END
        
        -- Insertar materias en la tabla temporal
        INSERT INTO @materias (materia_id)
        SELECT value FROM STRING_SPLIT(@materias_lista, ',') WHERE value <> '';
        
        -- Verificar que todas las materias existen
        IF EXISTS (
            SELECT 1 FROM @materias m
            WHERE NOT EXISTS (
                SELECT 1 FROM Materias WHERE materia_id = m.materia_id
            )
        )
        BEGIN
            SET @error_msg = 'Una o más materias especificadas no existen';
            RAISERROR(@error_msg, 16, 1);
        END
        
        -- Asignar cada materia al docente
        DECLARE @materia_id INT;
        DECLARE materia_cursor CURSOR FOR 
        SELECT materia_id FROM @materias;
        
        OPEN materia_cursor;
        FETCH NEXT FROM materia_cursor INTO @materia_id;
        
        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Verificar que no exista ya una asignación idéntica
            IF NOT EXISTS (
                SELECT 1 
                FROM Docente_Materia 
                WHERE docente_id = @docente_id 
                AND materia_id = @materia_id
                AND periodo = @periodo
            )
            BEGIN
                -- Insertar la asignación
                INSERT INTO Docente_Materia (docente_id, materia_id, periodo)
                VALUES (@docente_id, @materia_id, @periodo);
                
                SET @contador = @contador + 1;
                
                -- Registrar en log
                INSERT INTO Log_Auditoria (usuario, ip, accion, tabla_afectada, id_afectado, datos_nuevos)
                VALUES (@usuario, @ip, 'INSERT', 'Docente_Materia', SCOPE_IDENTITY(), 
                        CONCAT('Asignación docente: ', @docente_id, ' a materia ', @materia_id));
            END
            
            FETCH NEXT FROM materia_cursor INTO @materia_id;
        END
        
        CLOSE materia_cursor;
        DEALLOCATE materia_cursor;
        
        COMMIT;
        
        SELECT 'Éxito' AS Resultado, CONCAT(@contador, ' asignaciones realizadas correctamente') AS Mensaje;
    END TRY
    BEGIN CATCH
        IF CURSOR_STATUS('global', 'materia_cursor') >= 0
        BEGIN
            CLOSE materia_cursor;
            DEALLOCATE materia_cursor;
        END
        
        ROLLBACK;
        SELECT 'Error' AS Resultado, ERROR_MESSAGE() AS Mensaje;
    END CATCH
END;
GO


-- -----------------------------------------------------------------------------------
-- Procedimiento 5: Proceso de promoción de estudiantes (ajustado para tu esquema)
-- Cumple con: Procesos complejos con múltiples operaciones condicionales
-- -----------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_PromocionarEstudiantes
    @periodo_actual VARCHAR(20),
    @periodo_siguiente VARCHAR(20),
    @usuario VARCHAR(100),
    @ip VARCHAR(50)
AS
BEGIN
    DECLARE @contador_promovidos INT = 0;
    DECLARE @contador_repetidores INT = 0;
    DECLARE @nivel_maximo INT;
    
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Obtener el nivel máximo del sistema
        SELECT @nivel_maximo = MAX(CAST(nivel AS INT)) FROM Cursos;
        
        -- Crear tabla temporal para estudiantes a promocionar
        CREATE TABLE #EstudiantesPromocion (
            estudiante_id INT,
            curso_actual_id INT,
            nivel_actual INT,
            promedio DECIMAL(5,2),
            promovido BIT
        );
        
        -- Insertar estudiantes con sus datos académicos
        INSERT INTO #EstudiantesPromocion
        SELECT 
            e.estudiante_id,
            m.curso_id AS curso_actual_id,
            CAST(c.nivel AS INT) AS nivel_actual,
            AVG(cal.promedio) AS promedio,
            CASE 
                WHEN AVG(cal.promedio) >= 7 THEN 1 -- Aprobado para promoción
                ELSE 0 -- Repite el grado
            END AS promovido
        FROM 
            Estudiantes e
            JOIN Matriculas m ON e.estudiante_id = m.estudiante_id
            JOIN Cursos c ON m.curso_id = c.curso_id
            JOIN Calificaciones cal ON e.estudiante_id = cal.estudiante_id AND m.periodo = cal.periodo
        WHERE 
            m.periodo = @periodo_actual
            AND m.estado = 'Activo'
        GROUP BY 
            e.estudiante_id, m.curso_id, c.nivel;
        
        -- Procesar promoción para cada estudiante
        DECLARE @estudiante_id INT, @nivel_actual INT, @promovido BIT, @curso_actual_id INT;
        
        DECLARE estudiante_cursor CURSOR FOR 
        SELECT estudiante_id, nivel_actual, promovido, curso_actual_id FROM #EstudiantesPromocion;
        
        OPEN estudiante_cursor;
        FETCH NEXT FROM estudiante_cursor INTO @estudiante_id, @nivel_actual, @promovido, @curso_actual_id;
        
        WHILE @@FETCH_STATUS = 0
        BEGIN
            IF @promovido = 1 AND @nivel_actual < @nivel_maximo
            BEGIN
                -- Promover al siguiente nivel
                DECLARE @nuevo_curso_id INT;
                
                -- Obtener un curso del siguiente nivel (podría mejorarse con lógica más compleja)
                SELECT TOP 1 @nuevo_curso_id = curso_id 
                FROM Cursos 
                WHERE CAST(nivel AS INT) = @nivel_actual + 1;
                
                -- Matricular en el nuevo curso
                INSERT INTO Matriculas (estudiante_id, curso_id, periodo, fecha_matricula, estado)
                VALUES (@estudiante_id, @nuevo_curso_id, @periodo_siguiente, GETDATE(), 'Activo');
                
                SET @contador_promovidos = @contador_promovidos + 1;
                
                -- Registrar en log
                INSERT INTO Log_Auditoria (usuario, ip, accion, tabla_afectada, id_afectado, datos_nuevos)
                VALUES (@usuario, @ip, 'INSERT', 'Matriculas', SCOPE_IDENTITY(), 
                        CONCAT('Promoción estudiante: ', @estudiante_id, ' al curso ', @nuevo_curso_id));
            END
            ELSE
            BEGIN
                -- Repetir el curso (matricular en el mismo curso)
                INSERT INTO Matriculas (estudiante_id, curso_id, periodo, fecha_matricula, estado)
                VALUES (@estudiante_id, @curso_actual_id, @periodo_siguiente, GETDATE(), 'Activo');
                
                SET @contador_repetidores = @contador_repetidores + 1;
                
                -- Registrar en log
                INSERT INTO Log_Auditoria (usuario, ip, accion, tabla_afectada, id_afectado, datos_nuevos)
                VALUES (@usuario, @ip, 'INSERT', 'Matriculas', SCOPE_IDENTITY(), 
                        CONCAT('Repetición curso estudiante: ', @estudiante_id, ' en curso ', @curso_actual_id));
            END
            
            FETCH NEXT FROM estudiante_cursor INTO @estudiante_id, @nivel_actual, @promovido, @curso_actual_id;
        END
        
        CLOSE estudiante_cursor;
        DEALLOCATE estudiante_cursor;
        
        DROP TABLE #EstudiantesPromocion;
        
        COMMIT;
        
        SELECT 
            'Éxito' AS Resultado, 
            CONCAT('Proceso de promoción completado. ', 
                   @contador_promovidos, ' estudiantes promovidos, ', 
                   @contador_repetidores, ' estudiantes repetidores') AS Mensaje;
    END TRY
    BEGIN CATCH
        IF CURSOR_STATUS('global', 'estudiante_cursor') >= 0
        BEGIN
            CLOSE estudiante_cursor;
            DEALLOCATE estudiante_cursor;
        END
        
        IF OBJECT_ID('tempdb..#EstudiantesPromocion') IS NOT NULL
            DROP TABLE #EstudiantesPromocion;
            
        ROLLBACK;
        SELECT 'Error' AS Resultado, ERROR_MESSAGE() AS Mensaje;
    END CATCH
END;
GO
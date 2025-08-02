USE SistemaEducativo;
GO

-- Respaldo (usando comandos SQL Server)
-- Backup usando la ruta correcta para tu SQL Server Express 2022
BACKUP DATABASE gestion_educativa
TO DISK = 'C:\Universidad\Base de datos\Proyecto\gestion_educativa.bak' 
WITH
    NOFORMAT,
    INIT,
    NAME = 'gestion_educativa Backup',
    SKIP,
    NOREWIND,
    NOUNLOAD,
    STATS = 10;
GO
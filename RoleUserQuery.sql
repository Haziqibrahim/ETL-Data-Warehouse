-- DROP user di database sample
USE [sample];
GO

IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'etl_user')
BEGIN
    DROP USER [etl_user];
END
GO


-- DROP user di database DWH
USE [DWH];
GO

IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'etl_user')
BEGIN
    DROP USER [etl_user];
END
GO

-- DROP login di level server
USE [master];
GO

IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'etl_user')
BEGIN
    DROP LOGIN [etl_user];
END
GO

CREATE LOGIN [etl_user] WITH PASSWORD = 'sql1234';
GO

-- akses READ untuk sample
USE [sample];
GO
CREATE USER [etl_user] FOR LOGIN [etl_user];
GO
ALTER ROLE [db_datareader] ADD MEMBER [etl_user];
GO

-- akses FULL untuk DWH
USE [DWH];
GO
CREATE USER [etl_user] FOR LOGIN [etl_user];
GO
ALTER ROLE [db_owner] ADD MEMBER [etl_user];
GO

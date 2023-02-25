/*
Script de implantação para DW_SEATTLE_CHECKOUTS

Este código foi gerado por uma ferramenta.
As alterações feitas nesse arquivo poderão causar comportamento incorreto e serão perdidas se
o código for gerado novamente.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DW_SEATTLE_CHECKOUTS"
:setvar DefaultFilePrefix "DW_SEATTLE_CHECKOUTS"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detecta o modo SQLCMD e desabilita a execução do script se o modo SQLCMD não tiver suporte.
Para reabilitar o script após habilitar o modo SQLCMD, execute o comando a seguir:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'O modo SQLCMD deve ser habilitado para executar esse script com êxito.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'A operação de refatoração Renomear com chave 696caffd-045f-46af-a23c-450391ab6f43, 5f24bab5-af78-4b82-a74a-d203e1497324 foi ignorada; o elemento [dbo].[Dim_MATERIAL_TYPE].[Id] (SqlSimpleColumn) não será renomeado para ID_MaterialType';


GO
PRINT N'A operação de refatoração Renomear com chave 64369f14-f17d-42b2-9fb7-84cc6e51111d foi ignorada; o elemento [dbo].[Dim_MATERIAL_TYPE].[Material_Type] (SqlSimpleColumn) não será renomeado para MaterialType';


GO
PRINT N'Criando Tabela [dbo].[Dim_MATERIAL_TYPE]...';


GO
CREATE TABLE [dbo].[Dim_MATERIAL_TYPE] (
    [ID_MaterialType] VARCHAR (50)  NOT NULL,
    [MaterialType]    VARCHAR (100) NOT NULL,
    [ID_Material]     VARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([ID_MaterialType] ASC)
);


GO
-- Etapa de refatoração para atualizar o servidor de destino com logs de transação implantados

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '696caffd-045f-46af-a23c-450391ab6f43')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('696caffd-045f-46af-a23c-450391ab6f43')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5f24bab5-af78-4b82-a74a-d203e1497324')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5f24bab5-af78-4b82-a74a-d203e1497324')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '64369f14-f17d-42b2-9fb7-84cc6e51111d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('64369f14-f17d-42b2-9fb7-84cc6e51111d')

GO

GO
PRINT N'Atualização concluída.';


GO

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
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Criando o banco de dados $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)] COLLATE SQL_Latin1_General_CP1_CI_AS
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
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'As configurações de banco de dados não podem ser modificadas. Você deve ser um SysAdmin para aplicar essas configurações.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'As configurações de banco de dados não podem ser modificadas. Você deve ser um SysAdmin para aplicar essas configurações.';
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
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
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
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Criando Tabela [dbo].[Dim_Checkouts_Month]...';


GO
CREATE TABLE [dbo].[Dim_Checkouts_Month] (
    [ID_Checkout]   VARCHAR (50) NOT NULL,
    [ID_Material]   VARCHAR (50) NOT NULL,
    [CheckoutType]  VARCHAR (9)  NOT NULL,
    [CheckoutYear]  CHAR (4)     NOT NULL,
    [CheckoutMonth] VARCHAR (2)  NOT NULL,
    [Checkouts]     INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([ID_Checkout] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Dim_Subjects]...';


GO
CREATE TABLE [dbo].[Dim_Subjects] (
    [ID_Subjects] VARCHAR (50)  NOT NULL,
    [ID_Material] VARCHAR (50)  NOT NULL,
    [Subjects]    VARCHAR (500) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID_Subjects] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Dim_Material_Type]...';


GO
CREATE TABLE [dbo].[Dim_Material_Type] (
    [ID_MaterialType] VARCHAR (50)  NOT NULL,
    [MaterialType]    VARCHAR (100) NOT NULL,
    [ID_Material]     VARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([ID_MaterialType] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[F_Material]...';


GO
CREATE TABLE [dbo].[F_Material] (
    [ID_Material]     VARCHAR (50) NOT NULL,
    [ISBN]            VARCHAR (50) NULL,
    [Publisher]       VARCHAR (50) NULL,
    [PublicationYear] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ID_Material] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Dim_Creator]...';


GO
CREATE TABLE [dbo].[Dim_Creator] (
    [ID_Creator]  VARCHAR (50)  NOT NULL,
    [ID_Material] VARCHAR (50)  NOT NULL,
    [Creator]     VARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([ID_Creator] ASC)
);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Checkouts_Month_F_Material]...';


GO
ALTER TABLE [dbo].[Dim_Checkouts_Month]
    ADD CONSTRAINT [FK_Dim_Checkouts_Month_F_Material] FOREIGN KEY ([ID_Material]) REFERENCES [dbo].[F_Material] ([ID_Material]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Subjects_Month_F_Material]...';


GO
ALTER TABLE [dbo].[Dim_Subjects]
    ADD CONSTRAINT [FK_Dim_Subjects_Month_F_Material] FOREIGN KEY ([ID_Material]) REFERENCES [dbo].[F_Material] ([ID_Material]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Material_Type_Month_F_Material]...';


GO
ALTER TABLE [dbo].[Dim_Material_Type]
    ADD CONSTRAINT [FK_Dim_Material_Type_Month_F_Material] FOREIGN KEY ([ID_Material]) REFERENCES [dbo].[F_Material] ([ID_Material]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Creator_Month_F_Material]...';


GO
ALTER TABLE [dbo].[Dim_Creator]
    ADD CONSTRAINT [FK_Dim_Creator_Month_F_Material] FOREIGN KEY ([ID_Material]) REFERENCES [dbo].[F_Material] ([ID_Material]);


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
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET MULTI_USER 
    WITH ROLLBACK IMMEDIATE;


GO
PRINT N'Atualização concluída.';


GO

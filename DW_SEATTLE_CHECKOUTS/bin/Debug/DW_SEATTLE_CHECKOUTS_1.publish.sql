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
PRINT N'Criando Tabela [dbo].[Dim_Creator]...';


GO
CREATE TABLE [dbo].[Dim_Creator] (
    [ID_Creator]  VARCHAR (50)  NOT NULL,
    [ID_Material] VARCHAR (50)  NOT NULL,
    [Creator]     VARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([ID_Creator] ASC)
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
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Checkouts_Month_F_Material]...';


GO
ALTER TABLE [dbo].[Dim_Checkouts_Month] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Checkouts_Month_F_Material] FOREIGN KEY ([ID_Material]) REFERENCES [dbo].[F_Material] ([ID_Material]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Creator_Month_F_Material]...';


GO
ALTER TABLE [dbo].[Dim_Creator] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Creator_Month_F_Material] FOREIGN KEY ([ID_Material]) REFERENCES [dbo].[F_Material] ([ID_Material]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Subjects_Month_F_Material]...';


GO
ALTER TABLE [dbo].[Dim_Subjects] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Subjects_Month_F_Material] FOREIGN KEY ([ID_Material]) REFERENCES [dbo].[F_Material] ([ID_Material]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Material_Type_Month_F_Material]...';


GO
ALTER TABLE [dbo].[Dim_Material_Type] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Material_Type_Month_F_Material] FOREIGN KEY ([ID_Material]) REFERENCES [dbo].[F_Material] ([ID_Material]);


GO
PRINT N'Verificando os dados existentes em restrições recém-criadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Dim_Checkouts_Month] WITH CHECK CHECK CONSTRAINT [FK_Dim_Checkouts_Month_F_Material];

ALTER TABLE [dbo].[Dim_Creator] WITH CHECK CHECK CONSTRAINT [FK_Dim_Creator_Month_F_Material];

ALTER TABLE [dbo].[Dim_Subjects] WITH CHECK CHECK CONSTRAINT [FK_Dim_Subjects_Month_F_Material];

ALTER TABLE [dbo].[Dim_Material_Type] WITH CHECK CHECK CONSTRAINT [FK_Dim_Material_Type_Month_F_Material];


GO
PRINT N'Atualização concluída.';


GO

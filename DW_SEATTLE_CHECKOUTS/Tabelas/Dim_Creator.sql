CREATE TABLE [dbo].[Dim_Creator]
(
    [ID_Creator] VARCHAR(50) NOT NULL PRIMARY KEY,
    [ID_Material] VARCHAR(50) NOT NULL,
    [Creator] VARCHAR(200) NULL,
    CONSTRAINT [FK_Dim_Creator_Month_F_Material] FOREIGN KEY ([ID_Material]) REFERENCES[F_Material]([ID_Material])
)

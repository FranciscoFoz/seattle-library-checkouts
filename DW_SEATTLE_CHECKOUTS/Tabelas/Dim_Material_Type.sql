CREATE TABLE [dbo].[Dim_Material_Type]
(
	[ID_MaterialType] VARCHAR(50) NOT NULL PRIMARY KEY, 
    [MaterialType] VARCHAR(100) NOT NULL, 
    [ID_Material] VARCHAR(50) NOT NULL,
    CONSTRAINT [FK_Dim_Material_Type_Month_F_Material] FOREIGN KEY ([ID_Material]) REFERENCES[F_Material]([ID_Material])

)

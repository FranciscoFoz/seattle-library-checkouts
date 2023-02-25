CREATE TABLE [dbo].[Dim_Subjects]
(
	[ID_Subjects] VARCHAR(50) NOT NULL PRIMARY KEY,
	[ID_Material] VARCHAR(50) NOT NULL,
	[Subjects] VARCHAR(500) NOT NULL,
	CONSTRAINT [FK_Dim_Subjects_Month_F_Material] FOREIGN KEY ([ID_Material]) REFERENCES[F_Material]([ID_Material])
)

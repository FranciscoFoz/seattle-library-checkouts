CREATE TABLE [dbo].[Dim_Checkouts_Month]
(
	[ID_Checkout] VARCHAR(50) NOT NULL PRIMARY KEY,
	[ID_Material] VARCHAR(50) NOT NULL,
	[CheckoutType] VARCHAR(9) NOT NULL,
	[CheckoutYear] CHAR(4) NOT NULL,
	[CheckoutMonth] VARCHAR(2) NOT NULL,
	[Checkouts] INTEGER NOT NULL,
    CONSTRAINT [FK_Dim_Checkouts_Month_F_Material] FOREIGN KEY ([ID_Material]) REFERENCES[F_Material]([ID_Material])
	)

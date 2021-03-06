USE [ShopBridge]
GO
/****** Object:  Table [dbo].[ProductInformation]    Script Date: 17-12-2020 4.21.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInformation](
	[ProductId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](150) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductPrice] [decimal](10, 2) NULL,
 CONSTRAINT [PK_ProductInformation] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_Create_Product]    Script Date: 17-12-2020 4.21.51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Create_Product]
       -- Add the parameters for the stored procedure here
       @ProductName nvarchar (200),
       @ProductDescription nvarchar (200),
       @ProductPrice decimal (10,2)
AS
BEGIN       
       SET NOCOUNT ON;
    -- Insert statements for procedure here
       insert into ProductInformation(ProductName, ProductDescription, ProductPrice) values (@ProductName,@ProductDescription,
       @ProductPrice)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Product]    Script Date: 17-12-2020 4.21.51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Product]  
-- Add the parameters for the stored procedure here
	@ProductId int
AS
BEGIN    
    SET NOCOUNT ON;    
	Delete from ProductInformation where ProductId = @ProductId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_ProductList]    Script Date: 17-12-2020 4.21.51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_ProductList]
AS
BEGIN       
       SET NOCOUNT ON;    
       SELECT ProductId, ProductName, ProductDescription, ProductPrice
       FROM ProductInformation
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Product]    Script Date: 17-12-2020 4.21.51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Product]
		@ProductId int,
		@productName nvarchar(200),
		@productDescription nvarchar(200),
		@ProductPrice decimal (10,2)
AS 
BEGIN
		UPDATE ProductInformation SET
		ProductName = @ProductName,
		ProductDescription=@ProductDescription,
		ProductPrice=@ProductPrice
		WHERE ProductId = @ProductId
END
GO

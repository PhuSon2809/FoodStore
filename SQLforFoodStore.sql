-- Tran Phu Son - SE150552        PRJ301 - SE1606
-- Assignment                     FOOD STORE

-- Create new database
CREATE DATABASE FoodStore

-- Use database FoodStore
USE FoodStore

-- Create table
CREATE TABLE tblRoles(
	roleID NVARCHAR(10) PRIMARY KEY,
	roleName NVARCHAR(50) NULL
)
GO

CREATE TABLE tblUsers(
	UserID NVARCHAR(10) PRIMARY KEY,
	fullName NVARCHAR(50) NULL,
	password VARCHAR(50) NULL,
	roleID NVARCHAR(10) FOREIGN KEY REFERENCES tblRoles(roleID) NULL,
	address NVARCHAR(50) NULL,
	birthday DATE NULL,
	phone NVARCHAR(10) NULL,
	email NVARCHAR(50) NULL,
	status BIT NULL,
)
GO

CREATE TABLE tblOrder(
	orderID NVARCHAR(10) PRIMARY KEY,
	orderDate DATE DEFAULT GETDATE(),
	total FLOAT,
	userID NVARCHAR(10) FOREIGN KEY REFERENCES tblUsers(userID) NULL,
	status BIT NULL,
)
GO

CREATE TABLE tblOderDetail(
	detailID NVARCHAR(10) PRIMARY KEY,
	price FLOAT,
	quantity INT CHECK (quantity > 0) NULL,
	orderID NVARCHAR(10) FOREIGN KEY REFERENCES tblOrder(orderID),
	productID NVARCHAR(10) FOREIGN KEY REFERENCES tblProduct(productID),
)
GO

CREATE TABLE tblProduct(
	productID NVARCHAR(10) PRIMARY KEY,
	productName NVARCHAR(50) NULL,
	image NVARCHAR(2000),
	price FLOAT NULL,
	quantity INT NULL,
	categoryID NVARCHAR(10) FOREIGN KEY REFERENCES tblCategory(categoryID),
	importDate DATE NULL,
	usingDate DATE NULL,
	status BIT NULL,
)
GO

CREATE TABLE tblCategory(
	categoryID NVARCHAR(10) PRIMARY KEY,
	categoryName NVARCHAR(50) NULL,
)
GO

INSERT INTO dbo.tblRoles ( roleID, roleName ) VALUES (N'AD' , N'Admin')
INSERT INTO dbo.tblRoles ( roleID, roleName ) VALUES (N'US' , N'User')

INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) 
				 VALUES (N'admin', N'Tran Phu Son', N'1', N'AD', N'Ha Noi','01/01/2001', N'0914360736', N'phuson2809@gmail.com', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) 
				 VALUES (N'admin1', N'Van Thi My Anh', N'1', N'US',  N'Binh Phuoc','01/01/2001', N'0865049755', N'vthmyanh2604@gmail.com', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) 
				 VALUES (N'SE130363', N'Tran Gia Hao', N'1', N'AD', N'Ho Chi Minh','01/01/2001', N'0834118705', N'giahao223@gmail.com', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) 
				 VALUES (N'SE140103', N'Le Tuyet Nhung', N'1', N'US', N'Ha Noi','01/01/2001', N'0354063374', N'ltnhung27042001@gmail.com', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) 
				 VALUES (N'SE140119', N'Lam Van Phai', N'1', N'AD', N'Ho Chi Minh','01/01/2001', N'0915742603', N'lamvanphai36@gmail.com', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) 
				 VALUES (N'SE140130', N'Ngo Minh Hung', N'1', N'AD', N'Ha Noi','01/01/2001', N'0826973535', N'ngominhhung208@gmail.com', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) 
				 VALUES (N'SE140201', N'Nguyen Tan Dat', N'1', N'US', N'Quy Nhon','01/01/2001', N'0905558630', N'toimqn09@gmail.com', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) 
				 VALUES (N'SE140969', N'Nguyen Dang Nhu Phong', N'123', N'US', N'Ha Noi','01/01/2001', N'0934668470', N'nhuphong051002@gmail.com', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) 
				 VALUES (N'SE150443', N'Phung Thi Thuy Trang', N'1', N'US', N'Ha Noi','01/01/2001', N'0564594754', N'thuytrang04052001@gmail.com', 1)
GO

INSERT dbo.tblCategory ([categoryID], [categoryName]) 
				VALUES (N'CG01', N'Vegetables')
INSERT dbo.tblCategory ([categoryID], [categoryName]) 
				VALUES (N'CG02', N'Fresh Fruits')
INSERT dbo.tblCategory ([categoryID], [categoryName]) 
				VALUES (N'CG03', N'Dairy Products')
INSERT dbo.tblCategory ([categoryID], [categoryName]) 
				VALUES (N'CG04', N'Fresh Meat')

INSERT [dbo].[tblProduct] ([productID],[ProductName],[image],[price],[quantity],[categoryID],[importDate],[usingDate],[status]) 
				   VALUES (N'P001',N'Potato',N'https://sieuthiandam.vn/wp-content/uploads/2018/03/khoai-tay-F1.jpg',5,10,N'CG01','03/08/2022','03/15/2022',1)
INSERT [dbo].[tblProduct] ([productID],[ProductName],[image],[price],[quantity],[categoryID],[importDate],[usingDate],[status]) 
				   VALUES (N'P002',N'Carrot',N'https://everydayorganic.com.vn/data/news/3965/carot.02.jpg',8,12,N'CG01','03/07/2022','03/18/2022',1)
INSERT [dbo].[tblProduct] ([productID],[ProductName],[image],[price],[quantity],[categoryID],[importDate],[usingDate],[status]) 
				   VALUES (N'P003',N'Lemon',N'http://shoptinhdau.com/wp-content/uploads/2018/06/lemon-e1529576329191.jpg',7,7,N'CG01','03/06/2022','03/15/2022',1)
INSERT [dbo].[tblProduct] ([productID],[ProductName],[image],[price],[quantity],[categoryID],[importDate],[usingDate],[status]) 
				   VALUES (N'P004',N'Cabbage',N'https://hanoifreshfoods.com/wp-content/uploads/2020/11/white-cabbage.jpg',9,15,N'CG01','03/07/2022','03/16/2022',1)
INSERT [dbo].[tblProduct] ([productID],[ProductName],[image],[price],[quantity],[categoryID],[importDate],[usingDate],[status]) 
				   VALUES (N'P005',N'Onion',N'https://produits.bienmanger.com/36700-0w470h470_Organic_Red_Onion_From_Italy.jpg',4,17,N'CG01','03/05/2022','03/16/2022',1)

INSERT [dbo].[tblProduct] ([productID],[ProductName],[image],[price],[quantity],[categoryID],[importDate],[usingDate],[status]) 
				   VALUES (N'P006',N'Orange',N'https://www.collinsdictionary.com/images/full/orange_342874121.jpg',10,25,N'CG02','03/07/2022','03/16/2022',1)
INSERT [dbo].[tblProduct] ([productID],[ProductName],[image],[price],[quantity],[categoryID],[importDate],[usingDate],[status]) 
				   VALUES (N'P007',N'Avocado',N'https://sc04.alicdn.com/kf/Udc13e4d612e54a2cb317de6709f5193fl.jpg',6,30,N'CG02','03/05/2022','03/15/2022',1)
INSERT [dbo].[tblProduct] ([productID],[ProductName],[image],[price],[quantity],[categoryID],[importDate],[usingDate],[status]) 
				   VALUES (N'P008',N'Watermelon',N'http://baominhmart.vn/Cms_Data/Contents/admin/Media/trai-cay-bia/2-2.jpg',8,10,N'CG02','03/07/2022','03/16/2022',1)


INSERT [dbo].[tblProduct] ([productID],[ProductName],[image],[price],[quantity],[categoryID],[importDate],[usingDate],[status]) 
				   VALUES (N'P009',N'Meat',N'https://www.foodmanufacture.co.uk/var/wrbm_gb_food_pharma/storage/images/9/1/5/2/1722519-1-eng-GB/Hilton-Portugal-Partnership-to-supply-meat-nationwide.jpg',5,30,N'CG04','03/06/2022','03/16/2022',1)







USE [master]
GO
/****** Object:  Database [DatabaseEC]    Script Date: 30/11/2022 21:01:46 ******/
CREATE DATABASE [DatabaseEC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DatabaseEC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DatabaseEC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DatabaseEC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DatabaseEC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DatabaseEC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DatabaseEC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DatabaseEC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DatabaseEC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DatabaseEC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DatabaseEC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DatabaseEC] SET ARITHABORT OFF 
GO
ALTER DATABASE [DatabaseEC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DatabaseEC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DatabaseEC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DatabaseEC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DatabaseEC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DatabaseEC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DatabaseEC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DatabaseEC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DatabaseEC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DatabaseEC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DatabaseEC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DatabaseEC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DatabaseEC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DatabaseEC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DatabaseEC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DatabaseEC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DatabaseEC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DatabaseEC] SET RECOVERY FULL 
GO
ALTER DATABASE [DatabaseEC] SET  MULTI_USER 
GO
ALTER DATABASE [DatabaseEC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DatabaseEC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DatabaseEC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DatabaseEC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DatabaseEC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DatabaseEC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DatabaseEC', N'ON'
GO
ALTER DATABASE [DatabaseEC] SET QUERY_STORE = OFF
GO
USE [DatabaseEC]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 30/11/2022 21:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[session_id] [int] NULL,
	[product_id] [int] NULL,
	[quanlity] [int] NULL,
	[created_at] [date] NULL,
	[modified_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount]    Script Date: 30/11/2022 21:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_discount] [nvarchar](max) NULL,
	[desc_discount] [nvarchar](max) NULL,
	[discount_percent] [decimal](18, 0) NULL,
	[active] [bit] NULL,
	[created_at] [date] NULL,
	[modified_at] [date] NULL,
	[deleted_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 30/11/2022 21:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[users_id] [int] NULL,
	[total] [decimal](18, 0) NULL,
	[payment_id] [int] NULL,
	[created_at] [date] NULL,
	[modified_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 30/11/2022 21:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quanlity] [int] NULL,
	[created_at] [date] NULL,
	[modified_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_details]    Script Date: 30/11/2022 21:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[amount] [int] NULL,
	[providers] [nvarchar](max) NULL,
	[statuss] [nvarchar](max) NULL,
	[created_at] [date] NULL,
	[modified_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 30/11/2022 21:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_product] [nvarchar](max) NULL,
	[desc_product] [nvarchar](max) NULL,
	[category_id] [int] NULL,
	[inventory_id] [int] NULL,
	[price] [decimal](18, 0) NULL,
	[discount_id] [int] NULL,
	[image_url] [nvarchar](max) NULL,
	[created_at] [date] NULL,
	[modified_at] [date] NULL,
	[deleted_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_category]    Script Date: 30/11/2022 21:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_category] [nvarchar](max) NULL,
	[desc_category] [nvarchar](max) NULL,
	[created_at] [date] NULL,
	[modified_at] [date] NULL,
	[deleted_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_inventory]    Script Date: 30/11/2022 21:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_inventory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[created_at] [date] NULL,
	[modified_at] [date] NULL,
	[deleted_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_session]    Script Date: 30/11/2022 21:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_session](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[users_id] [int] NULL,
	[total] [decimal](18, 0) NULL,
	[created_at] [date] NULL,
	[modified_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_address]    Script Date: 30/11/2022 21:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[users_id] [int] NULL,
	[address_line1] [nvarchar](max) NULL,
	[address_line2] [nvarchar](max) NULL,
	[city] [nvarchar](max) NULL,
	[postal_code] [nvarchar](max) NULL,
	[country] [nvarchar](max) NULL,
	[telephone] [nvarchar](max) NULL,
	[mobile] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_payment]    Script Date: 30/11/2022 21:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[users_id] [int] NULL,
	[payment_type] [nvarchar](max) NULL,
	[providers] [nvarchar](max) NULL,
	[account_no] [int] NULL,
	[expiry] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 30/11/2022 21:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NULL,
	[passwords] [nvarchar](max) NULL,
	[first_name] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
	[telephone] [int] NULL,
	[created_at] [date] NULL,
	[modified_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cart_item] ON 

INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (1, 1, 1, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (2, 1, 2, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (3, 1, 3, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (4, 1, 4, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (5, 1, 5, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (6, 2, 1, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (7, 2, 2, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (8, 2, 3, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (9, 2, 14, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (10, 2, 17, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (11, 4, 1, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (12, 4, 3, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[cart_item] ([id], [session_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (13, 4, 4, 2, CAST(N'2022-11-30' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[cart_item] OFF
GO
SET IDENTITY_INSERT [dbo].[discount] ON 

INSERT [dbo].[discount] ([id], [name_discount], [desc_discount], [discount_percent], [active], [created_at], [modified_at], [deleted_at]) VALUES (1, N'Chrismast is coming', N'Get your Apple product now !', CAST(20 AS Decimal(18, 0)), 1, CAST(N'2022-11-30' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[discount] OFF
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 

INSERT [dbo].[order_details] ([id], [users_id], [total], [payment_id], [created_at], [modified_at]) VALUES (1, 2, CAST(45495 AS Decimal(18, 0)), 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_details] ([id], [users_id], [total], [payment_id], [created_at], [modified_at]) VALUES (2, 2, CAST(41095 AS Decimal(18, 0)), 2, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_details] ([id], [users_id], [total], [payment_id], [created_at], [modified_at]) VALUES (3, 2, CAST(29196 AS Decimal(18, 0)), 3, CAST(N'2022-11-30' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[order_items] ON 

INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (1, 1, 1, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (2, 1, 2, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (3, 1, 3, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (4, 1, 4, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (5, 1, 5, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (6, 2, 1, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (7, 2, 2, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (8, 2, 3, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (9, 2, 14, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (10, 2, 17, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (11, 3, 1, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (12, 3, 3, 1, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [quanlity], [created_at], [modified_at]) VALUES (13, 3, 4, 2, CAST(N'2022-11-30' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[order_items] OFF
GO
SET IDENTITY_INSERT [dbo].[payment_details] ON 

INSERT [dbo].[payment_details] ([id], [order_id], [amount], [providers], [statuss], [created_at], [modified_at]) VALUES (1, 1, 1, N'VISA', N'Complete', CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[payment_details] ([id], [order_id], [amount], [providers], [statuss], [created_at], [modified_at]) VALUES (2, 2, 1, N'VISA', N'Complete', CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[payment_details] ([id], [order_id], [amount], [providers], [statuss], [created_at], [modified_at]) VALUES (3, 3, 1, N'VISA', N'Complete', CAST(N'2022-11-30' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[payment_details] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (1, N'MacBook Air', N'Don’t take it lightly.', 1, 1, CAST(9599 AS Decimal(18, 0)), 1, N'https://iili.io/H9zWSFS.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (2, N'MacBook Pro 13”', N'Pro anywhere.', 1, 1, CAST(9999 AS Decimal(18, 0)), NULL, N'https://iili.io/HFN7f87.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (3, N'MacBook Pro 14” and 16”', N'Incredible power. Incredibly simple.', 1, 1, CAST(15999 AS Decimal(18, 0)), NULL, N'https://iili.io/H9zXoRn.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (4, N'iPad', N'Lovable. Drawable. Magical.', 2, 2, CAST(3499 AS Decimal(18, 0)), 1, N'https://iili.io/H9zXDXf.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (5, N'iPad Pro', N'Supercharged by M2', 2, 2, CAST(6499 AS Decimal(18, 0)), NULL, N'https://iili.io/HFN7vVf.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (6, N'iPad mini', N'The full iPad experience designed to fit in one hand.', 2, 2, CAST(3999 AS Decimal(18, 0)), NULL, N'https://iili.io/H9zjBun.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (7, N'iPhone 14', N'Big and bigger.', 3, 3, CAST(9499 AS Decimal(18, 0)), NULL, N'https://iili.io/H9zjxnf.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (8, N'iPhone 14 Pro', N'Pro. Beyond.', 3, 3, CAST(12999 AS Decimal(18, 0)), NULL, N'https://iili.io/H9zjzG4.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (9, N'iPhone SE', N'Love the power. Love the price.', 3, 3, CAST(5999 AS Decimal(18, 0)), NULL, N'https://iili.io/H9zjAaS.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (10, N'Apple Watch Ultra', N'Adventure awaits.', 4, 4, CAST(6399 AS Decimal(18, 0)), NULL, N'https://iili.io/H9zjYue.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (11, N'Apple Watch Series', N'A healthy leap ahead.', 4, 4, CAST(3199 AS Decimal(18, 0)), NULL, N'https://iili.io/HFNle72.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (12, N'Apple Watch SE', N'A great deal to love.', 4, 4, CAST(1999 AS Decimal(18, 0)), NULL, N'https://iili.io/H9zjgSI.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (13, N'AirPods Pro', N'2nd generation', 5, 5, CAST(1849 AS Decimal(18, 0)), NULL, N'https://iili.io/H9zjDKl.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (14, N'AirPods Max', N'Personalized Spatial Audio with dynamic head tracking', 5, 5, CAST(4599 AS Decimal(18, 0)), NULL, N'https://iili.io/HFNcWcQ.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (15, N'Apple TV 4K', N'The Apple experience. Cinematic in every sense.', 6, 6, CAST(229 AS Decimal(18, 0)), NULL, N'https://iili.io/HFN0nBs.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (16, N'HomePod mini', N'Room-filling sound in every room.', 6, 6, CAST(99 AS Decimal(18, 0)), NULL, N'https://iili.io/HFN0cCu.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (17, N'Apple Pencil (2nd generation)', N'Designed for iPad Pro and iPad Air', 7, 6, CAST(999 AS Decimal(18, 0)), NULL, N'https://iili.io/HFNae44.png', NULL, NULL, NULL)
INSERT [dbo].[product] ([id], [name_product], [desc_product], [category_id], [inventory_id], [price], [discount_id], [image_url], [created_at], [modified_at], [deleted_at]) VALUES (18, N'MagSafe Charger', N'Mix. Match. MagSafe.', 7, 6, CAST(299 AS Decimal(18, 0)), NULL, N'https://iili.io/H9zwpqv.png', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[product_category] ON 

INSERT [dbo].[product_category] ([id], [name_category], [desc_category], [created_at], [modified_at], [deleted_at]) VALUES (1, N'Mac', N'Which Mac is right for you?', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name_category], [desc_category], [created_at], [modified_at], [deleted_at]) VALUES (2, N'iPad', N'Introducing the all-new iPad and iPad Pro.', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name_category], [desc_category], [created_at], [modified_at], [deleted_at]) VALUES (3, N'iPhone', N'Which iPhone is right for you?', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name_category], [desc_category], [created_at], [modified_at], [deleted_at]) VALUES (4, N'Watch', N'Any case. Any band. Any style you want.', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name_category], [desc_category], [created_at], [modified_at], [deleted_at]) VALUES (5, N'Airpods', N'A magical connection to your devices.', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name_category], [desc_category], [created_at], [modified_at], [deleted_at]) VALUES (6, N'TV & Home', N'The future hits home.', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name_category], [desc_category], [created_at], [modified_at], [deleted_at]) VALUES (7, N'Accessories', N'Find the accessories you’re looking for.', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[product_category] OFF
GO
SET IDENTITY_INSERT [dbo].[product_inventory] ON 

INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (1, 1234, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (2, 1212, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (3, 3232, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (4, 2121, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (5, 1717, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (6, 1414, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (7, 123, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (8, 5664, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (9, 2345, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (10, 5435, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (11, 5346, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (12, 8746, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (13, 234, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (14, 251, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (15, 654, NULL, NULL, NULL)
INSERT [dbo].[product_inventory] ([id], [quantity], [created_at], [modified_at], [deleted_at]) VALUES (16, 638, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[product_inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[shopping_session] ON 

INSERT [dbo].[shopping_session] ([id], [users_id], [total], [created_at], [modified_at]) VALUES (1, 2, CAST(45495 AS Decimal(18, 0)), CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[shopping_session] ([id], [users_id], [total], [created_at], [modified_at]) VALUES (2, 2, CAST(41095 AS Decimal(18, 0)), CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[shopping_session] ([id], [users_id], [total], [created_at], [modified_at]) VALUES (3, 2, CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[shopping_session] ([id], [users_id], [total], [created_at], [modified_at]) VALUES (4, 2, CAST(29196 AS Decimal(18, 0)), CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[shopping_session] ([id], [users_id], [total], [created_at], [modified_at]) VALUES (5, 2, CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-30' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[shopping_session] OFF
GO
SET IDENTITY_INSERT [dbo].[user_address] ON 

INSERT [dbo].[user_address] ([id], [users_id], [address_line1], [address_line2], [city], [postal_code], [country], [telephone], [mobile]) VALUES (1, 2, N'Technology University', N'Banking University', N'Ho Chi Minh City', N'90000', N'Viet Nam', N'027934853', N'097547483')
SET IDENTITY_INSERT [dbo].[user_address] OFF
GO
SET IDENTITY_INSERT [dbo].[user_payment] ON 

INSERT [dbo].[user_payment] ([id], [users_id], [payment_type], [providers], [account_no], [expiry]) VALUES (1, 2, N'Credit Card', N'VISA', 1, CAST(N'2026-11-11' AS Date))
SET IDENTITY_INSERT [dbo].[user_payment] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [passwords], [first_name], [last_name], [telephone], [created_at], [modified_at]) VALUES (1, N'admin', N'admin', N'admin', N'admin', 0, NULL, NULL)
INSERT [dbo].[users] ([id], [username], [passwords], [first_name], [last_name], [telephone], [created_at], [modified_at]) VALUES (2, N'testuser', N'123456', N'Nguyen', N'Huy', 999111999, CAST(N'2022-11-30' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD FOREIGN KEY([session_id])
REFERENCES [dbo].[shopping_session] ([id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([payment_id])
REFERENCES [dbo].[payment_details] ([id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([users_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[order_details] ([id])
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[product_category] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([discount_id])
REFERENCES [dbo].[discount] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([inventory_id])
REFERENCES [dbo].[product_inventory] ([id])
GO
ALTER TABLE [dbo].[shopping_session]  WITH CHECK ADD FOREIGN KEY([users_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_address]  WITH CHECK ADD FOREIGN KEY([users_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_payment]  WITH CHECK ADD FOREIGN KEY([users_id])
REFERENCES [dbo].[users] ([id])
GO
USE [master]
GO
ALTER DATABASE [DatabaseEC] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [WideWorldImporters_DataWarehouse]    Script Date: 5/2/2025 3:50:43 AM ******/
CREATE DATABASE [WideWorldImporters_DataWarehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WideWorldImporters_DataWarehouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SANU2002\MSSQL\DATA\WideWorldImporters_DataWarehouse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WideWorldImporters_DataWarehouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SANU2002\MSSQL\DATA\WideWorldImporters_DataWarehouse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WideWorldImporters_DataWarehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET RECOVERY FULL 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET  MULTI_USER 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WideWorldImporters_DataWarehouse', N'ON'
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET QUERY_STORE = ON
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WideWorldImporters_DataWarehouse]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 5/2/2025 3:50:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerSK] [int] IDENTITY(1,1) NOT NULL,
	[AlternateCustomerID] [int] NULL,
	[CustomerName] [nvarchar](100) NULL,
	[CustomerFaxNumber] [nvarchar](20) NULL,
	[CustomerPhoneNumber] [nvarchar](20) NULL,
	[CustomerCategory] [nvarchar](50) NULL,
	[CustomerBuyingGroup] [nvarchar](50) NULL,
	[CustomerContinent] [nvarchar](30) NULL,
	[CustomerRegion] [nvarchar](30) NULL,
	[CustomerSubRegion] [nvarchar](30) NULL,
	[CustomerCountry] [nvarchar](60) NULL,
	[CustomerProvinceCode] [nvarchar](5) NULL,
	[CustomerStateProvince] [nvarchar](50) NULL,
	[CustomerCity] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Customer_CustomerSK] PRIMARY KEY CLUSTERED 
(
	[CustomerSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 5/2/2025 3:50:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[Date] [date] NULL,
	[FullDateUK] [char](10) NULL,
	[FullDateUSA] [char](10) NULL,
	[DayOfMonth] [varchar](2) NULL,
	[DaySuffix] [varchar](4) NULL,
	[DayName] [varchar](9) NULL,
	[DayOfWeekUSA] [char](1) NULL,
	[DayOfWeekUK] [char](1) NULL,
	[DayOfWeekInMonth] [varchar](2) NULL,
	[DayOfWeekInYear] [varchar](2) NULL,
	[DayOfQuarter] [varchar](3) NULL,
	[DayOfYear] [varchar](3) NULL,
	[WeekOfMonth] [varchar](1) NULL,
	[WeekOfQuarter] [varchar](2) NULL,
	[WeekOfYear] [varchar](2) NULL,
	[Month] [varchar](2) NULL,
	[MonthName] [varchar](9) NULL,
	[MonthOfQuarter] [varchar](2) NULL,
	[Quarter] [char](1) NULL,
	[QuarterName] [varchar](9) NULL,
	[Year] [char](4) NULL,
	[YearName] [char](7) NULL,
	[MonthYear] [char](10) NULL,
	[MMYYYY] [char](6) NULL,
	[FirstDayOfMonth] [date] NULL,
	[LastDayOfMonth] [date] NULL,
	[FirstDayOfQuarter] [date] NULL,
	[LastDayOfQuarter] [date] NULL,
	[FirstDayOfYear] [date] NULL,
	[LastDayOfYear] [date] NULL,
	[IsHolidaySL] [bit] NULL,
	[IsWeekday] [bit] NULL,
	[HolidaySL] [varchar](50) NULL,
	[isCurrentDay] [int] NULL,
	[isDataAvailable] [int] NULL,
	[isLatestDataAvailable] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 5/2/2025 3:50:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductSK] [int] IDENTITY(1,1) NOT NULL,
	[AlternateProductItemID] [int] NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductGroupName] [nvarchar](50) NULL,
	[ProductColor] [nvarchar](20) NULL,
	[ProductSupplierID] [int] NULL,
	[ProdcutSupplierName] [nvarchar](100) NULL,
	[ProductPackageType] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimProduct_ProductSK] PRIMARY KEY CLUSTERED 
(
	[ProductSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSalesPerson]    Script Date: 5/2/2025 3:50:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSalesPerson](
	[SalesPersonSK] [int] IDENTITY(1,1) NOT NULL,
	[AlternatePersonID] [int] NULL,
	[FullName] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[FaxNumber] [varchar](50) NULL,
 CONSTRAINT [PK_Dim_SalesPerson_DimSalesPersonSK] PRIMARY KEY CLUSTERED 
(
	[SalesPersonSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Sales]    Script Date: 5/2/2025 3:50:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Sales](
	[SalesID] [int] NOT NULL,
	[DateKey] [int] NULL,
	[ProductKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[SalesPersonKey] [int] NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[UnitProfit] [numeric](18, 2) NULL,
	[UnitCost] [numeric](18, 2) NULL,
	[TaxAmount] [numeric](18, 2) NULL,
	[SalesQuantity] [int] NULL,
	[SalesAmount] [numeric](18, 2) NULL,
	[CostAmount] [numeric](18, 2) NULL,
	[ProfitAmount] [numeric](18, 2) NULL,
	[TotalPriceWithoutTax] [numeric](18, 2) NULL,
	[InvoiceModifiedDate] [datetime2](7) NULL,
	[InvoiceLinesModifiedDate] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 5/2/2025 3:50:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[SalesID] [int] NOT NULL,
	[DateKey] [int] NULL,
	[ProductKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[SalesPersonKey] [int] NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[UnitProfit] [numeric](18, 2) NULL,
	[UnitCost] [numeric](18, 2) NULL,
	[TaxAmount] [numeric](18, 2) NULL,
	[SalesQuantity] [int] NULL,
	[SalesAmount] [numeric](18, 2) NULL,
	[CostAmount] [numeric](18, 2) NULL,
	[ProfitAmount] [numeric](18, 2) NULL,
	[TotalPriceWithoutTax] [numeric](18, 2) NULL,
	[InvoiceModifiedDate] [datetime2](7) NULL,
	[InvoiceLinesModifiedDate] [datetime2](7) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomer] ([CustomerSK])
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProduct] ([ProductSK])
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([SalesPersonKey])
REFERENCES [dbo].[DimSalesPerson] ([SalesPersonSK])
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([SalesPersonKey])
REFERENCES [dbo].[DimSalesPerson] ([SalesPersonSK])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomer] ([CustomerSK])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProduct] ([ProductSK])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([SalesPersonKey])
REFERENCES [dbo].[DimSalesPerson] ([SalesPersonSK])
GO
USE [master]
GO
ALTER DATABASE [WideWorldImporters_DataWarehouse] SET  READ_WRITE 
GO

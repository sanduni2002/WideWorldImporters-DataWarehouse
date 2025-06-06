USE [master]
GO
/****** Object:  Database [WideWorldImporters_Staging]    Script Date: 5/2/2025 5:04:23 AM ******/
CREATE DATABASE [WideWorldImporters_Staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WideWorldImporters_Staging', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SANU2002\MSSQL\DATA\WideWorldImporters_Staging.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WideWorldImporters_Staging_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SANU2002\MSSQL\DATA\WideWorldImporters_Staging_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WideWorldImporters_Staging] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WideWorldImporters_Staging].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WideWorldImporters_Staging] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET ARITHABORT OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET RECOVERY FULL 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET  MULTI_USER 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WideWorldImporters_Staging] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WideWorldImporters_Staging] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WideWorldImporters_Staging', N'ON'
GO
ALTER DATABASE [WideWorldImporters_Staging] SET QUERY_STORE = ON
GO
ALTER DATABASE [WideWorldImporters_Staging] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WideWorldImporters_Staging]
GO
/****** Object:  Table [dbo].[stg_Countries]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_Countries](
	[CountryID] [int] NULL,
	[CountryName] [nvarchar](60) NULL,
	[FormalName] [nvarchar](60) NULL,
	[IsoAlpha3Code] [nvarchar](3) NULL,
	[IsoNumericCode] [int] NULL,
	[CountryType] [nvarchar](20) NULL,
	[LatestRecordedPopulation] [bigint] NULL,
	[Continent] [nvarchar](30) NULL,
	[Region] [nvarchar](30) NULL,
	[Subregion] [nvarchar](30) NULL,
	[Border] [varbinary](max) NULL,
	[LastEditedBy] [int] NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_StateProvinces]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_StateProvinces](
	[StateProvinceID] [int] NULL,
	[StateProvinceCode] [nvarchar](5) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
	[SalesTerritory] [nvarchar](50) NULL,
	[Border] [varbinary](max) NULL,
	[LatestRecordedPopulation] [bigint] NULL,
	[LastEditedBy] [int] NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_Cities]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_Cities](
	[CityID] [int] NULL,
	[CityName] [nvarchar](50) NULL,
	[StateProvinceID] [int] NULL,
	[Location] [varbinary](max) NULL,
	[LatestRecordedPopulation] [bigint] NULL,
	[LastEditedBy] [int] NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[AddressDetails]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AddressDetails] AS
SELECT 
    -- Cities table columns
    c.[CityID],
    c.[CityName],
    c.[StateProvinceID] AS CityStateProvinceID,
    c.[Location],
    c.[LatestRecordedPopulation] AS CityLatestRecordedPopulation,
    c.[LastEditedBy] AS CityLastEditedBy,
    c.[ValidFrom] AS CityValidFrom,
    c.[ValidTo] AS CityValidTo,

    -- Countries table columns
    co.[CountryID],
    co.[CountryName],
    co.[FormalName],
    co.[IsoAlpha3Code],
    co.[IsoNumericCode],
    co.[CountryType],
    co.[LatestRecordedPopulation] AS CountryLatestRecordedPopulation,
    co.[Continent],
    co.[Region],
    co.[Subregion],
    co.[Border] AS CountryBorder,
    co.[LastEditedBy] AS CountryLastEditedBy,
    co.[ValidFrom] AS CountryValidFrom,
    co.[ValidTo] AS CountryValidTo,

    -- StateProvinces table columns
    sp.[StateProvinceID],
    sp.[StateProvinceCode],
    sp.[StateProvinceName],
    sp.[CountryID] AS StateProvinceCountryID,
    sp.[SalesTerritory],
    sp.[Border] AS StateProvinceBorder,
    sp.[LatestRecordedPopulation] AS StateProvinceLatestRecordedPopulation,
    sp.[LastEditedBy] AS StateProvinceLastEditedBy,
    sp.[ValidFrom] AS StateProvinceValidFrom,
    sp.[ValidTo] AS StateProvinceValidTo

FROM 
    [WideWorldImporters_Staging].[dbo].[stg_Cities] c
LEFT OUTER JOIN 
    [WideWorldImporters_Staging].[dbo].[stg_Countries] co
    ON c.[StateProvinceID] = co.[CountryID]  -- Adjust the join condition as necessary
LEFT OUTER JOIN 
    [WideWorldImporters_Staging].[dbo].[stg_StateProvinces] sp
    ON c.[StateProvinceID] = sp.[StateProvinceID];

GO
/****** Object:  Table [dbo].[stg_BuyingGroups]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_BuyingGroups](
	[BuyingGroupID] [int] NULL,
	[BuyingGroupName] [nvarchar](50) NULL,
	[LastEditedBy] [int] NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_Customers]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_Customers](
	[CustomerID] [int] NULL,
	[CustomerName] [nvarchar](100) NULL,
	[BillToCustomerID] [int] NULL,
	[CustomerCategoryID] [int] NULL,
	[BuyingGroupID] [int] NULL,
	[PrimaryContactPersonID] [int] NULL,
	[AlternateContactPersonID] [int] NULL,
	[DeliveryMethodID] [int] NULL,
	[DeliveryCityID] [int] NULL,
	[PostalCityID] [int] NULL,
	[CreditLimit] [numeric](18, 2) NULL,
	[AccountOpenedDate] [date] NULL,
	[StandardDiscountPercentage] [numeric](18, 3) NULL,
	[IsStatementSent] [bit] NULL,
	[IsOnCreditHold] [bit] NULL,
	[PaymentDays] [int] NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[FaxNumber] [nvarchar](20) NULL,
	[DeliveryRun] [nvarchar](5) NULL,
	[RunPosition] [nvarchar](5) NULL,
	[WebsiteURL] [nvarchar](256) NULL,
	[DeliveryAddressLine1] [nvarchar](60) NULL,
	[DeliveryAddressLine2] [nvarchar](60) NULL,
	[DeliveryPostalCode] [nvarchar](10) NULL,
	[DeliveryLocation] [varbinary](max) NULL,
	[PostalAddressLine1] [nvarchar](60) NULL,
	[PostalAddressLine2] [nvarchar](60) NULL,
	[PostalPostalCode] [nvarchar](10) NULL,
	[LastEditedBy] [int] NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_CustomerCategories]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_CustomerCategories](
	[CustomerCategoryID] [int] NULL,
	[CustomerCategoryName] [nvarchar](50) NULL,
	[LastEditedBy] [int] NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_CustomerDetails]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_CustomerDetails] AS
SELECT 
    c.[CustomerID],
    c.[CustomerName],
    c.[BillToCustomerID],
    c.[CustomerCategoryID] AS CustomerCategoryID_Original,
    c.[BuyingGroupID] AS CustomerBuyingGroupID,
    c.[PrimaryContactPersonID],
    c.[AlternateContactPersonID],
    c.[DeliveryMethodID],
    c.[DeliveryCityID],
    c.[PostalCityID],
    c.[CreditLimit],
    c.[AccountOpenedDate],
    c.[StandardDiscountPercentage],
    c.[IsStatementSent],
    c.[IsOnCreditHold],
    c.[PaymentDays],
    c.[PhoneNumber],
    c.[FaxNumber],
    c.[DeliveryRun],
    c.[RunPosition],
    c.[WebsiteURL],
    c.[DeliveryAddressLine1],
    c.[DeliveryAddressLine2],
    c.[DeliveryPostalCode],
    c.[PostalAddressLine1],
    c.[PostalAddressLine2],
    c.[PostalPostalCode],
    c.[LastEditedBy] AS CustomerLastEditedBy,
    c.[ValidFrom] AS CustomerValidFrom,
    c.[ValidTo] AS CustomerValidTo,
    
    -- CustomerCategory columns
    cat.[CustomerCategoryID] AS CategoryCustomerCategoryID,
    cat.[CustomerCategoryName],
    cat.[LastEditedBy] AS CategoryLastEditedBy,
    cat.[ValidFrom] AS CategoryValidFrom,
    cat.[ValidTo] AS CategoryValidTo,
    
    -- BuyingGroup columns
    bg.[BuyingGroupID] AS GroupBuyingGroupID,
    bg.[BuyingGroupName],
    bg.[LastEditedBy] AS GroupLastEditedBy,
    bg.[ValidFrom] AS GroupValidFrom,
    bg.[ValidTo] AS GroupValidTo

FROM 
    [WideWorldImporters_Staging].[dbo].[stg_Customers] c
LEFT OUTER JOIN 
    [WideWorldImporters_Staging].[dbo].[stg_CustomerCategories] cat
    ON c.CustomerCategoryID = cat.CustomerCategoryID
LEFT OUTER JOIN 
    [WideWorldImporters_Staging].[dbo].[stg_BuyingGroups] bg
    ON c.BuyingGroupID = bg.BuyingGroupID;

GO
/****** Object:  Table [dbo].[stg_StockGroups]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_StockGroups](
	[LastEditedBy] [int] NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL,
	[StockGroupID] [int] NULL,
	[StockGroupName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_StockItemStockGroups]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_StockItemStockGroups](
	[StockItemStockGroupID] [int] NULL,
	[StockItemID] [int] NULL,
	[StockGroupID] [int] NULL,
	[LastEditedBy] [int] NULL,
	[LastEditedWhen] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_StockItems]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_StockItems](
	[StockItemID] [int] NULL,
	[StockItemName] [nvarchar](100) NULL,
	[SupplierID] [int] NULL,
	[ColorID] [int] NULL,
	[UnitPackageID] [int] NULL,
	[OuterPackageID] [int] NULL,
	[Brand] [nvarchar](50) NULL,
	[Size] [nvarchar](20) NULL,
	[LeadTimeDays] [int] NULL,
	[QuantityPerOuter] [int] NULL,
	[IsChillerStock] [bit] NULL,
	[Barcode] [nvarchar](50) NULL,
	[TaxRate] [numeric](18, 3) NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[RecommendedRetailPrice] [numeric](18, 2) NULL,
	[TypicalWeightPerUnit] [numeric](18, 3) NULL,
	[MarketingComments] [nvarchar](max) NULL,
	[InternalComments] [nvarchar](max) NULL,
	[Photo] [varbinary](max) NULL,
	[CustomFields] [nvarchar](max) NULL,
	[Tags] [nvarchar](max) NULL,
	[SearchDetails] [nvarchar](max) NULL,
	[LastEditedBy] [int] NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_Colors]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_Colors](
	[ColorID] [int] NULL,
	[ColorName] [nvarchar](20) NULL,
	[LastEditedBy] [int] NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_Suppliers]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_Suppliers](
	[SupplierID] [int] NULL,
	[SupplierName] [nvarchar](100) NULL,
	[SupplierCategoryID] [int] NULL,
	[PrimaryContactPersonID] [int] NULL,
	[AlternateContactPersonID] [int] NULL,
	[DeliveryMethodID] [int] NULL,
	[DeliveryCityID] [int] NULL,
	[PostalCityID] [int] NULL,
	[SupplierReference] [nvarchar](20) NULL,
	[BankAccountName] [nvarchar](50) NULL,
	[BankAccountBranch] [nvarchar](50) NULL,
	[BankAccountCode] [nvarchar](20) NULL,
	[BankAccountNumber] [nvarchar](20) NULL,
	[BankInternationalCode] [nvarchar](20) NULL,
	[PaymentDays] [int] NULL,
	[InternalComments] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[FaxNumber] [nvarchar](20) NULL,
	[WebsiteURL] [nvarchar](256) NULL,
	[DeliveryAddressLine1] [nvarchar](60) NULL,
	[DeliveryAddressLine2] [nvarchar](60) NULL,
	[DeliveryPostalCode] [nvarchar](10) NULL,
	[DeliveryLocation] [varbinary](max) NULL,
	[PostalAddressLine1] [nvarchar](60) NULL,
	[PostalAddressLine2] [nvarchar](60) NULL,
	[PostalPostalCode] [nvarchar](10) NULL,
	[LastEditedBy] [int] NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_PackageType]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_PackageType](
	[PackageTypeID] [int] NULL,
	[PackageTypeName] [nvarchar](50) NULL,
	[LastEditedBy] [int] NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ProductDetails]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ProductDetails]
AS
SELECT 
    -- From stg_StockItems
    si.StockItemID,
    si.StockItemName,
    si.SupplierID,
    si.ColorID,
    si.UnitPackageID,
    si.OuterPackageID,
    si.Brand,
    si.Size,
    si.LeadTimeDays,
    si.QuantityPerOuter,
    si.IsChillerStock,
    si.Barcode,
    si.TaxRate,
    si.UnitPrice,
    si.RecommendedRetailPrice,
    si.TypicalWeightPerUnit,
    si.MarketingComments,
    si.InternalComments,
    si.Photo,
    si.CustomFields,
    si.Tags,
    si.SearchDetails,
    si.LastEditedBy AS StockItem_LastEditedBy,
    si.ValidFrom AS StockItem_ValidFrom,
    si.ValidTo AS StockItem_ValidTo,

    -- From stg_Suppliers
    sup.SupplierName,
    sup.SupplierCategoryID,
    sup.PrimaryContactPersonID,
    sup.AlternateContactPersonID,
    sup.DeliveryMethodID,
    sup.DeliveryCityID,
    sup.PostalCityID,
    sup.SupplierReference,
    sup.BankAccountName,
    sup.BankAccountBranch,
    sup.BankAccountCode,
    sup.BankAccountNumber,
    sup.BankInternationalCode,
    sup.PaymentDays,
    sup.InternalComments AS Supplier_InternalComments,
    sup.PhoneNumber,
    sup.FaxNumber,
    sup.WebsiteURL,
    sup.DeliveryAddressLine1,
    sup.DeliveryAddressLine2,
    sup.DeliveryPostalCode,
    sup.DeliveryLocation,
    sup.PostalAddressLine1,
    sup.PostalAddressLine2,
    sup.PostalPostalCode,
    sup.LastEditedBy AS Supplier_LastEditedBy,
    sup.ValidFrom AS Supplier_ValidFrom,
    sup.ValidTo AS Supplier_ValidTo,

    -- From stg_Colors
    col.ColorName,
    col.LastEditedBy AS Color_LastEditedBy,
    col.ValidFrom AS Color_ValidFrom,
    col.ValidTo AS Color_ValidTo,

    -- From stg_PackageTypes for UnitPackage
    up.PackageTypeName AS UnitPackageName,
    up.LastEditedBy AS UnitPackage_LastEditedBy,
    up.ValidFrom AS UnitPackage_ValidFrom,
    up.ValidTo AS UnitPackage_ValidTo,

    -- From stg_PackageTypes for OuterPackage
    op.PackageTypeName AS OuterPackageName,
    op.LastEditedBy AS OuterPackage_LastEditedBy,
    op.ValidFrom AS OuterPackage_ValidFrom,
    op.ValidTo AS OuterPackage_ValidTo,

    -- From stg_StockItemStockGroup
    sisg.StockItemStockGroupID,
    sisg.StockGroupID,
    sisg.LastEditedBy AS StockItemStockGroup_LastEditedBy,
    sisg.LastEditedWhen,

    -- From stg_StockGroups
    sg.StockGroupName,
    sg.LastEditedBy AS StockGroup_LastEditedBy,
    sg.ValidFrom AS StockGroup_ValidFrom,
    sg.ValidTo AS StockGroup_ValidTo

FROM [WideWorldImporters_Staging].[dbo].[stg_StockItems] si
LEFT JOIN [WideWorldImporters_Staging].[dbo].[stg_Suppliers] sup
    ON si.SupplierID = sup.SupplierID
LEFT JOIN [WideWorldImporters_Staging].[dbo].[stg_Colors] col
    ON si.ColorID = col.ColorID
LEFT JOIN [WideWorldImporters_Staging].[dbo].[stg_PackageType] up
    ON si.UnitPackageID = up.PackageTypeID
LEFT JOIN [WideWorldImporters_Staging].[dbo].[stg_PackageType] op
    ON si.OuterPackageID = op.PackageTypeID
LEFT JOIN [WideWorldImporters_Staging].[dbo].[stg_StockItemStockGroups]sisg
    ON si.StockItemID = sisg.StockItemID
LEFT JOIN [WideWorldImporters_Staging].[dbo].[stg_StockGroups] sg
    ON sisg.StockGroupID = sg.StockGroupID
;

GO
/****** Object:  Table [dbo].[stg_InvoiceLines]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_InvoiceLines](
	[InvoiceLineID] [int] NULL,
	[InvoiceID] [int] NULL,
	[StockItemID] [int] NULL,
	[Description] [nvarchar](100) NULL,
	[PackageTypeID] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[TaxRate] [numeric](18, 3) NULL,
	[TaxAmount] [numeric](18, 2) NULL,
	[LineProfit] [numeric](18, 2) NULL,
	[ExtendedPrice] [numeric](18, 2) NULL,
	[LastEditedBy] [int] NULL,
	[LastEditedWhen] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_Invoices]    Script Date: 5/2/2025 5:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_Invoices](
	[InvoiceID] [int] NULL,
	[LastEditedBy] [int] NULL,
	[LastEditedWhen] [datetime2](7) NULL,
	[CustomerID] [int] NULL,
	[BillToCustomerID] [int] NULL,
	[OrderID] [int] NULL,
	[DeliveryMethodID] [int] NULL,
	[ContactPersonID] [int] NULL,
	[AccountsPersonID] [int] NULL,
	[SalespersonPersonID] [int] NULL,
	[PackedByPersonID] [int] NULL,
	[InvoiceDate] [date] NULL,
	[CustomerPurchaseOrderNumber] [nvarchar](20) NULL,
	[IsCreditNote] [bit] NULL,
	[CreditNoteReason] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[DeliveryInstructions] [nvarchar](max) NULL,
	[InternalComments] [nvarchar](max) NULL,
	[TotalDryItems] [int] NULL,
	[TotalChillerItems] [int] NULL,
	[DeliveryRun] [nvarchar](5) NULL,
	[RunPosition] [nvarchar](5) NULL,
	[ReturnedDeliveryData] [nvarchar](max) NULL,
	[ConfirmedDeliveryTime] [datetime2](7) NULL,
	[ConfirmedReceivedBy] [nvarchar](4000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [WideWorldImporters_Staging] SET  READ_WRITE 
GO

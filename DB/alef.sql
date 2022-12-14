USE [master]
GO
/****** Object:  Database [ALEF]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE DATABASE [ALEF] ON  PRIMARY 
( NAME = N'Arch_KAlef2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Arch_KAelf2_data.mdf' , SIZE = 1024000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 102400KB )
 LOG ON 
( NAME = N'Arch_KAlef2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Arch_KAelf2_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 102400KB )
GO
ALTER DATABASE [ALEF] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ALEF].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [ALEF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ALEF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ALEF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ALEF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ALEF] SET ARITHABORT OFF 
GO
ALTER DATABASE [ALEF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ALEF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ALEF] SET AUTO_UPDATE_STATISTICS OFF 
GO
ALTER DATABASE [ALEF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ALEF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ALEF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ALEF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ALEF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ALEF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ALEF] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ALEF] SET AUTO_UPDATE_STATISTICS_ASYNC ON 
GO
ALTER DATABASE [ALEF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ALEF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ALEF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ALEF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ALEF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ALEF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ALEF] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ALEF] SET  MULTI_USER 
GO
ALTER DATABASE [ALEF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ALEF] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ALEF', N'ON'
GO
USE [ALEF]
GO
/****** Object:  User [alef1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE USER [alef1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[sys]
GO
/****** Object:  User [alef]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE USER [alef] FOR LOGIN [alef] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'alef1'
GO
sys.sp_addrolemember @rolename = N'db_accessadmin', @membername = N'alef1'
GO
sys.sp_addrolemember @rolename = N'db_securityadmin', @membername = N'alef1'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'alef1'
GO
sys.sp_addrolemember @rolename = N'db_backupoperator', @membername = N'alef1'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'alef1'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'alef1'
GO
sys.sp_addrolemember @rolename = N'db_denydatareader', @membername = N'alef1'
GO
sys.sp_addrolemember @rolename = N'db_denydatawriter', @membername = N'alef1'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'alef'
GO
/****** Object:  UserDefinedFunction [dbo].[ufnStringToDate]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************
**		Desc: 
**		Auth: 
**		Date: 
**********************************************************************************************
**		Change History
**********************************************************************************************
**		Date:		Author:	       Description:
**		--------	--------       -----------------------------------------------
*********************************************************************************************/
CREATE FUNCTION [dbo].[ufnStringToDate] (
	@mString VARCHAR(12)
) RETURNS DATETIME--RETURNS VARCHAR(20)
AS
BEGIN
	IF (@mString = '' or @mString IS NULL or LEN(@mString) < 12)
		RETURN NULL

	DECLARE @mDate VARCHAR(20)
	
	select @mDate =
	  SUBSTRING(@mString,1,4) -- year
	+'-'+ SUBSTRING(@mString,5,2) -- month
	+'-'+ SUBSTRING(@mString,7,2) -- day
	+' '+ SUBSTRING(@mString,9,2) -- hour
	+':'+ SUBSTRING(@mString,11,2) -- min
	+':00'

	DECLARE @DateConVert DATETIME
	select @DateConVert = CONVERT(DateTime, @mDate, 20)
	RETURN @DateConVert
END

GO
/****** Object:  Table [dbo].[ACCOUNTWORLD]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNTWORLD](
	[ACCOUNTID] [varchar](32) NOT NULL,
	[WORLD] [varchar](20) NOT NULL,
	[BANKMONEY] [decimal](20, 0) NULL,
	[BANKSIZE] [decimal](10, 0) NULL,
 CONSTRAINT [PK_ACCOUNTWORLD] PRIMARY KEY CLUSTERED 
(
	[ACCOUNTID] ASC,
	[WORLD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALT_CASHITEM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALT_CASHITEM](
	[ACTCODE] [varchar](10) NULL,
	[WDATE] [datetime2](7) NULL,
	[IPADDR] [varchar](15) NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[CHARID] [varchar](32) NULL,
	[CHARTID] [decimal](10, 0) NULL,
	[CHARLV] [decimal](10, 0) NULL,
	[CHAREXP] [decimal](10, 0) NULL,
	[GHELDINVEN] [decimal](20, 0) NULL,
	[GHELDBANK] [decimal](20, 0) NULL,
	[ITEMSEQ] [decimal](20, 0) NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[ITEMQTY] [decimal](10, 0) NULL,
	[ITEMCONVHIST] [varchar](128) NULL,
	[ITEMOPTION] [varchar](32) NULL,
	[GHELD] [decimal](10, 0) NULL,
	[CHARID2] [varchar](32) NULL,
	[INUSE] [decimal](10, 0) NULL,
	[USECOUNT] [decimal](10, 0) NULL,
	[REMAINTIME] [decimal](10, 0) NULL,
	[EXPIREDATE] [datetime2](7) NULL,
	[DESCR] [varchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALT_ETC]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALT_ETC](
	[ACTCODE] [varchar](10) NULL,
	[WDATE] [datetime2](7) NULL,
	[IPADDR] [varchar](15) NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[CHARID] [varchar](32) NULL,
	[CHARTID] [decimal](10, 0) NULL,
	[CHARLV] [decimal](10, 0) NULL,
	[CHAREXP] [decimal](10, 0) NULL,
	[GHELDINVEN] [decimal](20, 0) NULL,
	[GHELDBANK] [decimal](20, 0) NULL,
	[NUMID] [decimal](10, 0) NULL,
	[STRID] [varchar](32) NULL,
	[DESCR] [varchar](64) NULL,
	[GHELD] [decimal](10, 0) NULL,
	[CHARID2] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALT_GHELD]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALT_GHELD](
	[ACTCODE] [varchar](10) NULL,
	[WDATE] [datetime2](7) NULL,
	[IPADDR] [varchar](15) NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[CHARID] [varchar](32) NULL,
	[CHARTID] [decimal](10, 0) NULL,
	[CHARLV] [decimal](10, 0) NULL,
	[CHAREXP] [decimal](10, 0) NULL,
	[GHELDINVEN] [decimal](20, 0) NULL,
	[GHELDBANK] [decimal](20, 0) NULL,
	[GHELD] [decimal](10, 0) NULL,
	[CHARID2] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALT_ITEM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALT_ITEM](
	[ACTCODE] [varchar](10) NULL,
	[WDATE] [datetime2](7) NULL,
	[IPADDR] [varchar](15) NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[CHARID] [varchar](32) NULL,
	[CHARTID] [decimal](10, 0) NULL,
	[CHARLV] [decimal](10, 0) NULL,
	[CHAREXP] [decimal](10, 0) NULL,
	[GHELDINVEN] [decimal](20, 0) NULL,
	[GHELDBANK] [decimal](20, 0) NULL,
	[ITEMSEQ] [decimal](20, 0) NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[ITEMQTY] [decimal](10, 0) NULL,
	[ITEMCONVHIST] [varchar](128) NULL,
	[ITEMOPTION] [varchar](32) NULL,
	[GHELD] [decimal](10, 0) NULL,
	[CHARID2] [varchar](32) NULL,
	[INUSE] [decimal](10, 0) NULL,
	[USECOUNT] [decimal](10, 0) NULL,
	[REMAINTIME] [decimal](10, 0) NULL,
	[EXPIREDATE] [datetime2](7) NULL,
	[DESCR] [varchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALT_PLAY]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALT_PLAY](
	[ACTCODE] [varchar](10) NULL,
	[WDATE] [datetime2](7) NULL,
	[IPADDR] [varchar](15) NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[CHARID] [varchar](32) NULL,
	[CHARTID] [decimal](10, 0) NULL,
	[CHARLV] [decimal](10, 0) NULL,
	[CHAREXP] [decimal](10, 0) NULL,
	[GHELDINVEN] [decimal](20, 0) NULL,
	[GHELDBANK] [decimal](20, 0) NULL,
	[CHARLVFROM] [decimal](10, 0) NULL,
	[PARTYTIME] [decimal](10, 0) NULL,
	[SOLOTIME] [decimal](10, 0) NULL,
	[KILLPC] [decimal](10, 0) NULL,
	[KILLMON] [decimal](10, 0) NULL,
	[DEADBYPC] [decimal](10, 0) NULL,
	[DEADBYMON] [decimal](10, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AMT_ACCOUNT]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMT_ACCOUNT](
	[ACCOUNTID] [varchar](32) NULL,
	[PASSWORD] [varchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AMT_ACCOUNTLOG]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMT_ACCOUNTLOG](
	[ACCOUNT_SEQID] [decimal](10, 0) NOT NULL,
	[ACCOUNT_ID] [varchar](32) NOT NULL,
	[NAME] [varchar](30) NOT NULL,
	[LOG_TYPE] [varchar](2) NOT NULL,
	[LOG_DATE] [datetime2](7) NOT NULL,
	[IP] [varchar](23) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AMT_COUPON_MASTER]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMT_COUPON_MASTER](
	[ID] [decimal](38, 38) NOT NULL,
	[SEQ_MASTER] [decimal](20, 0) NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[CHARID] [varchar](32) NULL,
	[WORLD] [varchar](32) NULL,
	[CP_CODE] [char](32) NULL,
	[USEYN] [char](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AMT_COUPON_USER]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMT_COUPON_USER](
	[SEQ_MASTER] [decimal](32, 0) NULL,
	[COUPONNO] [decimal](32, 0) NULL,
	[COMPEN] [varchar](20) NULL,
	[USEYN] [char](10) NULL,
	[GAME_USEDT] [varchar](20) NULL,
	[GAME_ITEMLOG] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AMT_EVENT_COUPON]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMT_EVENT_COUPON](
	[USEYN] [varchar](32) NULL,
	[USEDATE] [datetime2](7) NULL,
	[COUPONNO] [decimal](32, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AMT_MASTER]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMT_MASTER](
	[ACCOUNTID] [varchar](32) NOT NULL,
	[EMAIL] [varchar](128) NOT NULL,
	[SOCIALNO] [varchar](18) NOT NULL,
	[CREATION_DATE] [datetime2](7) NOT NULL,
	[LAST_DATE] [datetime2](7) NULL,
	[MODIFY_DATE] [datetime2](7) NULL,
	[PHONE] [varchar](16) NULL,
	[MOBILE] [varchar](16) NULL,
	[ZIPCODE] [varchar](6) NULL,
	[ADDR1] [varchar](255) NULL,
	[ADDR2] [varchar](255) NULL,
	[SMS_YN] [char](1) NOT NULL,
	[EMAIL_YN] [char](1) NOT NULL,
	[PENALTY_GBN] [varchar](5) NULL,
	[PAUSE_DATE] [datetime2](7) NULL,
	[IP] [varchar](32) NULL,
	[LOGINCNT] [decimal](10, 0) NULL,
	[NOMINATOR] [varchar](32) NULL,
	[RPG_LEVEL] [decimal](10, 0) NULL,
	[LONEY_AGREEYN] [char](1) NULL,
	[LONEY_CHARGEYN] [char](1) NULL,
	[SEX] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AMT_MASTER_OUT]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMT_MASTER_OUT](
	[ACCOUNT_SEQID] [decimal](10, 0) NOT NULL,
	[ACCOUNT_ID] [varchar](32) NOT NULL,
	[NAME] [varchar](30) NOT NULL,
	[NICKNAME] [varchar](40) NOT NULL,
	[SOCIALNO] [varchar](13) NOT NULL,
	[PASSWORD] [varchar](16) NOT NULL,
	[EMAIL] [varchar](128) NOT NULL,
	[HINT_QUESTION] [varchar](6) NOT NULL,
	[HINT_ANSWER] [varchar](50) NOT NULL,
	[CREATION_DATE] [datetime2](7) NOT NULL,
	[LAST_DATE] [datetime2](7) NOT NULL,
	[MODIFY_DATE] [datetime2](7) NULL,
	[PHONE] [varchar](16) NULL,
	[MOBILE] [varchar](16) NULL,
	[ZIPCODE] [varchar](6) NULL,
	[ADDRESS] [varchar](255) NULL,
	[SMS_YN] [char](1) NOT NULL,
	[MARRY_YN] [char](1) NOT NULL,
	[EMAIL_YN] [char](1) NOT NULL,
	[PWD_RESET_YN] [char](1) NOT NULL,
	[OCCUPATION] [varchar](5) NOT NULL,
	[PENALTY_GBN] [varchar](2) NULL,
	[PAUSE_DATE] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AMT_WITHDRAW]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMT_WITHDRAW](
	[ACCOUNT_SEQID] [decimal](10, 0) NOT NULL,
	[ACCOUNT_ID] [varchar](32) NOT NULL,
	[SOCIALNO] [varchar](13) NOT NULL,
	[NICKNAME] [varchar](40) NOT NULL,
	[CREATION_DATE] [datetime2](7) NOT NULL,
	[WITHDRAW_DATE] [datetime2](7) NULL,
	[WITHDRAW_TYPE] [char](1) NOT NULL,
	[WITHDRAW_REASON] [varchar](6) NULL,
	[REFUND_YN] [char](1) NULL,
	[REFUND_COINAMT] [decimal](22, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AMT_WORLDMAPPING]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMT_WORLDMAPPING](
	[ACCOUNTID] [varchar](32) NOT NULL,
	[SECTION] [varchar](10) NOT NULL,
	[WORLD] [varchar](32) NOT NULL,
	[CHARID] [varchar](16) NOT NULL,
	[CREATIONDATE] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AMT_ZIPCODE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMT_ZIPCODE](
	[ZIP1] [char](3) NOT NULL,
	[ZIP2] [char](3) NOT NULL,
	[ADDR] [varchar](200) NOT NULL,
	[BUNJI] [varchar](100) NULL,
	[SADDR] [varchar](40) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAKCHARCASHITEM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAKCHARCASHITEM](
	[ITEMSEQ] [decimal](20, 0) NOT NULL,
	[CHARSEQ] [decimal](20, 0) NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[WORLD] [varchar](20) NULL,
	[CHARID] [varchar](47) NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[STACKCOUNT] [decimal](10, 0) NULL,
	[STATUS] [decimal](5, 0) NULL,
	[POS] [varchar](64) NULL,
	[NEEDLEVEL] [decimal](3, 0) NULL,
	[OWNTIME] [datetime] NULL,
	[CONVHIST] [varchar](128) NULL,
	[DURABILITY] [decimal](10, 0) NULL,
	[MAXDUR] [decimal](10, 0) NULL,
	[FLAG] [decimal](10, 0) NULL,
	[OPT] [varchar](32) NULL,
	[INUSE] [decimal](10, 0) NULL,
	[USECOUNT] [decimal](10, 0) NULL,
	[REMAINTIME] [decimal](10, 0) NULL,
	[EXPIREDATE] [datetime] NULL,
	[REASON] [varchar](32) NULL,
	[DELTIME] [datetime] NULL,
	[SKILLPLUS] [varchar](32) NULL,
	[STAMINAREMAINTIME] [decimal](10, 0) NULL,
 CONSTRAINT [PK_BAKCHARCASHITEM] PRIMARY KEY CLUSTERED 
(
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAKCHARDETAIL]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAKCHARDETAIL](
	[CHARSEQ] [decimal](20, 0) NOT NULL,
	[CHARID] [varchar](47) NULL,
	[TITLE] [varchar](32) NULL,
	[POS] [varchar](64) NULL,
	[CRIMINALSTATUS] [decimal](3, 0) NULL,
	[MURDERPOINT] [decimal](5, 0) NULL,
	[RCFTIME] [decimal](10, 0) NULL,
	[RMFTIME] [decimal](10, 0) NULL,
	[INVENMONEY] [decimal](20, 0) NULL,
	[HP] [decimal](10, 0) NULL,
	[MP] [decimal](10, 0) NULL,
	[SP] [decimal](10, 0) NULL,
	[EXP] [decimal](20, 0) NULL,
	[LV] [decimal](3, 0) NULL,
	[SKILLPOINT] [decimal](10, 0) NULL,
	[QUICKBELT] [varchar](512) NULL,
	[LATESTREGION] [decimal](3, 0) NULL,
	[FLAG] [char](256) NULL,
	[FLAG2] [char](256) NULL,
	[STATUS] [decimal](10, 0) NULL,
	[RESURRECTDATE] [datetime] NULL,
	[TRANSFORMDATE] [datetime] NULL,
	[CURCONNDATE] [datetime] NULL,
	[LASTVISITDATE] [datetime] NULL,
	[LASTVISITIP] [varchar](15) NULL,
	[HAIR] [decimal](10, 0) NULL,
	[FACE] [decimal](10, 0) NULL,
	[DEADTYPE] [decimal](3, 0) NULL,
	[CHARISMAPOINT] [decimal](20, 0) NULL,
	[HEROICPOINT] [decimal](20, 0) NULL,
 CONSTRAINT [PK_BAKCHARDETAIL] PRIMARY KEY CLUSTERED 
(
	[CHARSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAKCHARITEM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAKCHARITEM](
	[ITEMSEQ] [decimal](20, 0) NOT NULL,
	[CHARSEQ] [decimal](20, 0) NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[WORLD] [varchar](20) NULL,
	[CHARID] [varchar](47) NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[STACKCOUNT] [decimal](10, 0) NULL,
	[STATUS] [decimal](5, 0) NULL,
	[POS] [varchar](64) NULL,
	[NEEDLEVEL] [decimal](3, 0) NULL,
	[OWNTIME] [datetime] NULL,
	[CONVHIST] [varchar](128) NULL,
	[DURABILITY] [decimal](10, 0) NULL,
	[MAXDUR] [decimal](10, 0) NULL,
	[FLAG] [decimal](10, 0) NULL,
	[OPT] [varchar](32) NULL,
	[INUSE] [decimal](10, 0) NULL,
	[USECOUNT] [decimal](10, 0) NULL,
	[REMAINTIME] [decimal](10, 0) NULL,
	[EXPIREDATE] [datetime] NULL,
	[REASON] [varchar](32) NULL,
	[DELTIME] [datetime] NULL,
	[SKILLPLUS] [varchar](32) NULL,
	[STAMINAREMAINTIME] [decimal](10, 0) NULL,
 CONSTRAINT [PK_BAKCHARITEM] PRIMARY KEY CLUSTERED 
(
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAKCHARMASTER]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAKCHARMASTER](
	[CHARSEQ] [decimal](20, 0) IDENTITY(1,1) NOT NULL,
	[CHARID] [varchar](47) NULL,
	[WORLD] [varchar](20) NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[SLOT] [decimal](3, 0) NULL,
	[CHARTID] [decimal](10, 0) NULL,
	[CREATIONDATE] [datetime] NULL,
	[DELETIONDATE] [datetime] NULL,
	[CHARID2] [varchar](47) NULL,
	[FLAG] [decimal](3, 0) NULL,
 CONSTRAINT [PK_BAKCHARMASTER] PRIMARY KEY CLUSTERED 
(
	[CHARSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAKCHARQUEST]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAKCHARQUEST](
	[CHARSEQ] [decimal](20, 0) NOT NULL,
	[CHARID] [varchar](47) NOT NULL,
	[QUESTTID] [decimal](10, 0) NOT NULL,
	[SDATE] [datetime] NULL,
	[ARG1] [decimal](10, 0) NULL,
	[ARG2] [decimal](10, 0) NULL,
	[NPCID] [varchar](16) NULL,
 CONSTRAINT [PK_BAKCHARQUEST] PRIMARY KEY CLUSTERED 
(
	[CHARSEQ] ASC,
	[CHARID] ASC,
	[QUESTTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAKCHARSKILL]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAKCHARSKILL](
	[CHARSEQ] [decimal](20, 0) NOT NULL,
	[CHARID] [varchar](47) NULL,
	[SKILLSEQ] [varchar](512) NULL,
	[PRODUCT] [varchar](512) NULL,
 CONSTRAINT [PK_BAKCHARSKILL] PRIMARY KEY CLUSTERED 
(
	[CHARSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAKCHARTITLE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAKCHARTITLE](
	[CHARSEQ] [decimal](20, 0) NOT NULL,
	[CharID] [varchar](47) NOT NULL,
	[mTitleTid] [decimal](10, 0) NOT NULL,
	[mIsComplete] [decimal](3, 0) NOT NULL,
	[mIsEquip] [decimal](3, 0) NOT NULL,
	[mValue1] [decimal](10, 0) NULL,
	[mValue2] [decimal](10, 0) NULL,
	[mValue3] [decimal](10, 0) NULL,
	[mValue4] [decimal](10, 0) NULL,
	[mValue5] [decimal](10, 0) NULL,
	[mDateAccept] [datetime] NOT NULL,
	[mDateComplete] [datetime] NULL,
	[mDateEquip] [datetime] NULL,
 CONSTRAINT [PK_BAKCHARTITLE] PRIMARY KEY CLUSTERED 
(
	[CHARSEQ] ASC,
	[CharID] ASC,
	[mTitleTid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAKSALESBOARD]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAKSALESBOARD](
	[DOCID] [decimal](20, 0) NOT NULL,
	[CHARID] [varchar](47) NULL,
	[ITEMSEQ] [decimal](20, 0) NULL,
	[UNITPRICE] [decimal](10, 0) NULL,
	[TOTALQTY] [decimal](5, 0) NULL,
	[WDATE] [datetime] NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[STATUS] [decimal](10, 0) NULL,
 CONSTRAINT [PK_BAKSALESBOARD] PRIMARY KEY CLUSTERED 
(
	[DOCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CASHITEMBUYLIST]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CASHITEMBUYLIST](
	[BUYSEQ] [decimal](20, 0) NOT NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[CHARID] [varchar](47) NULL,
	[CHARTID] [decimal](10, 0) NULL,
	[CHARLV] [decimal](10, 0) NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[ITEMQTY] [decimal](10, 0) NULL,
	[ITEMSEQ] [decimal](20, 0) NULL,
	[MONEY] [decimal](20, 0) NULL,
	[BUYTIME] [datetime] NULL,
	[BUYIP] [varchar](15) NULL,
	[ORDERNO] [decimal](20, 0) NULL,
	[STATUS] [varchar](10) NULL,
 CONSTRAINT [PK_CASHITEMBUYLIST] PRIMARY KEY CLUSTERED 
(
	[BUYSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CASTLE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CASTLE](
	[CASTLEID] [varchar](32) NOT NULL,
	[OWNERGUILDID] [varchar](32) NULL,
	[TOTALINCOME] [decimal](20, 0) NULL,
	[LATESTTRANSFER] [datetime] NULL,
	[LATESTMODIFY] [datetime] NULL,
	[REGIONNAME1] [varchar](32) NULL,
	[REGIONRATIO1] [decimal](10, 0) NULL,
	[REGIONINCOME1] [decimal](20, 0) NULL,
	[REGIONNAME2] [varchar](32) NULL,
	[REGIONRATIO2] [decimal](10, 0) NULL,
	[REGIONINCOME2] [decimal](20, 0) NULL,
	[REGIONNAME3] [varchar](32) NULL,
	[REGIONRATIO3] [decimal](10, 0) NULL,
	[REGIONINCOME3] [decimal](20, 0) NULL,
	[REGIONNAME4] [varchar](32) NULL,
	[REGIONRATIO4] [decimal](10, 0) NULL,
	[REGIONINCOME4] [decimal](20, 0) NULL,
 CONSTRAINT [PK_CASTLE] PRIMARY KEY CLUSTERED 
(
	[CASTLEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CERARIUM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CERARIUM](
	[cItemSEQ] [decimal](20, 0) NOT NULL,
	[CHARID] [varchar](47) NULL,
	[CHARTID] [decimal](10, 0) NULL,
	[LV] [decimal](3, 0) NULL,
	[EXP] [decimal](20, 0) NULL,
	[cDATE] [datetime] NULL,
 CONSTRAINT [PK_CERARIUM] PRIMARY KEY CLUSTERED 
(
	[cItemSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CERARIUM_CHARCASHITEM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CERARIUM_CHARCASHITEM](
	[cItemSEQ] [decimal](20, 0) NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[WORLD] [varchar](20) NULL,
	[ITEMSEQ] [decimal](20, 0) NOT NULL,
	[CHARID] [varchar](47) NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[STACKCOUNT] [decimal](10, 0) NULL,
	[STATUS] [decimal](5, 0) NULL,
	[POS] [varchar](64) NULL,
	[NEEDLEVEL] [decimal](3, 0) NULL,
	[OWNTIME] [datetime] NULL,
	[CONVHIST] [varchar](128) NULL,
	[DURABILITY] [decimal](20, 0) NULL,
	[FLAG] [decimal](10, 0) NULL,
	[OPT] [varchar](32) NULL,
	[INUSE] [decimal](10, 0) NULL,
	[USECOUNT] [decimal](10, 0) NULL,
	[REMAINTIME] [decimal](10, 0) NULL,
	[EXPIREDATE] [datetime] NULL,
	[MAXDUR] [decimal](20, 0) NULL,
	[SKILLPLUS] [varchar](32) NULL,
	[STAMINAREMAINTIME] [decimal](10, 0) NULL,
	[cDATE] [datetime] NULL,
 CONSTRAINT [PK_CERARIUM_CHARCASHITEM] PRIMARY KEY CLUSTERED 
(
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CERARIUM_CHARDETAIL]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CERARIUM_CHARDETAIL](
	[cItemSEQ] [decimal](20, 0) NOT NULL,
	[CHARID] [varchar](47) NULL,
	[TITLE] [varchar](32) NULL,
	[POS] [varchar](64) NULL,
	[CRIMINALSTATUS] [decimal](3, 0) NULL,
	[MURDERPOINT] [decimal](5, 0) NULL,
	[RCFTIME] [decimal](10, 0) NULL,
	[RMFTIME] [decimal](10, 0) NULL,
	[INVENMONEY] [decimal](20, 0) NULL,
	[HP] [decimal](10, 0) NULL,
	[MP] [decimal](10, 0) NULL,
	[SP] [decimal](10, 0) NULL,
	[EXP] [decimal](20, 0) NULL,
	[LV] [decimal](3, 0) NULL,
	[SKILLPOINT] [decimal](10, 0) NULL,
	[QUICKBELT] [varchar](512) NULL,
	[LATESTREGION] [decimal](3, 0) NULL,
	[FLAG] [char](256) NULL,
	[STATUS] [decimal](10, 0) NULL,
	[RESURRECTDATE] [datetime] NULL,
	[TRANSFORMDATE] [datetime] NULL,
	[CURCONNDATE] [datetime] NULL,
	[LASTVISITDATE] [datetime] NULL,
	[LASTVISITIP] [varchar](15) NULL,
	[HAIR] [decimal](10, 0) NULL,
	[FACE] [decimal](10, 0) NULL,
	[DEADTYPE] [decimal](3, 0) NULL,
	[FLAG2] [char](256) NULL,
	[FLAG3] [char](256) NULL,
	[CHARISMAPOINT] [decimal](10, 0) NULL,
	[NICKNAME] [varchar](16) NULL,
	[COOLDOWN] [varchar](512) NULL,
	[cDATE] [datetime] NULL,
	[HEROICPOINT] [decimal](20, 0) NULL,
 CONSTRAINT [PK_CERARIUM_CHARDETAIL] PRIMARY KEY CLUSTERED 
(
	[cItemSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CERARIUM_CHARITEM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CERARIUM_CHARITEM](
	[cItemSEQ] [decimal](20, 0) NOT NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[WORLD] [varchar](20) NULL,
	[ITEMSEQ] [decimal](20, 0) NOT NULL,
	[CHARID] [varchar](47) NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[STACKCOUNT] [decimal](10, 0) NULL,
	[STATUS] [decimal](5, 0) NULL,
	[POS] [varchar](64) NULL,
	[NEEDLEVEL] [decimal](3, 0) NULL,
	[OWNTIME] [datetime] NULL,
	[CONVHIST] [varchar](128) NULL,
	[DURABILITY] [decimal](20, 0) NULL,
	[FLAG] [decimal](10, 0) NULL,
	[OPT] [varchar](32) NULL,
	[INUSE] [decimal](10, 0) NULL,
	[USECOUNT] [decimal](10, 0) NULL,
	[REMAINTIME] [decimal](10, 0) NULL,
	[EXPIREDATE] [datetime] NULL,
	[MAXDUR] [decimal](20, 0) NULL,
	[SKILLPLUS] [varchar](32) NULL,
	[STAMINAREMAINTIME] [decimal](10, 0) NULL,
	[cDATE] [datetime] NULL,
 CONSTRAINT [PK_CERARIUM_CHARITEM] PRIMARY KEY CLUSTERED 
(
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CERARIUM_CHARMASTER]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CERARIUM_CHARMASTER](
	[cItemSEQ] [decimal](20, 0) NOT NULL,
	[CHARID] [varchar](47) NULL,
	[OLDCHARID] [varchar](25) NULL,
	[WORLD] [varchar](20) NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[SLOT] [decimal](3, 0) NULL,
	[CHARTID] [decimal](10, 0) NULL,
	[CREATIONDATE] [datetime] NULL,
	[cDATE] [datetime] NULL,
 CONSTRAINT [PK_CERARIUM_CHARMASTER] PRIMARY KEY CLUSTERED 
(
	[cItemSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CERARIUM_CHARQUEST]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CERARIUM_CHARQUEST](
	[cItemSEQ] [decimal](20, 0) NOT NULL,
	[CHARID] [varchar](47) NOT NULL,
	[QUESTTID] [decimal](10, 0) NOT NULL,
	[SDATE] [datetime] NULL,
	[ARG1] [decimal](10, 0) NULL,
	[ARG2] [decimal](10, 0) NULL,
	[NPCID] [varchar](16) NULL,
	[cDATE] [datetime] NULL,
 CONSTRAINT [PK_CERARIUM_CHARQUEST] PRIMARY KEY CLUSTERED 
(
	[cItemSEQ] ASC,
	[CHARID] ASC,
	[QUESTTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CERARIUM_CHARSKILL]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CERARIUM_CHARSKILL](
	[cItemSEQ] [decimal](20, 0) NOT NULL,
	[CHARID] [varchar](47) NULL,
	[SKILLSEQ] [varchar](512) NULL,
	[PRODUCT] [varchar](512) NULL,
	[cDATE] [datetime] NULL,
 CONSTRAINT [PK_CERARIUM_CHARSKILL] PRIMARY KEY CLUSTERED 
(
	[cItemSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CERARIUM_CHARTITLE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CERARIUM_CHARTITLE](
	[cItemSEQ] [decimal](20, 0) NOT NULL,
	[CharID] [varchar](47) NOT NULL,
	[mTitleTid] [decimal](20, 0) NOT NULL,
	[mIsComplete] [decimal](20, 0) NOT NULL,
	[mIsEquip] [decimal](20, 0) NOT NULL,
	[mValue1] [decimal](20, 0) NULL,
	[mValue2] [decimal](20, 0) NULL,
	[mValue3] [decimal](20, 0) NULL,
	[mValue4] [decimal](20, 0) NULL,
	[mValue5] [decimal](20, 0) NULL,
	[mDATEAccept] [datetime] NOT NULL,
	[mDATEComplete] [datetime] NULL,
	[mDATEEquip] [datetime] NULL,
	[cDATE] [datetime] NULL,
 CONSTRAINT [PK_CERARIUM_CHARTITLE] PRIMARY KEY CLUSTERED 
(
	[cItemSEQ] ASC,
	[CharID] ASC,
	[mTitleTid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CERARIUM_MAILBOX]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CERARIUM_MAILBOX](
	[cItemSEQ] [decimal](20, 0) NOT NULL,
	[MAILSEQ] [decimal](20, 0) NOT NULL,
	[TOCHARID] [varchar](47) NULL,
	[FROMCHARID] [varchar](47) NULL,
	[SUBJECT] [varchar](50) NULL,
	[CONTENTS] [varchar](2000) NULL,
	[WDATE] [datetime] NULL,
	[FLAG] [decimal](10, 0) NULL,
	[ITEMSEQ] [decimal](20, 0) NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[ITEMQTY] [decimal](10, 0) NULL,
	[cDATE] [datetime] NULL,
 CONSTRAINT [PK_CERARIUM_MAILBOX] PRIMARY KEY CLUSTERED 
(
	[cItemSEQ] ASC,
	[MAILSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHARBUDDY]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHARBUDDY](
	[CHARID] [varchar](47) NOT NULL,
	[BUDDYID] [varchar](47) NOT NULL,
	[FLAG] [decimal](10, 0) NULL,
	[MentorStatus] [decimal](2, 0) NULL,
 CONSTRAINT [PK_CHARBUDDY] PRIMARY KEY CLUSTERED 
(
	[CHARID] ASC,
	[BUDDYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHARCASHITEM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHARCASHITEM](
	[ITEMSEQ] [decimal](20, 0) NOT NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[WORLD] [varchar](20) NULL,
	[CHARID] [varchar](47) NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[STACKCOUNT] [decimal](10, 0) NULL,
	[STATUS] [decimal](5, 0) NULL,
	[POS] [varchar](64) NULL,
	[NEEDLEVEL] [decimal](3, 0) NULL,
	[OWNTIME] [datetime] NULL,
	[CONVHIST] [varchar](128) NULL,
	[DURABILITY] [decimal](10, 0) NULL,
	[MAXDUR] [decimal](10, 0) NULL,
	[FLAG] [decimal](10, 0) NULL,
	[OPT] [varchar](32) NULL,
	[INUSE] [decimal](10, 0) NULL,
	[USECOUNT] [decimal](10, 0) NULL,
	[REMAINTIME] [decimal](10, 0) NULL,
	[EXPIREDATE] [datetime] NULL,
	[SKILLPLUS] [varchar](32) NULL,
	[STAMINAREMAINTIME] [decimal](10, 0) NULL,
 CONSTRAINT [PK_CHARCASHITEM] PRIMARY KEY CLUSTERED 
(
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHARDETAIL]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHARDETAIL](
	[CHARID] [varchar](47) NOT NULL,
	[TITLE] [varchar](32) NULL,
	[POS] [varchar](64) NULL,
	[CRIMINALSTATUS] [decimal](3, 0) NULL,
	[MURDERPOINT] [decimal](5, 0) NULL,
	[RCFTIME] [decimal](10, 0) NULL,
	[RMFTIME] [decimal](10, 0) NULL,
	[INVENMONEY] [decimal](20, 0) NULL,
	[HP] [decimal](10, 0) NULL,
	[MP] [decimal](10, 0) NULL,
	[SP] [decimal](10, 0) NULL,
	[EXP] [decimal](20, 0) NULL,
	[LV] [decimal](3, 0) NULL,
	[SKILLPOINT] [decimal](10, 0) NULL,
	[QUICKBELT] [varchar](512) NULL,
	[LATESTREGION] [decimal](3, 0) NULL,
	[FLAG] [char](512) NULL,
	[FLAG2] [char](512) NULL,
	[flag3] [char](512) NULL,
	[STATUS] [decimal](10, 0) NULL,
	[RESURRECTDATE] [datetime] NULL,
	[TRANSFORMDATE] [datetime] NULL,
	[CURCONNDATE] [datetime] NULL,
	[LASTVISITDATE] [datetime] NULL,
	[LASTVISITIP] [varchar](15) NULL,
	[HAIR] [decimal](10, 0) NULL,
	[FACE] [decimal](10, 0) NULL,
	[DEADTYPE] [decimal](3, 0) NULL,
	[CHARISMAPOINT] [decimal](10, 0) NULL,
	[NICKNAME] [varchar](16) NULL,
	[COOLDOWN] [varchar](512) NULL,
	[HEROICPOINT] [decimal](20, 0) NULL,
	[BSLastKilledTime] [decimal](20, 0) NULL,
 CONSTRAINT [PK_CHARDETAIL] PRIMARY KEY CLUSTERED 
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHARITEM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHARITEM](
	[ITEMSEQ] [decimal](20, 0) NOT NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[WORLD] [varchar](20) NULL,
	[CHARID] [varchar](47) NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[STACKCOUNT] [decimal](10, 0) NULL,
	[STATUS] [decimal](5, 0) NULL,
	[POS] [varchar](64) NULL,
	[NEEDLEVEL] [decimal](3, 0) NULL,
	[OWNTIME] [datetime] NULL,
	[CONVHIST] [varchar](128) NULL,
	[DURABILITY] [decimal](10, 0) NULL,
	[MAXDUR] [decimal](10, 0) NULL,
	[FLAG] [decimal](10, 0) NULL,
	[OPT] [varchar](32) NULL,
	[INUSE] [decimal](10, 0) NULL,
	[USECOUNT] [decimal](10, 0) NULL,
	[REMAINTIME] [decimal](10, 0) NULL,
	[EXPIREDATE] [datetime] NULL,
	[SKILLPLUS] [varchar](32) NULL,
	[STAMINAREMAINTIME] [decimal](10, 0) NULL,
 CONSTRAINT [PK_CHARITEM] PRIMARY KEY CLUSTERED 
(
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHARMASTER]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHARMASTER](
	[CHARID] [varchar](47) NOT NULL,
	[OLDCHARID] [varchar](47) NULL,
	[WORLD] [varchar](20) NULL,
	[ACCOUNTID] [varchar](32) NULL,
	[SLOT] [decimal](3, 0) NULL,
	[CHARTID] [decimal](10, 0) NULL,
	[CREATIONDATE] [datetime] NULL,
 CONSTRAINT [PK_CHARMASTER] PRIMARY KEY CLUSTERED 
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHARPVP]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHARPVP](
	[CHARID] [char](50) NOT NULL,
	[TOTALWIN] [int] NULL,
	[TOTALLOSE] [int] NULL,
	[VSHUMANWIN] [int] NULL,
	[VSHUMANLOSE] [int] NULL,
	[VSORCWIN] [int] NULL,
	[VSORCLOSE] [int] NULL,
	[VSMOONELFWIN] [int] NULL,
	[VSMOONELFLOSE] [int] NULL,
	[VSSCIONWIN] [int] NULL,
	[VSSCIONLOSE] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHARQUEST]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHARQUEST](
	[CHARID] [varchar](47) NOT NULL,
	[QUESTTID] [decimal](10, 0) NOT NULL,
	[SDATE] [datetime] NULL,
	[ARG1] [decimal](10, 0) NULL,
	[ARG2] [decimal](10, 0) NULL,
	[NPCID] [varchar](32) NULL,
 CONSTRAINT [PK_CHARQUEST] PRIMARY KEY CLUSTERED 
(
	[CHARID] ASC,
	[QUESTTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHARSKILL]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHARSKILL](
	[CHARID] [varchar](47) NOT NULL,
	[SKILLSEQ] [varchar](512) NULL,
	[PRODUCT] [varchar](512) NULL,
 CONSTRAINT [PK_CHARSKILL] PRIMARY KEY CLUSTERED 
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHARSKILLEQUIP]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHARSKILLEQUIP](
	[CHARID] [varchar](47) NOT NULL,
	[SKILLTID] [decimal](10, 0) NOT NULL,
	[REMAINTIME] [decimal](10, 0) NULL,
	[EXPIREDATE] [datetime] NOT NULL,
	[SAVETYPE] [decimal](10, 0) NOT NULL,
 CONSTRAINT [PK_CHARSKILLEQUIP] PRIMARY KEY CLUSTERED 
(
	[CHARID] ASC,
	[SKILLTID] ASC,
	[EXPIREDATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHARTITLE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHARTITLE](
	[CharID] [varchar](47) NOT NULL,
	[mTitleTid] [decimal](10, 0) NOT NULL,
	[mIsComplete] [decimal](3, 0) NOT NULL,
	[mIsEquip] [decimal](3, 0) NOT NULL,
	[mValue1] [decimal](10, 0) NULL,
	[mValue2] [decimal](10, 0) NULL,
	[mValue3] [decimal](10, 0) NULL,
	[mValue4] [decimal](10, 0) NULL,
	[mValue5] [decimal](10, 0) NULL,
	[mDateAccept] [datetime] NOT NULL,
	[mDateComplete] [datetime] NULL,
	[mDateEquip] [datetime] NULL,
 CONSTRAINT [PK_CHARTITLE] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[mTitleTid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GUILDBATTLEHIST]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GUILDBATTLEHIST](
	[GUILDID] [varchar](32) NOT NULL,
	[ENEMYGUILDID] [varchar](32) NULL,
	[BATTLERESULT] [decimal](3, 0) NULL,
	[BATTLESTDATE] [datetime] NOT NULL,
	[BATTLEDURATION] [decimal](10, 0) NULL,
	[SCORE] [decimal](10, 0) NULL,
	[ENEMYSCORE] [decimal](10, 0) NULL,
 CONSTRAINT [PK_GUILDBATTLEHIST] PRIMARY KEY CLUSTERED 
(
	[GUILDID] ASC,
	[BATTLESTDATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GUILDITEM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GUILDITEM](
	[ITEMSEQ] [decimal](20, 0) NOT NULL,
	[GUILDID] [varchar](32) NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[STACKCOUNT] [decimal](10, 0) NULL,
	[STATUS] [decimal](5, 0) NULL,
	[POS] [varchar](64) NULL,
	[NEEDLEVEL] [decimal](3, 0) NULL,
	[OWNTIME] [datetime] NULL,
	[CONVHIST] [varchar](128) NULL,
	[DURABILITY] [decimal](10, 0) NULL,
	[MAXDUR] [decimal](10, 0) NULL,
	[FLAG] [decimal](10, 0) NULL,
	[OPT] [varchar](32) NULL,
	[INUSE] [decimal](10, 0) NULL,
	[USECOUNT] [decimal](10, 0) NULL,
	[REMAINTIME] [decimal](10, 0) NULL,
	[EXPIREDATE] [datetime] NULL,
	[SKILLPLUS] [varchar](32) NULL,
	[STAMINAREMAINTIME] [decimal](10, 0) NULL,
 CONSTRAINT [PK_GUILDITEM] PRIMARY KEY CLUSTERED 
(
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GUILDMASTER]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GUILDMASTER](
	[GUILDID] [varchar](32) NOT NULL,
	[GUILDTID] [decimal](10, 0) NULL,
	[GMCHARID] [varchar](47) NULL,
	[MAXMEMBER] [decimal](10, 0) NULL,
	[CREATIONDATE] [datetime] NULL,
	[UNIONID] [decimal](10, 0) NULL,
	[GUILDRANK] [decimal](10, 0) NULL,
	[PASSWORD] [varchar](12) NULL,
	[BATTLEGUILDID] [varchar](32) NULL,
	[BATTLESTDATE] [datetime] NULL,
	[BATTLEDURATION] [decimal](10, 0) NULL,
	[SCORE1] [decimal](10, 0) NULL,
	[WIN] [decimal](10, 0) NULL,
	[DRAW] [decimal](10, 0) NULL,
	[LOSE] [decimal](10, 0) NULL,
	[MARKID] [decimal](10, 0) NULL,
	[COLORID] [decimal](10, 0) NULL,
	[MONEY] [decimal](20, 0) NULL,
	[SLOT] [decimal](10, 0) NULL,
	[GUILDPOINT] [decimal](10, 0) NULL,
 CONSTRAINT [PK_GUILDMASTER] PRIMARY KEY CLUSTERED 
(
	[GUILDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GUILDMEMBER]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GUILDMEMBER](
	[CHARID] [varchar](47) NOT NULL,
	[GUILDID] [varchar](32) NULL,
	[MEMBERRANK] [decimal](5, 0) NULL,
	[JOINDATE] [datetime] NULL,
 CONSTRAINT [PK_GUILDMEMBER] PRIMARY KEY CLUSTERED 
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GUILDRELATIONSHIP]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GUILDRELATIONSHIP](
	[GUILDID] [varchar](32) NOT NULL,
	[TARGETGUILDID] [varchar](32) NOT NULL,
	[RELATION] [decimal](3, 0) NULL,
	[WDATE] [decimal](10, 0) NULL,
 CONSTRAINT [PK_GUILDRELATIONSHIP] PRIMARY KEY CLUSTERED 
(
	[GUILDID] ASC,
	[TARGETGUILDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGINSTATUS]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGINSTATUS](
	[ACCOUNTID] [varchar](20) NULL,
	[STATUS] [decimal](3, 0) NULL,
	[CHARID] [varchar](32) NULL,
	[CID] [decimal](20, 0) NULL,
	[SERVER] [varchar](40) NULL,
	[SERVERUID] [decimal](20, 0) NULL,
	[ACCOUNTLV] [decimal](2, 0) NULL,
	[NID] [decimal](20, 0) NULL,
	[LASTCHARID] [varchar](16) NULL,
	[ACCESSDATE] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LORDGUARD]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LORDGUARD](
	[CHARID] [varchar](47) NOT NULL,
	[ELECDATE] [datetime] NULL,
 CONSTRAINT [PK_LORDGUARD] PRIMARY KEY CLUSTERED 
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LORDOFGEN]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LORDOFGEN](
	[GUILDID] [varchar](32) NOT NULL,
	[CHARID] [varchar](47) NOT NULL,
	[SIEGEID] [decimal](10, 0) NULL,
	[DATEFROM] [datetime] NULL,
	[DATETO] [datetime] NULL,
 CONSTRAINT [PK_LORDOFGEN] PRIMARY KEY CLUSTERED 
(
	[GUILDID] ASC,
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MAILBOX]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAILBOX](
	[MAILSEQ] [decimal](20, 0) IDENTITY(1,1) NOT NULL,
	[TOCHARID] [varchar](47) NULL,
	[FROMCHARID] [varchar](47) NULL,
	[SUBJECT] [varchar](50) NULL,
	[CONTENTS] [varchar](2000) NULL,
	[WDATE] [datetime] NULL,
	[FLAG] [decimal](10, 0) NULL,
	[ITEMSEQ] [decimal](20, 0) NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[ITEMQTY] [decimal](10, 0) NULL,
 CONSTRAINT [PK_MAILBOX] PRIMARY KEY CLUSTERED 
(
	[MAILSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RPGWT]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RPGWT](
	[SERVERID] [varchar](16) NULL,
	[CHARTID] [decimal](10, 0) NOT NULL,
	[WDATE] [datetime] NULL,
	[CURCONN] [decimal](10, 0) NULL,
	[MAXCONN] [decimal](10, 0) NULL,
 CONSTRAINT [PK_RPGWT] PRIMARY KEY CLUSTERED 
(
	[CHARTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SALESBOARD]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALESBOARD](
	[DOCID] [decimal](20, 0) IDENTITY(1,1) NOT NULL,
	[CHARID] [varchar](47) NULL,
	[ITEMSEQ] [decimal](20, 0) NULL,
	[ITEMSEQ2] [decimal](20, 0) NULL,
	[UNITPRICE] [decimal](10, 0) NULL,
	[TOTALQTY] [decimal](5, 0) NULL,
	[WDATE] [datetime] NULL,
	[ITEMTID] [decimal](10, 0) NULL,
	[STATUS] [decimal](10, 0) NULL,
 CONSTRAINT [PK_SALESBOARD] PRIMARY KEY CLUSTERED 
(
	[DOCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SALESBOUGHT]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALESBOUGHT](
	[BUYID] [decimal](20, 0) IDENTITY(1,1) NOT NULL,
	[DOCID] [decimal](20, 0) NULL,
	[BUYCHARID] [varchar](47) NULL,
	[BUYQTY] [decimal](5, 0) NULL,
	[BUYDATE] [datetime] NULL,
	[BUYITEMSEQ] [decimal](20, 0) NULL,
 CONSTRAINT [PK_SALESBOUGHT] PRIMARY KEY CLUSTERED 
(
	[BUYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIEGE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIEGE](
	[CASTLEID] [varchar](32) NOT NULL,
	[SIEGEID] [decimal](10, 0) NOT NULL,
	[APPLYBEGINDATE] [datetime] NULL,
	[APPLYELAPSED] [decimal](10, 0) NULL,
	[SIEGEBEGINDATE] [datetime] NULL,
	[SIEGEELAPSED] [decimal](10, 0) NULL,
	[SIEGEENDDATE] [datetime] NULL,
	[PREVENDDATE] [datetime] NULL,
	[STATUS] [decimal](10, 0) NULL,
	[GUILDID] [varchar](32) NULL,
 CONSTRAINT [PK_SIEGE] PRIMARY KEY CLUSTERED 
(
	[CASTLEID] ASC,
	[SIEGEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIEGEAPPLICATION]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIEGEAPPLICATION](
	[CASTLEID] [varchar](32) NOT NULL,
	[SIEGEID] [decimal](10, 0) NOT NULL,
	[GUILDID] [varchar](32) NOT NULL,
	[SIDE] [decimal](10, 0) NULL,
	[APPLYDATE] [datetime] NULL,
	[ADOPTED] [decimal](10, 0) NULL,
 CONSTRAINT [PK_SIEGEAPPLICATION] PRIMARY KEY CLUSTERED 
(
	[CASTLEID] ASC,
	[SIEGEID] ASC,
	[GUILDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIEGEOBJECT]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIEGEOBJECT](
	[CASTLEID] [varchar](32) NOT NULL,
	[OBJECTNO] [decimal](10, 0) NOT NULL,
	[TID] [decimal](10, 0) NULL,
	[HP] [decimal](10, 0) NULL,
	[POS] [varchar](64) NULL,
	[STATUS] [decimal](10, 0) NULL,
	[SPECIALSTATUS] [decimal](10, 0) NULL,
 CONSTRAINT [PK_SIEGEOBJECT] PRIMARY KEY CLUSTERED 
(
	[CASTLEID] ASC,
	[OBJECTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblProcLog]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProcLog](
	[mNo] [int] IDENTITY(1,1) NOT NULL,
	[mDBName] [varchar](20) NULL,
	[mName] [varchar](50) NULL,
	[mParam] [varchar](4000) NULL,
	[mRegDate] [datetime] NULL,
 CONSTRAINT [PK__TblProcL__DF51C22F42E1EEFE] PRIMARY KEY CLUSTERED 
(
	[mNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WANTEDCRIMINAL]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WANTEDCRIMINAL](
	[CHARID] [varchar](47) NOT NULL,
	[BOUNTY] [decimal](20, 0) NULL,
 CONSTRAINT [PK_WANTEDCRIMINAL] PRIMARY KEY CLUSTERED 
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ACCOUNTWORLD] ([ACCOUNTID], [WORLD], [BANKMONEY], [BANKSIZE]) VALUES (N'test', N'TestWorld', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)))
GO
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-05T15:34:19.0000000' AS DateTime2), N'', N'', N'#@????', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'????', N'½A(0)≫c(0)½º(0)C    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-05T15:39:19.0000000' AS DateTime2), N'', N'', N'#@????', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'????', N'½A(0)≫c(0)½º(0)C    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'QSTACP', CAST(N'2022-05-06T15:09:25.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(2 AS Decimal(10, 0)), N'', N'', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:25:16.0000000' AS DateTime2), N'', N'', N'#@Arthian', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Arthian', N'°n(0)Ai(0)Æ®(0)AU   ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:25:16.0000000' AS DateTime2), N'', N'', N'#@Traqua', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Traqua', N'³e(0)¶o(0)μ￥(0)A    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:25:16.0000000' AS DateTime2), N'', N'', N'#@Inflame', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Inflame', N'¾Þ(0)μ¨(0)Aø(0)    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:25:16.0000000' AS DateTime2), N'', N'', N'#@Drayger', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Drayger', N'½A(0)≫c(0)½º(0)C    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:25:16.0000000' AS DateTime2), N'', N'', N'#@Rensphere', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Rensphere', N'CI(0)A×(0)??(0 ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:30:25.0000000' AS DateTime2), N'', N'', N'#@Arthian', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Arthian', N'°n(0)Ai(0)Æ®(0)AU   ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:30:25.0000000' AS DateTime2), N'', N'', N'#@Drayger', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Drayger', N'½A(0)≫c(0)½º(0)C    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:30:25.0000000' AS DateTime2), N'', N'', N'#@Inflame', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Inflame', N'¾Þ(0)μ¨(0)Aø(0)    ?', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:30:25.0000000' AS DateTime2), N'', N'', N'#@Rensphere', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Rensphere', N'CI(0)A×(0)??(0 ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:30:25.0000000' AS DateTime2), N'', N'', N'#@Traqua', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Traqua', N'³e(0)¶o(0)μ￥(0)A    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'CHDEATH', CAST(N'2022-05-07T01:48:53.0000000' AS DateTime2), N'', N'', N'', CAST(450 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', N'Monster -477272,0,-52084', CAST(0 AS Decimal(10, 0)), N'EÞ¸O ³²AU 2,0,')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'CHDEATH', CAST(N'2022-05-07T01:50:51.0000000' AS DateTime2), N'', N'', N'', CAST(450 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', N'Monster -478159,0,-52369', CAST(0 AS Decimal(10, 0)), N'EÞ¸O ³²AU 9,0,')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'CHDEATH', CAST(N'2022-05-07T01:52:15.0000000' AS DateTime2), N'', N'', N'', CAST(450 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', N'Monster -478313,0,-51898', CAST(0 AS Decimal(10, 0)), N'EÞ¸O ³²AU 3,0,')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:52:37.0000000' AS DateTime2), N'', N'', N'#@Arthian', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Arthian', N'°n(0)Ai(0)Æ®(0)AU   ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:52:37.0000000' AS DateTime2), N'', N'', N'#@Drayger', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Drayger', N'½A(0)≫c(0)½º(0)C    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:52:37.0000000' AS DateTime2), N'', N'', N'#@Inflame', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Inflame', N'¾Þ(0)μ¨(0)Aø(0)    고o', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:52:37.0000000' AS DateTime2), N'', N'', N'#@Rensphere', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Rensphere', N'CI(0)A×(0)??(0 ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:52:37.0000000' AS DateTime2), N'', N'', N'#@Traqua', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Traqua', N'³e(0)¶o(0)μ￥(0)A    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:57:37.0000000' AS DateTime2), N'', N'', N'#@Arthian', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Arthian', N'°n(0)Ai(0)Æ®(0)AU   ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:57:37.0000000' AS DateTime2), N'', N'', N'#@Drayger', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Drayger', N'½A(0)≫c(0)½º(0)C    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:57:37.0000000' AS DateTime2), N'', N'', N'#@Inflame', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Inflame', N'¾Þ(0)μ¨(0)Aø(0)    ;  ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:57:37.0000000' AS DateTime2), N'', N'', N'#@Rensphere', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Rensphere', N'CI(0)A×(0)??(0 ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T01:57:37.0000000' AS DateTime2), N'', N'', N'#@Traqua', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Traqua', N'³e(0)¶o(0)μ￥(0)A    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'CHDEATH', CAST(N'2022-05-07T02:00:08.0000000' AS DateTime2), N'', N'', N'', CAST(450 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', N'Monster -480389,0,-52703', CAST(0 AS Decimal(10, 0)), N'EÞ¸O ³²AU 9,0,')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'CHDEATH', CAST(N'2022-05-07T02:01:18.0000000' AS DateTime2), N'', N'', N'', CAST(450 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', N'Monster -475740,0,-49329', CAST(0 AS Decimal(10, 0)), N'EÞ¸O ³²AU 0,0,')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'CHDEATH', CAST(N'2022-05-07T02:02:36.0000000' AS DateTime2), N'', N'', N'', CAST(450 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', N'Monster -475443,0,-47190', CAST(0 AS Decimal(10, 0)), N'EÞ¸O ³²AU 3,0,')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T02:02:37.0000000' AS DateTime2), N'', N'', N'#@Arthian', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Arthian', N'°n(0)Ai(0)Æ®(0)AU   ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T02:02:37.0000000' AS DateTime2), N'', N'', N'#@Drayger', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Drayger', N'½A(0)≫c(0)½º(0)C    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T02:02:37.0000000' AS DateTime2), N'', N'', N'#@Inflame', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Inflame', N'¾Þ(0)μ¨(0)Aø(0)    고o', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T02:02:37.0000000' AS DateTime2), N'', N'', N'#@Rensphere', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Rensphere', N'CI(0)A×(0)??(0 ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T02:02:37.0000000' AS DateTime2), N'', N'', N'#@Traqua', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Traqua', N'³e(0)¶o(0)μ￥(0)A    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'CHDEATH', CAST(N'2022-05-07T02:02:49.0000000' AS DateTime2), N'', N'', N'', CAST(450 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', N'Monster -473853,0,-47133', CAST(0 AS Decimal(10, 0)), N'EÞ¸O ³²AU 3,0,')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'QSTCOM', CAST(N'2022-05-07T02:04:37.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(181 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(2 AS Decimal(10, 0)), N'', N'', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'SKBUY', CAST(N'2022-05-07T02:05:02.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(101 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(10, 0)), N'', N'', CAST(80 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'CHDEATH', CAST(N'2022-05-07T02:05:50.0000000' AS DateTime2), N'', N'', N'', CAST(450 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', N'Monster -476885,0,-47288', CAST(0 AS Decimal(10, 0)), N'EÞ¸O ³²AU 5,0,')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:06:00.0000000' AS DateTime2), N'', N'', N'#@Arthian', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Arthian', N'°n(0)Ai(0)Æ®(0)AU   ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:06:00.0000000' AS DateTime2), N'', N'', N'#@Drayger', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Drayger', N'½A(0)≫c(0)½º(0)C    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:06:00.0000000' AS DateTime2), N'', N'', N'#@Traqua', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Traqua', N'³e(0)¶o(0)μ￥(0)A    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:11:00.0000000' AS DateTime2), N'', N'', N'#@Arthian', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Arthian', N'°n(0)Ai(0)Æ®(0)AU   ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:11:00.0000000' AS DateTime2), N'', N'', N'#@Drayger', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Drayger', N'½A(0)≫c(0)½º(0)C    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:11:00.0000000' AS DateTime2), N'', N'', N'#@Inflame', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Inflame', N'¾Þ(0)μ¨(0)Aø(0)    쟅', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:16:00.0000000' AS DateTime2), N'', N'', N'#@Arthian', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Arthian', N'°n(0)Ai(0)Æ®(0)AU   ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:16:00.0000000' AS DateTime2), N'', N'', N'#@Drayger', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Drayger', N'½A(0)≫c(0)½º(0)C    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:16:00.0000000' AS DateTime2), N'', N'', N'#@Inflame', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Inflame', N'¾Þ(0)μ¨(0)Aø(0)    쟅', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T01:02:45.0000000' AS DateTime2), N'', N'', N'#@Traqua', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Traqua', N'³e(0)¶o(0)μ￥(0)A    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T01:07:45.0000000' AS DateTime2), N'', N'', N'#@Traqua', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Traqua', N'³e(0)¶o(0)μ￥(0)A    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:06:00.0000000' AS DateTime2), N'', N'', N'#@Inflame', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Inflame', N'¾Þ(0)μ¨(0)Aø(0)    읫9', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:11:00.0000000' AS DateTime2), N'', N'', N'#@Rensphere', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Rensphere', N'CI(0)A×(0)??(0 ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:11:00.0000000' AS DateTime2), N'', N'', N'#@Traqua', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Traqua', N'³e(0)¶o(0)μ￥(0)A    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:16:00.0000000' AS DateTime2), N'', N'', N'#@Rensphere', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Rensphere', N'CI(0)A×(0)??(0 ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:16:00.0000000' AS DateTime2), N'', N'', N'#@Traqua', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Traqua', N'³e(0)¶o(0)μ￥(0)A    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'CHDEATH', CAST(N'2022-05-08T00:56:28.0000000' AS DateTime2), N'', N'', N'', CAST(450 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', N'Monster -474921,1684,-50288', CAST(0 AS Decimal(10, 0)), N'EÞ¸O ³²AU 1,168')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T00:57:45.0000000' AS DateTime2), N'', N'', N'#@Arthian', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Arthian', N'°n(0)Ai(0)Æ®(0)AU   ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T00:57:45.0000000' AS DateTime2), N'', N'', N'#@Drayger', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Drayger', N'½A(0)≫c(0)½º(0)C    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T00:57:45.0000000' AS DateTime2), N'', N'', N'#@Inflame', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Inflame', N'¾Þ(0)μ¨(0)Aø(0)    ?', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T00:57:45.0000000' AS DateTime2), N'', N'', N'#@Rensphere', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Rensphere', N'CI(0)A×(0)??(0 ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T00:57:45.0000000' AS DateTime2), N'', N'', N'#@Traqua', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Traqua', N'³e(0)¶o(0)μ￥(0)A    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T01:02:45.0000000' AS DateTime2), N'', N'', N'#@Arthian', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Arthian', N'°n(0)Ai(0)Æ®(0)AU   ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T01:02:45.0000000' AS DateTime2), N'', N'', N'#@Drayger', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Drayger', N'½A(0)≫c(0)½º(0)C    ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T01:02:45.0000000' AS DateTime2), N'', N'', N'#@Inflame', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Inflame', N'¾Þ(0)μ¨(0)Aø(0)      ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T01:02:45.0000000' AS DateTime2), N'', N'', N'#@Rensphere', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Rensphere', N'CI(0)A×(0)??(0 ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T01:07:45.0000000' AS DateTime2), N'', N'', N'#@Arthian', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Arthian', N'°n(0)Ai(0)Æ®(0)AU   ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T01:07:45.0000000' AS DateTime2), N'', N'', N'#@Drayger', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Drayger', N'½A(0)≫c(0)½º(0)C   ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T01:07:45.0000000' AS DateTime2), N'', N'', N'#@Inflame', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Inflame', N'¾Þ(0)μ¨(0)Aø(0)    ?', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-08T01:07:45.0000000' AS DateTime2), N'', N'', N'#@Rensphere', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Rensphere', N'CI(0)A×(0)??(0 ', CAST(0 AS Decimal(10, 0)), N'')
INSERT [dbo].[ALT_ETC] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [NUMID], [STRID], [DESCR], [GHELD], [CHARID2]) VALUES (N'TAXBK', CAST(N'2022-05-07T23:06:00.0000000' AS DateTime2), N'', N'', N'#@Rensphere', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'Rensphere', N'CI(0)A×(0)??(0 ', CAST(0 AS Decimal(10, 0)), N'')
GO
INSERT [dbo].[ALT_GHELD] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [GHELD], [CHARID2]) VALUES (N'GHQSTRE', CAST(N'2022-05-07T02:04:37.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(181 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(20 AS Decimal(10, 0)), N'')
GO
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITBANKIN', CAST(N'2022-05-06T15:08:18.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(4012205060037240035 AS Decimal(20, 0)), CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), N'0:0:', N'0,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'0/0 [-480162,4703,-68778]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITBANKOUT', CAST(N'2022-05-06T15:08:21.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(4012205060037240035 AS Decimal(20, 0)), CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), N'0:0:', N'0,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'0/0 [-480162,4703,-68778]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITUSE', CAST(N'2022-05-06T15:08:30.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(4012205060037240037 AS Decimal(20, 0)), CAST(3857 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), N'0:0:', N'0,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'0/0 [-480162,4703,-68778]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITBANKIN', CAST(N'2022-05-06T15:08:47.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(4012205060037240035 AS Decimal(20, 0)), CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), N'0:0:', N'0,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'0/0 [-480162,4703,-68778]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITBANKOUT', CAST(N'2022-05-06T15:08:49.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(4012205060037240035 AS Decimal(20, 0)), CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), N'0:0:', N'0,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'0/0 [-480162,4703,-68778]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T01:48:58.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(10 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070148584497 AS Decimal(20, 0)), CAST(2906 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5429,5135,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'60/60 [-477152,4021,-52226]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T01:49:00.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(10 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070149004498 AS Decimal(20, 0)), CAST(27 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5005,5452,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'68/68 [-477152,4021,-52226]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T01:49:02.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(10 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070149024499 AS Decimal(20, 0)), CAST(486 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), N'0:0:', N'0,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'0/0 [-477389,3773,-52157]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T01:49:08.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(10 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070149084500 AS Decimal(20, 0)), CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5482,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'54/54 [-477389,3773,-52157]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T01:50:56.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(111 AS Decimal(10, 0)), CAST(19 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070150564501 AS Decimal(20, 0)), CAST(13 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'5455,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'68/68 [-478136,4896,-52407]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T01:50:57.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(111 AS Decimal(10, 0)), CAST(19 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070150574502 AS Decimal(20, 0)), CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'5061,5484,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'54/54 [-478136,4896,-52407]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T01:50:58.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(111 AS Decimal(10, 0)), CAST(19 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070150584503 AS Decimal(20, 0)), CAST(2848 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:3:', N'5069,5186,5428,5159,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'61/61 [-478136,4896,-52407]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T01:50:59.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(111 AS Decimal(10, 0)), CAST(19 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070150594504 AS Decimal(20, 0)), CAST(317 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5464,5012,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'74/74 [-478136,4896,-52407]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T01:52:17.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(19 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070152174505 AS Decimal(20, 0)), CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'5483,5061,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'54/54 [-478298,4896,-51938]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T01:52:33.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(19 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070152334506 AS Decimal(20, 0)), CAST(64 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5159,5185,5065,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'76/76 [-478298,4896,-51938]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T01:52:36.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(19 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070152364507 AS Decimal(20, 0)), CAST(12 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'5573,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'63/63 [-478298,4896,-51938]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITNPCSELL', CAST(N'2022-05-07T01:56:32.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(33 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070152364507 AS Decimal(20, 0)), CAST(12 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'5573,0,0,0,0::0,0,0', CAST(5 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'63/63 [-479414,4763,-62320]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITNPCSELL', CAST(N'2022-05-07T01:56:36.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(45 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070150584503 AS Decimal(20, 0)), CAST(2848 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:3:', N'5069,5186,5428,5159,0::0,0,0', CAST(12 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'61/61 [-479414,4763,-62320]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITNPCSELL', CAST(N'2022-05-07T01:56:39.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(95 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070149004498 AS Decimal(20, 0)), CAST(27 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5005,5452,0,0,0::0,0,0', CAST(50 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'68/68 [-479414,4763,-62320]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITNPCSELL', CAST(N'2022-05-07T01:56:42.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(100 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070150564501 AS Decimal(20, 0)), CAST(13 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'5455,0,0,0,0::0,0,0', CAST(5 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'68/68 [-479414,4763,-62320]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITNPCSELL', CAST(N'2022-05-07T01:56:44.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(105 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070152174505 AS Decimal(20, 0)), CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'5483,5061,0,0,0::0,0,0', CAST(5 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'54/54 [-479414,4763,-62320]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITNPCSELL', CAST(N'2022-05-07T01:56:46.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(110 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070149084500 AS Decimal(20, 0)), CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5482,0,0,0,0::0,0,0', CAST(5 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'54/54 [-479414,4763,-62320]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITNPCSELL', CAST(N'2022-05-07T01:56:48.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(115 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(4012205060037240034 AS Decimal(20, 0)), CAST(11 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'0,0,0,0,0::0,0,0', CAST(5 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'88/88 [-479414,4763,-62320]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITNPCSELL', CAST(N'2022-05-07T01:56:50.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(125 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070148584497 AS Decimal(20, 0)), CAST(2906 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5429,5135,0,0,0::0,0,0', CAST(10 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'60/60 [-479414,4763,-62320]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:00:10.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(107 AS Decimal(10, 0)), CAST(134 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070200104508 AS Decimal(20, 0)), CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'5062,5481,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'54/54 [-480244,3894,-52789]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:00:11.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(107 AS Decimal(10, 0)), CAST(134 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070200114509 AS Decimal(20, 0)), CAST(11 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'1:1:', N'5451,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'88/88 [-480244,3894,-52789]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:00:11.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(107 AS Decimal(10, 0)), CAST(134 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070200114510 AS Decimal(20, 0)), CAST(68 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5425,5105,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'67/67 [-480244,3894,-52789]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:01:21.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(215 AS Decimal(10, 0)), CAST(143 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070201214511 AS Decimal(20, 0)), CAST(520 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'1:1:', N'5573,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'69/69 [-475656,3402,-49331]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:01:22.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(215 AS Decimal(10, 0)), CAST(143 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070201224512 AS Decimal(20, 0)), CAST(69 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5219,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'50/50 [-475656,3402,-49331]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:01:22.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(215 AS Decimal(10, 0)), CAST(143 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070201224513 AS Decimal(20, 0)), CAST(201 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), N'0:0:', N'0,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'0/0 [-475656,3402,-49331]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:02:38.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(323 AS Decimal(10, 0)), CAST(143 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070202384514 AS Decimal(20, 0)), CAST(11 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'1:3:', N'5574,5456,5006,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'88/88 [-475448,3402,-47369]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:02:39.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(323 AS Decimal(10, 0)), CAST(143 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070202394515 AS Decimal(20, 0)), CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'5482,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'54/54 [-475448,3402,-47369]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:02:40.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(323 AS Decimal(10, 0)), CAST(143 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070202404516 AS Decimal(20, 0)), CAST(82 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5187,5427,5065,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'61/61 [-475448,3402,-47369]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:02:52.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(161 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070202524517 AS Decimal(20, 0)), CAST(8089 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'5001,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'68/68 [-473988,3402,-47163]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:02:53.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(161 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070202534518 AS Decimal(20, 0)), CAST(7525 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5513,5543,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'0/0 [-473988,3402,-47163]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:02:59.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(161 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070202594519 AS Decimal(20, 0)), CAST(2850 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5451,5245,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'40/40 [-473988,3402,-47163]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:05:53.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(113 AS Decimal(10, 0)), CAST(101 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070205534520 AS Decimal(20, 0)), CAST(69 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5218,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'50/50 [-476830,3425,-47374]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:05:54.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(113 AS Decimal(10, 0)), CAST(110 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070205544521 AS Decimal(20, 0)), CAST(2727 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'5452,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'81/81 [-476830,3425,-47374]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-07T02:05:56.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(113 AS Decimal(10, 0)), CAST(110 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205070205564522 AS Decimal(20, 0)), CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:1:', N'5063,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'54/54 [-477001,3336,-47181]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-08T00:56:38.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Uhhbro', CAST(1 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(10 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205080056384497 AS Decimal(20, 0)), CAST(19 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5009,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'93/93 [-475144,2868,-50554]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-08T00:56:38.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Uhhbro', CAST(1 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(10 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205080056384498 AS Decimal(20, 0)), CAST(2905 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5460,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'45/45 [-475144,2868,-50554]')
INSERT [dbo].[ALT_ITEM] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [ITEMSEQ], [ITEMTID], [ITEMQTY], [ITEMCONVHIST], [ITEMOPTION], [GHELD], [CHARID2], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [DESCR]) VALUES (N'ITPICK', CAST(N'2022-05-08T00:56:39.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Uhhbro', CAST(1 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(10 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(12205080056394499 AS Decimal(20, 0)), CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'0:2:', N'5061,0,0,0,0::0,0,0', CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), N'54/54 [-475144,2868,-50554]')
GO
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHGIN', CAST(N'2022-05-06T00:01:42.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Alanna', CAST(6 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHGIN', CAST(N'2022-05-06T00:24:24.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Alanna', CAST(6 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHGIN', CAST(N'2022-05-06T15:06:40.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHGIN', CAST(N'2022-05-07T01:23:52.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHGIN', CAST(N'2022-05-07T01:48:03.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHLVUP', CAST(N'2022-05-07T01:48:53.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHLVUP', CAST(N'2022-05-07T01:52:15.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(19 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(2 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHTICK', CAST(N'2022-05-07T01:57:23.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(125 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHLVUP', CAST(N'2022-05-07T02:02:49.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Testguy', CAST(96 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(152 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHGIN', CAST(N'2022-05-07T23:39:37.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Uhhbro', CAST(1 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHGOUT', CAST(N'2022-05-07T23:40:27.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Uhhbro', CAST(1 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHGIN', CAST(N'2022-05-08T00:54:12.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Uhhbro', CAST(1 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHLVUP', CAST(N'2022-05-08T00:56:28.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Uhhbro', CAST(1 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[ALT_PLAY] ([ACTCODE], [WDATE], [IPADDR], [ACCOUNTID], [CHARID], [CHARTID], [CHARLV], [CHAREXP], [GHELDINVEN], [GHELDBANK], [CHARLVFROM], [PARTYTIME], [SOLOTIME], [KILLPC], [KILLMON], [DEADBYPC], [DEADBYMON]) VALUES (N'CHGOUT', CAST(N'2022-05-08T00:56:46.0000000' AS DateTime2), N'192.168.255.1', N'test', N'Uhhbro', CAST(1 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(10 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
GO
INSERT [dbo].[AMT_ACCOUNT] ([ACCOUNTID], [PASSWORD]) VALUES (N'test', N'test')
GO
INSERT [dbo].[AMT_MASTER] ([ACCOUNTID], [EMAIL], [SOCIALNO], [CREATION_DATE], [LAST_DATE], [MODIFY_DATE], [PHONE], [MOBILE], [ZIPCODE], [ADDR1], [ADDR2], [SMS_YN], [EMAIL_YN], [PENALTY_GBN], [PAUSE_DATE], [IP], [LOGINCNT], [NOMINATOR], [RPG_LEVEL], [LONEY_AGREEYN], [LONEY_CHARGEYN], [SEX]) VALUES (N'test', N'test@test.net', N'23', CAST(N'2011-06-14T10:50:39.0000000' AS DateTime2), CAST(N'2011-06-15T10:51:34.0000000' AS DateTime2), CAST(N'2011-06-15T10:51:38.0000000' AS DateTime2), N'346346', N'436346', N'436346', N'346346', N'346346', N'N', N'N', N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[AMT_WORLDMAPPING] ([ACCOUNTID], [SECTION], [WORLD], [CHARID], [CREATIONDATE]) VALUES (N'test', N'1', N'TestWorld', N'Alanna', CAST(N'2022-05-07T02:08:26.4900000' AS DateTime2))
INSERT [dbo].[AMT_WORLDMAPPING] ([ACCOUNTID], [SECTION], [WORLD], [CHARID], [CREATIONDATE]) VALUES (N'test', N'1', N'TestWorld', N'Testguy', CAST(N'2022-05-06T00:37:24.9470000' AS DateTime2))
INSERT [dbo].[AMT_WORLDMAPPING] ([ACCOUNTID], [SECTION], [WORLD], [CHARID], [CREATIONDATE]) VALUES (N'test', N'1', N'TestWorld', N'Uhhbro', CAST(N'2022-05-08T00:54:07.6030000' AS DateTime2))
GO
INSERT [dbo].[BAKCHARDETAIL] ([CHARSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [FLAG2], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [CHARISMAPOINT], [HEROICPOINT]) VALUES (CAST(1 AS Decimal(20, 0)), N'Testbro', N'', N'0,0,0', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(120 AS Decimal(10, 0)), CAST(32 AS Decimal(10, 0)), CAST(65 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'190,193;0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(-1 AS Decimal(3, 0)), NULL, NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, NULL, NULL)
INSERT [dbo].[BAKCHARDETAIL] ([CHARSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [FLAG2], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [CHARISMAPOINT], [HEROICPOINT]) VALUES (CAST(2 AS Decimal(20, 0)), N'Alanna', N'', N'-477413,4538,-65047', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(50000000 AS Decimal(20, 0)), CAST(80 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(37 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), N'190,193;0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(255 AS Decimal(3, 0)), NULL, NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2022-05-07T02:08:01.980' AS DateTime), CAST(N'2022-05-07T02:08:11.317' AS DateTime), N'192.168.255.1', CAST(24 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)))
INSERT [dbo].[BAKCHARDETAIL] ([CHARSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [FLAG2], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [CHARISMAPOINT], [HEROICPOINT]) VALUES (CAST(3 AS Decimal(20, 0)), N'Notlost', N'', N'0,0,0', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(80 AS Decimal(10, 0)), CAST(48 AS Decimal(10, 0)), CAST(91 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), N'190,193;0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(255 AS Decimal(3, 0)), NULL, NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2022-05-07T02:38:25.293' AS DateTime), NULL, N'192.168.255.1', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)))
INSERT [dbo].[BAKCHARDETAIL] ([CHARSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [FLAG2], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [CHARISMAPOINT], [HEROICPOINT]) VALUES (CAST(4 AS Decimal(20, 0)), N'Uhhbro', N'', N'0,0,0', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(80 AS Decimal(10, 0)), CAST(48 AS Decimal(10, 0)), CAST(91 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(255 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2022-05-07T23:39:37.980' AS DateTime), CAST(N'2022-05-07T23:40:27.680' AS DateTime), N'192.168.255.1', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)))
INSERT [dbo].[BAKCHARDETAIL] ([CHARSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [FLAG2], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [CHARISMAPOINT], [HEROICPOINT]) VALUES (CAST(5 AS Decimal(20, 0)), N'Uhhbro', N'', N'0,0,0', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(80 AS Decimal(10, 0)), CAST(48 AS Decimal(10, 0)), CAST(92 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(-1 AS Decimal(3, 0)), NULL, NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, NULL, NULL)
GO
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205042309150034 AS Decimal(20, 0)), CAST(2 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(12 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, N'', CAST(63 AS Decimal(10, 0)), CAST(63 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-07T02:08:17.133' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205042309150035 AS Decimal(20, 0)), CAST(2 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-07T02:08:17.133' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205042309150036 AS Decimal(20, 0)), CAST(2 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-07T02:08:17.133' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205042309150037 AS Decimal(20, 0)), CAST(2 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-07T02:08:17.133' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205050139370034 AS Decimal(20, 0)), CAST(1 AS Decimal(20, 0)), N'test', NULL, N'Testbro', CAST(11 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, N'', CAST(88 AS Decimal(10, 0)), CAST(88 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-06T00:37:01.123' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205050139370035 AS Decimal(20, 0)), CAST(1 AS Decimal(20, 0)), N'test', NULL, N'Testbro', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-06T00:37:01.123' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205050139370036 AS Decimal(20, 0)), CAST(1 AS Decimal(20, 0)), N'test', NULL, N'Testbro', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-06T00:37:01.123' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205050139370037 AS Decimal(20, 0)), CAST(1 AS Decimal(20, 0)), N'test', NULL, N'Testbro', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-06T00:37:01.123' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205070238220034 AS Decimal(20, 0)), CAST(3 AS Decimal(20, 0)), N'test', NULL, N'Notlost', CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,1,2', NULL, NULL, N'', CAST(93 AS Decimal(10, 0)), CAST(93 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-07T23:02:04.007' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205070238220035 AS Decimal(20, 0)), CAST(3 AS Decimal(20, 0)), N'test', NULL, N'Notlost', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-07T23:02:04.007' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205070238220036 AS Decimal(20, 0)), CAST(3 AS Decimal(20, 0)), N'test', NULL, N'Notlost', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-07T23:02:04.007' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205070238220037 AS Decimal(20, 0)), CAST(3 AS Decimal(20, 0)), N'test', NULL, N'Notlost', CAST(194 AS Decimal(10, 0)), CAST(500 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-07T23:02:04.007' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205070238220038 AS Decimal(20, 0)), CAST(3 AS Decimal(20, 0)), N'test', NULL, N'Notlost', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-07T23:02:04.007' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205072339290034 AS Decimal(20, 0)), CAST(4 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,1,2', NULL, NULL, N'', CAST(93 AS Decimal(10, 0)), CAST(93 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-08T00:47:59.310' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205072339290035 AS Decimal(20, 0)), CAST(4 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-08T00:47:59.310' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205072339290036 AS Decimal(20, 0)), CAST(4 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-08T00:47:59.310' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205072339290037 AS Decimal(20, 0)), CAST(4 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(194 AS Decimal(10, 0)), CAST(500 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-08T00:47:59.310' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205072339290038 AS Decimal(20, 0)), CAST(4 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-08T00:47:59.310' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205080048220034 AS Decimal(20, 0)), CAST(5 AS Decimal(20, 0)), N'test', NULL, N'Uhhbro', CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,1,2', NULL, NULL, N'', CAST(93 AS Decimal(10, 0)), CAST(93 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-08T00:48:57.710' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205080048220035 AS Decimal(20, 0)), CAST(5 AS Decimal(20, 0)), N'test', NULL, N'Uhhbro', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-08T00:48:57.710' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205080048220036 AS Decimal(20, 0)), CAST(5 AS Decimal(20, 0)), N'test', NULL, N'Uhhbro', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-08T00:48:57.710' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205080048220037 AS Decimal(20, 0)), CAST(5 AS Decimal(20, 0)), N'test', NULL, N'Uhhbro', CAST(194 AS Decimal(10, 0)), CAST(500 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-08T00:48:57.710' AS DateTime), NULL, NULL)
INSERT [dbo].[BAKCHARITEM] ([ITEMSEQ], [CHARSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [REASON], [DELTIME], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205080048220038 AS Decimal(20, 0)), CAST(5 AS Decimal(20, 0)), N'test', NULL, N'Uhhbro', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Remove on Login Server', CAST(N'2022-05-08T00:48:57.710' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[BAKCHARMASTER] ON 

INSERT [dbo].[BAKCHARMASTER] ([CHARSEQ], [CHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [DELETIONDATE], [CHARID2], [FLAG]) VALUES (CAST(1 AS Decimal(20, 0)), N'Testbro', N'TestWorld', N'test', CAST(1 AS Decimal(3, 0)), CAST(96 AS Decimal(10, 0)), CAST(N'2022-05-03T01:39:41.040' AS DateTime), CAST(N'2022-05-06T00:37:01.120' AS DateTime), NULL, CAST(3 AS Decimal(3, 0)))
INSERT [dbo].[BAKCHARMASTER] ([CHARSEQ], [CHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [DELETIONDATE], [CHARID2], [FLAG]) VALUES (CAST(2 AS Decimal(20, 0)), N'Alanna', N'TestWorld', N'test', CAST(0 AS Decimal(3, 0)), CAST(6 AS Decimal(10, 0)), CAST(N'2022-05-04T23:09:16.003' AS DateTime), CAST(N'2022-05-07T02:08:17.127' AS DateTime), NULL, CAST(3 AS Decimal(3, 0)))
INSERT [dbo].[BAKCHARMASTER] ([CHARSEQ], [CHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [DELETIONDATE], [CHARID2], [FLAG]) VALUES (CAST(3 AS Decimal(20, 0)), N'Notlost', N'TestWorld', N'test', CAST(2 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), CAST(N'2022-05-05T02:38:22.250' AS DateTime), CAST(N'2022-05-07T23:02:04.000' AS DateTime), NULL, CAST(3 AS Decimal(3, 0)))
INSERT [dbo].[BAKCHARMASTER] ([CHARSEQ], [CHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [DELETIONDATE], [CHARID2], [FLAG]) VALUES (CAST(4 AS Decimal(20, 0)), N'Uhhbro', N'TestWorld', N'test', CAST(2 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), CAST(N'2022-05-05T23:39:29.973' AS DateTime), CAST(N'2022-05-08T00:47:59.307' AS DateTime), NULL, CAST(3 AS Decimal(3, 0)))
INSERT [dbo].[BAKCHARMASTER] ([CHARSEQ], [CHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [DELETIONDATE], [CHARID2], [FLAG]) VALUES (CAST(5 AS Decimal(20, 0)), N'Uhhbro', N'TestWorld', N'test', CAST(2 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), CAST(N'2022-05-05T00:48:24.677' AS DateTime), CAST(N'2022-05-08T00:48:57.710' AS DateTime), NULL, CAST(3 AS Decimal(3, 0)))
SET IDENTITY_INSERT [dbo].[BAKCHARMASTER] OFF
GO
INSERT [dbo].[BAKCHARSKILL] ([CHARSEQ], [CHARID], [SKILLSEQ], [PRODUCT]) VALUES (CAST(1 AS Decimal(20, 0)), N'Testbro', N'', N'')
INSERT [dbo].[BAKCHARSKILL] ([CHARSEQ], [CHARID], [SKILLSEQ], [PRODUCT]) VALUES (CAST(2 AS Decimal(20, 0)), N'Alanna', N'', N'')
INSERT [dbo].[BAKCHARSKILL] ([CHARSEQ], [CHARID], [SKILLSEQ], [PRODUCT]) VALUES (CAST(3 AS Decimal(20, 0)), N'Notlost', N'', N'')
INSERT [dbo].[BAKCHARSKILL] ([CHARSEQ], [CHARID], [SKILLSEQ], [PRODUCT]) VALUES (CAST(4 AS Decimal(20, 0)), N'Uhhbro', N'222,1:', N'')
INSERT [dbo].[BAKCHARSKILL] ([CHARSEQ], [CHARID], [SKILLSEQ], [PRODUCT]) VALUES (CAST(5 AS Decimal(20, 0)), N'Uhhbro', N'222,1:', N'')
GO
INSERT [dbo].[CASTLE] ([CASTLEID], [OWNERGUILDID], [TOTALINCOME], [LATESTTRANSFER], [LATESTMODIFY], [REGIONNAME1], [REGIONRATIO1], [REGIONINCOME1], [REGIONNAME2], [REGIONRATIO2], [REGIONINCOME2], [REGIONNAME3], [REGIONRATIO3], [REGIONINCOME3], [REGIONNAME4], [REGIONRATIO4], [REGIONINCOME4]) VALUES (N'Arthian', N'', CAST(0 AS Decimal(20, 0)), CAST(N'2012-05-07T00:01:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Golundo', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Kuhn', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Trilgard', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Zylok', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)))
INSERT [dbo].[CASTLE] ([CASTLEID], [OWNERGUILDID], [TOTALINCOME], [LATESTTRANSFER], [LATESTMODIFY], [REGIONNAME1], [REGIONRATIO1], [REGIONINCOME1], [REGIONNAME2], [REGIONRATIO2], [REGIONINCOME2], [REGIONNAME3], [REGIONRATIO3], [REGIONINCOME3], [REGIONNAME4], [REGIONRATIO4], [REGIONINCOME4]) VALUES (N'Drayger', N'', CAST(0 AS Decimal(20, 0)), CAST(N'2012-05-07T00:01:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Sienne', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Sariend', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Stull', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Halien', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)))
INSERT [dbo].[CASTLE] ([CASTLEID], [OWNERGUILDID], [TOTALINCOME], [LATESTTRANSFER], [LATESTMODIFY], [REGIONNAME1], [REGIONRATIO1], [REGIONINCOME1], [REGIONNAME2], [REGIONRATIO2], [REGIONINCOME2], [REGIONNAME3], [REGIONRATIO3], [REGIONINCOME3], [REGIONNAME4], [REGIONRATIO4], [REGIONINCOME4]) VALUES (N'Inflame', N'', CAST(0 AS Decimal(20, 0)), CAST(N'2012-05-07T00:01:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Anchorville', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Delfaras', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Tullan', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Ellore', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)))
INSERT [dbo].[CASTLE] ([CASTLEID], [OWNERGUILDID], [TOTALINCOME], [LATESTTRANSFER], [LATESTMODIFY], [REGIONNAME1], [REGIONRATIO1], [REGIONINCOME1], [REGIONNAME2], [REGIONRATIO2], [REGIONINCOME2], [REGIONNAME3], [REGIONRATIO3], [REGIONINCOME3], [REGIONNAME4], [REGIONRATIO4], [REGIONINCOME4]) VALUES (N'Rensphere', N'', CAST(0 AS Decimal(20, 0)), CAST(N'2012-05-07T00:01:01.000' AS DateTime), CAST(N'2011-09-20T15:00:01.000' AS DateTime), N'Hideback', CAST(10 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Terranoa', CAST(10 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'????', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)))
INSERT [dbo].[CASTLE] ([CASTLEID], [OWNERGUILDID], [TOTALINCOME], [LATESTTRANSFER], [LATESTMODIFY], [REGIONNAME1], [REGIONRATIO1], [REGIONINCOME1], [REGIONNAME2], [REGIONRATIO2], [REGIONINCOME2], [REGIONNAME3], [REGIONRATIO3], [REGIONINCOME3], [REGIONNAME4], [REGIONRATIO4], [REGIONINCOME4]) VALUES (N'Traqua', N'', CAST(0 AS Decimal(20, 0)), CAST(N'2012-05-07T00:01:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Norine', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Laflesia', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Deribelle', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), N'Tor Fortress', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)))
GO
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'봉인캐릭2', CAST(96 AS Decimal(10, 0)), CAST(99 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(9007199635788449 AS Decimal(20, 0)), N'봉인캐릭3', CAST(96 AS Decimal(10, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2009-05-07T13:09:25.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'얍삽', CAST(9 AS Decimal(10, 0)), CAST(99 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(9007199635788545 AS Decimal(20, 0)), N'이름변경중', CAST(377 AS Decimal(10, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2009-05-08T15:47:36.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(9007199635788546 AS Decimal(20, 0)), N'쉽덕쉽덕', CAST(1724 AS Decimal(10, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2009-05-08T15:47:40.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(9007199635788555 AS Decimal(20, 0)), N'좀나와라', CAST(377 AS Decimal(10, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2009-05-08T17:17:48.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(9007199635788556 AS Decimal(20, 0)), N'지지지지베이베', CAST(1724 AS Decimal(10, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2009-05-08T17:17:55.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(9007199635788570 AS Decimal(20, 0)), N'이제되는구나', CAST(377 AS Decimal(10, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2009-05-08T22:39:34.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(9007199635788571 AS Decimal(20, 0)), N'지연생성', CAST(1724 AS Decimal(10, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2009-05-08T22:39:38.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(9007199635788608 AS Decimal(20, 0)), N'Yeah', CAST(377 AS Decimal(10, 0)), CAST(47 AS Decimal(3, 0)), CAST(7 AS Decimal(20, 0)), CAST(N'2009-05-11T12:10:59.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'개스트', CAST(9 AS Decimal(10, 0)), CAST(99 AS Decimal(3, 0)), CAST(26896346 AS Decimal(20, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(11102101702424584 AS Decimal(20, 0)), N'Qateam5', CAST(1724 AS Decimal(10, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2011-02-10T17:03:18.330' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'시온시온', CAST(1724 AS Decimal(10, 0)), CAST(50 AS Decimal(3, 0)), CAST(5 AS Decimal(20, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(11102101734244498 AS Decimal(20, 0)), N'Bean', CAST(8 AS Decimal(10, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2011-02-10T17:34:23.950' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(11103091114444541 AS Decimal(20, 0)), N'제주감귤', CAST(460 AS Decimal(10, 0)), CAST(15 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2011-03-09T11:14:48.533' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(18014398584067646 AS Decimal(20, 0)), N'두번', CAST(377 AS Decimal(10, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2009-04-30T18:34:40.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(18014398584067659 AS Decimal(20, 0)), N'셀러드세트', CAST(377 AS Decimal(10, 0)), CAST(50 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2009-05-13T23:39:52.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(91002031045194741 AS Decimal(20, 0)), N'Sdfdff', CAST(6 AS Decimal(10, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2010-02-03T10:45:19.000' AS DateTime))
INSERT [dbo].[CERARIUM] ([cItemSEQ], [CHARID], [CHARTID], [LV], [EXP], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(96 AS Decimal(10, 0)), CAST(120 AS Decimal(3, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
GO
INSERT [dbo].[CERARIUM_CHARCASHITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635785643 AS Decimal(20, 0)), N'개스트', CAST(3911 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)), CAST(51 AS Decimal(5, 0)), N'0,0,0', NULL, CAST(N'2009-01-16T11:49:52.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARCASHITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788608 AS Decimal(20, 0)), N'anycall413', N'트렁크대박', CAST(9007199635786780 AS Decimal(20, 0)), N'Yeah', CAST(11241 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), CAST(51 AS Decimal(5, 0)), N'0,0,0', NULL, CAST(N'2009-02-26T18:36:32.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'2106-02-07T15:28:15.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-11T12:10:59.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARCASHITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788608 AS Decimal(20, 0)), N'anycall413', N'트렁크대박', CAST(9007199635786782 AS Decimal(20, 0)), N'Yeah', CAST(11166 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(51 AS Decimal(5, 0)), N'0,1,0', NULL, CAST(N'2009-02-26T18:38:53.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'2009-03-12T18:38:56.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-11T12:10:59.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARCASHITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'gg2851', N'트렁크대박', CAST(9007199635787792 AS Decimal(20, 0)), N'얍삽', CAST(7600 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(51 AS Decimal(5, 0)), N'0,0,0', NULL, CAST(N'2009-03-24T16:23:44.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'2009-03-24T16:23:49.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(9753551 AS Decimal(10, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARCASHITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788445 AS Decimal(20, 0)), N'봉인캐릭2', CAST(11405 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(51 AS Decimal(5, 0)), N'0,0,0', NULL, CAST(N'2009-05-07T13:06:26.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARCASHITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'gg2851', N'트렁크대박', CAST(9007199635788455 AS Decimal(20, 0)), N'얍삽', CAST(11405 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(51 AS Decimal(5, 0)), N'0,1,0', NULL, CAST(N'2009-05-07T16:52:18.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARCASHITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11103091114444541 AS Decimal(20, 0)), N'jkchoo', N'트렁크', CAST(11103071247334539 AS Decimal(20, 0)), N'제주감귤', CAST(4568 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(51 AS Decimal(5, 0)), N'0,0,0', NULL, CAST(N'2011-03-07T12:47:34.347' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-03-09T11:14:48.557' AS DateTime))
GO
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'봉인캐릭2', NULL, N'-477167,4545,-65846', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(49706484 AS Decimal(20, 0)), CAST(2664 AS Decimal(10, 0)), CAST(586 AS Decimal(10, 0)), CAST(1960 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(99 AS Decimal(3, 0)), CAST(100 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(9 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-05-07T12:46:39.000' AS DateTime), CAST(N'2009-05-07T13:06:36.000' AS DateTime), N'58.225.85.151', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-05-07T13:07:38.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(9007199635788449 AS Decimal(20, 0)), N'봉인캐릭3', NULL, N'-477839,4527,-67097', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(120 AS Decimal(10, 0)), CAST(32 AS Decimal(10, 0)), CAST(65 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(-1 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2009-05-07T13:09:25.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'얍삽', NULL, N'-477121,4547,-65791', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(39792000 AS Decimal(20, 0)), CAST(1980 AS Decimal(10, 0)), CAST(2277 AS Decimal(10, 0)), CAST(1507 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(99 AS Decimal(3, 0)), CAST(94 AS Decimal(10, 0)), N'190,193;2,222:2,619:2,621:2,548:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(9 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-05-07T16:38:40.000' AS DateTime), CAST(N'2009-05-07T16:53:30.000' AS DateTime), N'124.111.236.153', CAST(15 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-05-07T16:53:48.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(9007199635788545 AS Decimal(20, 0)), N'이름변경중', NULL, N'-477285,4536,-66359', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(104 AS Decimal(10, 0)), CAST(43 AS Decimal(10, 0)), CAST(70 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(9 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-05-08T05:32:40.000' AS DateTime), CAST(N'2009-05-08T05:33:43.000' AS DateTime), N'124.111.236.218', CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-05-08T15:47:36.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(9007199635788546 AS Decimal(20, 0)), N'쉽덕쉽덕', NULL, N'-476831,4566,-65927', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(80 AS Decimal(10, 0)), CAST(48 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(9 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-05-08T05:30:50.000' AS DateTime), CAST(N'2009-05-08T05:32:17.000' AS DateTime), N'124.111.236.218', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-05-08T15:47:40.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(9007199635788555 AS Decimal(20, 0)), N'좀나와라', NULL, N'516200,19082,29200', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(104 AS Decimal(10, 0)), CAST(43 AS Decimal(10, 0)), CAST(70 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(-1 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, CAST(15 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2009-05-08T17:17:48.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(9007199635788556 AS Decimal(20, 0)), N'지지지지베이베', NULL, N'-594420,22971,329053', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(80 AS Decimal(10, 0)), CAST(48 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(-1 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, CAST(10 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2009-05-08T17:17:55.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(9007199635788570 AS Decimal(20, 0)), N'이제되는구나', NULL, N'516200,19082,29200', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(104 AS Decimal(10, 0)), CAST(43 AS Decimal(10, 0)), CAST(70 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(-1 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, CAST(7 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2009-05-08T22:39:34.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(9007199635788571 AS Decimal(20, 0)), N'지연생성', NULL, N'-594420,22971,329053', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(80 AS Decimal(10, 0)), CAST(48 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(-1 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, CAST(5 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2009-05-08T22:39:38.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(9007199635788608 AS Decimal(20, 0)), N'Yeah', NULL, N'-470233,4431,-41192', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(94907 AS Decimal(20, 0)), CAST(824 AS Decimal(10, 0)), CAST(339 AS Decimal(10, 0)), CAST(705 AS Decimal(10, 0)), CAST(7 AS Decimal(20, 0)), CAST(47 AS Decimal(3, 0)), CAST(47 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(9 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-03-27T14:42:01.000' AS DateTime), CAST(N'2009-03-27T14:45:44.000' AS DateTime), N'58.225.85.151', CAST(28 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-05-11T12:10:59.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'개스트', NULL, N'227148,7202,-43903', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(84291 AS Decimal(20, 0)), CAST(1608 AS Decimal(10, 0)), CAST(1890 AS Decimal(10, 0)), CAST(1507 AS Decimal(10, 0)), CAST(26896346 AS Decimal(20, 0)), CAST(99 AS Decimal(3, 0)), CAST(120 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:78,77;', CAST(32 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-10-19T17:36:36.000' AS DateTime), CAST(N'2009-10-19T17:37:20.000' AS DateTime), N'124.111.236.168', CAST(2 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-10-19T18:15:20.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(11102101702424584 AS Decimal(20, 0)), N'Qateam5', N'', N'0,0,0', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(80 AS Decimal(10, 0)), CAST(48 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(-1 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2011-02-10T17:03:18.337' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'시온시온', N'', N'523775,17438,58139', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(207622 AS Decimal(20, 0)), CAST(1112 AS Decimal(10, 0)), CAST(382 AS Decimal(10, 0)), CAST(570 AS Decimal(10, 0)), CAST(5 AS Decimal(20, 0)), CAST(50 AS Decimal(3, 0)), CAST(51 AS Decimal(10, 0)), N'190,193;2,222:2,203:2,663:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(26 AS Decimal(3, 0)), NULL, CAST(0 AS Decimal(10, 0)), NULL, CAST(N'2011-02-09T12:28:42.970' AS DateTime), CAST(N'2011-02-10T15:52:22.107' AS DateTime), CAST(N'2011-02-10T15:52:29.760' AS DateTime), N'10.95.0.152', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), N'', N'', CAST(N'2011-02-10T17:10:08.687' AS DateTime), CAST(0 AS Decimal(20, 0)))
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(11102101734244498 AS Decimal(20, 0)), N'Bean', N'', N'133319,11716,514279', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(88 AS Decimal(10, 0)), CAST(43 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(5 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2011-02-10T15:41:02.073' AS DateTime), CAST(N'2011-02-10T15:38:23.470' AS DateTime), N'10.95.1.47', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), N'', N'', CAST(N'2011-02-10T17:34:23.950' AS DateTime), CAST(0 AS Decimal(20, 0)))
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(11103091114444541 AS Decimal(20, 0)), N'제주감귤', N'', N'515594,19096,28904', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(224 AS Decimal(10, 0)), CAST(96 AS Decimal(10, 0)), CAST(220 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(15 AS Decimal(3, 0)), CAST(15 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(26 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2011-03-08T17:16:21.157' AS DateTime), CAST(N'2011-03-08T17:49:18.987' AS DateTime), N'10.95.1.47', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), N'', N'', CAST(N'2011-03-09T11:14:48.533' AS DateTime), CAST(0 AS Decimal(20, 0)))
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(18014398584067646 AS Decimal(20, 0)), N'두번', NULL, N'516200,19082,29200', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(104 AS Decimal(10, 0)), CAST(43 AS Decimal(10, 0)), CAST(70 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(-1 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2009-04-30T18:34:40.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(18014398584067659 AS Decimal(20, 0)), N'셀러드세트', NULL, N'-475789,3382,-50755', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(1000000 AS Decimal(20, 0)), CAST(896 AS Decimal(10, 0)), CAST(366 AS Decimal(10, 0)), CAST(770 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(50 AS Decimal(3, 0)), CAST(51 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(9 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-05-12T12:05:20.000' AS DateTime), CAST(N'2009-05-12T12:24:40.000' AS DateTime), N'124.111.236.23', CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(1 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-05-13T23:39:52.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(91002031045194741 AS Decimal(20, 0)), N'Sdfdff', NULL, N'-480922,4897,-67455', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(80 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(37 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(9 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2009-11-19T17:03:46.000' AS DateTime), CAST(N'2009-11-19T17:05:26.000' AS DateTime), N'124.111.236.168', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2010-02-03T10:45:19.000' AS DateTime), NULL)
INSERT [dbo].[CERARIUM_CHARDETAIL] ([cItemSEQ], [CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [FLAG2], [FLAG3], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [cDATE], [HEROICPOINT]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'스킬리뉴얼1', NULL, N'543967,11516,773367', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(41203665 AS Decimal(20, 0)), CAST(3488 AS Decimal(10, 0)), CAST(770 AS Decimal(10, 0)), CAST(2579 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(120 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'190,6273;2,222:2,1:2,7:2,223:2,126:2,57:2,3:2,49:2,128:0,0:0,0:2,4:2,131:2,135:2,228:2,10:2,133:2,134:2,132:0,0:2,129:2,229:2,141:2,227:2,139:2,431:2,8:2,130:0,0:0,0:2,526:2,525:2,527:2,555:2,630:2,554:2,556:2,598:2,599:2,600:6,10;', CAST(9 AS Decimal(3, 0)), NULL, CAST(3 AS Decimal(10, 0)), NULL, NULL, CAST(N'2010-08-04T16:20:47.000' AS DateTime), CAST(N'2010-08-04T16:51:53.000' AS DateTime), N'10.95.0.153', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2010-08-05T15:59:23.000' AS DateTime), CAST(71 AS Decimal(20, 0)))
GO
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199254752861 AS Decimal(20, 0)), N'개스트', CAST(5536 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,1', NULL, CAST(N'2008-09-10T18:32:43.000' AS DateTime), N'0:1:', CAST(39 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(39 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199254752862 AS Decimal(20, 0)), N'개스트', CAST(5537 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,3', NULL, CAST(N'2008-09-10T18:32:45.000' AS DateTime), N'0:1:', CAST(88 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(88 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199254752863 AS Decimal(20, 0)), N'개스트', CAST(5538 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,1,1', NULL, CAST(N'2008-09-10T18:32:48.000' AS DateTime), N'0:1:', CAST(59 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(59 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199254752864 AS Decimal(20, 0)), N'개스트', CAST(5539 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,1,2', NULL, CAST(N'2008-09-10T18:32:50.000' AS DateTime), N'0:1:', CAST(78 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(78 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199254752865 AS Decimal(20, 0)), N'개스트', CAST(5540 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,2,0', NULL, CAST(N'2008-09-10T18:32:52.000' AS DateTime), N'0:1:', CAST(59 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(59 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199254752867 AS Decimal(20, 0)), N'개스트', CAST(1797 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,0', NULL, CAST(N'2008-09-10T18:35:43.000' AS DateTime), N'0:1:9055:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199254752871 AS Decimal(20, 0)), N'개스트', CAST(5673 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, CAST(N'2008-09-10T18:37:30.000' AS DateTime), N'0:5:259,259,259,259,259:', CAST(113 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'2911,2889,2779,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(113 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199254752875 AS Decimal(20, 0)), N'개스트', CAST(1797 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,1', NULL, CAST(N'2008-09-10T18:38:59.000' AS DateTime), N'0:1:9055:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'2873,2830,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788608 AS Decimal(20, 0)), N'anycall413', N'트렁크대박', CAST(9007199635787719 AS Decimal(20, 0)), N'Yeah', CAST(10347 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, CAST(N'2009-03-18T19:30:07.000' AS DateTime), N'0:0:', CAST(251981 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(252000 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-11T12:10:59.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'gg2851', N'트렁크대박', CAST(9007199635787785 AS Decimal(20, 0)), N'얍삽', CAST(4443 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,1,1', NULL, CAST(N'2009-03-24T16:21:36.000' AS DateTime), N'0:3:', CAST(90 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(90 AS Decimal(20, 0)), N'323,315,0', CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'gg2851', N'트렁크대박', CAST(9007199635787786 AS Decimal(20, 0)), N'얍삽', CAST(4445 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,1,0', NULL, CAST(N'2009-03-24T16:21:38.000' AS DateTime), N'0:2:', CAST(61 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(61 AS Decimal(20, 0)), N'380,427,0', CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'gg2851', N'트렁크대박', CAST(9007199635787787 AS Decimal(20, 0)), N'얍삽', CAST(4446 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,2,1', NULL, CAST(N'2009-03-24T16:21:39.000' AS DateTime), N'0:2:', CAST(81 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(81 AS Decimal(20, 0)), N'379,337,333', CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'gg2851', N'트렁크대박', CAST(9007199635787788 AS Decimal(20, 0)), N'얍삽', CAST(4447 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,2,0', NULL, CAST(N'2009-03-24T16:21:41.000' AS DateTime), N'0:2:', CAST(61 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(61 AS Decimal(20, 0)), N'340,434,0', CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'gg2851', N'트렁크대박', CAST(9007199635787789 AS Decimal(20, 0)), N'얍삽', CAST(4460 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,1', NULL, CAST(N'2009-03-24T16:21:44.000' AS DateTime), N'0:1:', CAST(40 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(40 AS Decimal(20, 0)), N'355,354,352', CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'gg2851', N'트렁크대박', CAST(9007199635787791 AS Decimal(20, 0)), N'얍삽', CAST(3014 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, CAST(N'2009-03-24T16:23:19.000' AS DateTime), N'0:0:', CAST(251998 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(252000 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788385 AS Decimal(20, 0)), N'봉인캐릭2', CAST(194 AS Decimal(10, 0)), CAST(600 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, CAST(N'2009-05-07T12:47:15.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788387 AS Decimal(20, 0)), N'봉인캐릭2', CAST(238 AS Decimal(10, 0)), CAST(610 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,0', NULL, CAST(N'2009-05-07T12:47:15.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788390 AS Decimal(20, 0)), N'봉인캐릭2', CAST(198 AS Decimal(10, 0)), CAST(11 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,1', NULL, CAST(N'2009-05-07T12:47:18.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788392 AS Decimal(20, 0)), N'봉인캐릭2', CAST(1048 AS Decimal(10, 0)), CAST(99 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,2', NULL, CAST(N'2009-05-07T12:47:20.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788394 AS Decimal(20, 0)), N'봉인캐릭2', CAST(1048 AS Decimal(10, 0)), CAST(11 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,3', NULL, CAST(N'2009-05-07T12:47:21.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788395 AS Decimal(20, 0)), N'봉인캐릭2', CAST(1051 AS Decimal(10, 0)), CAST(99 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,0', NULL, CAST(N'2009-05-07T12:47:21.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788397 AS Decimal(20, 0)), N'봉인캐릭2', CAST(1051 AS Decimal(10, 0)), CAST(11 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,1', NULL, CAST(N'2009-05-07T12:47:23.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788398 AS Decimal(20, 0)), N'봉인캐릭2', CAST(1049 AS Decimal(10, 0)), CAST(11 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,2', NULL, CAST(N'2009-05-07T12:47:23.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788400 AS Decimal(20, 0)), N'봉인캐릭2', CAST(191 AS Decimal(10, 0)), CAST(41 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,3', NULL, CAST(N'2009-05-07T12:47:31.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788403 AS Decimal(20, 0)), N'봉인캐릭2', CAST(4438 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,0', NULL, CAST(N'2009-05-07T12:47:32.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788404 AS Decimal(20, 0)), N'봉인캐릭2', CAST(4438 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,1', NULL, CAST(N'2009-05-07T12:47:33.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788405 AS Decimal(20, 0)), N'봉인캐릭2', CAST(654 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,2', NULL, CAST(N'2009-05-07T12:47:34.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788406 AS Decimal(20, 0)), N'봉인캐릭2', CAST(655 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,3', NULL, CAST(N'2009-05-07T12:47:34.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788407 AS Decimal(20, 0)), N'봉인캐릭2', CAST(1016 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,0', NULL, CAST(N'2009-05-07T12:47:35.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788408 AS Decimal(20, 0)), N'봉인캐릭2', CAST(3601 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,1', NULL, CAST(N'2009-05-07T12:47:36.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788409 AS Decimal(20, 0)), N'봉인캐릭2', CAST(11 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,2', NULL, CAST(N'2009-05-07T12:47:54.000' AS DateTime), N'0:1:', CAST(88 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(88 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788410 AS Decimal(20, 0)), N'봉인캐릭2', CAST(18 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,3', NULL, CAST(N'2009-05-07T12:47:54.000' AS DateTime), N'0:1:', CAST(88 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(88 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788411 AS Decimal(20, 0)), N'봉인캐릭2', CAST(31 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,1,0', NULL, CAST(N'2009-05-07T12:47:55.000' AS DateTime), N'0:1:', CAST(88 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(88 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788412 AS Decimal(20, 0)), N'봉인캐릭2', CAST(10 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,1,1', NULL, CAST(N'2009-05-07T12:47:55.000' AS DateTime), N'0:1:', CAST(81 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(81 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788413 AS Decimal(20, 0)), N'봉인캐릭2', CAST(35 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,1,2', NULL, CAST(N'2009-05-07T12:47:56.000' AS DateTime), N'0:1:', CAST(81 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(81 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788414 AS Decimal(20, 0)), N'봉인캐릭2', CAST(491 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,1,3', NULL, CAST(N'2009-05-07T12:47:56.000' AS DateTime), N'0:1:', CAST(81 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(81 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788415 AS Decimal(20, 0)), N'봉인캐릭2', CAST(4 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,2,0', NULL, CAST(N'2009-05-07T12:47:56.000' AS DateTime), N'0:1:', CAST(74 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(74 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788416 AS Decimal(20, 0)), N'봉인캐릭2', CAST(20 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,2,1', NULL, CAST(N'2009-05-07T12:47:57.000' AS DateTime), N'0:1:', CAST(74 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(74 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788417 AS Decimal(20, 0)), N'봉인캐릭2', CAST(13 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,2,2', NULL, CAST(N'2009-05-07T12:48:01.000' AS DateTime), N'0:1:', CAST(68 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788418 AS Decimal(20, 0)), N'봉인캐릭2', CAST(27 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,2,3', NULL, CAST(N'2009-05-07T12:48:01.000' AS DateTime), N'0:1:', CAST(68 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788419 AS Decimal(20, 0)), N'봉인캐릭2', CAST(524 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,3,0', NULL, CAST(N'2009-05-07T12:48:01.000' AS DateTime), N'0:1:', CAST(68 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788420 AS Decimal(20, 0)), N'봉인캐릭2', CAST(324 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,3,1', NULL, CAST(N'2009-05-07T12:48:02.000' AS DateTime), N'0:1:', CAST(63 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(63 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788421 AS Decimal(20, 0)), N'봉인캐릭2', CAST(327 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,3,2', NULL, CAST(N'2009-05-07T12:48:03.000' AS DateTime), N'0:1:', CAST(42 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(42 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788422 AS Decimal(20, 0)), N'봉인캐릭2', CAST(328 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,3,3', NULL, CAST(N'2009-05-07T12:48:03.000' AS DateTime), N'0:1:', CAST(56 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(56 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788423 AS Decimal(20, 0)), N'봉인캐릭2', CAST(329 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,0,0', NULL, CAST(N'2009-05-07T12:48:03.000' AS DateTime), N'0:1:', CAST(42 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(42 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788424 AS Decimal(20, 0)), N'봉인캐릭2', CAST(70 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,0,1', NULL, CAST(N'2009-05-07T12:48:04.000' AS DateTime), N'0:1:', CAST(63 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(63 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788425 AS Decimal(20, 0)), N'봉인캐릭2', CAST(73 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,0,2', NULL, CAST(N'2009-05-07T12:48:05.000' AS DateTime), N'0:1:', CAST(42 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(42 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788426 AS Decimal(20, 0)), N'봉인캐릭2', CAST(74 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,0,3', NULL, CAST(N'2009-05-07T12:48:05.000' AS DateTime), N'0:1:', CAST(56 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(56 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788427 AS Decimal(20, 0)), N'봉인캐릭2', CAST(75 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,1,0', NULL, CAST(N'2009-05-07T12:48:06.000' AS DateTime), N'0:1:', CAST(42 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(42 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788428 AS Decimal(20, 0)), N'봉인캐릭2', CAST(76 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,1,1', NULL, CAST(N'2009-05-07T12:48:06.000' AS DateTime), N'0:1:', CAST(63 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(63 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788429 AS Decimal(20, 0)), N'봉인캐릭2', CAST(79 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,1,2', NULL, CAST(N'2009-05-07T12:48:12.000' AS DateTime), N'0:1:', CAST(42 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(42 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788430 AS Decimal(20, 0)), N'봉인캐릭2', CAST(80 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,1,3', NULL, CAST(N'2009-05-07T12:48:12.000' AS DateTime), N'0:1:', CAST(56 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(56 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788431 AS Decimal(20, 0)), N'봉인캐릭2', CAST(81 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,2,0', NULL, CAST(N'2009-05-07T12:48:13.000' AS DateTime), N'0:1:', CAST(42 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(42 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788432 AS Decimal(20, 0)), N'봉인캐릭2', CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,2,1', NULL, CAST(N'2009-05-07T12:48:14.000' AS DateTime), N'0:1:', CAST(54 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(54 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788433 AS Decimal(20, 0)), N'봉인캐릭2', CAST(269 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,2,2', NULL, CAST(N'2009-05-07T12:48:17.000' AS DateTime), N'0:1:', CAST(54 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(54 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788434 AS Decimal(20, 0)), N'봉인캐릭2', CAST(29 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,2,3', NULL, CAST(N'2009-05-07T12:48:17.000' AS DateTime), N'0:1:', CAST(54 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(54 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788435 AS Decimal(20, 0)), N'봉인캐릭2', CAST(42 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,3,0', NULL, CAST(N'2009-05-07T12:48:18.000' AS DateTime), N'0:1:', CAST(54 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(54 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788436 AS Decimal(20, 0)), N'봉인캐릭2', CAST(23 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,3,1', NULL, CAST(N'2009-05-07T12:48:18.000' AS DateTime), N'0:1:', CAST(54 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(54 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788437 AS Decimal(20, 0)), N'봉인캐릭2', CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,3,2', NULL, CAST(N'2009-05-07T12:48:20.000' AS DateTime), N'0:1:', CAST(54 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(54 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788438 AS Decimal(20, 0)), N'봉인캐릭2', CAST(81 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,3,3', NULL, CAST(N'2009-05-07T12:48:21.000' AS DateTime), N'0:1:', CAST(42 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(42 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788439 AS Decimal(20, 0)), N'봉인캐릭2', CAST(1911 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,0,0', NULL, CAST(N'2009-05-07T12:48:27.000' AS DateTime), N'0:1:', CAST(74 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(74 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788440 AS Decimal(20, 0)), N'봉인캐릭2', CAST(494 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,0,1', NULL, CAST(N'2009-05-07T12:48:27.000' AS DateTime), N'0:1:', CAST(69 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(69 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788441 AS Decimal(20, 0)), N'봉인캐릭2', CAST(520 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,0,2', NULL, CAST(N'2009-05-07T12:48:27.000' AS DateTime), N'0:1:', CAST(69 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(69 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(9007199635788442 AS Decimal(20, 0)), N'봉인캐릭2', CAST(521 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,0,3', NULL, CAST(N'2009-05-07T12:48:28.000' AS DateTime), N'0:1:', CAST(69 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(69 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635791647 AS Decimal(20, 0)), N'개스트', CAST(7560 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,1,0', NULL, CAST(N'2009-08-14T15:47:43.000' AS DateTime), N'0:5:6254,9047:', CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'353,434,335', CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635792157 AS Decimal(20, 0)), N'개스트', CAST(4625 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,1,3', NULL, CAST(N'2009-09-08T14:36:32.000' AS DateTime), N'0:1:', CAST(49999 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(50000 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793188 AS Decimal(20, 0)), N'개스트', CAST(3616 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, CAST(N'2009-09-15T17:46:25.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793189 AS Decimal(20, 0)), N'개스트', CAST(6076 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,0', NULL, CAST(N'2009-09-15T17:46:26.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'3211,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793190 AS Decimal(20, 0)), N'개스트', CAST(472 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,1', NULL, CAST(N'2009-09-15T17:46:27.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'104,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793191 AS Decimal(20, 0)), N'개스트', CAST(9345 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,2', NULL, CAST(N'2009-09-15T17:46:32.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793192 AS Decimal(20, 0)), N'개스트', CAST(9999 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,3', NULL, CAST(N'2009-09-15T17:46:33.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793193 AS Decimal(20, 0)), N'개스트', CAST(1867 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,0', NULL, CAST(N'2009-09-15T17:46:34.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'3196,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793194 AS Decimal(20, 0)), N'개스트', CAST(259 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,1', NULL, CAST(N'2009-09-15T17:46:35.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793195 AS Decimal(20, 0)), N'개스트', CAST(610 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,2', NULL, CAST(N'2009-09-15T17:46:55.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'3244,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793196 AS Decimal(20, 0)), N'개스트', CAST(1877 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,3', NULL, CAST(N'2009-09-15T17:46:56.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'3202,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793197 AS Decimal(20, 0)), N'개스트', CAST(9341 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,0', NULL, CAST(N'2009-09-15T17:46:57.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793198 AS Decimal(20, 0)), N'개스트', CAST(486 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,1', NULL, CAST(N'2009-09-15T17:46:57.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793199 AS Decimal(20, 0)), N'개스트', CAST(267 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,2', NULL, CAST(N'2009-09-15T17:46:59.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635793200 AS Decimal(20, 0)), N'개스트', CAST(263 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,3', NULL, CAST(N'2009-09-15T17:47:05.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(9007199635795841 AS Decimal(20, 0)), N'개스트', CAST(20003 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,0,0', NULL, CAST(N'2009-09-30T18:41:29.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'3253,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081106524503 AS Decimal(20, 0)), N'시온시온', CAST(654 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,0', NULL, CAST(N'2011-02-08T11:07:28.750' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081106554504 AS Decimal(20, 0)), N'시온시온', CAST(655 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,1', NULL, CAST(N'2011-02-08T11:07:31.427' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081107004505 AS Decimal(20, 0)), N'시온시온', CAST(1016 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,2', NULL, CAST(N'2011-02-08T11:07:36.547' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081135154588 AS Decimal(20, 0)), N'시온시온', CAST(4921 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,0,1', NULL, CAST(N'2011-02-08T11:35:34.993' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081135354591 AS Decimal(20, 0)), N'시온시온', CAST(4945 AS Decimal(10, 0)), CAST(6 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,0,3', NULL, CAST(N'2011-02-08T11:35:55.733' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081135454592 AS Decimal(20, 0)), N'시온시온', CAST(4969 AS Decimal(10, 0)), CAST(14 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,1,0', NULL, CAST(N'2011-02-08T11:36:05.440' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081140294593 AS Decimal(20, 0)), N'시온시온', CAST(1120 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,1,1', NULL, CAST(N'2011-02-08T11:40:49.210' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081140494594 AS Decimal(20, 0)), N'시온시온', CAST(1122 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,1,2', NULL, CAST(N'2011-02-08T11:41:09.547' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081141064595 AS Decimal(20, 0)), N'시온시온', CAST(2071 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,1,3', NULL, CAST(N'2011-02-08T11:41:25.900' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081141244598 AS Decimal(20, 0)), N'시온시온', CAST(2073 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,2,0', NULL, CAST(N'2011-02-08T11:41:44.597' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081200074605 AS Decimal(20, 0)), N'시온시온', CAST(4940 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,3,0', NULL, CAST(N'2011-02-08T12:00:27.627' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081200554613 AS Decimal(20, 0)), N'시온시온', CAST(628 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,3,1', NULL, CAST(N'2011-02-08T12:01:15.440' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081212474614 AS Decimal(20, 0)), N'시온시온', CAST(4970 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,3,0', NULL, CAST(N'2011-02-08T12:13:07.293' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081212514615 AS Decimal(20, 0)), N'시온시온', CAST(640 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,3,1', NULL, CAST(N'2011-02-08T12:13:11.693' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081212574616 AS Decimal(20, 0)), N'시온시온', CAST(622 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,2,3', NULL, CAST(N'2011-02-08T12:13:17.383' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081213054617 AS Decimal(20, 0)), N'시온시온', CAST(4961 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,1,3', NULL, CAST(N'2011-02-08T12:13:24.890' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081213094618 AS Decimal(20, 0)), N'시온시온', CAST(4952 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,1,0', NULL, CAST(N'2011-02-08T12:13:29.020' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081213164619 AS Decimal(20, 0)), N'시온시온', CAST(634 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,1,1', NULL, CAST(N'2011-02-08T12:13:36.247' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081213254620 AS Decimal(20, 0)), N'시온시온', CAST(626 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,1,2', NULL, CAST(N'2011-02-08T12:13:45.480' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081213384622 AS Decimal(20, 0)), N'시온시온', CAST(639 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,2,0', NULL, CAST(N'2011-02-08T12:13:57.970' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
GO
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081213424623 AS Decimal(20, 0)), N'시온시온', CAST(625 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,2,1', NULL, CAST(N'2011-02-08T12:14:02.047' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081444334632 AS Decimal(20, 0)), N'시온시온', CAST(645 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,2,2', NULL, CAST(N'2011-02-08T14:44:53.487' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081444474633 AS Decimal(20, 0)), N'시온시온', CAST(647 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,3,3', NULL, CAST(N'2011-02-08T14:45:07.450' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081451284637 AS Decimal(20, 0)), N'시온시온', CAST(1011 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,3,2', NULL, CAST(N'2011-02-08T14:51:48.133' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081506554642 AS Decimal(20, 0)), N'시온시온', CAST(4949 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,2,0', NULL, CAST(N'2011-02-08T15:07:31.460' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081507044643 AS Decimal(20, 0)), N'시온시온', CAST(4973 AS Decimal(10, 0)), CAST(6 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,0,3', NULL, CAST(N'2011-02-08T15:07:39.843' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081508214648 AS Decimal(20, 0)), N'시온시온', CAST(1117 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,3,1', NULL, CAST(N'2011-02-08T15:08:57.233' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081601294674 AS Decimal(20, 0)), N'시온시온', CAST(636 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,2,1', NULL, CAST(N'2011-02-08T16:02:05.360' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081601354675 AS Decimal(20, 0)), N'시온시온', CAST(627 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,2,3', NULL, CAST(N'2011-02-08T16:02:11.093' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081627454684 AS Decimal(20, 0)), N'시온시온', CAST(4926 AS Decimal(10, 0)), CAST(40 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,3,2', NULL, CAST(N'2011-02-08T16:28:21.157' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081627484685 AS Decimal(20, 0)), N'시온시온', CAST(4947 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,3,3', NULL, CAST(N'2011-02-08T16:28:23.973' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081627514686 AS Decimal(20, 0)), N'시온시온', CAST(4974 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,0,0', NULL, CAST(N'2011-02-08T16:28:27.177' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081628044690 AS Decimal(20, 0)), N'시온시온', CAST(4962 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,2,1', NULL, CAST(N'2011-02-08T16:28:40.227' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081628094691 AS Decimal(20, 0)), N'시온시온', CAST(4941 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,2,2', NULL, CAST(N'2011-02-08T16:28:44.727' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081628114692 AS Decimal(20, 0)), N'시온시온', CAST(4932 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'3,2,3', NULL, CAST(N'2011-02-08T16:28:47.520' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081719004729 AS Decimal(20, 0)), N'시온시온', CAST(4966 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, CAST(N'2011-02-08T17:19:35.957' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081719504731 AS Decimal(20, 0)), N'시온시온', CAST(4960 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, CAST(N'2011-02-08T17:20:26.610' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081720344734 AS Decimal(20, 0)), N'시온시온', CAST(4927 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, CAST(N'2011-02-08T17:21:10.167' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102081721264735 AS Decimal(20, 0)), N'시온시온', CAST(1126 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,2,2', NULL, CAST(N'2011-02-08T17:22:02.540' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091045294750 AS Decimal(20, 0)), N'시온시온', CAST(4963 AS Decimal(10, 0)), CAST(6 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,3', NULL, CAST(N'2011-02-09T10:46:05.467' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091045384751 AS Decimal(20, 0)), N'시온시온', CAST(4930 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,0', NULL, CAST(N'2011-02-09T10:46:14.403' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091053094763 AS Decimal(20, 0)), N'시온시온', CAST(4933 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,1', NULL, CAST(N'2011-02-09T10:53:45.607' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091053164764 AS Decimal(20, 0)), N'시온시온', CAST(4972 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,2', NULL, CAST(N'2011-02-09T10:53:52.133' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091058024769 AS Decimal(20, 0)), N'시온시온', CAST(4939 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,3', NULL, CAST(N'2011-02-09T10:58:38.593' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091058144771 AS Decimal(20, 0)), N'시온시온', CAST(4957 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,2', NULL, CAST(N'2011-02-09T10:58:49.700' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091109204778 AS Decimal(20, 0)), N'시온시온', CAST(4946 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,3', NULL, CAST(N'2011-02-09T11:09:56.530' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091109304780 AS Decimal(20, 0)), N'시온시온', CAST(4943 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,0', NULL, CAST(N'2011-02-09T11:10:06.210' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091116144788 AS Decimal(20, 0)), N'시온시온', CAST(4958 AS Decimal(10, 0)), CAST(6 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,1', NULL, CAST(N'2011-02-09T11:16:50.337' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091116214789 AS Decimal(20, 0)), N'시온시온', CAST(4937 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,2', NULL, CAST(N'2011-02-09T11:16:56.800' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091124134795 AS Decimal(20, 0)), N'시온시온', CAST(405 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,3', NULL, CAST(N'2011-02-09T11:24:48.943' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091124234796 AS Decimal(20, 0)), N'시온시온', CAST(1092 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,0,0', NULL, CAST(N'2011-02-09T11:24:58.780' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091124374797 AS Decimal(20, 0)), N'시온시온', CAST(2689 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,0,1', NULL, CAST(N'2011-02-09T11:25:12.923' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091146214801 AS Decimal(20, 0)), N'시온시온', CAST(406 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,0,2', NULL, CAST(N'2011-02-09T11:46:56.890' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091208594802 AS Decimal(20, 0)), N'시온시온', CAST(2687 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,1,0', NULL, CAST(N'2011-02-09T12:09:34.940' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091218544803 AS Decimal(20, 0)), N'시온시온', CAST(1032 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,1,1', NULL, CAST(N'2011-02-09T12:19:30.270' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091219234804 AS Decimal(20, 0)), N'시온시온', CAST(1029 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,1,2', NULL, CAST(N'2011-02-09T12:19:59.100' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(11102091227404805 AS Decimal(20, 0)), N'시온시온', CAST(2686 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,0', NULL, CAST(N'2011-02-09T12:28:15.707' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(91007141734044601 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(23 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,2', NULL, CAST(N'2010-07-14T17:34:04.000' AS DateTime), N'0:1:', CAST(54 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(54 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(91007141734054602 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(81 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,2,0', NULL, CAST(N'2010-07-14T17:34:06.000' AS DateTime), N'0:1:', CAST(42 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(42 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(91007141734074603 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(80 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,2,1', NULL, CAST(N'2010-07-14T17:34:07.000' AS DateTime), N'0:1:', CAST(56 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(56 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(91007141734084604 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(79 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,1,0', NULL, CAST(N'2010-07-14T17:34:08.000' AS DateTime), N'0:1:', CAST(42 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(42 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(91007141734094605 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(76 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,1,1', NULL, CAST(N'2010-07-14T17:34:09.000' AS DateTime), N'0:1:', CAST(63 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(63 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(91007141734134606 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(521 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,0', NULL, CAST(N'2010-07-14T17:34:13.000' AS DateTime), N'0:1:', CAST(69 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(69 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(91007141734164607 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(524 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,0', NULL, CAST(N'2010-07-14T17:34:16.000' AS DateTime), N'0:1:', CAST(68 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(91007141734184608 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(20 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,1', NULL, CAST(N'2010-07-14T17:34:18.000' AS DateTime), N'0:1:', CAST(74 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(74 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(91007141734204609 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(4 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, CAST(N'2010-07-14T17:34:21.000' AS DateTime), N'0:1:', CAST(74 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(74 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(91007141736044610 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(6273 AS Decimal(10, 0)), CAST(45 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, CAST(N'2010-07-14T17:36:05.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(91007141736134615 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(6275 AS Decimal(10, 0)), CAST(50 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,1', NULL, CAST(N'2010-07-14T17:36:13.000' AS DateTime), N'0:0:', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(3611886901151158137 AS Decimal(20, 0)), N'개스트', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'gastmichael', N'트렁크대박', CAST(3611886901151158138 AS Decimal(20, 0)), N'개스트', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788608 AS Decimal(20, 0)), N'anycall413', N'트렁크대박', CAST(3611886901151164224 AS Decimal(20, 0)), N'Yeah', CAST(4920 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(92 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(93 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-11T12:10:59.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788608 AS Decimal(20, 0)), N'anycall413', N'트렁크대박', CAST(3611886901151164225 AS Decimal(20, 0)), N'Yeah', CAST(5558 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,1,2', NULL, NULL, NULL, CAST(58 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(59 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-11T12:10:59.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788608 AS Decimal(20, 0)), N'anycall413', N'트렁크대박', CAST(3611886901151164226 AS Decimal(20, 0)), N'Yeah', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-11T12:10:59.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788608 AS Decimal(20, 0)), N'anycall413', N'트렁크대박', CAST(3611886901151164227 AS Decimal(20, 0)), N'Yeah', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-11T12:10:59.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788608 AS Decimal(20, 0)), N'anycall413', N'트렁크대박', CAST(3611886901151164228 AS Decimal(20, 0)), N'Yeah', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-11T12:10:59.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'gg2851', N'트렁크대박', CAST(3611886901151164550 AS Decimal(20, 0)), N'얍삽', CAST(2711 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(71 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(71 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'gg2851', N'트렁크대박', CAST(3611886901151164551 AS Decimal(20, 0)), N'얍삽', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'gg2851', N'트렁크대박', CAST(3611886901151164552 AS Decimal(20, 0)), N'얍삽', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'gg2851', N'트렁크대박', CAST(3611886901151164553 AS Decimal(20, 0)), N'얍삽', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(3611886901151165010 AS Decimal(20, 0)), N'봉인캐릭2', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(52 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(3611886901151165052 AS Decimal(20, 0)), N'봉인캐릭2', CAST(11 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(88 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(88 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(3611886901151165053 AS Decimal(20, 0)), N'봉인캐릭2', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(3611886901151165054 AS Decimal(20, 0)), N'봉인캐릭2', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'acadmin015', N'트렁크대박', CAST(3611886901151165055 AS Decimal(20, 0)), N'봉인캐릭2', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788449 AS Decimal(20, 0)), N'acadmin015', NULL, CAST(3611886901151165056 AS Decimal(20, 0)), N'봉인캐릭3', CAST(11 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(88 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(88 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:09:25.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788449 AS Decimal(20, 0)), N'acadmin015', NULL, CAST(3611886901151165057 AS Decimal(20, 0)), N'봉인캐릭3', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:09:25.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788449 AS Decimal(20, 0)), N'acadmin015', NULL, CAST(3611886901151165058 AS Decimal(20, 0)), N'봉인캐릭3', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:09:25.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788449 AS Decimal(20, 0)), N'acadmin015', NULL, CAST(3611886901151165059 AS Decimal(20, 0)), N'봉인캐릭3', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-07T13:09:25.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788546 AS Decimal(20, 0)), N'somedail', N'트렁크대박', CAST(3611886901151165124 AS Decimal(20, 0)), N'쉽덕쉽덕', CAST(7830 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(68 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T15:47:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788546 AS Decimal(20, 0)), N'somedail', N'트렁크대박', CAST(3611886901151165125 AS Decimal(20, 0)), N'쉽덕쉽덕', CAST(7968 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(68 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T15:47:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788546 AS Decimal(20, 0)), N'somedail', N'트렁크대박', CAST(3611886901151165126 AS Decimal(20, 0)), N'쉽덕쉽덕', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T15:47:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788546 AS Decimal(20, 0)), N'somedail', N'트렁크대박', CAST(3611886901151165127 AS Decimal(20, 0)), N'쉽덕쉽덕', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T15:47:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788546 AS Decimal(20, 0)), N'somedail', N'트렁크대박', CAST(3611886901151165128 AS Decimal(20, 0)), N'쉽덕쉽덕', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T15:47:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788545 AS Decimal(20, 0)), N'somedail', N'트렁크대박', CAST(3611886901151165129 AS Decimal(20, 0)), N'이름변경중', CAST(4920 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(93 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(93 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T15:47:36.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788545 AS Decimal(20, 0)), N'somedail', N'트렁크대박', CAST(3611886901151165130 AS Decimal(20, 0)), N'이름변경중', CAST(5558 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(59 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(59 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T15:47:36.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788545 AS Decimal(20, 0)), N'somedail', N'트렁크대박', CAST(3611886901151165131 AS Decimal(20, 0)), N'이름변경중', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T15:47:36.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788545 AS Decimal(20, 0)), N'somedail', N'트렁크대박', CAST(3611886901151165132 AS Decimal(20, 0)), N'이름변경중', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T15:47:36.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788545 AS Decimal(20, 0)), N'somedail', N'트렁크대박', CAST(3611886901151165133 AS Decimal(20, 0)), N'이름변경중', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T15:47:36.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(18014398584067659 AS Decimal(20, 0)), N'arycoatd', N'울프라이프', CAST(3611886901151165268 AS Decimal(20, 0)), N'셀러드세트', CAST(4920 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(93 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(93 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-13T23:39:52.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(18014398584067659 AS Decimal(20, 0)), N'arycoatd', N'울프라이프', CAST(3611886901151165269 AS Decimal(20, 0)), N'셀러드세트', CAST(5558 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(59 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(59 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-13T23:39:52.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(18014398584067659 AS Decimal(20, 0)), N'arycoatd', N'울프라이프', CAST(3611886901151165270 AS Decimal(20, 0)), N'셀러드세트', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-13T23:39:52.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(18014398584067659 AS Decimal(20, 0)), N'arycoatd', N'울프라이프', CAST(3611886901151165271 AS Decimal(20, 0)), N'셀러드세트', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-13T23:39:52.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(18014398584067659 AS Decimal(20, 0)), N'arycoatd', N'울프라이프', CAST(3611886901151165272 AS Decimal(20, 0)), N'셀러드세트', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-13T23:39:52.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788555 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165273 AS Decimal(20, 0)), N'좀나와라', CAST(4920 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(93 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(93 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T17:17:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788555 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165274 AS Decimal(20, 0)), N'좀나와라', CAST(5558 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(59 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(59 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T17:17:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788555 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165275 AS Decimal(20, 0)), N'좀나와라', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T17:17:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788555 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165276 AS Decimal(20, 0)), N'좀나와라', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T17:17:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788555 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165277 AS Decimal(20, 0)), N'좀나와라', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T17:17:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788556 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165278 AS Decimal(20, 0)), N'지지지지베이베', CAST(7830 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(68 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T17:17:55.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788556 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165279 AS Decimal(20, 0)), N'지지지지베이베', CAST(7968 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(68 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T17:17:55.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788556 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165280 AS Decimal(20, 0)), N'지지지지베이베', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T17:17:55.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788556 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165281 AS Decimal(20, 0)), N'지지지지베이베', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T17:17:55.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788556 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165282 AS Decimal(20, 0)), N'지지지지베이베', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T17:17:55.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788571 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165283 AS Decimal(20, 0)), N'지연생성', CAST(7830 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(68 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T22:39:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788571 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165284 AS Decimal(20, 0)), N'지연생성', CAST(7968 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(68 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T22:39:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788571 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165285 AS Decimal(20, 0)), N'지연생성', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T22:39:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788571 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165286 AS Decimal(20, 0)), N'지연생성', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T22:39:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788571 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165287 AS Decimal(20, 0)), N'지연생성', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T22:39:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788570 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165288 AS Decimal(20, 0)), N'이제되는구나', CAST(4920 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(93 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(93 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T22:39:34.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788570 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165289 AS Decimal(20, 0)), N'이제되는구나', CAST(5558 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(59 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(59 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T22:39:34.000' AS DateTime))
GO
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788570 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165290 AS Decimal(20, 0)), N'이제되는구나', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T22:39:34.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788570 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165291 AS Decimal(20, 0)), N'이제되는구나', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T22:39:34.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(9007199635788570 AS Decimal(20, 0)), N'somedail', NULL, CAST(3611886901151165292 AS Decimal(20, 0)), N'이제되는구나', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-05-08T22:39:34.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(18014398584067646 AS Decimal(20, 0)), N'arycoatd', NULL, CAST(3620894100405879142 AS Decimal(20, 0)), N'두번', CAST(4920 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(93 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(93 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-04-30T18:34:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(18014398584067646 AS Decimal(20, 0)), N'arycoatd', NULL, CAST(3620894100405879143 AS Decimal(20, 0)), N'두번', CAST(5558 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(59 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(59 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-04-30T18:34:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(18014398584067646 AS Decimal(20, 0)), N'arycoatd', NULL, CAST(3620894100405879144 AS Decimal(20, 0)), N'두번', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-04-30T18:34:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(18014398584067646 AS Decimal(20, 0)), N'arycoatd', NULL, CAST(3620894100405879145 AS Decimal(20, 0)), N'두번', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-04-30T18:34:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(18014398584067646 AS Decimal(20, 0)), N'arycoatd', NULL, CAST(3620894100405879146 AS Decimal(20, 0)), N'두번', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2009-04-30T18:34:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91002031045194741 AS Decimal(20, 0)), N'absenty', N'트렁크대박', CAST(4010911191703340046 AS Decimal(20, 0)), N'Sdfdff', CAST(12 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(63 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(63 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-02-03T10:45:19.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91002031045194741 AS Decimal(20, 0)), N'absenty', N'트렁크대박', CAST(4010911191703340047 AS Decimal(20, 0)), N'Sdfdff', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-02-03T10:45:19.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91002031045194741 AS Decimal(20, 0)), N'absenty', N'트렁크대박', CAST(4010911191703340048 AS Decimal(20, 0)), N'Sdfdff', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-02-03T10:45:19.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91002031045194741 AS Decimal(20, 0)), N'absenty', N'트렁크대박', CAST(4010911191703340049 AS Decimal(20, 0)), N'Sdfdff', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-02-03T10:45:19.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(4011007141653110034 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(11 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,3', NULL, NULL, NULL, CAST(88 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(88 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(4011007141653110035 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(4011007141653110036 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'acadmin029', N'트렁크대박', CAST(4011007141653110037 AS Decimal(20, 0)), N'스킬리뉴얼1', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, NULL, CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(4011102071420240039 AS Decimal(20, 0)), N'시온시온', CAST(7830 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,1', NULL, CAST(N'2011-02-07T14:21:00.990' AS DateTime), N'0:1:20003:', CAST(65 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(4011102071420240040 AS Decimal(20, 0)), N'시온시온', CAST(7968 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'2,1,3', NULL, CAST(N'2011-02-07T14:21:01.003' AS DateTime), N'0:1:20003:', CAST(67 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'lagz80', N'트렁크', CAST(4011102071420240043 AS Decimal(20, 0)), N'시온시온', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, CAST(N'2011-02-07T14:21:01.023' AS DateTime), N'', CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101702424584 AS Decimal(20, 0)), N'ruefulsoul', NULL, CAST(4011102081800410064 AS Decimal(20, 0)), N'Qateam5', CAST(7830 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, CAST(N'2011-02-08T18:01:17.383' AS DateTime), N'', CAST(68 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:03:18.340' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101702424584 AS Decimal(20, 0)), N'ruefulsoul', NULL, CAST(4011102081800410065 AS Decimal(20, 0)), N'Qateam5', CAST(7968 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, CAST(N'2011-02-08T18:01:17.383' AS DateTime), N'', CAST(68 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(68 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:03:18.340' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101702424584 AS Decimal(20, 0)), N'ruefulsoul', NULL, CAST(4011102081800410066 AS Decimal(20, 0)), N'Qateam5', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, CAST(N'2011-02-08T18:01:17.387' AS DateTime), N'', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:03:18.340' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101702424584 AS Decimal(20, 0)), N'ruefulsoul', NULL, CAST(4011102081800410067 AS Decimal(20, 0)), N'Qateam5', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, CAST(N'2011-02-08T18:01:17.390' AS DateTime), N'', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:03:18.340' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101702424584 AS Decimal(20, 0)), N'ruefulsoul', NULL, CAST(4011102081800410068 AS Decimal(20, 0)), N'Qateam5', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, CAST(N'2011-02-08T18:01:17.390' AS DateTime), N'', CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), NULL, CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:03:18.340' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101734244498 AS Decimal(20, 0)), N'jkchoo', N'트렁크', CAST(4011102101519080038 AS Decimal(20, 0)), N'Bean', CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,1,2', NULL, CAST(N'2011-02-10T15:19:43.970' AS DateTime), N'', CAST(93 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(93 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:34:23.950' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101734244498 AS Decimal(20, 0)), N'jkchoo', N'트렁크', CAST(4011102101519080039 AS Decimal(20, 0)), N'Bean', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, CAST(N'2011-02-10T15:19:43.977' AS DateTime), N'', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:34:23.950' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101734244498 AS Decimal(20, 0)), N'jkchoo', N'트렁크', CAST(4011102101519080040 AS Decimal(20, 0)), N'Bean', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, CAST(N'2011-02-10T15:19:43.983' AS DateTime), N'', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:34:23.950' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101734244498 AS Decimal(20, 0)), N'jkchoo', N'트렁크', CAST(4011102101519080041 AS Decimal(20, 0)), N'Bean', CAST(194 AS Decimal(10, 0)), CAST(500 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, CAST(N'2011-02-10T15:19:43.987' AS DateTime), N'', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:34:23.950' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11102101734244498 AS Decimal(20, 0)), N'jkchoo', N'트렁크', CAST(4011102101519080042 AS Decimal(20, 0)), N'Bean', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, CAST(N'2011-02-10T15:19:43.990' AS DateTime), N'', CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-02-10T17:34:23.950' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11103091114444541 AS Decimal(20, 0)), N'jkchoo', N'트렁크', CAST(4011103071245310034 AS Decimal(20, 0)), N'제주감귤', CAST(2727 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, CAST(N'2011-03-07T12:45:32.813' AS DateTime), N'', CAST(81 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(81 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-03-09T11:14:48.533' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11103091114444541 AS Decimal(20, 0)), N'jkchoo', N'트렁크', CAST(4011103071245310035 AS Decimal(20, 0)), N'제주감귤', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, CAST(N'2011-03-07T12:45:32.830' AS DateTime), N'', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-03-09T11:14:48.533' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11103091114444541 AS Decimal(20, 0)), N'jkchoo', N'트렁크', CAST(4011103071245310036 AS Decimal(20, 0)), N'제주감귤', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, CAST(N'2011-03-07T12:45:32.833' AS DateTime), N'', CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-03-09T11:14:48.533' AS DateTime))
INSERT [dbo].[CERARIUM_CHARITEM] ([cItemSEQ], [ACCOUNTID], [WORLD], [ITEMSEQ], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [MAXDUR], [SKILLPLUS], [STAMINAREMAINTIME], [cDATE]) VALUES (CAST(11103091114444541 AS Decimal(20, 0)), N'jkchoo', N'트렁크', CAST(4011103071245310037 AS Decimal(20, 0)), N'제주감귤', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, CAST(N'2011-03-07T12:45:32.837' AS DateTime), N'', CAST(0 AS Decimal(20, 0)), CAST(9 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0 AS Decimal(20, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(N'2011-03-09T11:14:48.533' AS DateTime))
GO
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'봉인캐릭2', NULL, N'트렁크대박', N'acadmin015', CAST(1 AS Decimal(3, 0)), CAST(96 AS Decimal(10, 0)), CAST(N'2009-05-07T12:46:26.000' AS DateTime), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(9007199635788449 AS Decimal(20, 0)), N'봉인캐릭3', NULL, N'트렁크대박', N'acadmin015', CAST(1 AS Decimal(3, 0)), CAST(96 AS Decimal(10, 0)), CAST(N'2009-05-07T13:08:13.000' AS DateTime), CAST(N'2009-05-07T13:09:25.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'얍삽', NULL, N'트렁크대박', N'gg2851', CAST(0 AS Decimal(3, 0)), CAST(9 AS Decimal(10, 0)), CAST(N'2009-03-24T16:20:37.000' AS DateTime), CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(9007199635788545 AS Decimal(20, 0)), N'이름변경중', NULL, N'트렁크대박', N'somedail', CAST(0 AS Decimal(3, 0)), CAST(377 AS Decimal(10, 0)), CAST(N'2009-05-08T02:23:52.000' AS DateTime), CAST(N'2009-05-08T15:47:36.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(9007199635788546 AS Decimal(20, 0)), N'쉽덕쉽덕', NULL, N'트렁크대박', N'somedail', CAST(2 AS Decimal(3, 0)), CAST(1724 AS Decimal(10, 0)), CAST(N'2009-05-08T02:06:01.000' AS DateTime), CAST(N'2009-05-08T15:47:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(9007199635788555 AS Decimal(20, 0)), N'좀나와라', NULL, N'트렁크대박', N'somedail', CAST(0 AS Decimal(3, 0)), CAST(377 AS Decimal(10, 0)), CAST(N'2009-05-08T15:50:51.000' AS DateTime), CAST(N'2009-05-08T17:17:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(9007199635788556 AS Decimal(20, 0)), N'지지지지베이베', NULL, N'트렁크대박', N'somedail', CAST(2 AS Decimal(3, 0)), CAST(1724 AS Decimal(10, 0)), CAST(N'2009-05-08T17:02:36.000' AS DateTime), CAST(N'2009-05-08T17:17:55.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(9007199635788570 AS Decimal(20, 0)), N'이제되는구나', NULL, N'트렁크대박', N'somedail', CAST(2 AS Decimal(3, 0)), CAST(377 AS Decimal(10, 0)), CAST(N'2009-05-08T18:04:21.000' AS DateTime), CAST(N'2009-05-08T22:39:34.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(9007199635788571 AS Decimal(20, 0)), N'지연생성', NULL, N'트렁크대박', N'somedail', CAST(0 AS Decimal(3, 0)), CAST(1724 AS Decimal(10, 0)), CAST(N'2009-05-08T17:52:15.000' AS DateTime), CAST(N'2009-05-08T22:39:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(9007199635788608 AS Decimal(20, 0)), N'Yeah', NULL, N'트렁크대박', N'anycall413', CAST(1 AS Decimal(3, 0)), CAST(377 AS Decimal(10, 0)), CAST(N'2009-02-26T18:35:58.000' AS DateTime), CAST(N'2009-05-11T12:10:59.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'개스트', NULL, N'트렁크대박', N'gastmichael', CAST(0 AS Decimal(3, 0)), CAST(9 AS Decimal(10, 0)), CAST(N'2008-09-10T18:20:35.000' AS DateTime), CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(11102101702424584 AS Decimal(20, 0)), N'Qateam5', NULL, N'트렁크', N'ruefulsoul', CAST(2 AS Decimal(3, 0)), CAST(1724 AS Decimal(10, 0)), CAST(N'2011-02-08T18:01:17.380' AS DateTime), CAST(N'2011-02-10T17:03:18.330' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'시온시온', NULL, N'트렁크', N'lagz80', CAST(0 AS Decimal(3, 0)), CAST(1724 AS Decimal(10, 0)), CAST(N'2011-02-07T14:21:00.987' AS DateTime), CAST(N'2011-02-10T17:10:08.687' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(11102101734244498 AS Decimal(20, 0)), N'Bean', NULL, N'트렁크', N'jkchoo', CAST(1 AS Decimal(3, 0)), CAST(8 AS Decimal(10, 0)), CAST(N'2011-02-10T15:19:43.963' AS DateTime), CAST(N'2011-02-10T17:34:23.950' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(11103091114444541 AS Decimal(20, 0)), N'제주감귤', NULL, N'트렁크', N'jkchoo', CAST(2 AS Decimal(3, 0)), CAST(460 AS Decimal(10, 0)), CAST(N'2011-03-07T12:45:32.800' AS DateTime), CAST(N'2011-03-09T11:14:48.533' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(18014398584067646 AS Decimal(20, 0)), N'두번', NULL, N'울프라이프', N'arycoatd', CAST(1 AS Decimal(3, 0)), CAST(377 AS Decimal(10, 0)), CAST(N'2009-04-29T21:24:45.000' AS DateTime), CAST(N'2009-04-30T18:34:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(18014398584067659 AS Decimal(20, 0)), N'셀러드세트', NULL, N'울프라이프', N'arycoatd', CAST(1 AS Decimal(3, 0)), CAST(377 AS Decimal(10, 0)), CAST(N'2009-05-08T14:55:47.000' AS DateTime), CAST(N'2009-05-13T23:39:52.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(91002031045194741 AS Decimal(20, 0)), N'Sdfdff', NULL, N'트렁크대박', N'absenty', CAST(1 AS Decimal(3, 0)), CAST(6 AS Decimal(10, 0)), CAST(N'2009-11-19T17:03:34.000' AS DateTime), CAST(N'2010-02-03T10:45:19.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARMASTER] ([cItemSEQ], [CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'스킬리뉴얼1', NULL, N'트렁크대박', N'acadmin029', CAST(1 AS Decimal(3, 0)), CAST(96 AS Decimal(10, 0)), CAST(N'2010-07-14T16:53:11.000' AS DateTime), CAST(N'2010-08-05T15:59:23.000' AS DateTime))
GO
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), N'봉인캐릭2', N'222,1:1,1:57,1:7,1:49,1:223,1:224,1:225,1:226,1:126,1:128,1:3,1:75,1:4,1:10,1:131,1:132,1:133,1:134,1:135,1:228,1:', NULL, CAST(N'2009-05-07T13:07:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(9007199635788449 AS Decimal(20, 0)), N'봉인캐릭3', N'222,1:', NULL, CAST(N'2009-05-07T13:09:25.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(9007199635788459 AS Decimal(20, 0)), N'얍삽', N'222,1:547,4:546,3:548,3:593,2:590,3:591,3:621,3:646,2:592,2:619,1:', NULL, CAST(N'2009-05-07T16:53:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(9007199635788545 AS Decimal(20, 0)), N'이름변경중', N'222,1:', NULL, CAST(N'2009-05-08T15:47:36.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(9007199635788546 AS Decimal(20, 0)), N'쉽덕쉽덕', N'222,1:', NULL, CAST(N'2009-05-08T15:47:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(9007199635788555 AS Decimal(20, 0)), N'좀나와라', N'222,1:', NULL, CAST(N'2009-05-08T17:17:48.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(9007199635788556 AS Decimal(20, 0)), N'지지지지베이베', N'222,1:', NULL, CAST(N'2009-05-08T17:17:55.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(9007199635788570 AS Decimal(20, 0)), N'이제되는구나', N'222,1:', NULL, CAST(N'2009-05-08T22:39:34.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(9007199635788571 AS Decimal(20, 0)), N'지연생성', N'222,1:', NULL, CAST(N'2009-05-08T22:39:38.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(9007199635788608 AS Decimal(20, 0)), N'Yeah', N'222,1:', NULL, CAST(N'2009-05-11T12:10:59.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(10909191815214538 AS Decimal(20, 0)), N'개스트', N'222,1:', NULL, CAST(N'2009-10-19T18:15:20.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(11102101702424584 AS Decimal(20, 0)), N'Qateam5', N'222,1:', N'', CAST(N'2011-02-10T17:03:18.350' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(11102101709334587 AS Decimal(20, 0)), N'시온시온', N'222,1:663,255:203,30700:285,14086:', N'6145:6146:6147:644:646:648:650:1013:1010:1114:1116:1118:2077:2079:1120:1122:2071:2073:2075:645:647:649:651:1014:1011:1115:1117:1119:2078:2080:1121:1123:2072:2074:2076:1006:1007:1008:1009:1015:1012:111:112:113:114:115:406:397:396:403:398:400:1030:2684:1095:1029:1032:1093:1094:402:1034:2686:2687:405:1092:2689:', CAST(N'2011-02-10T17:10:08.703' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(11102101734244498 AS Decimal(20, 0)), N'Bean', N'222,1:', N'', CAST(N'2011-02-10T17:34:23.950' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(11103091114444541 AS Decimal(20, 0)), N'제주감귤', N'222,1:', N'', CAST(N'2011-03-09T11:14:48.570' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(18014398584067646 AS Decimal(20, 0)), N'두번', N'222,1:', NULL, CAST(N'2009-04-30T18:34:40.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(18014398584067659 AS Decimal(20, 0)), N'셀러드세트', N'222,1:', NULL, CAST(N'2009-05-13T23:39:52.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(91002031045194741 AS Decimal(20, 0)), N'Sdfdff', N'222,1:', NULL, CAST(N'2010-02-03T10:45:19.000' AS DateTime))
INSERT [dbo].[CERARIUM_CHARSKILL] ([cItemSEQ], [CHARID], [SKILLSEQ], [PRODUCT], [cDATE]) VALUES (CAST(91008051559224500 AS Decimal(20, 0)), N'스킬리뉴얼1', N'222,1:1,5:7,5:223,5:225,5:126,5:3,5:57,5:49,5:224,5:226,5:128,5:75,5:4,5:131,5:133,5:135,5:228,5:134,5:132,5:10,5:129,5:229,5:141,1:227,1:139,1:431,1:8,1:130,1:526,4:527,3:525,3:558,2:630,2:555,2:554,3:556,3:599,1:598,1:600,1:', NULL, CAST(N'2010-08-05T15:59:23.000' AS DateTime))
GO
INSERT [dbo].[CERARIUM_CHARTITLE] ([cItemSEQ], [CharID], [mTitleTid], [mIsComplete], [mIsEquip], [mValue1], [mValue2], [mValue3], [mValue4], [mValue5], [mDATEAccept], [mDATEComplete], [mDATEEquip], [cDATE]) VALUES (CAST(11103091114444541 AS Decimal(20, 0)), N'제주감귤', CAST(140022 AS Decimal(20, 0)), CAST(1 AS Decimal(20, 0)), CAST(1 AS Decimal(20, 0)), CAST(15 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(20, 0)), CAST(N'2011-03-08T13:54:00.000' AS DateTime), CAST(N'2011-03-08T13:54:00.000' AS DateTime), CAST(N'2011-03-08T13:55:00.000' AS DateTime), CAST(N'2011-03-09T11:14:48.580' AS DateTime))
GO
INSERT [dbo].[CERARIUM_MAILBOX] ([cItemSEQ], [MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY], [cDATE]) VALUES (CAST(9007199635788447 AS Decimal(20, 0)), CAST(701 AS Decimal(20, 0)), N'봉인캐릭2', N'캐릭변경', N'ㅇㄴㄹㅇ', NULL, CAST(N'2009-05-07T12:51:30.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(3611886901151165010 AS Decimal(20, 0)), CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(N'2009-05-07T13:07:38.000' AS DateTime))
GO
INSERT [dbo].[CHARDETAIL] ([CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [FLAG2], [flag3], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [HEROICPOINT], [BSLastKilledTime]) VALUES (N'Alanna', N'', N'-475817,4426,-59958', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(20 AS Decimal(20, 0)), CAST(80 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(37 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), N'190,193;0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:37,22;', CAST(255 AS Decimal(3, 0)), NULL, NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2022-05-07T02:10:27.517' AS DateTime), CAST(N'2022-05-07T02:12:36.290' AS DateTime), N'192.168.255.1', CAST(24 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'', N'', CAST(0 AS Decimal(20, 0)), CAST(37 AS Decimal(20, 0)))
INSERT [dbo].[CHARDETAIL] ([CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [FLAG2], [flag3], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [HEROICPOINT], [BSLastKilledTime]) VALUES (N'Testguy', N'', N'-477039,4542,-64689', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(110 AS Decimal(20, 0)), CAST(144 AS Decimal(10, 0)), CAST(37 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(113 AS Decimal(20, 0)), CAST(4 AS Decimal(3, 0)), CAST(3 AS Decimal(10, 0)), N'190,193;2,1:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:29,17;', CAST(255 AS Decimal(3, 0)), N'                                                                                                                                                                                                                                                                ', N'yyyy                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'yyyy                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2022-05-07T01:48:03.137' AS DateTime), CAST(N'2022-05-07T02:07:33.753' AS DateTime), N'192.168.255.1', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'', N'', CAST(0 AS Decimal(20, 0)), CAST(64 AS Decimal(20, 0)))
INSERT [dbo].[CHARDETAIL] ([CHARID], [TITLE], [POS], [CRIMINALSTATUS], [MURDERPOINT], [RCFTIME], [RMFTIME], [INVENMONEY], [HP], [MP], [SP], [EXP], [LV], [SKILLPOINT], [QUICKBELT], [LATESTREGION], [FLAG], [FLAG2], [flag3], [STATUS], [RESURRECTDATE], [TRANSFORMDATE], [CURCONNDATE], [LASTVISITDATE], [LASTVISITIP], [HAIR], [FACE], [DEADTYPE], [CHARISMAPOINT], [NICKNAME], [COOLDOWN], [HEROICPOINT], [BSLastKilledTime]) VALUES (N'Uhhbro', N'', N'-475858,4436,-57770', CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(5, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(30 AS Decimal(20, 0)), CAST(80 AS Decimal(10, 0)), CAST(48 AS Decimal(10, 0)), CAST(91 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(1 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), N'190,193;2,222:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0;', CAST(9 AS Decimal(3, 0)), NULL, NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, NULL, CAST(N'2022-05-08T01:55:32.250' AS DateTime), CAST(N'2022-05-08T01:57:01.513' AS DateTime), N'192.168.255.1', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(3, 0)), CAST(0 AS Decimal(10, 0)), N'', N'', CAST(0 AS Decimal(20, 0)), CAST(91 AS Decimal(20, 0)))
GO
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070149024499 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(486 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, CAST(N'2022-05-07T01:49:02.280' AS DateTime), N'0:0:', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070150574502 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,1,2', NULL, CAST(N'2022-05-07T01:50:57.303' AS DateTime), N'0:1:', CAST(54 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5061,5484,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070150594504 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(317 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,1', NULL, CAST(N'2022-05-07T01:50:59.063' AS DateTime), N'0:2:', CAST(74 AS Decimal(10, 0)), CAST(74 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5464,5012,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070152334506 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(64 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,0', NULL, CAST(N'2022-05-07T01:52:33.370' AS DateTime), N'0:2:', CAST(76 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5159,5185,5065,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070200104508 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,1', NULL, CAST(N'2022-05-07T02:00:10.720' AS DateTime), N'0:1:', CAST(54 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5062,5481,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070200114509 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(11 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,2', NULL, CAST(N'2022-05-07T02:00:11.310' AS DateTime), N'1:1:', CAST(88 AS Decimal(10, 0)), CAST(88 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5451,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070200114510 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(68 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,3', NULL, CAST(N'2022-05-07T02:00:11.953' AS DateTime), N'0:2:', CAST(67 AS Decimal(10, 0)), CAST(67 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5425,5105,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070201214511 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(520 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,0', NULL, CAST(N'2022-05-07T02:01:21.750' AS DateTime), N'1:1:', CAST(69 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5573,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070201224512 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(69 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,1', NULL, CAST(N'2022-05-07T02:01:22.147' AS DateTime), N'0:2:', CAST(50 AS Decimal(10, 0)), CAST(50 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5219,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070201224513 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(201 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,2', NULL, CAST(N'2022-05-07T02:01:22.640' AS DateTime), N'0:0:', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070202384514 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(11 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, CAST(N'2022-05-07T02:02:38.550' AS DateTime), N'1:3:', CAST(88 AS Decimal(10, 0)), CAST(88 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5574,5456,5006,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070202394515 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,0', NULL, CAST(N'2022-05-07T02:02:39.627' AS DateTime), N'0:1:', CAST(54 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5482,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070202404516 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(82 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,1', NULL, CAST(N'2022-05-07T02:02:40.087' AS DateTime), N'0:2:', CAST(61 AS Decimal(10, 0)), CAST(61 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5187,5427,5065,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070202524517 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(8089 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,2', NULL, CAST(N'2022-05-07T02:02:52.637' AS DateTime), N'0:1:', CAST(68 AS Decimal(10, 0)), CAST(68 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5001,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070202534518 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(7525 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,3', NULL, CAST(N'2022-05-07T02:02:53.943' AS DateTime), N'0:2:', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), N'5513,5543,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070202594519 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(2850 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,0', NULL, CAST(N'2022-05-07T02:02:59.817' AS DateTime), N'0:2:', CAST(40 AS Decimal(10, 0)), CAST(40 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5451,5245,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070205534520 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(69 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,3', NULL, CAST(N'2022-05-07T02:05:53.453' AS DateTime), N'0:2:', CAST(50 AS Decimal(10, 0)), CAST(50 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5218,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070205544521 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(2727 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,2', NULL, CAST(N'2022-05-07T02:05:54.420' AS DateTime), N'0:1:', CAST(81 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5452,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070205564522 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'1,0,3', NULL, CAST(N'2022-05-07T02:05:56.517' AS DateTime), N'0:1:', CAST(54 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5063,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070211124497 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(69 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, CAST(N'2022-05-07T02:11:12.587' AS DateTime), N'0:2:', CAST(50 AS Decimal(10, 0)), CAST(50 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5487,5219,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070211134498 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,0', NULL, CAST(N'2022-05-07T02:11:13.017' AS DateTime), N'0:1:', CAST(54 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5484,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070211134499 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(15 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,1', NULL, CAST(N'2022-05-07T02:11:13.950' AS DateTime), N'0:1:', CAST(63 AS Decimal(10, 0)), CAST(63 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5572,5459,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070211584500 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,2', NULL, CAST(N'2022-05-07T02:11:58.077' AS DateTime), N'0:1:', CAST(54 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5061,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070211584501 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(85 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,3', NULL, CAST(N'2022-05-07T02:11:58.570' AS DateTime), N'0:2:', CAST(40 AS Decimal(10, 0)), CAST(40 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5462,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205070212004502 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(14 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,0', NULL, CAST(N'2022-05-07T02:12:00.190' AS DateTime), N'1:1:', CAST(74 AS Decimal(10, 0)), CAST(74 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5004,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205080056384497 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(19 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,0', NULL, CAST(N'2022-05-08T00:56:38.573' AS DateTime), N'0:2:', CAST(93 AS Decimal(10, 0)), CAST(93 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5009,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205080056384498 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(2905 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,1', NULL, CAST(N'2022-05-08T00:56:38.987' AS DateTime), N'0:2:', CAST(45 AS Decimal(10, 0)), CAST(45 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5460,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205080056394499 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,2', NULL, CAST(N'2022-05-08T00:56:39.870' AS DateTime), N'0:2:', CAST(54 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5061,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205080155524497 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(5066 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,1,3', NULL, CAST(N'2022-05-08T01:55:52.060' AS DateTime), N'0:2:', CAST(76 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5423,5069,5158,5189,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205080155524498 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,0', NULL, CAST(N'2022-05-08T01:55:52.550' AS DateTime), N'0:1:', CAST(54 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5481,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205080155524499 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(7968 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,1', NULL, CAST(N'2022-05-08T01:55:52.893' AS DateTime), N'0:1:', CAST(68 AS Decimal(10, 0)), CAST(68 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5571,5453,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205080156144500 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(2711 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,2', NULL, CAST(N'2022-05-08T01:56:14.803' AS DateTime), N'1:2:', CAST(71 AS Decimal(10, 0)), CAST(71 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5459,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205080156164501 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(389 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,2,3', NULL, CAST(N'2022-05-08T01:56:16.320' AS DateTime), N'0:2:', CAST(34 AS Decimal(10, 0)), CAST(34 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5211,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205080156164502 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(5066 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,0', NULL, CAST(N'2022-05-08T01:56:16.673' AS DateTime), N'0:3:', CAST(76 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5157,5429,5188,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(12205080156184503 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(8 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,3,1', NULL, CAST(N'2022-05-08T01:56:18.357' AS DateTime), N'0:1:', CAST(54 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'5481,0,0,0,0', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205060037240035 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205060037240036 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205060037240037 AS Decimal(20, 0)), N'test', N'TestWorld', N'Testguy', CAST(3857 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205070208260034 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(12 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, N'', CAST(62 AS Decimal(10, 0)), CAST(63 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205070208260035 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(190 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205070208260036 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205070208260037 AS Decimal(20, 0)), N'test', N'TestWorld', N'Alanna', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205080054040034 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(3 AS Decimal(5, 0)), N'0,1,2', NULL, NULL, N'', CAST(91 AS Decimal(10, 0)), CAST(93 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205080054040035 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(190 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,0', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205080054040036 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(193 AS Decimal(10, 0)), CAST(3 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,1', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205080054040037 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(194 AS Decimal(10, 0)), CAST(461 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,2', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[CHARITEM] ([ITEMSEQ], [ACCOUNTID], [WORLD], [CHARID], [ITEMTID], [STACKCOUNT], [STATUS], [POS], [NEEDLEVEL], [OWNTIME], [CONVHIST], [DURABILITY], [MAXDUR], [FLAG], [OPT], [INUSE], [USECOUNT], [REMAINTIME], [EXPIREDATE], [SKILLPLUS], [STAMINAREMAINTIME]) VALUES (CAST(4012205080054040038 AS Decimal(20, 0)), N'test', N'TestWorld', N'Uhhbro', CAST(3857 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(2 AS Decimal(5, 0)), N'0,0,3', NULL, NULL, N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), N'', CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(0 AS Decimal(10, 0)))
GO
INSERT [dbo].[CHARMASTER] ([CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE]) VALUES (N'Alanna', NULL, N'TestWorld', N'test', CAST(0 AS Decimal(3, 0)), CAST(6 AS Decimal(10, 0)), CAST(N'2022-05-07T02:08:26.480' AS DateTime))
INSERT [dbo].[CHARMASTER] ([CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE]) VALUES (N'Testguy', NULL, N'TestWorld', N'test', CAST(1 AS Decimal(3, 0)), CAST(96 AS Decimal(10, 0)), CAST(N'2022-05-06T00:37:24.937' AS DateTime))
INSERT [dbo].[CHARMASTER] ([CHARID], [OLDCHARID], [WORLD], [ACCOUNTID], [SLOT], [CHARTID], [CREATIONDATE]) VALUES (N'Uhhbro', NULL, N'TestWorld', N'test', CAST(2 AS Decimal(3, 0)), CAST(1 AS Decimal(10, 0)), CAST(N'2022-05-08T00:54:04.223' AS DateTime))
GO
INSERT [dbo].[CHARSKILL] ([CHARID], [SKILLSEQ], [PRODUCT]) VALUES (N'Alanna', N'', N'')
INSERT [dbo].[CHARSKILL] ([CHARID], [SKILLSEQ], [PRODUCT]) VALUES (N'Testguy', N'1,1:', N'')
INSERT [dbo].[CHARSKILL] ([CHARID], [SKILLSEQ], [PRODUCT]) VALUES (N'Uhhbro', N'222,1:', N'')
GO
INSERT [dbo].[LOGINSTATUS] ([ACCOUNTID], [STATUS], [CHARID], [CID], [SERVER], [SERVERUID], [ACCOUNTLV], [NID], [LASTCHARID], [ACCESSDATE]) VALUES (N'test', NULL, N'Uhhbro', CAST(14 AS Decimal(20, 0)), N'192.168.255.1:11008', NULL, NULL, CAST(4012205080155240000 AS Decimal(20, 0)), NULL, CAST(N'2022-05-08T01:55:31.1870000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[MAILBOX] ON 

INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1 AS Decimal(20, 0)), N'와따보우', N'따당', N'긍께', NULL, CAST(N'2007-12-18T20:07:37.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(9007199254743576 AS Decimal(20, 0)), CAST(639 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(2 AS Decimal(20, 0)), N'와따보우', N'따당', N'함 보시라니깐요', N'냉무', CAST(N'2007-12-18T20:08:20.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(3 AS Decimal(20, 0)), N'용정007', N'철인28호', N'배고파요 ', N'빨리 밥오라고 기도해주세요^^ ', CAST(N'2007-12-18T20:43:59.000' AS DateTime), CAST(17 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(4 AS Decimal(20, 0)), N'철인28호', N'용정007', N'[RE]배고파요 ', N'참으세요.\n밥 1분안에 도착하도록 만드어줄게요.\n', CAST(N'2007-12-18T20:45:52.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(5 AS Decimal(20, 0)), N'용정007', N'철인28호', N'1번', NULL, CAST(N'2007-12-18T21:06:35.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(6 AS Decimal(20, 0)), N'용정007', N'철인28호', N'2번', NULL, CAST(N'2007-12-18T21:06:47.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(7 AS Decimal(20, 0)), N'용정007', N'철인28호', N'3번', NULL, CAST(N'2007-12-18T21:07:14.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(8 AS Decimal(20, 0)), N'용정007', N'철인28호', N'4번', NULL, CAST(N'2007-12-18T21:07:28.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(9 AS Decimal(20, 0)), N'용정007', N'철인28호', N'5번', NULL, CAST(N'2007-12-18T21:07:40.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(10 AS Decimal(20, 0)), N'용정008', N'철인28호', N'6번', NULL, CAST(N'2007-12-18T21:07:51.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(11 AS Decimal(20, 0)), N'용정007', N'철인28호', N'7번 ', N'이제부턴 아이템드리죠..', CAST(N'2007-12-18T21:08:24.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(12 AS Decimal(20, 0)), N'용정007', N'철인28호', N'8번', NULL, CAST(N'2007-12-18T21:08:51.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706757 AS Decimal(20, 0)), CAST(1047 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(13 AS Decimal(20, 0)), N'용정007', N'철인28호', N'9번', NULL, CAST(N'2007-12-18T21:09:08.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706861 AS Decimal(20, 0)), CAST(1914 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(14 AS Decimal(20, 0)), N'용정007', N'철인28호', N'10번', NULL, CAST(N'2007-12-18T21:09:23.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706769 AS Decimal(20, 0)), CAST(1924 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(16 AS Decimal(20, 0)), N'용정007', N'철인28호', N'12번', NULL, CAST(N'2007-12-18T21:09:55.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(17 AS Decimal(20, 0)), N'용정007', N'철인28호', N'13번', NULL, CAST(N'2007-12-18T21:10:09.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(45035996273706775 AS Decimal(20, 0)), CAST(13 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(18 AS Decimal(20, 0)), N'용정007', N'철인28호', N'14번', NULL, CAST(N'2007-12-18T21:10:28.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706776 AS Decimal(20, 0)), CAST(20 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(19 AS Decimal(20, 0)), N'용정007', N'철인28호', N'15번', NULL, CAST(N'2007-12-18T21:10:41.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706815 AS Decimal(20, 0)), CAST(2845 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(20 AS Decimal(20, 0)), N'용정007', N'철인28호', N'16번', NULL, CAST(N'2007-12-18T21:10:54.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706778 AS Decimal(20, 0)), CAST(2841 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(21 AS Decimal(20, 0)), N'용정007', N'철인28호', N'17번', NULL, CAST(N'2007-12-18T21:11:16.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706827 AS Decimal(20, 0)), CAST(2850 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(22 AS Decimal(20, 0)), N'용정007', N'철인28호', N'18번', NULL, CAST(N'2007-12-18T21:11:29.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706812 AS Decimal(20, 0)), CAST(2727 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(23 AS Decimal(20, 0)), N'용정007', N'철인28호', N'19번', NULL, CAST(N'2007-12-18T21:11:43.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706845 AS Decimal(20, 0)), CAST(20 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(24 AS Decimal(20, 0)), N'용정007', N'철인28호', N'20번', NULL, CAST(N'2007-12-18T21:11:58.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706789 AS Decimal(20, 0)), CAST(5494 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(25 AS Decimal(20, 0)), N'용정007', N'철인28호', N'21번', NULL, CAST(N'2007-12-18T21:12:10.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706846 AS Decimal(20, 0)), CAST(2907 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(26 AS Decimal(20, 0)), N'용정007', N'철인28호', N'22번', NULL, CAST(N'2007-12-18T21:12:23.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706787 AS Decimal(20, 0)), CAST(324 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(27 AS Decimal(20, 0)), N'용정007', N'철인28호', N'23번', NULL, CAST(N'2007-12-18T21:12:40.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706814 AS Decimal(20, 0)), CAST(690 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(28 AS Decimal(20, 0)), N'용정007', N'철인28호', N'24번', NULL, CAST(N'2007-12-18T21:12:52.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706794 AS Decimal(20, 0)), CAST(2711 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(29 AS Decimal(20, 0)), N'용정007', N'철인28호', N'25번', NULL, CAST(N'2007-12-18T21:13:07.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706799 AS Decimal(20, 0)), CAST(388 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(30 AS Decimal(20, 0)), N'용정007', N'철인28호', N'26번', NULL, CAST(N'2007-12-18T21:13:27.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706797 AS Decimal(20, 0)), CAST(51 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(31 AS Decimal(20, 0)), N'용정007', N'철인28호', N'27번', NULL, CAST(N'2007-12-18T21:13:39.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(3611886901151142119 AS Decimal(20, 0)), CAST(4920 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(32 AS Decimal(20, 0)), N'용정007', N'철인28호', N'28번', NULL, CAST(N'2007-12-18T21:13:54.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706806 AS Decimal(20, 0)), CAST(4920 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(33 AS Decimal(20, 0)), N'용정007', N'철인28호', N'29번', N'쓰던거 드렸으니 다 사용하시구 수리하세요^^ \n', CAST(N'2007-12-18T21:14:43.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(3611886901151142120 AS Decimal(20, 0)), CAST(5558 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(34 AS Decimal(20, 0)), N'용정007', N'철인28호', N'30번', N'마지막이죠? ', CAST(N'2007-12-18T21:15:03.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706849 AS Decimal(20, 0)), CAST(82 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(35 AS Decimal(20, 0)), N'용정007', N'철인28호', N'[RE][RE]배고파요 1', NULL, CAST(N'2007-12-18T21:15:37.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706824 AS Decimal(20, 0)), CAST(11 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(36 AS Decimal(20, 0)), N'용정007', N'철인28호', N'[RE][RE]배고파요 2', NULL, CAST(N'2007-12-18T21:15:48.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(45035996273706851 AS Decimal(20, 0)), CAST(2840 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(37 AS Decimal(20, 0)), N'용정007', N'철인28호', N'[RE][RE]배고파요 3', NULL, CAST(N'2007-12-18T21:15:56.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(38 AS Decimal(20, 0)), N'용정007', N'철인28호', N'[RE][RE]배고파요 4', NULL, CAST(N'2007-12-18T21:16:08.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706822 AS Decimal(20, 0)), CAST(2730 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(39 AS Decimal(20, 0)), N'용정007', N'철인28호', N'[RE][RE]배고파요 5', NULL, CAST(N'2007-12-18T21:16:15.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706826 AS Decimal(20, 0)), CAST(1925 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(40 AS Decimal(20, 0)), N'용정007', N'철인28호', N'[RE][RE]배고파요 6', NULL, CAST(N'2007-12-18T21:16:23.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706829 AS Decimal(20, 0)), CAST(157 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(41 AS Decimal(20, 0)), N'용정007', N'철인28호', N'[RE][RE]배고파요 7', NULL, CAST(N'2007-12-18T21:16:33.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706831 AS Decimal(20, 0)), CAST(5494 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(42 AS Decimal(20, 0)), N'용정007', N'철인28호', N'[RE][RE]배고파요 8', NULL, CAST(N'2007-12-18T21:16:40.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706832 AS Decimal(20, 0)), CAST(172 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(43 AS Decimal(20, 0)), N'용정007', N'철인28호', N'[RE][RE]배고파요 9', NULL, CAST(N'2007-12-18T21:16:51.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706844 AS Decimal(20, 0)), CAST(666 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(101 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'[RE][RE]배고파요 9', NULL, CAST(N'2007-12-18T21:16:51.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706844 AS Decimal(20, 0)), CAST(666 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(102 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'[RE][RE]배고파요 8', NULL, CAST(N'2007-12-18T21:16:40.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706832 AS Decimal(20, 0)), CAST(172 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(103 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'[RE][RE]배고파요 7', NULL, CAST(N'2007-12-18T21:16:33.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706831 AS Decimal(20, 0)), CAST(5494 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(104 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'[RE][RE]배고파요 6', NULL, CAST(N'2007-12-18T21:16:23.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706829 AS Decimal(20, 0)), CAST(157 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(105 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'[RE][RE]배고파요 5', NULL, CAST(N'2007-12-18T21:16:15.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706826 AS Decimal(20, 0)), CAST(1925 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(106 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'[RE][RE]배고파요 4', NULL, CAST(N'2007-12-18T21:16:08.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706822 AS Decimal(20, 0)), CAST(2730 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(107 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'[RE][RE]배고파요 3', NULL, CAST(N'2007-12-18T21:15:56.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(108 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'[RE][RE]배고파요 2', NULL, CAST(N'2007-12-18T21:15:48.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(45035996273706851 AS Decimal(20, 0)), CAST(2840 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(109 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'[RE][RE]배고파요 1', NULL, CAST(N'2007-12-18T21:15:37.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706824 AS Decimal(20, 0)), CAST(11 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(110 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'30번', N'마지막이죠? ', CAST(N'2007-12-18T21:15:03.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706849 AS Decimal(20, 0)), CAST(82 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(111 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'29번', N'쓰던거 드렸으니 다 사용하시구 수리하세요^^ \n', CAST(N'2007-12-18T21:14:43.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(3611886901151142120 AS Decimal(20, 0)), CAST(5558 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(112 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'28번', NULL, CAST(N'2007-12-18T21:13:54.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706806 AS Decimal(20, 0)), CAST(4920 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(113 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'27번', NULL, CAST(N'2007-12-18T21:13:39.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(3611886901151142119 AS Decimal(20, 0)), CAST(4920 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(114 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'26번', NULL, CAST(N'2007-12-18T21:13:27.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706797 AS Decimal(20, 0)), CAST(51 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(115 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'25번', NULL, CAST(N'2007-12-18T21:13:07.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706799 AS Decimal(20, 0)), CAST(388 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(116 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'24번', NULL, CAST(N'2007-12-18T21:12:52.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706794 AS Decimal(20, 0)), CAST(2711 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(117 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'23번', NULL, CAST(N'2007-12-18T21:12:40.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706814 AS Decimal(20, 0)), CAST(690 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(118 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'22번', NULL, CAST(N'2007-12-18T21:12:23.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706787 AS Decimal(20, 0)), CAST(324 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(119 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'21번', NULL, CAST(N'2007-12-18T21:12:10.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706846 AS Decimal(20, 0)), CAST(2907 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(120 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'20번', NULL, CAST(N'2007-12-18T21:11:58.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706789 AS Decimal(20, 0)), CAST(5494 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(121 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'19번', NULL, CAST(N'2007-12-18T21:11:43.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706845 AS Decimal(20, 0)), CAST(20 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(122 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'18번', NULL, CAST(N'2007-12-18T21:11:29.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706812 AS Decimal(20, 0)), CAST(2727 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(123 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'17번', NULL, CAST(N'2007-12-18T21:11:16.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706827 AS Decimal(20, 0)), CAST(2850 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(124 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'16번', NULL, CAST(N'2007-12-18T21:10:54.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706778 AS Decimal(20, 0)), CAST(2841 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(125 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'15번', NULL, CAST(N'2007-12-18T21:10:41.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706815 AS Decimal(20, 0)), CAST(2845 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(126 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'14번', NULL, CAST(N'2007-12-18T21:10:28.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706776 AS Decimal(20, 0)), CAST(20 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(127 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'13번', NULL, CAST(N'2007-12-18T21:10:09.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(45035996273706775 AS Decimal(20, 0)), CAST(13 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(128 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'12번', NULL, CAST(N'2007-12-18T21:09:55.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(129 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'10번', NULL, CAST(N'2007-12-18T21:09:23.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706769 AS Decimal(20, 0)), CAST(1924 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(130 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'9번', NULL, CAST(N'2007-12-18T21:09:08.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706861 AS Decimal(20, 0)), CAST(1914 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(131 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'8번', NULL, CAST(N'2007-12-18T21:08:51.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(45035996273706757 AS Decimal(20, 0)), CAST(1047 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(132 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'7번 ', N'이제부턴 아이템드리죠..', CAST(N'2007-12-18T21:08:24.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(133 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'5번', NULL, CAST(N'2007-12-18T21:07:40.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(134 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'4번', NULL, CAST(N'2007-12-18T21:07:28.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(135 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'3번', NULL, CAST(N'2007-12-18T21:07:14.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(136 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'2번', NULL, CAST(N'2007-12-18T21:06:47.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(137 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'1번', NULL, CAST(N'2007-12-18T21:06:35.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(138 AS Decimal(20, 0)), N'슈퍼티제이', N'철인28호', N'배고파요 ', N'빨리 밥오라고 기도해주세요^^ ', CAST(N'2007-12-18T20:43:59.000' AS DateTime), CAST(17 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(201 AS Decimal(20, 0)), N'이런된장', N'작두가져와라', N'반지1', NULL, CAST(N'2008-06-17T22:18:46.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(9007199254749121 AS Decimal(20, 0)), CAST(7500 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(202 AS Decimal(20, 0)), N'이런된장', N'작두가져와라', N'반지2', N'물저의 힘을 느껴보아요', CAST(N'2008-06-17T22:19:05.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(9007199254749135 AS Decimal(20, 0)), CAST(7500 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(312 AS Decimal(20, 0)), N'공성전이다', N'편지지함', N'ㅁㄴㅇㄹ', N'ㅁㄴㅇㄻㄴ랴ㅑㅑㅑ', CAST(N'2008-10-06T15:33:00.000' AS DateTime), CAST(17 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(313 AS Decimal(20, 0)), N'편지지함', N'공성전이다', N'[RE]ㅁㄴㅇㄹ', NULL, CAST(N'2008-10-06T15:33:23.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(314 AS Decimal(20, 0)), N'공성전이다', N'편지지함', N'[RE][RE]ㅁㄴㅇㄹ', NULL, CAST(N'2008-10-06T15:33:34.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(315 AS Decimal(20, 0)), N'편지지함', N'공성전이다', N'[RE][RE][RE]ㅁㄴㅇㄹ', NULL, CAST(N'2008-10-06T15:34:35.000' AS DateTime), CAST(17 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(316 AS Decimal(20, 0)), N'공성전이다', N'편지지함', N'[RE][RE][RE][RE]ㅁㄴㅇㄹ', NULL, CAST(N'2008-10-06T15:34:47.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(317 AS Decimal(20, 0)), N'공성전이다', N'편지지함', N'[RE][RE][RE][RE]ㅁㄴㅇㄹ', NULL, CAST(N'2008-10-06T15:35:04.000' AS DateTime), CAST(17 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(320 AS Decimal(20, 0)), N'편지지함', N'공성전이다', N'[RE][RE][RE][RE][RE]ㅁㄴㅇㄹ', NULL, CAST(N'2008-10-06T15:42:06.000' AS DateTime), CAST(17 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(321 AS Decimal(20, 0)), N'공성전이다', N'편지지함', N'[RE][RE][RE][RE][RE][RE]ㅁㄴㅇㄹ', NULL, CAST(N'2008-10-06T15:45:37.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(45035996273708160 AS Decimal(20, 0)), CAST(190 AS Decimal(10, 0)), CAST(88 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(415 AS Decimal(20, 0)), N'공성버그2', N'코스튬3', N'ㅁㄴㅇㄻㄴㅇㄹ', NULL, CAST(N'2008-10-09T17:25:05.000' AS DateTime), CAST(17 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(416 AS Decimal(20, 0)), N'공성버그2', N'코스튬3', N'루룰', NULL, CAST(N'2008-10-09T17:25:58.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(417 AS Decimal(20, 0)), N'공성버그2', N'코스튬3', N'라라', NULL, CAST(N'2008-10-09T17:29:12.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(418 AS Decimal(20, 0)), N'공성버그2', N'코스튬3', N'물약물약물약', NULL, CAST(N'2008-10-09T17:30:30.000' AS DateTime), CAST(17 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(419 AS Decimal(20, 0)), N'공성버그', N'코스튬3', N'234', NULL, CAST(N'2008-10-09T17:31:21.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(9007199254753385 AS Decimal(20, 0)), CAST(1054 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(420 AS Decimal(20, 0)), N'공성버그2', N'코스튬3', N'ㅁㄴㅇㄹ', N'ㅁㄴㅇㄻㄴㅇㄹ', CAST(N'2008-10-09T17:32:58.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(421 AS Decimal(20, 0)), N'공성버그2', N'코스튬3', N'공성버그', N'ㅁㅁㅁㅁ', CAST(N'2008-10-09T17:34:45.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(423 AS Decimal(20, 0)), N'공성버그2', N'코스튬3', N'[RE][RE]공성버그', NULL, CAST(N'2008-10-09T17:39:58.000' AS DateTime), CAST(17 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(440 AS Decimal(20, 0)), N'나이뜨', N'나이끼', N'ㅇㅇㅇㅇㅇㅇ', N'ㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㅇ류\nㅁㄴㅇㄻㄴ\nㅇㄻ\nㄴㅇㄹ\nㅁㄴㅇㄹ\nㅁ\nㄴㅇㄹ\nㅁㄴ\nㅇㄹ\nㅁㄴㅇ\nㄹㄴㅇ\nㄹ\n', CAST(N'2008-10-28T18:23:22.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
GO
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(454 AS Decimal(20, 0)), N'간지가이', N'스킬레벨버그', N'사랑해요', NULL, CAST(N'2008-10-29T15:29:52.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(455 AS Decimal(20, 0)), N'간지가이', N'스킬레벨버그', N'우겔겔겔 디뎌 고쳤다', NULL, CAST(N'2008-10-29T15:31:25.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(456 AS Decimal(20, 0)), N'간지가이', N'스킬레벨버그', N'우왕ㅋ 굳ㅋ ', NULL, CAST(N'2008-10-29T15:32:56.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(457 AS Decimal(20, 0)), N'간지가이', N'스킬레벨버그', N'이것도 오류가 나는가?!', NULL, CAST(N'2008-10-29T15:37:08.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(458 AS Decimal(20, 0)), N'간지가이', N'스킬레벨버그', N'이것도 가능한가요?!', NULL, CAST(N'2008-10-29T16:11:58.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(459 AS Decimal(20, 0)), N'간지가이', N'스킬레벨버그', N'정말 잘 되는게 맞는거지요?!', NULL, CAST(N'2008-10-29T16:12:38.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(460 AS Decimal(20, 0)), N'퍼펙트여', N'퍼펙트요', N'ㅅㅅㅅㅅ', NULL, CAST(N'2008-10-29T17:00:25.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(504 AS Decimal(20, 0)), N'키라', N'아잉', N'받아쳐무', NULL, CAST(N'2009-02-13T18:38:18.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(801 AS Decimal(20, 0)), N'대충만든이름', N'이상한골반라인', N'아놔 편지지 폰트색깔 왜 이래;;', NULL, CAST(N'2009-07-14T16:06:24.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(802 AS Decimal(20, 0)), N'대충만든이름', N'아놔짜증놔', N'타이밍이 너무 빠르자나~', N'아놔.. 지랄이네 타이밍.. 이걸 어떡하지?\n', CAST(N'2009-07-14T16:15:44.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(3611886901151165135 AS Decimal(20, 0)), CAST(5558 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(803 AS Decimal(20, 0)), N'대충만든이름', N'아놔짜증놔', N'아놔 메일 왜 안가', N'필터링인가;;; 메일이 왜 안가..', CAST(N'2009-07-14T16:24:19.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(804 AS Decimal(20, 0)), N'대충만든이름', N'아놔짜증놔', N'아무래도 너무 빠르지?', N'로딩중이니까.. 빠를지도.. 그렇다고 타이밍을 어케 늦추나..', CAST(N'2009-07-14T16:32:14.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(805 AS Decimal(20, 0)), N'대충만든이름', N'아놔짜증놔', N'어째.. 안찍히냐..', N'음먀..', CAST(N'2009-07-14T16:42:40.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(901 AS Decimal(20, 0)), N'엘리', N'나이뚜', N'dfdfd', NULL, CAST(N'2009-09-10T22:53:29.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(902 AS Decimal(20, 0)), N'엘리', N'나이뚜', N'dfdfd', NULL, CAST(N'2009-09-10T22:53:32.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(903 AS Decimal(20, 0)), N'엘리', N'나이뚜', N'dfdfd', NULL, CAST(N'2009-09-10T22:53:34.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1003 AS Decimal(20, 0)), N'흐흐흐', N'스치골', N'ㅇㄹㅇㄹ', N'ㅇㄹㅇㄹㅇㄹㅇ', CAST(N'2010-01-20T15:43:28.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1005 AS Decimal(20, 0)), N'흐흐흐', N'스치골', N'ㅂㄷㄳㅅ', N'ㅋㅌㅊㅍㅌㅊ', CAST(N'2010-01-20T15:43:49.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1301 AS Decimal(20, 0)), N'아행', N'Sdfdffgg', N'ㄴㅇㄹㅇㄹ', N'ㄴㅇㄹㄴㅇㄹ', CAST(N'2010-05-07T16:56:28.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1302 AS Decimal(20, 0)), N'아행', N'Sdfdffgg', N'ㄴㅇㄹㄴㅇㄹ', N'ㄴㅇㄹㄴㅇㄹ', CAST(N'2010-05-07T16:56:53.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1303 AS Decimal(20, 0)), N'아행', N'Sdfdffgg', N'ㄴㅇㄹㄴㅇㄹ', N'ㄴㅇㄹㄴㅇㄹ', CAST(N'2010-05-07T16:59:59.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1304 AS Decimal(20, 0)), N'아행', N'Sdfdffgg', N'ㅇㄹㅇㄹㅇ', N'ㅇㄹㅇㄹㅇㄹ', CAST(N'2010-05-07T17:00:33.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1305 AS Decimal(20, 0)), N'아행', N'Sdfdffgg', N'ㅇㄹㅇㄹㅇ', N'ㅇㄹㅇㄹㅇㄹ', CAST(N'2010-05-07T17:00:33.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1306 AS Decimal(20, 0)), N'아행', N'Sdfdffgg', N'ㅇㄹㅇㄹㅇ', N'ㅇㄹㅇㄹㅇㄹ', CAST(N'2010-05-07T17:00:49.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1307 AS Decimal(20, 0)), N'아행', N'Sdfdffgg', N'ㅇㄹㅇㄹ', N'ㅇㄹㅇㄹㅇ', CAST(N'2010-05-07T17:01:00.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1308 AS Decimal(20, 0)), N'아행', N'Sdfdffgg', N'ㅇㄹㅇㄹㅇ', N'ㅇㄹㅇㄹㅇㄹ', CAST(N'2010-05-07T17:01:12.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1309 AS Decimal(20, 0)), N'아행', N'Sdfdffgg', N'ㅇㄹㅇㄹㅇㄹ', NULL, CAST(N'2010-05-07T17:01:52.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1310 AS Decimal(20, 0)), N'아행', N'Sdfdffgg', N'ㅇㄹㅇㄹㅇ', N'ㅇㄹㅇㄹㅇ', CAST(N'2010-05-07T17:21:32.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1311 AS Decimal(20, 0)), N'아행', N'Sdfdffgg', N'ㅇㄹㅇㄹㅇ', N'ㅋㅌㅊㅍ', CAST(N'2010-05-07T17:23:45.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1312 AS Decimal(20, 0)), N'아행', N'Sdfdffgg', N'ㅇㄹㅇㄹㅇ', N'ㅋㅌㅊㅍ', CAST(N'2010-05-07T17:23:45.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1323 AS Decimal(20, 0)), N'1231231', N'Fdsfsd', N'복삭ㄱ', N'복사사사', CAST(N'2010-05-07T19:24:17.000' AS DateTime), CAST(1 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1325 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ', N'ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ', CAST(N'2011-02-09T17:43:30.000' AS DateTime), CAST(17 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1326 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'2', N'', CAST(N'2011-02-09T17:44:49.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1327 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'3', N'', CAST(N'2011-02-09T17:44:56.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1328 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'4', N'', CAST(N'2011-02-09T17:45:03.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1329 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'5', N'', CAST(N'2011-02-09T17:45:09.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1330 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'5', N'', CAST(N'2011-02-09T17:45:24.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1331 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'6', N'', CAST(N'2011-02-09T17:45:46.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1332 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'7', N'', CAST(N'2011-02-09T17:45:57.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1333 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'7', N'', CAST(N'2011-02-09T17:46:05.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1334 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'8', N'', CAST(N'2011-02-09T17:46:11.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1335 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'9', N'', CAST(N'2011-02-09T17:46:16.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1336 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'10', N'', CAST(N'2011-02-09T17:46:24.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1337 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'9', N'', CAST(N'2011-02-09T17:46:33.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1338 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'10', N'', CAST(N'2011-02-09T17:46:42.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1339 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'11', N'', CAST(N'2011-02-09T17:46:52.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1340 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'12', N'', CAST(N'2011-02-09T17:47:00.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1342 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'12', N'', CAST(N'2011-02-09T17:48:38.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1343 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'13', N'', CAST(N'2011-02-09T17:48:44.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1344 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'[RE]RRR', N'', CAST(N'2011-02-09T17:48:47.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1345 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'[RE]RRR', N'', CAST(N'2011-02-09T17:48:50.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1346 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'[RE]RRR', N'', CAST(N'2011-02-09T17:48:53.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1347 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'[RE]RRR', N'', CAST(N'2011-02-09T17:48:56.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1348 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'[RE]RRR', N'', CAST(N'2011-02-09T17:48:59.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1349 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'[RE]RRR', N'', CAST(N'2011-02-09T17:49:01.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1350 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'[RE]RRR', N'', CAST(N'2011-02-09T17:49:03.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1351 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'[RE]RRR', N'', CAST(N'2011-02-09T17:49:06.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1352 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'[RE]RRR', N'', CAST(N'2011-02-09T17:49:08.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1353 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'[RE]RRR', N'', CAST(N'2011-02-09T17:49:10.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1354 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'[RE]RRR', N'', CAST(N'2011-02-09T17:49:11.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1355 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'[RE]RRR', N'', CAST(N'2011-02-09T17:49:13.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1356 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'20', N'', CAST(N'2011-02-09T17:49:18.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1357 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'21', N'', CAST(N'2011-02-09T17:49:24.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1358 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'22', N'', CAST(N'2011-02-09T17:49:29.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1359 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'23', N'', CAST(N'2011-02-09T17:49:34.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[MAILBOX] ([MAILSEQ], [TOCHARID], [FROMCHARID], [SUBJECT], [CONTENTS], [WDATE], [FLAG], [ITEMSEQ], [ITEMTID], [ITEMQTY]) VALUES (CAST(1360 AS Decimal(20, 0)), N'엘리엘리', N'Qateam7', N'24', N'', CAST(N'2011-02-09T17:49:39.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(20, 0)), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
SET IDENTITY_INSERT [dbo].[MAILBOX] OFF
GO
INSERT [dbo].[RPGWT] ([SERVERID], [CHARTID], [WDATE], [CURCONN], [MAXCONN]) VALUES (N'TestWorld', CAST(0 AS Decimal(10, 0)), CAST(N'2022-05-08T01:55:01.903' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[RPGWT] ([SERVERID], [CHARTID], [WDATE], [CURCONN], [MAXCONN]) VALUES (N'TestWorld', CAST(1 AS Decimal(10, 0)), CAST(N'2022-05-08T01:55:01.903' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[RPGWT] ([SERVERID], [CHARTID], [WDATE], [CURCONN], [MAXCONN]) VALUES (N'TestWorld', CAST(3 AS Decimal(10, 0)), CAST(N'2022-05-08T01:55:01.907' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[RPGWT] ([SERVERID], [CHARTID], [WDATE], [CURCONN], [MAXCONN]) VALUES (N'TestWorld', CAST(4 AS Decimal(10, 0)), CAST(N'2022-05-08T01:55:01.907' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[RPGWT] ([SERVERID], [CHARTID], [WDATE], [CURCONN], [MAXCONN]) VALUES (N'TestWorld', CAST(6 AS Decimal(10, 0)), CAST(N'2022-05-08T01:55:01.907' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[RPGWT] ([SERVERID], [CHARTID], [WDATE], [CURCONN], [MAXCONN]) VALUES (N'TestWorld', CAST(8 AS Decimal(10, 0)), CAST(N'2022-05-08T01:55:01.907' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[RPGWT] ([SERVERID], [CHARTID], [WDATE], [CURCONN], [MAXCONN]) VALUES (N'TestWorld', CAST(9 AS Decimal(10, 0)), CAST(N'2022-05-08T01:55:01.907' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[RPGWT] ([SERVERID], [CHARTID], [WDATE], [CURCONN], [MAXCONN]) VALUES (N'TestWorld', CAST(96 AS Decimal(10, 0)), CAST(N'2022-05-08T01:55:01.903' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[RPGWT] ([SERVERID], [CHARTID], [WDATE], [CURCONN], [MAXCONN]) VALUES (N'TestWorld', CAST(377 AS Decimal(10, 0)), CAST(N'2022-05-08T01:55:01.907' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
INSERT [dbo].[RPGWT] ([SERVERID], [CHARTID], [WDATE], [CURCONN], [MAXCONN]) VALUES (N'TestWorld', CAST(460 AS Decimal(10, 0)), CAST(N'2022-05-08T01:55:01.907' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)))
GO
INSERT [dbo].[SIEGE] ([CASTLEID], [SIEGEID], [APPLYBEGINDATE], [APPLYELAPSED], [SIEGEBEGINDATE], [SIEGEELAPSED], [SIEGEENDDATE], [PREVENDDATE], [STATUS], [GUILDID]) VALUES (N'Arthian', CAST(1651730938 AS Decimal(10, 0)), CAST(N'2022-05-07T20:00:58.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(N'2022-05-07T21:00:58.000' AS DateTime), CAST(3453 AS Decimal(10, 0)), CAST(N'2022-05-08T01:58:41.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(4 AS Decimal(10, 0)), N'')
INSERT [dbo].[SIEGE] ([CASTLEID], [SIEGEID], [APPLYBEGINDATE], [APPLYELAPSED], [SIEGEBEGINDATE], [SIEGEELAPSED], [SIEGEENDDATE], [PREVENDDATE], [STATUS], [GUILDID]) VALUES (N'Drayger', CAST(1651730938 AS Decimal(10, 0)), CAST(N'2022-05-07T20:00:58.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(N'2022-05-07T21:00:58.000' AS DateTime), CAST(3453 AS Decimal(10, 0)), CAST(N'2022-05-08T01:58:41.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(4 AS Decimal(10, 0)), N'')
INSERT [dbo].[SIEGE] ([CASTLEID], [SIEGEID], [APPLYBEGINDATE], [APPLYELAPSED], [SIEGEBEGINDATE], [SIEGEELAPSED], [SIEGEENDDATE], [PREVENDDATE], [STATUS], [GUILDID]) VALUES (N'Inflame', CAST(1651730938 AS Decimal(10, 0)), CAST(N'2022-05-07T20:00:58.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(N'2022-05-07T21:00:58.000' AS DateTime), CAST(3453 AS Decimal(10, 0)), CAST(N'2022-05-08T01:58:41.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(4 AS Decimal(10, 0)), N'')
INSERT [dbo].[SIEGE] ([CASTLEID], [SIEGEID], [APPLYBEGINDATE], [APPLYELAPSED], [SIEGEBEGINDATE], [SIEGEELAPSED], [SIEGEENDDATE], [PREVENDDATE], [STATUS], [GUILDID]) VALUES (N'Rensphere', CAST(1651730938 AS Decimal(10, 0)), CAST(N'2022-07-03T23:08:58.000' AS DateTime), CAST(4290808629 AS Decimal(10, 0)), CAST(N'2022-07-03T23:08:58.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(N'2022-06-25T05:07:20.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(2 AS Decimal(10, 0)), N'')
INSERT [dbo].[SIEGE] ([CASTLEID], [SIEGEID], [APPLYBEGINDATE], [APPLYELAPSED], [SIEGEBEGINDATE], [SIEGEELAPSED], [SIEGEENDDATE], [PREVENDDATE], [STATUS], [GUILDID]) VALUES (N'Traqua', CAST(1651730938 AS Decimal(10, 0)), CAST(N'2022-05-07T20:00:58.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(N'2022-05-07T21:00:58.000' AS DateTime), CAST(3453 AS Decimal(10, 0)), CAST(N'2022-05-08T01:58:41.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(4 AS Decimal(10, 0)), N'')
GO
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(1000 AS Decimal(10, 0)), CAST(1268 AS Decimal(10, 0)), CAST(3000000 AS Decimal(10, 0)), N'356000,8822,259800', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(1001 AS Decimal(10, 0)), CAST(1268 AS Decimal(10, 0)), CAST(3000000 AS Decimal(10, 0)), N'341600,8822,259800', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(2000 AS Decimal(10, 0)), CAST(1265 AS Decimal(10, 0)), CAST(1500000 AS Decimal(10, 0)), N'348800,11206,244600', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(3000 AS Decimal(10, 0)), CAST(1269 AS Decimal(10, 0)), CAST(3000000 AS Decimal(10, 0)), N'348800,8822,256100', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(4000 AS Decimal(10, 0)), CAST(1317 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'348800,11205,240000', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(5000 AS Decimal(10, 0)), CAST(1264 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'348800,10425,248800', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(6000 AS Decimal(10, 0)), CAST(1312 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'348800,12915,229800', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(7000 AS Decimal(10, 0)), CAST(1266 AS Decimal(10, 0)), CAST(500000 AS Decimal(10, 0)), N'340000,12396,237800', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(7001 AS Decimal(10, 0)), CAST(1266 AS Decimal(10, 0)), CAST(500000 AS Decimal(10, 0)), N'357600,12396,237800', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(8000 AS Decimal(10, 0)), CAST(1267 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'355400,12395,239400', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(8001 AS Decimal(10, 0)), CAST(1267 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'355400,12378,236200', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(8002 AS Decimal(10, 0)), CAST(1267 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'342200,12391,239400', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(8003 AS Decimal(10, 0)), CAST(1267 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'342200,12390,236200', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(9000 AS Decimal(10, 0)), CAST(1263 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'352600,8201,274800', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(9001 AS Decimal(10, 0)), CAST(1263 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'345000,8091,274800', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(10000 AS Decimal(10, 0)), CAST(1258 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'356000,8133,277600', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(10001 AS Decimal(10, 0)), CAST(1258 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'348800,8248,273000', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Arthian', CAST(10002 AS Decimal(10, 0)), CAST(1258 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'341600,8090,277600', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(1000 AS Decimal(10, 0)), CAST(1268 AS Decimal(10, 0)), CAST(3000000 AS Decimal(10, 0)), N'-361600,4520,-30600', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(1001 AS Decimal(10, 0)), CAST(1268 AS Decimal(10, 0)), CAST(3000000 AS Decimal(10, 0)), N'-347200,4520,-30600', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(2000 AS Decimal(10, 0)), CAST(1265 AS Decimal(10, 0)), CAST(1500000 AS Decimal(10, 0)), N'-354400,6910,-15300', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(3000 AS Decimal(10, 0)), CAST(1269 AS Decimal(10, 0)), CAST(3000000 AS Decimal(10, 0)), N'-354400,4519,-26900', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(4000 AS Decimal(10, 0)), CAST(1317 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'-354400,6909,-10800', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(5000 AS Decimal(10, 0)), CAST(1264 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'-354400,6124,-19600', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(6000 AS Decimal(10, 0)), CAST(1312 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'-354400,8612,-380', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(7000 AS Decimal(10, 0)), CAST(1266 AS Decimal(10, 0)), CAST(500000 AS Decimal(10, 0)), N'-345610,8100,-8600', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(7001 AS Decimal(10, 0)), CAST(1266 AS Decimal(10, 0)), CAST(500000 AS Decimal(10, 0)), N'-363200,8100,-8600', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(8000 AS Decimal(10, 0)), CAST(1267 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'-347800,8096,-10200', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(8001 AS Decimal(10, 0)), CAST(1267 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'-347800,8091,-7000', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(8002 AS Decimal(10, 0)), CAST(1267 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'-361000,8097,-10200', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(8003 AS Decimal(10, 0)), CAST(1267 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'-361000,8092,-7000', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(9000 AS Decimal(10, 0)), CAST(1263 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'-357400,3638,-46800', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(9001 AS Decimal(10, 0)), CAST(1263 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'-351400,3511,-46800', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(10000 AS Decimal(10, 0)), CAST(1258 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'-361600,3572,-48200', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(10001 AS Decimal(10, 0)), CAST(1258 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'-354400,3730,-43800', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Inflame', CAST(10002 AS Decimal(10, 0)), CAST(1258 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'-347200,3428,-48200', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(1000 AS Decimal(10, 0)), CAST(1268 AS Decimal(10, 0)), CAST(3000000 AS Decimal(10, 0)), N'239200,4356,-153400', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(1001 AS Decimal(10, 0)), CAST(1268 AS Decimal(10, 0)), CAST(3000000 AS Decimal(10, 0)), N'253600,4356,-153400', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(2000 AS Decimal(10, 0)), CAST(1265 AS Decimal(10, 0)), CAST(1500000 AS Decimal(10, 0)), N'246400,6737,-138200', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(3000 AS Decimal(10, 0)), CAST(1269 AS Decimal(10, 0)), CAST(3000000 AS Decimal(10, 0)), N'246400,4356,-149700', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(4000 AS Decimal(10, 0)), CAST(1317 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'246400,6729,-133600', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(5000 AS Decimal(10, 0)), CAST(1264 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'246385,5959,-142001', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(6000 AS Decimal(10, 0)), CAST(1312 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'246400,8436,-122800', CAST(0 AS Decimal(10, 0)), CAST(1024 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(7000 AS Decimal(10, 0)), CAST(1266 AS Decimal(10, 0)), CAST(500000 AS Decimal(10, 0)), N'255200,7927,-131400', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(7001 AS Decimal(10, 0)), CAST(1266 AS Decimal(10, 0)), CAST(500000 AS Decimal(10, 0)), N'237633,7927,-131414', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(8000 AS Decimal(10, 0)), CAST(1267 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'253000,7923,-133000', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(8001 AS Decimal(10, 0)), CAST(1267 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'253032,7921,-129814', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(8002 AS Decimal(10, 0)), CAST(1267 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'239800,7927,-133000', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(8003 AS Decimal(10, 0)), CAST(1267 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), N'239832,7920,-129814', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(9000 AS Decimal(10, 0)), CAST(1263 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'242600,3336,-168400', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(9001 AS Decimal(10, 0)), CAST(1263 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'250400,3399,-168400', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(10000 AS Decimal(10, 0)), CAST(1258 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'239200,3295,-171000', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(10001 AS Decimal(10, 0)), CAST(1258 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'246400,3229,-166800', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
INSERT [dbo].[SIEGEOBJECT] ([CASTLEID], [OBJECTNO], [TID], [HP], [POS], [STATUS], [SPECIALSTATUS]) VALUES (N'Traqua', CAST(10002 AS Decimal(10, 0)), CAST(1258 AS Decimal(10, 0)), CAST(1000000 AS Decimal(10, 0)), N'253600,3350,-171000', CAST(0 AS Decimal(10, 0)), CAST(263168 AS Decimal(10, 0)))
GO
SET IDENTITY_INSERT [dbo].[TblProcLog] ON 

INSERT [dbo].[TblProcLog] ([mNo], [mDBName], [mName], [mParam], [mRegDate]) VALUES (6, N'KAlef2', N'spCerariumSeal', N'@V_ITEMSEQ:11103171726134632, @V_CHARID:바게트, @V_ACCOUNTID:ruefulsoul, @V_WORLD:릴리즈', CAST(N'2011-03-17T17:27:54.550' AS DateTime))
INSERT [dbo].[TblProcLog] ([mNo], [mDBName], [mName], [mParam], [mRegDate]) VALUES (7, N'KAlef2', N'spCerariumSeal', N'@V_ITEMSEQ:11103171733034634, @V_CHARID:생크림, @V_ACCOUNTID:ruefulsoul, @V_WORLD:릴리즈', CAST(N'2011-03-17T17:34:44.667' AS DateTime))
INSERT [dbo].[TblProcLog] ([mNo], [mDBName], [mName], [mParam], [mRegDate]) VALUES (8, N'KAlef2', N'spCerariumReleaseSeal', N'@V_ITEMSEQ:11103171726134632, @V_CHARID:슈크림, @V_ACCOUNTID:ruefulsoul, @V_WORLD:릴리즈, @V_SLOT:1', CAST(N'2011-03-17T17:34:52.923' AS DateTime))
INSERT [dbo].[TblProcLog] ([mNo], [mDBName], [mName], [mParam], [mRegDate]) VALUES (9, N'KAlef2', N'spCerariumReleaseSeal', N'@V_ITEMSEQ:11103171733034634, @V_CHARID:슈크림, @V_ACCOUNTID:ruefulsoul, @V_WORLD:릴리즈, @V_SLOT:2', CAST(N'2011-03-17T17:34:59.710' AS DateTime))
SET IDENTITY_INSERT [dbo].[TblProcLog] OFF
GO
/****** Object:  Index [BAKCHARCASHITEM_PK2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [BAKCHARCASHITEM_PK2] ON [dbo].[BAKCHARCASHITEM]
(
	[CHARSEQ] ASC,
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UCL_BAKCHARCASHITEM_ACCOUNTID]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [UCL_BAKCHARCASHITEM_ACCOUNTID] ON [dbo].[BAKCHARCASHITEM]
(
	[ACCOUNTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [BAKCHARDETAIL_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [BAKCHARDETAIL_IX1] ON [dbo].[BAKCHARDETAIL]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [BAKCHARITEM_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [BAKCHARITEM_IX1] ON [dbo].[BAKCHARITEM]
(
	[CHARSEQ] ASC,
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UCL_BAKCHARITEM_ACCOUNTID]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [UCL_BAKCHARITEM_ACCOUNTID] ON [dbo].[BAKCHARITEM]
(
	[ACCOUNTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [BAKCHARMASTER_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [BAKCHARMASTER_IX1] ON [dbo].[BAKCHARMASTER]
(
	[ACCOUNTID] ASC,
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [BAKCHARMASTER_IX2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [BAKCHARMASTER_IX2] ON [dbo].[BAKCHARMASTER]
(
	[CREATIONDATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [BAKCHARMASTER_IX3]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [BAKCHARMASTER_IX3] ON [dbo].[BAKCHARMASTER]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [BAKCHARSKILL_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [BAKCHARSKILL_IX1] ON [dbo].[BAKCHARSKILL]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [BAKSALESBOARD_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [BAKSALESBOARD_IX1] ON [dbo].[BAKSALESBOARD]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [CASHITEMBUYLIST_IX2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CASHITEMBUYLIST_IX2] ON [dbo].[CASHITEMBUYLIST]
(
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CASHITEMBUYLIST_IX3]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CASHITEMBUYLIST_IX3] ON [dbo].[CASHITEMBUYLIST]
(
	[ACCOUNTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CASHITEMBUYLIST_IX4]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CASHITEMBUYLIST_IX4] ON [dbo].[CASHITEMBUYLIST]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CERARIUM_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [CERARIUM_IX1] ON [dbo].[CERARIUM]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [CERARIUM_CHARCASHITEM_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CERARIUM_CHARCASHITEM_IX1] ON [dbo].[CERARIUM_CHARCASHITEM]
(
	[cItemSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CERARIUM_CHARCASHITEM_IX2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CERARIUM_CHARCASHITEM_IX2] ON [dbo].[CERARIUM_CHARCASHITEM]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CERARIUM_CHARDETAIL_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [CERARIUM_CHARDETAIL_IX1] ON [dbo].[CERARIUM_CHARDETAIL]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [CERARIUM_CHARITEM_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CERARIUM_CHARITEM_IX1] ON [dbo].[CERARIUM_CHARITEM]
(
	[cItemSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CERARIUM_CHARITEM_IX2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CERARIUM_CHARITEM_IX2] ON [dbo].[CERARIUM_CHARITEM]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CERARIUM_CHARMASTER_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [CERARIUM_CHARMASTER_IX1] ON [dbo].[CERARIUM_CHARMASTER]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CERARIUM_CHARQUEST_IX2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CERARIUM_CHARQUEST_IX2] ON [dbo].[CERARIUM_CHARQUEST]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CERARIUM_CHARSKILL_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [CERARIUM_CHARSKILL_IX1] ON [dbo].[CERARIUM_CHARSKILL]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CERARIUM_CHARTITLE_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CERARIUM_CHARTITLE_IX1] ON [dbo].[CERARIUM_CHARTITLE]
(
	[CharID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CERARIUM_MAILBOX_IX2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CERARIUM_MAILBOX_IX2] ON [dbo].[CERARIUM_MAILBOX]
(
	[TOCHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CHARCASHITEM_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CHARCASHITEM_IX1] ON [dbo].[CHARCASHITEM]
(
	[ACCOUNTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CHARCASHITEM_PK2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [CHARCASHITEM_PK2] ON [dbo].[CHARCASHITEM]
(
	[CHARID] ASC,
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CHARITEM_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CHARITEM_IX1] ON [dbo].[CHARITEM]
(
	[CHARID] ASC,
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CHARITEM_IX2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CHARITEM_IX2] ON [dbo].[CHARITEM]
(
	[ACCOUNTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CHARMASTER_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CHARMASTER_IX1] ON [dbo].[CHARMASTER]
(
	[ACCOUNTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [CHARMASTER_IX2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CHARMASTER_IX2] ON [dbo].[CHARMASTER]
(
	[CREATIONDATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [CHARQUEST_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [CHARQUEST_IX1] ON [dbo].[CHARQUEST]
(
	[QUESTTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GUILDITEM_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [GUILDITEM_IX1] ON [dbo].[GUILDITEM]
(
	[GUILDID] ASC,
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GUILDMASTER_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [GUILDMASTER_IX1] ON [dbo].[GUILDMASTER]
(
	[GMCHARID] ASC,
	[GUILDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GUILDMEMBER_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [GUILDMEMBER_IX1] ON [dbo].[GUILDMEMBER]
(
	[GUILDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [MAILBOX_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [MAILBOX_IX1] ON [dbo].[MAILBOX]
(
	[TOCHARID] ASC,
	[WDATE] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [MAILBOX_IX2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [MAILBOX_IX2] ON [dbo].[MAILBOX]
(
	[FROMCHARID] ASC,
	[WDATE] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [SALESBOARD_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [SALESBOARD_IX1] ON [dbo].[SALESBOARD]
(
	[ITEMTID] ASC,
	[DOCID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [SALESBOARD_IX2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [SALESBOARD_IX2] ON [dbo].[SALESBOARD]
(
	[ITEMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SALESBOARD_IX3]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [SALESBOARD_IX3] ON [dbo].[SALESBOARD]
(
	[CHARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [SALESBOUGHT_IX1]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [SALESBOUGHT_IX1] ON [dbo].[SALESBOUGHT]
(
	[DOCID] ASC,
	[BUYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SALESBOUGHT_IX2]    Script Date: 5/8/2022 8:47:02 PM ******/
CREATE NONCLUSTERED INDEX [SALESBOUGHT_IX2] ON [dbo].[SALESBOUGHT]
(
	[BUYCHARID] ASC,
	[BUYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CHARSKILLEQUIP] ADD  CONSTRAINT [DF__CHARSKILL__REMAI__3A81B327]  DEFAULT ((0)) FOR [REMAINTIME]
GO
ALTER TABLE [dbo].[CHARSKILLEQUIP] ADD  CONSTRAINT [DF__CHARSKILL__EXPIR__3B75D760]  DEFAULT (getdate()) FOR [EXPIREDATE]
GO
ALTER TABLE [dbo].[SALESBOARD] ADD  CONSTRAINT [DF__SALESBOAR__WDATE__3C69FB99]  DEFAULT (getdate()) FOR [WDATE]
GO
ALTER TABLE [dbo].[TblProcLog] ADD  CONSTRAINT [DF__TblProcLo__mRegD__44CA3770]  DEFAULT (getdate()) FOR [mRegDate]
GO
/****** Object:  StoredProcedure [dbo].[spAttendanceCheck]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
declare @v_code int 
exec spAttendanceCheck 1,2,'009','Brumhart','Yayaya', @V_CODE OUTPUT
select @v_code

*/
CREATE PROCEDURE
	[dbo].[spAttendanceCheck]( @V_EVENTID DECIMAL(20),@V_TYPE DECIMAL(20),@V_ACCOUNTID VARCHAR(32),@V_WORLD VARCHAR(20),@V_CHARID VARCHAR(32), @V_CODE DECIMAL(20) OUTPUT )
	
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	DECLARE	@V_DUP		VARCHAR(5);
	DECLARE @V_NUM		INT;
	DECLARE @V_STARTDATE	VARCHAR(50);
	DECLARE @V_ENDDATE	VARCHAR(50);
	DECLARE @V_DATE		VARCHAR(50);

	SET @V_NUM = 0;
	SET @V_CODE = 0;

	-- 금일 날짜 뽑기 

	SET @V_STARTDATE = convert(varchar(30),getdate(),111)
	SET @V_STARTDATE = @V_STARTDATE + ' 00:00:00';

	SET @V_ENDDATE = convert(varchar(30),getdate(),111)
	SET @V_ENDDATE = @V_ENDDATE + ' 23:59:59';

	-- ACCOUNTID 가 있는지 검사 
	SET @V_CODE = -1;
	-- accountid 는 1개 이상 나올수 있다
	SELECT @V_NUM = count(*) FROM dbo.CHARMASTER WHERE ACCOUNTID = @V_ACCOUNTID;
	IF @V_NUM = 0
	BEGIN
		--RAISERROR('ERROR', 11, 1);
		RETURN
	END

	-- CHARID가 있는지 검사 
	SET @V_CODE = -2;

	SELECT @V_DUP = 'Y' FROM dbo.CHARMASTER WHERE CHARID = @V_CHARID;
	IF @@ROWCOUNT = 0 
	BEGIN
		--RAISERROR('ERROR', 11, 2);
		RETURN
	END
	

	-- 전 월드 계정 출석여부 검사 
	IF @V_TYPE = 2
	BEGIN
		SET @V_CODE = 2;
		SET @V_NUM =0;
		SELECT @V_NUM = count(*) FROM ARCH_KWEBARCH.DBO.TblAttendanceCheck WHERE ACCOUNTID = @V_ACCOUNTID
			AND WDATE >= @V_STARTDATE
			AND WDATE <= @V_ENDDATE
			AND EVENTID = @V_EVENTID
			AND TYPE = @V_TYPE
			; 
		IF @V_NUM > 0
		BEGIN
			--RAISERROR('ERROR', 11, 3);
			RETURN
		END
			
	END;

	ELSE IF @V_TYPE = 3
	BEGIN
		SET @V_CODE = 2;
		SET @V_NUM =0;
		SELECT @V_NUM = count(*) FROM ARCH_KWEBARCH.DBO.TblAttendanceCheck WHERE ACCOUNTID = @V_ACCOUNTID AND WORLD = @V_WORLD
			AND WDATE >= @V_STARTDATE
			AND WDATE <= @V_ENDDATE
			AND EVENTID = @V_EVENTID
			AND TYPE = @V_TYPE
			; 
		IF @V_NUM > 0
		BEGIN
			--RAISERROR('ERROR', 11, 4);
			RETURN
		END
			
	END;

	ELSE IF @V_TYPE = 1
	BEGIN
		SET @V_CODE = 2;
		SET @V_NUM =0;
		SELECT @V_NUM = count(*) FROM ARCH_KWEBARCH.DBO.TblAttendanceCheck WHERE ACCOUNTID = @V_ACCOUNTID AND CHARID = @V_CHARID AND WORLD = @V_WORLD
			AND WDATE >= @V_STARTDATE
			AND WDATE <= @V_ENDDATE
			AND EVENTID = @V_EVENTID
			AND TYPE = @V_TYPE
			; 
		IF @V_NUM > 0
		BEGIN
			--RAISERROR('ERROR', 11, 5);
			RETURN
		END
			
	END;

	ELSE
	BEGIN
		SET @V_CODE =-3;
		BEGIN
			--RAISERROR('ERROR', 11, 6);
			RETURN
		END
			
	END;


	-- TblAttendanceCheck 에 로그기록
	SET @V_CODE = -4;
	INSERT INTO ARCH_KWEBARCH.DBO.TblAttendanceCheck ( eventid,type,accountid,world,charid,wdate )
	VALUES ( @V_EVENTID,@V_TYPE,@V_ACCOUNTID,@V_WORLD,@V_CHARID,GETDATE() );
	IF @@ROWCOUNT = 0
	BEGIN	
		--RAISERROR('ERROR', 11, 7);
		RETURN
	END

	-- SUCCESS
	SET @V_CODE = 1;
	

GO
/****** Object:  StoredProcedure [dbo].[spCashItemExtend]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE	[dbo].[spCashItemExtend](
		@V_TIME		INT,
		@V_oTIME	INT OUT,
		@V_RESULT	INT OUT 
	)
AS
	SET @V_oTIME = 0;
	SET @V_RESULT = 0;

	UPDATE 
		CHARCASHITEM SET EXPIREDATE = DATEADD(mi,@V_TIME,EXPIREDATE)
	WHERE ITEMTID IN (
		SELECT ITEMTID
		FROM ARCH_KWEBARCH.dbo.CASHITEM_EXTEND
	) and inuse = 1;

	SET @V_RESULT = 1;
	SET @V_oTIME = @V_TIME;



GO
/****** Object:  StoredProcedure [dbo].[spCerariumLoad]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*********************************************************************************************								
**		Desc: 캐릭터 봉인 요약정보 불러오기						
**		Auth:						
**		Date:						
**********************************************************************************************								
**		Change History						
**********************************************************************************************								
**		Date:		Author:	       Description:			
**		--------	--------       -----------------------------------------------					
**		2009-04-15	soundkey	처음생성				
*********************************************************************************************/								

CREATE PROCEDURE [dbo].[spCerariumLoad](@V_ITEMSEQ DECIMAL(20),@V_CHARID VARCHAR(47) OUT,@V_CHARTID DECIMAL(10) OUT,@V_LV DECIMAL(3) OUT,@V_EXP DECIMAL(20) OUT )
AS
	DECLARE	@V_CHARSEQ		DECIMAL(20);
	DECLARE	@V_DUP			VARCHAR(50);
	DECLARE @V_DATE			DATETIME;
BEGIN
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	/* 초기화 */							
	SET @V_CHARID	= '';						
	SET @V_CHARTID	= 0;						
	SET @V_LV		= 0;					
	SET @V_EXP		= 0;					
	
	SELECT							
			@V_CHARID = CHARID
		,	@V_CHARTID = CHARTID
		,	@V_LV = LV
		,	@V_EXP = EXP						
	FROM CERARIUM WHERE cItemSEQ = @V_ITEMSEQ;							
	IF @@ROWCOUNT = 0
	BEGIN
		--RAISERROR('ERROR', 11, 1);
		RETURN
	END
END


GO
/****** Object:  StoredProcedure [dbo].[spCerariumReleaseSeal]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*********************************************************************************************
**		Desc: 캐릭터 봉인풀기
**		Auth:
**		Date:
DECLARE @RC int
DECLARE @V_ITEMSEQ decimal(20,0)
DECLARE @V_CHARID varchar(47)
DECLARE @V_RESULT decimal(10,0)

-- TODO: 여기에서 매개 변수 값을 설정합니다.

EXECUTE @RC = Arch_KAlef2.dbo.spCerariumReleaseSeal_dev 
   9007199635788447
  ,'10점만점에10점'
  ,@V_RESULT OUTPUT
GO

**********************************************************************************************
**		Change History
**********************************************************************************************
**		Date:		Author:	       Description:
**		--------	--------       -----------------------------------------------
**		2009-04-15	soundkey	처음생성
**		2009-06-02	soundkey	통합월드 오류 관련 v_world 변경
**		2009-10-13	soundkey	CHARTITLE 추가
**		2009.12.10	soundkey	cerarium_chardetail HEROICPOINT 추가
**		2011.02.11	soundkey	mailbox mailseq 삭제
**		2011.03.09	soundkey	입력파라미터 로그 추가
*********************************************************************************************/
CREATE PROCEDURE
	[dbo].[spCerariumReleaseSeal](@V_ITEMSEQ DECIMAL(20), @V_CHARID VARCHAR(47), @V_RESULT DECIMAL(10) OUT)
AS
	DECLARE @V_DUP			VARCHAR(1);
	DECLARE @V_SLOT			DECIMAL(1,0);
	DECLARE @V_SLOTFLAG		CHAR(1);
	DECLARE @V_ACCOUNTID	VARCHAR(32);
	DECLARE @V_WORLD		VARCHAR(20);
	DECLARE @V_CHARID_TO	VARCHAR(47);
	DECLARE @V_SECTION		VARCHAR(10);
	
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	SET @V_SLOT = -1;
	SET @V_SLOTFLAG = 'N';

	/* 봉인캐릭터 찾기 */

	SET @V_RESULT = 2;

	SELECT @V_CHARID_TO = CHARID FROM DBO.CERARIUM WHERE cItemSEQ = @V_ITEMSEQ;
	IF @@ROWCOUNT = 0
	BEGIN
		--RAISERROR('ERROR', 11, 2);
		RETURN
	END

	/* 봉인해제 캐릭터 정보 얻어오기 */
	SET @V_RESULT = 3;

	SELECT @V_ACCOUNTID = ACCOUNTID, @V_WORLD = WORLD FROM DBO.CHARMASTER WHERE CHARID = @V_CHARID;
	IF @@ROWCOUNT = 0
	BEGIN
		--RAISERROR('ERROR', 11, 3);
		RETURN
	END

	/* 빈 슬롯 찾기*/

	SET @V_RESULT = 4;

	SELECT @V_SLOT = COUNT(*) FROM DBO.CHARMASTER WHERE ACCOUNTID = @V_ACCOUNTID and WORLD = @V_WORLD;
	IF @V_SLOT >= 3   /* 빈 슬롯이 없슴*/
	BEGIN
		--RAISERROR('ERROR', 11, 4);
		RETURN
	END

	-- 입력값 로그 남기기
	DECLARE @mParam VARCHAR(4000)
	DECLARE @mDBName VARCHAR(20)
	DECLARE @mName VARCHAR(50)
	SELECT @mDBName = SUSER_NAME()
	SET @mName = 'spCerariumReleaseSeal'
	SET @mParam = '@V_ITEMSEQ:'+CONVERT(VARCHAR(20),@V_ITEMSEQ)+', @V_CHARID:'+@V_CHARID+', @V_ACCOUNTID:'+@V_ACCOUNTID+', @V_WORLD:'+@V_WORLD+', @V_SLOT:'+CONVERT(VARCHAR(2),@V_SLOT)
	
	INSERT INTO dbo.TblProcLog (mDBName, mName, mParam ) VALUES ( @mDBName, @mName, @mParam );


	SELECT @V_SLOT = SLOT FROM DBO.CHARMASTER WHERE ACCOUNTID = @V_ACCOUNTID and WORLD = @V_WORLD AND SLOT = 0;
	IF @@ROWCOUNT = 0
	BEGIN
		SET @V_SLOT = 0;
		SET @V_SLOTFLAG = 'Y';
	END;

	IF @V_SLOTFLAG = 'N'
	BEGIN
		SELECT @V_SLOT = SLOT FROM DBO.CHARMASTER WHERE ACCOUNTID = @V_ACCOUNTID and WORLD = @V_WORLD AND SLOT = 1;
		IF @@ROWCOUNT = 0
		BEGIN
			SET @V_SLOT = 1;
			SET @V_SLOTFLAG = 'Y';
		END
	END

	IF @V_SLOTFLAG = 'N'
	BEGIN
		SELECT @V_SLOT = SLOT FROM DBO.CHARMASTER WHERE ACCOUNTID = @V_ACCOUNTID and WORLD = @V_WORLD AND SLOT = 2;
		IF @@ROWCOUNT = 0
		BEGIN
			SET @V_SLOT = 2;
			SET @V_SLOTFLAG = 'Y';
		END
	END

	IF @V_SLOTFLAG = 'N'
	BEGIN
		--RAISERROR('ERROR', 11, 4);
		RETURN
	END


	BEGIN TRY
		BEGIN TRANSACTION;
		
		SET @V_RESULT = -1;

		/* CHARMASTER */
		INSERT INTO DBO.CHARMASTER (
			CHARID,OLDCHARID,WORLD,ACCOUNTID,SLOT,CHARTID,CREATIONDATE)
		SELECT
			CHARID,OLDCHARID,@V_WORLD,@V_ACCOUNTID,@V_SLOT,CHARTID,CREATIONDATE
		FROM DBO.CERARIUM_CHARMASTER WHERE cItemSEQ = @V_ITEMSEQ;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		/* CHARDETAIL */
		INSERT INTO DBO.CHARDETAIL (
			CHARID,TITLE,POS,CRIMINALSTATUS,MURDERPOINT,RCFTIME,RMFTIME,
			INVENMONEY,HP,MP,SP,EXP,LV,SKILLPOINT,QUICKBELT,
			LATESTREGION,FLAG,STATUS,RESURRECTDATE,TRANSFORMDATE,CURCONNDATE,LASTVISITDATE,
			LASTVISITIP,HAIR,FACE,DEADTYPE,FLAG2,FLAG3,CHARISMAPOINT,NICKNAME,COOLDOWN,HEROICPOINT )
		SELECT
			CHARID,TITLE,POS,CRIMINALSTATUS,MURDERPOINT,RCFTIME,RMFTIME,
			INVENMONEY,HP,MP,SP,EXP,LV,SKILLPOINT,QUICKBELT,
			LATESTREGION,FLAG,STATUS,RESURRECTDATE,TRANSFORMDATE,CURCONNDATE,LASTVISITDATE,
			LASTVISITIP,HAIR,FACE,DEADTYPE,FLAG2,FLAG3,CHARISMAPOINT,NICKNAME,COOLDOWN,HEROICPOINT
		FROM DBO.CERARIUM_CHARDETAIL WHERE cItemSEQ = @V_ITEMSEQ;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		/* CHARITEM BACKUP */
		INSERT INTO DBO.CHARITEM	(
			ACCOUNTID,WORLD,ITEMSEQ,CHARID,ITEMTID,STACKCOUNT,STATUS,POS,NEEDLEVEL,OWNTIME,CONVHIST,
			DURABILITY,FLAG,OPT,INUSE,USECOUNT,REMAINTIME,EXPIREDATE,MAXDUR,SKILLPLUS,STAMINAREMAINTIME )
		SELECT
			@V_ACCOUNTID,@V_WORLD,ITEMSEQ,CHARID,ITEMTID,STACKCOUNT,STATUS,POS,NEEDLEVEL,OWNTIME,CONVHIST,
			DURABILITY,FLAG,OPT,INUSE,USECOUNT,REMAINTIME,EXPIREDATE,MAXDUR,SKILLPLUS,STAMINAREMAINTIME
		FROM DBO.CERARIUM_CHARITEM WHERE cItemSEQ = @V_ITEMSEQ;

		/* CHARCASHITEM BACKUP */
		INSERT INTO DBO.CHARCASHITEM	(
			ACCOUNTID,WORLD,ITEMSEQ,CHARID,ITEMTID,STACKCOUNT,STATUS,POS,NEEDLEVEL,OWNTIME,CONVHIST,
			DURABILITY,FLAG,OPT,INUSE,USECOUNT,REMAINTIME,EXPIREDATE,MAXDUR,SKILLPLUS,STAMINAREMAINTIME )
		SELECT
			@V_ACCOUNTID,@V_WORLD,ITEMSEQ,CHARID,ITEMTID,STACKCOUNT,STATUS,POS,NEEDLEVEL,OWNTIME,CONVHIST,
			DURABILITY,FLAG,OPT,INUSE,USECOUNT,REMAINTIME,EXPIREDATE,MAXDUR,SKILLPLUS,STAMINAREMAINTIME
		FROM DBO.CERARIUM_CHARCASHITEM WHERE cItemSEQ = @V_ITEMSEQ;

		/* CHARSKILL BACKUP */
		INSERT INTO DBO.CHARSKILL ( CHARID, SKILLSEQ, PRODUCT )
		SELECT CHARID, SKILLSEQ, PRODUCT
		FROM DBO.CERARIUM_CHARSKILL WHERE cItemSEQ = @V_ITEMSEQ;

		/* CHARQUEST BACKUP */
		INSERT INTO DBO.CHARQUEST ( CHARID, QUESTTID,SDATE,ARG1,ARG2,NPCID )
		SELECT CHARID, QUESTTID, SDATE, ARG1, ARG2, NPCID
		FROM DBO.CERARIUM_CHARQUEST WHERE cItemSEQ = @V_ITEMSEQ;

		/* CHARTITLE */
		INSERT INTO DBO.CHARTITLE ( 
			CharID,mTitleTid,mIsComplete,mIsEquip,mValue1,mValue2,mValue3,mValue4,mValue5,
			mDateAccept,mDateComplete,mDateEquip )
		SELECT 
			CharID,mTitleTid,mIsComplete,mIsEquip,mValue1,mValue2,mValue3,mValue4,mValue5,
			mDateAccept,mDateComplete,mDateEquip
		FROM DBO.CERARIUM_CHARTITLE WHERE cItemSEQ = @V_ITEMSEQ;

		/* MAILBOX BACKUP */
		-- 2011.02.11 soundkey mailseq 삭제
		/*
		INSERT INTO DBO.MAILBOX (MAILSEQ,TOCHARID,FROMCHARID,SUBJECT,CONTENTS,WDATE,FLAG,ITEMSEQ,ITEMTID,ITEMQTY)
		SELECT MAILSEQ,TOCHARID,FROMCHARID,SUBJECT,CONTENTS,WDATE,FLAG,ITEMSEQ,ITEMTID,ITEMQTY
		FROM DBO.CERARIUM_MAILBOX WHERE cItemSEQ = @V_ITEMSEQ;
		*/
		INSERT INTO DBO.MAILBOX (TOCHARID,FROMCHARID,SUBJECT,CONTENTS,WDATE,FLAG,ITEMSEQ,ITEMTID,ITEMQTY)
		SELECT TOCHARID,FROMCHARID,SUBJECT,CONTENTS,WDATE,FLAG,ITEMSEQ,ITEMTID,ITEMQTY
		FROM DBO.CERARIUM_MAILBOX WHERE cItemSEQ = @V_ITEMSEQ;

		SET @V_RESULT = -2;

		/* DELETE 봉인캐릭터 */

		DELETE FROM DBO.CERARIUM WHERE cItemSEQ = @V_ITEMSEQ;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		DELETE FROM DBO.CERARIUM_CHARMASTER WHERE cItemSEQ = @V_ITEMSEQ;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		DELETE FROM DBO.CERARIUM_CHARDETAIL WHERE cItemSEQ = @V_ITEMSEQ;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		/* 아이템이나 스킬은 삭제된 로우가 하나도 없어도 무시한다. */

		/* 아이템 */
		DELETE FROM DBO.CERARIUM_CHARITEM WHERE cItemSEQ = @V_ITEMSEQ;

		DELETE FROM DBO.CERARIUM_CHARCASHITEM WHERE cItemSEQ = @V_ITEMSEQ;

		/* 스킬 */
		DELETE FROM DBO.CERARIUM_CHARSKILL WHERE cItemSEQ = @V_ITEMSEQ;

		/* 퀘스트 */
		DELETE FROM DBO.CERARIUM_CHARQUEST WHERE cItemSEQ = @V_ITEMSEQ;

		/* 타이틀 */
		DELETE FROM DBO.CERARIUM_CHARTITLE WHERE cItemSEQ = @V_ITEMSEQ;

		/* 메일 박스 */
		DELETE FROM DBO.CERARIUM_MAILBOX WHERE cItemSEQ = @V_ITEMSEQ;

		SET @V_RESULT = -3;

		/* 월드매핑 정보 */

		SELECT @V_SECTION = SECTION FROM Arch_KWebarch.dbo.amt_worldmapping
		WHERE ACCOUNTID = @V_ACCOUNTID AND WORLD = @V_WORLD AND CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		INSERT INTO Arch_KWebarch.dbo.AMT_WORLDMAPPING (ACCOUNTID,SECTION,WORLD,CHARID,CREATIONDATE)
		VALUES (@V_ACCOUNTID,@V_SECTION,@V_WORLD,@V_CHARID_TO,GETDATE());
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;

	
		COMMIT TRANSACTION;
		SET @V_RESULT = 1;
		
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;
	END CATCH;

END


GO
/****** Object:  StoredProcedure [dbo].[spCerariumSeal]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*********************************************************************************************
**		Desc: 캐릭터 봉인
**		Auth:
**		Date:
**********************************************************************************************
**		Change History
**********************************************************************************************
**		Date:		Author:	       Description:
**		--------	--------       -----------------------------------------------
**		2009-04-15	soundkey	처음생성
**		2009-10-13	soundkey	CHARTITLE 추가
**		2009.12.10	soundkey	cerarium_chardetail HEROICPOINT 추가
**		2011.03.09	soundkey	입력파라미터 로그 추가
*********************************************************************************************/
CREATE PROCEDURE
	[dbo].[spCerariumSeal](@V_ITEMSEQ DECIMAL(20), @V_CHARID VARCHAR(47), @V_RESULT DECIMAL(10) OUT)
AS
	DECLARE @V_DUP		VARCHAR(1);
	DECLARE @V_ACCOUNTID	VARCHAR(32);
	DECLARE @V_WORLD		VARCHAR(20);
	
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	/* 해당 캐릭터 아이디로 로우 선택 */
	SET @V_RESULT = 2;
	SELECT @V_DUP = CHARID FROM dbo.CHARMASTER WHERE CHARID = @V_CHARID;
	IF @@ROWCOUNT = 0
	BEGIN
		--RAISERROR('ERROR', 11, 2);
		RETURN
	END

	SELECT @V_DUP = CHARID FROM dbo.CHARDETAIL WHERE CHARID = @V_CHARID;
	IF @@ROWCOUNT = 0
	BEGIN
		--RAISERROR('ERROR', 11, 2);
		RETURN
	END

	/* 길드멤버이면 봉인불가능 */
	SET @V_RESULT = 3;
	SELECT @V_DUP = CHARID FROM dbo.GUILDMEMBER WHERE CHARID = @V_CHARID;
	IF @@ROWCOUNT > 0
	BEGIN
		--RAISERROR('ERROR', 11, 3);
		RETURN
	END
	
	/* 거래게시판에 아이템이 있으면 봉인불가 */
	SET @V_RESULT = 4;
	SELECT @V_DUP = CHARID FROM dbo.SALESBOARD WHERE CHARID = @V_CHARID;
	IF @@ROWCOUNT > 0
	BEGIN	
		--RAISERROR('ERROR', 11, 4);
		RETURN
	END
	
	SET @V_RESULT = 5;
	SELECT @V_ACCOUNTID = ACCOUNTID, @V_WORLD = WORLD FROM dbo.CHARMASTER WHERE CHARID = @V_CHARID;
	IF @@ROWCOUNT = 0
	BEGIN		
		--RAISERROR('ERROR', 11, 2);
		RETURN
	END
	
	-- 입력값 로그 남기기
	DECLARE @mParam VARCHAR(4000)
	DECLARE @mDBName VARCHAR(20)
	DECLARE @mName VARCHAR(50)
	SELECT @mDBName = SUSER_NAME()
	SET @mName = 'spCerariumSeal'
	SET @mParam = '@V_ITEMSEQ:'+CONVERT(VARCHAR(20),@V_ITEMSEQ)+', @V_CHARID:'+@V_CHARID+', @V_ACCOUNTID:'+@V_ACCOUNTID+', @V_WORLD:'+@V_WORLD
	
	INSERT INTO dbo.TblProcLog (mDBName, mName, mParam ) VALUES ( @mDBName, @mName, @mParam );


	BEGIN TRY
		BEGIN TRANSACTION;

		SET @V_RESULT = -1;
		/* CERARIUM BACKUP*/
		INSERT INTO CERARIUM (
			cItemSEQ ,CHARID,CHARTID,LV,EXP,cDATE)
		SELECT
			@V_ITEMSEQ,A.CHARID,A.CHARTID,B.LV,B.EXP,GETDATE()
		FROM CHARMASTER A, CHARDETAIL B WHERE A.CHARID = B.CHARID AND A.CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		/* CHARMASTER BACKUP */
		INSERT INTO CERARIUM_CHARMASTER (
			cItemSEQ ,CHARID,OLDCHARID,WORLD,ACCOUNTID,SLOT,CHARTID,CREATIONDATE,cDATE)
		SELECT
			@V_ITEMSEQ,CHARID,OLDCHARID,WORLD,ACCOUNTID,SLOT,CHARTID,CREATIONDATE,GETDATE()
		FROM CHARMASTER WHERE CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		SET @V_RESULT = -2;
		/* CHARDETAIL BACKUP */
		INSERT INTO CERARIUM_CHARDETAIL (
			cItemSEQ,CHARID,TITLE,POS,CRIMINALSTATUS,MURDERPOINT,RCFTIME,RMFTIME,
			INVENMONEY,HP,MP,SP,EXP,LV,SKILLPOINT,QUICKBELT,
			LATESTREGION,FLAG,STATUS,RESURRECTDATE,TRANSFORMDATE,CURCONNDATE,LASTVISITDATE,
			LASTVISITIP,HAIR,FACE,DEADTYPE,FLAG2,FLAG3,CHARISMAPOINT,NICKNAME,COOLDOWN,cDATE,HEROICPOINT )
		SELECT
			@V_ITEMSEQ,CHARID,TITLE,POS,CRIMINALSTATUS,MURDERPOINT,RCFTIME,RMFTIME,
			INVENMONEY,HP,MP,SP,EXP,LV,SKILLPOINT,QUICKBELT,
			LATESTREGION,FLAG,STATUS,RESURRECTDATE,TRANSFORMDATE,CURCONNDATE,LASTVISITDATE,
			LASTVISITIP,HAIR,FACE,DEADTYPE,FLAG2,FLAG3,CHARISMAPOINT,NICKNAME,COOLDOWN,GETDATE(),HEROICPOINT
		FROM CHARDETAIL WHERE CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		/* CHARITEM BACKUP */
		INSERT INTO CERARIUM_CHARITEM	(
			cItemSEQ,ACCOUNTID,WORLD,ITEMSEQ,CHARID,ITEMTID,STACKCOUNT,STATUS,POS,NEEDLEVEL,OWNTIME,CONVHIST,
			DURABILITY,FLAG,OPT,INUSE,USECOUNT,REMAINTIME,EXPIREDATE,MAXDUR,SKILLPLUS,STAMINAREMAINTIME,cDATE )
		SELECT
			@V_ITEMSEQ,ACCOUNTID,WORLD,ITEMSEQ,CHARID,ITEMTID,STACKCOUNT,STATUS,POS,NEEDLEVEL,OWNTIME,CONVHIST,
			DURABILITY,FLAG,OPT,INUSE,USECOUNT,REMAINTIME,EXPIREDATE,MAXDUR,SKILLPLUS,STAMINAREMAINTIME,GETDATE()
		FROM CHARITEM WHERE CHARID = @V_CHARID AND STATUS < 100;	/* 뱅크아이템 제외 */

		/* CHARCASHITEM BACKUP */
		INSERT INTO CERARIUM_CHARCASHITEM	(
			cItemSEQ,ACCOUNTID,WORLD,ITEMSEQ,CHARID,ITEMTID,STACKCOUNT,STATUS,POS,NEEDLEVEL,OWNTIME,CONVHIST,
			DURABILITY,FLAG,OPT,INUSE,USECOUNT,REMAINTIME,EXPIREDATE,MAXDUR,SKILLPLUS,STAMINAREMAINTIME,cDATE )
		SELECT
			@V_ITEMSEQ,ACCOUNTID,WORLD,ITEMSEQ,CHARID,ITEMTID,STACKCOUNT,STATUS,POS,NEEDLEVEL,OWNTIME,CONVHIST,
			DURABILITY,FLAG,OPT,INUSE,USECOUNT,REMAINTIME,EXPIREDATE,MAXDUR,SKILLPLUS,STAMINAREMAINTIME,GETDATE()
		FROM CHARCASHITEM WHERE CHARID = @V_CHARID;

		/* CHARSKILL BACKUP */
		INSERT INTO CERARIUM_CHARSKILL (cItemSEQ, CHARID, SKILLSEQ, PRODUCT,cDATE)
		SELECT @V_ITEMSEQ, CHARID, SKILLSEQ, PRODUCT, GETDATE()
		FROM CHARSKILL WHERE CHARID = @V_CHARID;

		/* CHARQUEST BACKUP */
		INSERT INTO CERARIUM_CHARQUEST (cItemSEQ, CHARID, QUESTTID,SDATE,ARG1,ARG2,NPCID,cDATE)
		SELECT @V_ITEMSEQ, CHARID, QUESTTID, SDATE, ARG1, ARG2, NPCID, GETDATE()
		FROM CHARQUEST WHERE CHARID = @V_CHARID;

		/* CHARTITLE BACKUP */
		INSERT INTO CERARIUM_CHARTITLE (
			cItemSEQ,CharID,mTitleTid,mIsComplete,mIsEquip,mValue1,mValue2,mValue3,mValue4,mValue5,
			mDateAccept,mDateComplete,mDateEquip,cDate )
		SELECT 
			@V_ITEMSEQ,CharID,mTitleTid,mIsComplete,mIsEquip,mValue1,mValue2,mValue3,mValue4,mValue5,
			mDateAccept,mDateComplete,mDateEquip,GETDATE() 
		FROM CHARTITLE WHERE CHARID = @V_CHARID;

		/* MAILBOX BACKUP */
		INSERT INTO CERARIUM_MAILBOX (
			cItemSEQ,MAILSEQ,TOCHARID,FROMCHARID,SUBJECT,CONTENTS,WDATE,FLAG,ITEMSEQ,ITEMTID,ITEMQTY,cDATE)
		SELECT
			@V_ITEMSEQ,MAILSEQ,TOCHARID,FROMCHARID,SUBJECT,CONTENTS,WDATE,FLAG,ITEMSEQ,ITEMTID,ITEMQTY,GETDATE()
		FROM MAILBOX WHERE TOCHARID = @V_CHARID;
		
		SET @V_RESULT = -3;
		/* DELETE SOURCE */
		DELETE FROM CHARMASTER WHERE CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		DELETE FROM CHARDETAIL WHERE CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		/* 아이템이나 스킬은 삭제된 로우가 하나도 없어도 무시한다. */

		/* 아이템 */
		DELETE FROM CHARITEM WHERE CHARID = @V_CHARID AND STATUS < 100;		/* 뱅크아이템 제외 */
		DELETE FROM CHARCASHITEM WHERE CHARID = @V_CHARID;

		/* 스킬 */
		DELETE FROM CHARSKILL WHERE CHARID = @V_CHARID;
		/* 스킬Equip */
		DELETE FROM CHARSKILLEQUIP WHERE CHARID = @V_CHARID;
		/* 퀘스트 */
		DELETE FROM CHARQUEST WHERE CHARID = @V_CHARID;
		/* 타이틀 */
		DELETE FROM CHARTITLE WHERE CHARID = @V_CHARID;
		/* 거래게시판 등록 물품 */
		DELETE FROM SALESBOARD WHERE CHARID = @V_CHARID;
		/* 메일 박스 */
		DELETE FROM MAILBOX WHERE TOCHARID = @V_CHARID;
		/* 버디 */
		DELETE FROM CHARBUDDY WHERE CHARID = @V_CHARID;
		
		SET @V_RESULT = -4;
		/* 월드매핑정보 삭제 */
		DELETE FROM Arch_KWebarch.dbo.amt_worldmapping
		WHERE ACCOUNTID = @V_ACCOUNTID AND WORLD = @V_WORLD AND CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		SET @V_RESULT = 1;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;
	END CATCH;

	
END;


GO
/****** Object:  StoredProcedure [dbo].[spCharacterCreate]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*********************************************************************************************
**		Desc: 
**		Auth: 
**		Date: 
**********************************************************************************************
**		Change History
**********************************************************************************************
**		Date:		Author:	       Description:
**		--------	--------       -----------------------------------------------
**		2009-11-12	soundkey	캐릭터 생성시 중복이름 체크
*********************************************************************************************/

CREATE PROCEDURE
	[dbo].[spCharacterCreate](@V_CHARID VARCHAR(47), @V_CODE INT OUTPUT)
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	DECLARE @v_num	INT;
	SET @v_num = 0;
	SET @V_CODE =1;

	-- CHARID가 있는지 검사 
	SELECT @v_num = count(*) FROM CHARMASTER WHERE CHARID = @V_CHARID;
	if @v_num > 0
		RETURN

	SET @v_num = 0;
	SELECT @v_num = count(*) FROM CHARDETAIL WHERE CHARID = @V_CHARID;
	if @v_num > 0
		RETURN

	SET @v_num = 0;
	SELECT @v_num = count(*) FROM BAKCHARMASTER WHERE CHARID = @V_CHARID;
	if @v_num > 0
		RETURN

	SET @v_num = 0;
	SELECT @v_num = count(*) FROM CERARIUM WHERE CHARID = @V_CHARID;
	if @v_num > 0
		RETURN

	SET @V_CODE =0;



GO
/****** Object:  StoredProcedure [dbo].[SPDELETECASHITEM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE
	[dbo].[SPDELETECASHITEM](@V_ITEMSEQ DECIMAL(20), @V_REASON VARCHAR(32))
AS
BEGIN
SET NOCOUNT ON
	BEGIN TRY
		BEGIN TRANSACTION;

		DELETE FROM dbo.CHARCASHITEM WHERE ITEMSEQ = @V_ITEMSEQ;
		IF @@ROWCOUNT = 0
			RAISERROR('ERROR', 11, 1);

		IF (SUBSTRING(@V_REASON, 1, 8) = 'Drawback')
			UPDATE dbo.CASHITEMBUYLIST SET STATUS = 'DRAWBACK' WHERE ITEMSEQ = @V_ITEMSEQ;
		ELSE
			UPDATE dbo.CASHITEMBUYLIST SET STATUS = 'EXHAUST' WHERE ITEMSEQ = @V_ITEMSEQ;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;	
	END CATCH;
END;



GO
/****** Object:  StoredProcedure [dbo].[SPDELETECHAR]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*********************************************************************************************										
**		Desc: 								
**		Auth: 								
**		Date: 								
**********************************************************************************************										
**		Change History								
**********************************************************************************************										
**		Date:		Author:	       Description:					
**		--------	--------       -----------------------------------------------							
**		2006.02.17			BAKCHARDETAIL에 HAIR, FACE, DEADTYPE 추가					
**						BAKCHARITEM에 WORLD, INUSE, USECOUNT, REMAINTIME, EXPIREDATE 추가				
**						BAKCHARCASHITEM 추가.				
**		2006.03.27			MAXDUR 추가					
**		2007.02.07			skill plus option added					
**		2008.04.30	soundkey	복구대상에 퀘스트 추가, 아이템백업전에 중복아이템 삭제로직 추가						
**		2008.05.22	soundkey	중복캐쉬아이템 삭제 로직 추가						
**		2008.09.19	soundkey	길마 삭제불가능 기능 추가, V_RESULT 성공및 실패값 변경						
**		2008.12.29	soundkey	charskillequip 테이블 삭제 추가						
**		2009.02.24	soundkey	부가서비스를 위한 bakcharmaster flag 컬럼추가						
**		2009.10.13	soundkey	CHARTITLE 추가						
**		2009.12.10	soundkey	bakchardetail CHARISMAPOINT, HEROICPOINT 추가	
**		2010.11.09	soundkey	BAKCHARTITLE 추가						
*********************************************************************************************/										
CREATE PROCEDURE
	[dbo].[SPDELETECHAR](@V_CHARID VARCHAR(32),@V_REASON VARCHAR(50),@V_RESULT DECIMAL(10) OUT )
AS
	DECLARE	@V_CHARSEQ		DECIMAL(20);
	DECLARE	@V_DUP			VARCHAR(50);
	DECLARE @V_DATE			DATETIME;
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	/* 길마이면 삭제불가능 */
	SET @V_RESULT = 2;
	SELECT @V_DUP=GMCHARID FROM dbo.GUILDMASTER WHERE GMCHARID = @V_CHARID;
	IF @@ROWCOUNT > 0
	BEGIN
		--RAISERROR('ERROR', 11, 2);
		RETURN
	END

	/* 생성한지 하루가 지났는지 체크 */
	SET @V_RESULT = 1;
	SELECT /*@@IDENTITY,*/ @V_DATE = CREATIONDATE FROM dbo.CHARMASTER WHERE CHARID = @V_CHARID;
	IF ( GETDATE() < @V_DATE + 1 )
	BEGIN	
		--RAISERROR('ERROR', 11, 1);
		RETURN
	END


	BEGIN TRY
		BEGIN TRANSACTION;

		/* CHARMASTER BACKUP */
		SET @V_RESULT = -2;
		INSERT INTO dbo.BAKCHARMASTER (/*CHARSEQ,*/ CHARID, WORLD, ACCOUNTID, SLOT, CHARTID, CREATIONDATE, DELETIONDATE, FLAG)
		SELECT /*@@IDENTITY,*/ CHARID, WORLD, ACCOUNTID, SLOT, CHARTID, CREATIONDATE, GETDATE(), 3
		FROM dbo.CHARMASTER WHERE CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN
		END;

		

		SET @V_CHARSEQ = @@IDENTITY;

		/* CHARDETAIL BACKUP */
		SET @V_RESULT = -3;
		INSERT INTO dbo.BAKCHARDETAIL (
			CHARSEQ, CHARID, TITLE, POS, CRIMINALSTATUS, MURDERPOINT, RCFTIME, RMFTIME,
			INVENMONEY, HP, MP, SP, EXP, LV, SKILLPOINT, QUICKBELT,
			LATESTREGION, FLAG, STATUS, RESURRECTDATE, TRANSFORMDATE,
			CURCONNDATE, LASTVISITDATE, LASTVISITIP, HAIR, FACE, DEADTYPE, FLAG2, CHARISMAPOINT, HEROICPOINT)
		SELECT
			@V_CHARSEQ, CHARID, TITLE, POS, CRIMINALSTATUS, MURDERPOINT, RCFTIME, RMFTIME,
			INVENMONEY, HP, MP, SP, EXP, LV, SKILLPOINT, QUICKBELT,
			LATESTREGION, FLAG, STATUS, RESURRECTDATE, TRANSFORMDATE,
			CURCONNDATE, LASTVISITDATE, LASTVISITIP, HAIR, FACE, DEADTYPE, FLAG2, CHARISMAPOINT, HEROICPOINT
		FROM dbo.CHARDETAIL C WHERE C.CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN
		END;


		/* 2008/04/30 soundkey -- 삭제된 캐릭터복구후 또 삭제시 중복된 아이템을 먼저 삭제한다*/
		DELETE FROM dbo.BAKCHARITEM WHERE ITEMSEQ IN
			(SELECT ITEMSEQ FROM CHARITEM WHERE CHARID = @V_CHARID);

		/* 2008/05/22 soundkey -- 삭제된 캐릭터복구후 또 삭제시 중복된 아이템을 먼저 삭제한다*/
		DELETE FROM dbo.BAKCHARCASHITEM WHERE ITEMSEQ IN 
			(SELECT ITEMSEQ FROM CHARCASHITEM WHERE CHARID = @V_CHARID);


		/* 아이템이나 스킬은 삭제된 로우가 하나도 없어도 무시한다. */
		/* CHARITEM BACKUP */
		INSERT INTO dbo.BAKCHARITEM	(
			ITEMSEQ, ACCOUNTID, CHARSEQ, CHARID, ITEMTID, STACKCOUNT, STATUS, POS,
			NEEDLEVEL, OWNTIME, CONVHIST, DURABILITY, MAXDUR, FLAG, OPT, SKILLPLUS, REASON, DELTIME,
			WORLD, INUSE, USECOUNT, REMAINTIME, EXPIREDATE, STAMINAREMAINTIME)
		SELECT ITEMSEQ, ACCOUNTID, @V_CHARSEQ, CHARID, ITEMTID, STACKCOUNT, STATUS, POS,
			NEEDLEVEL, OWNTIME, CONVHIST, DURABILITY, MAXDUR, FLAG, OPT, SKILLPLUS, @V_REASON, GETDATE(),
			WORLD, INUSE, USECOUNT, REMAINTIME, EXPIREDATE, STAMINAREMAINTIME
			FROM dbo.CHARITEM WHERE CHARID = @V_CHARID AND STATUS < 100;	/* 뱅크아이템 제외 */

		/* CHARCASHITEM BACKUP */
		INSERT INTO dbo.BAKCHARCASHITEM	(
			ITEMSEQ, ACCOUNTID, CHARSEQ, CHARID, ITEMTID, STACKCOUNT, STATUS, POS,
			NEEDLEVEL, OWNTIME, CONVHIST, DURABILITY, MAXDUR, FLAG, OPT, SKILLPLUS, REASON, DELTIME,
			WORLD, INUSE, USECOUNT, REMAINTIME, EXPIREDATE, STAMINAREMAINTIME )
		SELECT ITEMSEQ, ACCOUNTID, @V_CHARSEQ, CHARID, ITEMTID, STACKCOUNT, STATUS, POS,
			NEEDLEVEL, OWNTIME, CONVHIST, DURABILITY, MAXDUR, FLAG, OPT, SKILLPLUS, @V_REASON, GETDATE(),
			WORLD, INUSE, USECOUNT, REMAINTIME, EXPIREDATE, STAMINAREMAINTIME
			FROM dbo.CHARCASHITEM WHERE CHARID = @V_CHARID;

		/* CHARSKILL BACKUP */
		INSERT INTO dbo.BAKCHARSKILL (CHARSEQ, CHARID, SKILLSEQ, PRODUCT)
		SELECT @V_CHARSEQ, CHARID, SKILLSEQ, PRODUCT
		FROM dbo.CHARSKILL WHERE CHARID = @V_CHARID;

		/* 2008/04/30 soundkey -- 복구대상에 퀘스트추가*/
		/* CHARQUEST BACKUP */
		INSERT INTO dbo.BAKCHARQUEST (CHARSEQ, CHARID, QUESTTID,SDATE,ARG1,ARG2,NPCID)
		SELECT @V_CHARSEQ, CHARID, QUESTTID, SDATE, ARG1, ARG2, NPCID
		FROM dbo.CHARQUEST WHERE CHARID = @V_CHARID;

		/* 2010/11/09 soundkey -- 복구대상에 타이틀추가*/
		/* CHARTITLE BACKUP */
		INSERT INTO dbo.BAKCHARTITLE (CHARSEQ, CharID, mTitleTid, mIsComplete, mIsEquip, mValue1, mValue2, mValue3, mValue4, mValue5, mDateAccept, mDateComplete, mDateEquip)
		SELECT @V_CHARSEQ,CharID, mTitleTid, mIsComplete, mIsEquip, mValue1, mValue2, mValue3, mValue4, mValue5, mDateAccept, mDateComplete, mDateEquip
		FROM dbo.CHARTITLE WHERE CHARID = @V_CHARID;


		/* 캐릭터 */
		SET @V_RESULT = -4;		
		DELETE FROM dbo.CHARMASTER WHERE CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN
		END;


		SET @V_RESULT = -5;
		DELETE FROM dbo.CHARDETAIL WHERE CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN
		END;


		/* 아이템이나 스킬은 삭제된 로우가 하나도 없어도 무시한다. */
		/* 아이템 */
		DELETE FROM dbo.CHARITEM WHERE CHARID = @V_CHARID AND STATUS < 100;		/* 뱅크아이템 제외 */
		DELETE FROM dbo.CHARCASHITEM WHERE CHARID = @V_CHARID;

		/* 스킬 */
		DELETE FROM dbo.CHARSKILL WHERE CHARID = @V_CHARID;				
		/* 스킬equip */
		DELETE FROM dbo.CHARSKILLEQUIP WHERE CHARID = @V_CHARID;				

		/* 퀘스트 */
		DELETE FROM dbo.CHARQUEST WHERE CHARID = @V_CHARID;
		
		/* 타이틀 */
		DELETE FROM dbo.CHARTITLE WHERE CHARID = @V_CHARID;
		
		/* 거래게시판 등록 물품 */
		DELETE FROM dbo.SALESBOARD WHERE CHARID = @V_CHARID;
		/* 메일 박스 */
		DELETE FROM dbo.MAILBOX WHERE TOCHARID = @V_CHARID;
		/* 버디 */
		DELETE FROM dbo.CHARBUDDY WHERE CHARID = @V_CHARID;

		SET @V_RESULT = 0;
		COMMIT TRANSACTION;

	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;
	
	END CATCH;
END;


GO
/****** Object:  StoredProcedure [dbo].[SPDELETECHAR_DEV]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*********************************************************************************************										
**		Desc: 								
**		Auth: 								
**		Date: 								
**********************************************************************************************										
**		Change History								
**********************************************************************************************										
**		Date:		Author:	       Description:					
**		--------	--------       -----------------------------------------------							
**		2006.02.17			BAKCHARDETAIL에 HAIR, FACE, DEADTYPE 추가					
**						BAKCHARITEM에 WORLD, INUSE, USECOUNT, REMAINTIME, EXPIREDATE 추가				
**						BAKCHARCASHITEM 추가.				
**		2006.03.27			MAXDUR 추가					
**		2007.02.07			skill plus option added					
**		2008.04.30	soundkey	복구대상에 퀘스트 추가, 아이템백업전에 중복아이템 삭제로직 추가						
**		2008.05.22	soundkey	중복캐쉬아이템 삭제 로직 추가						
**		2008.09.19	soundkey	길마 삭제불가능 기능 추가, V_RESULT 성공및 실패값 변경						
**		2008.12.29	soundkey	charskillequip 테이블 삭제 추가						
**		2009.02.24	soundkey	부가서비스를 위한 bakcharmaster flag 컬럼추가						
**		2009.10.13	soundkey	CHARTITLE 추가						
**		2009.12.10	soundkey	bakchardetail CHARISMAPOINT, HEROICPOINT 추가	
**		2010.11.09	soundkey	BAKCHARTITLE 추가						
*********************************************************************************************/										
CREATE PROCEDURE
	[dbo].[SPDELETECHAR_DEV](@V_CHARID VARCHAR(32),@V_RESULT DECIMAL(10) OUT )
AS
	DECLARE	@V_CHARSEQ		DECIMAL(20);
	DECLARE	@V_DUP			VARCHAR(50);
	DECLARE @V_DATE			DATETIME;
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	--/* 길마이면 삭제불가능 */
	--SET @V_RESULT = 2;
	--SELECT @V_DUP=GMCHARID FROM dbo.GUILDMASTER WHERE GMCHARID = @V_CHARID;
	--IF @@ROWCOUNT > 0
	--	RAISERROR('ERROR', 11, 2);

	--/* 생성한지 하루가 지났는지 체크 */
	--SET @V_RESULT = 1;
	--SELECT /*@@IDENTITY,*/ @V_DATE = CREATIONDATE FROM dbo.CHARMASTER WHERE CHARID = @V_CHARID;
	--IF ( GETDATE() < @V_DATE + 1 )
	--	RAISERROR('ERROR', 11, 1);


	BEGIN TRY
		BEGIN TRANSACTION;

		--/* CHARMASTER BACKUP */
		--SET @V_RESULT = -2;
		--INSERT INTO dbo.BAKCHARMASTER (/*CHARSEQ,*/ CHARID, WORLD, ACCOUNTID, SLOT, CHARTID, CREATIONDATE, DELETIONDATE, FLAG)
		--SELECT /*@@IDENTITY,*/ CHARID, WORLD, ACCOUNTID, SLOT, CHARTID, CREATIONDATE, GETDATE(), 3
		--FROM dbo.CHARMASTER WHERE CHARID = @V_CHARID;
		--IF @@ROWCOUNT = 0
		--	RAISERROR('ERROR', 11, -2);
		

		--SET @V_CHARSEQ = @@IDENTITY;

		--/* CHARDETAIL BACKUP */
		--SET @V_RESULT = -3;
		--INSERT INTO dbo.BAKCHARDETAIL (
		--	CHARSEQ, CHARID, TITLE, POS, CRIMINALSTATUS, MURDERPOINT, RCFTIME, RMFTIME,
		--	INVENMONEY, HP, MP, SP, EXP, LV, SKILLPOINT, QUICKBELT,
		--	LATESTREGION, FLAG, STATUS, RESURRECTDATE, TRANSFORMDATE,
		--	CURCONNDATE, LASTVISITDATE, LASTVISITIP, HAIR, FACE, DEADTYPE, FLAG2, CHARISMAPOINT, HEROICPOINT)
		--SELECT
		--	@V_CHARSEQ, CHARID, TITLE, POS, CRIMINALSTATUS, MURDERPOINT, RCFTIME, RMFTIME,
		--	INVENMONEY, HP, MP, SP, EXP, LV, SKILLPOINT, QUICKBELT,
		--	LATESTREGION, FLAG, STATUS, RESURRECTDATE, TRANSFORMDATE,
		--	CURCONNDATE, LASTVISITDATE, LASTVISITIP, HAIR, FACE, DEADTYPE, FLAG2, CHARISMAPOINT, HEROICPOINT
		--FROM dbo.CHARDETAIL C WHERE C.CHARID = @V_CHARID;
		--IF @@ROWCOUNT = 0
		--	RAISERROR('ERROR', 11, -3);

		--/* 2008/04/30 soundkey -- 삭제된 캐릭터복구후 또 삭제시 중복된 아이템을 먼저 삭제한다*/
		--DELETE FROM dbo.BAKCHARITEM WHERE ITEMSEQ IN
		--	(SELECT ITEMSEQ FROM CHARITEM WHERE CHARID = @V_CHARID);

		--/* 2008/05/22 soundkey -- 삭제된 캐릭터복구후 또 삭제시 중복된 아이템을 먼저 삭제한다*/
		--DELETE FROM dbo.BAKCHARCASHITEM WHERE ITEMSEQ IN 
		--	(SELECT ITEMSEQ FROM CHARCASHITEM WHERE CHARID = @V_CHARID);


		--/* 아이템이나 스킬은 삭제된 로우가 하나도 없어도 무시한다. */
		--/* CHARITEM BACKUP */
		--INSERT INTO dbo.BAKCHARITEM	(
		--	ITEMSEQ, ACCOUNTID, CHARSEQ, CHARID, ITEMTID, STACKCOUNT, STATUS, POS,
		--	NEEDLEVEL, OWNTIME, CONVHIST, DURABILITY, MAXDUR, FLAG, OPT, SKILLPLUS, REASON, DELTIME,
		--	WORLD, INUSE, USECOUNT, REMAINTIME, EXPIREDATE, STAMINAREMAINTIME)
		--SELECT ITEMSEQ, ACCOUNTID, @V_CHARSEQ, CHARID, ITEMTID, STACKCOUNT, STATUS, POS,
		--	NEEDLEVEL, OWNTIME, CONVHIST, DURABILITY, MAXDUR, FLAG, OPT, SKILLPLUS, @V_REASON, GETDATE(),
		--	WORLD, INUSE, USECOUNT, REMAINTIME, EXPIREDATE, STAMINAREMAINTIME
		--	FROM dbo.CHARITEM WHERE CHARID = @V_CHARID AND STATUS < 100;	/* 뱅크아이템 제외 */

		--/* CHARCASHITEM BACKUP */
		--INSERT INTO dbo.BAKCHARCASHITEM	(
		--	ITEMSEQ, ACCOUNTID, CHARSEQ, CHARID, ITEMTID, STACKCOUNT, STATUS, POS,
		--	NEEDLEVEL, OWNTIME, CONVHIST, DURABILITY, MAXDUR, FLAG, OPT, SKILLPLUS, REASON, DELTIME,
		--	WORLD, INUSE, USECOUNT, REMAINTIME, EXPIREDATE, STAMINAREMAINTIME )
		--SELECT ITEMSEQ, ACCOUNTID, @V_CHARSEQ, CHARID, ITEMTID, STACKCOUNT, STATUS, POS,
		--	NEEDLEVEL, OWNTIME, CONVHIST, DURABILITY, MAXDUR, FLAG, OPT, SKILLPLUS, @V_REASON, GETDATE(),
		--	WORLD, INUSE, USECOUNT, REMAINTIME, EXPIREDATE, STAMINAREMAINTIME
		--	FROM dbo.CHARCASHITEM WHERE CHARID = @V_CHARID;

		--/* CHARSKILL BACKUP */
		--INSERT INTO dbo.BAKCHARSKILL (CHARSEQ, CHARID, SKILLSEQ, PRODUCT)
		--SELECT @V_CHARSEQ, CHARID, SKILLSEQ, PRODUCT
		--FROM dbo.CHARSKILL WHERE CHARID = @V_CHARID;

		--/* 2008/04/30 soundkey -- 복구대상에 퀘스트추가*/
		--/* CHARQUEST BACKUP */
		--INSERT INTO dbo.BAKCHARQUEST (CHARSEQ, CHARID, QUESTTID,SDATE,ARG1,ARG2,NPCID)
		--SELECT @V_CHARSEQ, CHARID, QUESTTID, SDATE, ARG1, ARG2, NPCID
		--FROM dbo.CHARQUEST WHERE CHARID = @V_CHARID;

		--/* 2010/11/09 soundkey -- 복구대상에 타이틀추가*/
		--/* CHARTITLE BACKUP */
		--INSERT INTO dbo.BAKCHARTITLE (CHARSEQ, CharID, mTitleTid, mIsComplete, mIsEquip, mValue1, mValue2, mValue3, mValue4, mValue5, mDateAccept, mDateComplete, mDateEquip)
		--SELECT @V_CHARSEQ,CharID, mTitleTid, mIsComplete, mIsEquip, mValue1, mValue2, mValue3, mValue4, mValue5, mDateAccept, mDateComplete, mDateEquip
		--FROM dbo.CHARTITLE WHERE CHARID = @V_CHARID;


		/* 캐릭터 */
		SET @V_RESULT = -4;		
		DELETE FROM dbo.CHARMASTER WHERE CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
			RAISERROR('ERROR', 11, -4);

		SET @V_RESULT = -5;
		DELETE FROM dbo.CHARDETAIL WHERE CHARID = @V_CHARID;
		IF @@ROWCOUNT = 0
			RAISERROR('ERROR', 11, -5);

		/* 아이템이나 스킬은 삭제된 로우가 하나도 없어도 무시한다. */
		/* 아이템 */
		DELETE FROM dbo.CHARITEM WHERE CHARID = @V_CHARID AND STATUS < 100;		/* 뱅크아이템 제외 */
		DELETE FROM dbo.CHARCASHITEM WHERE CHARID = @V_CHARID;

		/* 스킬 */
		DELETE FROM dbo.CHARSKILL WHERE CHARID = @V_CHARID;				
		/* 스킬equip */
		DELETE FROM dbo.CHARSKILLEQUIP WHERE CHARID = @V_CHARID;				

		/* 퀘스트 */
		DELETE FROM dbo.CHARQUEST WHERE CHARID = @V_CHARID;
		
		/* 타이틀 */
		DELETE FROM dbo.CHARTITLE WHERE CHARID = @V_CHARID;
		
		/* 거래게시판 등록 물품 */
		DELETE FROM dbo.SALESBOARD WHERE CHARID = @V_CHARID;
		/* 메일 박스 */
		DELETE FROM dbo.MAILBOX WHERE TOCHARID = @V_CHARID;
		/* 버디 */
		DELETE FROM dbo.CHARBUDDY WHERE CHARID = @V_CHARID;

		SET @V_RESULT = 0;
		COMMIT TRANSACTION;

	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;
	
	END CATCH;
END;




GO
/****** Object:  StoredProcedure [dbo].[SPDELETEGUILD]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE
	[dbo].[SPDELETEGUILD](@V_GUILDID VARCHAR(32))
AS
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	BEGIN TRY
		BEGIN TRANSACTION;

		DELETE FROM dbo.GUILDMASTER WHERE GUILDID = @V_GUILDID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN
		END;	
		
		DELETE FROM dbo.GUILDMEMBER WHERE GUILDID = @V_GUILDID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN
		END;	

		
		DELETE FROM dbo.GUILDBATTLEHIST WHERE GUILDID = @V_GUILDID;
		
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;	
	END CATCH;
END;


GO
/****** Object:  StoredProcedure [dbo].[SPDELETEITEM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/******************************************************************************
**		Name: SPDELETEITEM
**		Desc: 아이템삭제
**
**		Auth: 
**		Date: 
*******************************************************************************
**		Change History
*******************************************************************************
**		Date:		Author:				Description:
**		--------	--------			---------------------------------------
**		2009-11-03	soundkey			reason 에 따라 분리, trans 구문 제거
*******************************************************************************/
CREATE PROCEDURE
	[dbo].[SPDELETEITEM](@V_ITEMSEQ DECIMAL(20), @V_REASON VARCHAR(32))
AS
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	IF (@V_REASON = 'Bank:stackcount == 0') 
		OR (@V_REASON = 'Inventory:stackcount == 0') 
		OR (@V_REASON = 'stackcount == 0') 
		OR (@V_REASON = 'SubInventory:stackcount == 0') 
	BEGIN
		/* BAKCHARITEM에 안들어가도 무시 */
		INSERT INTO dbo.BAKCHARITEM	(
				ITEMSEQ, ACCOUNTID, CHARID, ITEMTID, STACKCOUNT, STATUS, POS, NEEDLEVEL,
				OWNTIME, CONVHIST, DURABILITY, MAXDUR, FLAG, OPT, SKILLPLUS, REASON, DELTIME,
				WORLD, INUSE, USECOUNT, REMAINTIME, EXPIREDATE )
		SELECT
			I.ITEMSEQ, I.ACCOUNTID, I.CHARID, I.ITEMTID, I.STACKCOUNT, I.STATUS, I.POS, I.NEEDLEVEL,
			I.OWNTIME, I.CONVHIST, I.DURABILITY, I.MAXDUR, I.FLAG, I.OPT, I.SKILLPLUS, @V_REASON, GETDATE(),
			I.WORLD, I.INUSE, I.USECOUNT, I.REMAINTIME, I.EXPIREDATE
		FROM dbo.CHARITEM I
		WHERE ITEMSEQ = @V_ITEMSEQ;
	END;

	BEGIN TRY
	
		DELETE FROM dbo.CHARITEM WHERE ITEMSEQ = @V_ITEMSEQ;
		IF @@ROWCOUNT = 0
			RAISERROR('ERROR', 11, 1);

	END TRY
	BEGIN CATCH
		RAISERROR('ERROR', 11, 1);
	END CATCH;
END;



GO
/****** Object:  StoredProcedure [dbo].[SPEVENTMOVECHAR]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE					
	[dbo].[SPEVENTMOVECHAR](@V_CHARID VARCHAR(47),@V_SECTION INT,@V_EVENTWORLD VARCHAR(47), @V_CODE INT OUTPUT )				
AS
	DECLARE @V_ACCOUNTID	VARCHAR(32);
	DECLARE @V_EVENTCHARID	VARCHAR(47);
	DECLARE @V_WORLD		VARCHAR(20);
	DECLARE @V_DATE		DATETIME;
	DECLARE @V_DUP		VARCHAR(5);
	DECLARE @V_MOVEFLAG	VARCHAR(1);
	DECLARE @V_COUNT		INT;

	SET @V_SECTION = 3;
	SET @V_EVENTWORLD = 'ZZang';

	/* 참가접수일에만 이동가능하다*/
	/* 캐릭터이동 : 2008.09.01 ~ 2008.09.11 */
	SET @V_CODE = 19;
	SET @V_DATE = getdate();
	/* 날짜제한을 하지 않기로 해서 필요없다. 참가신청NPC를 운영쪽에서 관리하기로함.
	IF V_DATE < TO_DATE('2008/09/01 00:00:00','YYYY/MM/DD HH24:MI:SS') THEN
		RAISE E_MYEXCPT;
	END IF;

	IF V_DATE >= TO_DATE('2008/09/12 00:00:00','YYYY/MM/DD HH24:MI:SS') THEN
		RAISE E_MYEXCPT;
	END IF;
	*/

	/* CHARID가 있는지 검사 */
	SET @V_CODE = 1;
	SELECT @V_DUP = 'Y',@V_ACCOUNTID = ACCOUNTID,@V_WORLD = WORLD FROM dbo.CHARMASTER WHERE CHARID = @V_CHARID;
	IF @@ROWCOUNT = 0
		RETURN

	SET @V_EVENTCHARID = '['+@V_WORLD+']'+@V_CHARID;

	/* 이벤트서버로 캐릭터이전신청을 이미했는지 검사 */
	SET @V_CODE = 2;
	SELECT @V_DUP = 'Y' FROM arch_galef3.dbo.CHAREVENTMOVE WHERE CHARID = @V_EVENTCHARID;
	IF @@ROWCOUNT > 0
		RETURN

	/* 계정당 캐릭터 한개만 복사할수 있음. 기존 캐릭터정보는 무조건 삭제 */
	SET @V_CODE = 3;
	delete from arch_galef3.dbo.chardetail WHERE charid in (select charid from arch_galef3.dbo.charmaster where accountid = @V_ACCOUNTID);
	delete from arch_galef3.dbo.charitem WHERE charid in (select charid from arch_galef3.dbo.charmaster where accountid = @V_ACCOUNTID);
	delete from arch_galef3.dbo.charcashitem WHERE charid in (select charid from arch_galef3.dbo.charmaster where accountid = @V_ACCOUNTID);
	delete from arch_galef3.dbo.charskill WHERE charid in (select charid from arch_galef3.dbo.charmaster where accountid = @V_ACCOUNTID);
	delete from arch_galef3.dbo.charskillequip WHERE charid in (select charid from arch_galef3.dbo.charmaster where accountid = @V_ACCOUNTID);
	delete from arch_galef3.dbo.chareventmove WHERE charid in (select charid from arch_galef3.dbo.charmaster where accountid = @V_ACCOUNTID);
	delete from arch_galef3.dbo.charmaster WHERE accountid = @V_ACCOUNTID;
	delete from arch_galef3.dbo.accountworld WHERE accountid = @V_ACCOUNTID and world = @V_EVENTWORLD;
	delete from arch_gwebarch.dbo.amt_worldmapping WHERE accountid = @V_ACCOUNTID and world = @V_EVENTWORLD;
	-- 길드정보는 삭제하지 않는다

	/* 이벤트서버로 캐릭터 복사 */
	SET @V_CODE = 10;
	Insert into arch_galef3.dbo.ACCOUNTWORLD ( accountid, world, bankmoney, banksize )
	select accountid, @V_EVENTWORLD world, bankmoney, banksize
	from dbo.accountworld where accountid = @V_ACCOUNTID and world = @V_WORLD;

	SET @V_CODE = 11;
	INSERT INTO arch_galef3.dbo.charmaster ( charid, oldcharid, world, accountid, slot, chartid, creationdate )
	SELECT @V_EVENTCHARID charid, oldcharid, @V_EVENTWORLD world, accountid, slot, chartid, creationdate
	FROM   dbo.charmaster WHERE charid = @V_CHARID;

	SET @V_CODE = 12;
	INSERT INTO arch_galef3.dbo.chardetail (
	       charid, title, pos, criminalstatus, murderpoint, rcftime, rmftime, invenmoney, 
	       hp, mp, sp, EXP, lv, skillpoint, quickbelt, latestregion, flag, flag2, flag3, status,
	       resurrectdate, transformdate, curconndate, lastvisitdate, lastvisitip, hair, face, deadtype,
	       charismapoint,nickname,cooldown )
	SELECT @V_EVENTCHARID charid, title, pos, criminalstatus, murderpoint, rcftime, rmftime, invenmoney, 
	       hp, mp, sp, EXP, lv, skillpoint, quickbelt, latestregion, flag, flag2, flag3, status,
	       resurrectdate, transformdate, curconndate, lastvisitdate, lastvisitip, hair, face, deadtype,
	       charismapoint, nickname, cooldown
	FROM   dbo.chardetail WHERE charid = @V_CHARID;

	-- 장착아이템만 복사???
	SET @V_CODE = 13;
	INSERT INTO arch_galef3.dbo.charitem (
	       accountid, world, itemseq, charid,
	       itemtid, stackcount, status, pos, needlevel, owntime, convhist, durability, maxdur, 
	       flag, opt, skillplus, inuse, usecount, remaintime, expiredate, staminaremaintime )
	SELECT accountid, @V_EVENTWORLD world, itemseq, @V_EVENTCHARID charid,
	       itemtid, stackcount, status, pos, needlevel, owntime, convhist, durability, maxdur,
	       flag, opt, skillplus, inuse, usecount, remaintime, expiredate, staminaremaintime
	FROM   dbo.charitem WHERE charid = @V_CHARID and status in (2,3,100);  -- 2:인벤토리, 3:장착, 100:창고

	-- 캐쉬템 복사????
	SET @V_CODE = 14;
	INSERT INTO arch_galef3.dbo.charcashitem (
	       accountid, world, itemseq, charid,
	       itemtid, stackcount, status, pos, needlevel, owntime, convhist, durability, maxdur, 
	       flag, opt, skillplus, inuse, usecount, remaintime, expiredate, staminaremaintime )
	SELECT accountid, @V_EVENTWORLD world, itemseq, @V_EVENTCHARID charid,
	       itemtid, stackcount, status, pos, needlevel, owntime, convhist, durability, maxdur,
	       flag, opt, skillplus, inuse, usecount, remaintime, expiredate, staminaremaintime
	FROM   dbo.charcashitem WHERE charid = @V_CHARID; 


	SET @V_CODE = 15;
	INSERT into arch_galef3.dbo.charskill ( charid, skillseq, product )
	SELECT @V_EVENTCHARID charid, skillseq, product
	FROM   dbo.charskill WHERE charid = @V_CHARID;

	SET @V_CODE = 16;
	INSERT into arch_galef3.dbo.charskillequip ( charid, skilltid, remaintime, expiredate, savetype )
	SELECT @V_EVENTCHARID charid, skilltid, remaintime, expiredate, savetype
	FROM   dbo.charskillequip WHERE charid = @V_CHARID;

	-- 타이틀 복사???

	SET @V_CODE = 17;
	INSERT into arch_galef3.dbo.chareventmove ( charid, world, accountid, movedate )
	values ( @V_EVENTCHARID, @V_WORLD, @V_ACCOUNTID, getdate() );

	SET @V_CODE = 18;
	INSERT into arch_gwebarch.dbo.amt_worldmapping ( accountid,section,world,charid,creationdate )
	values ( @V_ACCOUNTID,@V_SECTION,@V_EVENTWORLD,@V_EVENTCHARID,getdate() );

	/* SUCCESS */
	SET @V_CODE = 0;



GO
/****** Object:  StoredProcedure [dbo].[SPEVENTMOVEGUILD]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*********************************************************************************************
**  Desc: 월드챔피언쉽용 길드 이동
**  Auth:
**  Date:
**********************************************************************************************
**  Change History
**********************************************************************************************
**  Date:  Author:        Description:
**  -------- --------       -----------------------------------------------
**  
*********************************************************************************************/
/*
declare @v_code int;exec SPEVENTMOVEGUILD 'guildid','gmcharid', @v_code output; select @v_code;
*/
CREATE PROCEDURE					
	[dbo].[SPEVENTMOVEGUILD](@V_GUILDID VARCHAR(33), @V_GMCHARID VARCHAR(47), @V_CODE INT OUTPUT)				
AS
	DECLARE @V_ACCOUNTID	VARCHAR(32);
	DECLARE @V_EVENTGUILDID	VARCHAR(33);
	DECLARE @V_EVENTGMCHARID VARCHAR(47);
	DECLARE @V_WORLD		VARCHAR(20);
	DECLARE @V_DATE		DATETIME;
	DECLARE @V_DUP		VARCHAR(5);

	/* 참가접수일에만 이동가능하다 */
	/* 길드접수 : 2008.08.21 ~ 2008.08.28 */
	SET @V_CODE = 19;
	SET @V_DATE = getdate();
	/* 날짜제한을 하지 않기로 해서 필요없다. 참가신청NPC를 운영쪽에서 관리하기로함.
	IF @V_DATE < TO_DATE('2008/08/21 00:00:00','YYYY/MM/DD HH24:MI:SS') THEN
		RAISE E_MYEXCPT;
	END IF;

	IF @V_DATE >= TO_DATE('2008/08/29 00:00:00','YYYY/MM/DD HH24:MI:SS') THEN
		RAISE E_MYEXCPT;
	END IF;
	*/
	/* GMCHARID가 있는지 검사 */
	SET @V_CODE = 1;
	SELECT @V_DUP = 'Y',@V_ACCOUNTID = ACCOUNTID,@V_WORLD = WORLD FROM dbo.CHARMASTER WHERE CHARID = @V_GMCHARID;
	IF @@ROWCOUNT = 0
		RETURN


	/* 길드와 길드마스터인지 검사 */
	SET @V_CODE = 2;
	SELECT @V_DUP = 'Y' FROM GUILDMASTER WHERE GUILDID = @V_GUILDID AND GMCHARID = @V_GMCHARID;
	IF @@ROWCOUNT = 0
		RETURN

	SET @V_EVENTGUILDID = '['+@V_WORLD+']'+@V_GUILDID;
	SET @V_EVENTGMCHARID = '['+@V_WORLD+']'+@V_GMCHARID;

	/* 이벤트서버로 길드신청을 이미했는지 검사 */
	SET @V_CODE = 3;
	SELECT @V_DUP = 'Y' FROM arch_galef3.dbo.GUILDEVENTMOVE WHERE GUILDID = @V_EVENTGUILDID;
	IF @@ROWCOUNT > 0
		RETURN

	/* 이벤트서버로 길드 복사 */
	SET @V_CODE = 11;
	Insert into arch_galef3.dbo.GUILDMASTER (
	       guildid, guildtid, gmcharid, maxmember, creationdate, unionid, 
	       guildrank, password, battleguildid, battlestdate, battleduration, score1, win, draw, lose,
	       markid,colorid,money,slot,guildpoint )
	select @V_EVENTGUILDID guildid, guildtid, @V_EVENTGMCHARID gmcharid, maxmember, creationdate, unionid, 
	       guildrank, password, battleguildid, battlestdate, battleduration, score1, win, draw, lose,
	       markid,colorid,money,slot,guildpoint
	from   GUILDMASTER where GUILDID = @V_GUILDID;

	SET @V_CODE = 12;
	INSERT INTO arch_galef3.dbo.guildmember ( charid, guildid, memberrank, joindate )
	SELECT '['+@V_WORLD+']'+charid, @V_EVENTGUILDID guildid, memberrank, joindate
	FROM   guildmember where GUILDID = @V_GUILDID;

	SET @V_CODE = 13;
	INSERT into arch_galef3.dbo.guildeventmove ( guildid, world, gmcharid, accountid, movedate )
	values ( @V_EVENTGUILDID, @V_WORLD, @V_EVENTGMCHARID, @V_ACCOUNTID, getdate() );


	/* SUCCESS */
	SET @V_CODE = 0;



GO
/****** Object:  StoredProcedure [dbo].[spEventUserCheck2]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*********************************************************************************************
**		Desc: 
**		Auth: 
**		Date: 
**********************************************************************************************
**		Change History
**********************************************************************************************
**		Date:		Author:	       Description:
**		--------	--------       -----------------------------------------------
**		2009-03-20	soundkey	이벤트 대상자 여부 체크
**		2009-05-26	soundkey	미국 신규캐릭터 지원이벤트 체크 수동추가
**		2009-07-20	soundkey	유럽 신규캐릭터 지원이벤트 체크 수동추가
**		2009-09-30	soundkey	아시아 신규캐릭터 지원이벤트 체크 수동추가
*********************************************************************************************/
/*
DECLARE @RC int
DECLARE @V_EVENTID decimal(20,0)
DECLARE @V_TYPE decimal(20,0)
DECLARE @V_ACCOUNTID varchar(32)
DECLARE @V_WORLD varchar(20)
DECLARE @V_CHARID varchar(32)
DECLARE @V_CODE decimal(20,0)

-- TODO: 여기에서 매개 변수 값을 설정합니다.
SET @V_EVENTID = 400
SET @V_TYPE = 2
SET @V_ACCOUNTID = 'soundkey'
SET @V_WORLD = ''
SET @V_CHARID = ''

EXECUTE @RC = [dbo].[spEventUserCheck2] 
   @V_EVENTID
  ,@V_TYPE
  ,@V_ACCOUNTID
  ,@V_WORLD
  ,@V_CHARID
  ,@V_CODE OUTPUT
select @v_code
*/

CREATE PROCEDURE
	[dbo].[spEventUserCheck2]( @V_EVENTID DECIMAL(20),@V_TYPE DECIMAL(20),@V_ACCOUNTID VARCHAR(32),@V_WORLD VARCHAR(20),@V_CHARID VARCHAR(32), @V_CODE DECIMAL(20) OUTPUT )
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	BEGIN TRY

		--2010-09-30	soundkey	툴란 신규캐릭터 지원이벤트 전용 루틴 추가
		/*
		IF @V_EVENTID IN (1025,1032,1037,1042,1047,1052,1057,1062,1072)	 
		BEGIN
			IF @V_WORLD != 'Ernan'
			BEGIN
				SET @V_CODE = 1;
				RETURN
			END
		END
		*/
		/*
		--2010-05-26	soundkey	미국 신규캐릭터 지원이벤트 전용 루틴 추가
		--미국 신규캐릭터 지원이벤트일경우 Gracia 월드인지 체크해서 미국월드가 아니면 에러처리하기
		--미국 신규캐릭터 지원이벤트 끝나면 삭제해야 하는 루틴이다........
		IF @V_EVENTID IN (810,811,825,832,837,842,847,852,857,862,867,872 )	-- 미국 지원 레벨별 EVENTID 확인해서 모두 넣어야 한다.. 
		BEGIN
			IF @V_WORLD != 'Gracia'
			BEGIN
				SET @V_CODE = 1;
				RETURN
			END
		END

		IF @V_EVENTID IN (910,911,925,932,937,942,947,952,957,962,967,972 )	-- 유럽 지원 레벨별 EVENTID 확인해서 모두 넣어야 한다.. 
		BEGIN
			IF @V_WORLD != 'Zian'
			BEGIN
				SET @V_CODE = 1;	-- 루아에 V_CODE가 지정되어 있어서 어쩔수 없이 맞추었다..봵!!! 햇갈려!!!
				RETURN
			END
		END
		*/


		DECLARE @V_FLAG		INT;
		DECLARE @V_NUM		INT;

		SET @V_FLAG = 2;  -- 0:이벤트대상자이나아이템못받음 1:이벤트대상자이고 아이템받음 2: 이벤트 대상자 아님
		SET @V_NUM = 0;
		SET @V_CODE = 2;  -- 1:flag=0 , 3:flag=1, 2: 대상자 아닐경우

		-- 전 월드 계정 검사 
		IF @V_TYPE = 2
		BEGIN
			SET @V_NUM =0;
			SELECT @V_NUM = count(*) FROM ARCH_KWEBARCH.DBO.TblEventUserCheck 
			WHERE ACCOUNTID = @V_ACCOUNTID AND EVENTID = @V_EVENTID AND TYPE = @V_TYPE
			IF @V_NUM > 0 
			BEGIN
				SELECT @V_FLAG = FLAG FROM ARCH_KWEBARCH.DBO.TblEventUserCheck 
				WHERE ACCOUNTID = @V_ACCOUNTID AND EVENTID = @V_EVENTID AND TYPE = @V_TYPE

				IF @V_FLAG = 0
					SET @V_CODE = 1;
				ELSE IF @V_FLAG = 1
					SET @V_CODE = 3;
				ELSE
				BEGIN
					--RAISERROR('ERROR', 11, 1);
					RETURN
				END
			END;
		END;

		-- 해당 월드 계정 검사
		ELSE IF @V_TYPE = 3
		BEGIN
			SET @V_NUM =0;
			SELECT @V_NUM = count(*) FROM ARCH_KWEBARCH.DBO.TblEventUserCheck 
			WHERE ACCOUNTID = @V_ACCOUNTID AND WORLD = @V_WORLD AND EVENTID = @V_EVENTID AND TYPE = @V_TYPE
			IF @V_NUM > 0 
			BEGIN
				SELECT @V_FLAG = FLAG FROM ARCH_KWEBARCH.DBO.TblEventUserCheck 
				WHERE ACCOUNTID = @V_ACCOUNTID AND WORLD = @V_WORLD AND EVENTID = @V_EVENTID AND TYPE = @V_TYPE

				IF @V_FLAG = 0
					SET @V_CODE = 1;
				ELSE IF @V_FLAG = 1
					SET @V_CODE = 3;
				ELSE
				BEGIN
					--RAISERROR('ERROR', 11, 2);
					RETURN
				END					
			END;
		END;

		-- 해당 캐릭터 검사
		ELSE IF @V_TYPE = 1
		BEGIN
			SET @V_NUM =0;
			SELECT @V_NUM = count(*) FROM ARCH_KWEBARCH.DBO.TblEventUserCheck 
			WHERE ACCOUNTID = @V_ACCOUNTID AND CHARID = @V_CHARID AND WORLD = @V_WORLD AND EVENTID = @V_EVENTID AND TYPE = @V_TYPE
			IF @V_NUM > 0 
			BEGIN
				SELECT @V_FLAG = FLAG FROM ARCH_KWEBARCH.DBO.TblEventUserCheck 
				WHERE ACCOUNTID = @V_ACCOUNTID AND CHARID = @V_CHARID AND WORLD = @V_WORLD AND EVENTID = @V_EVENTID AND TYPE = @V_TYPE

				IF @V_FLAG = 0
					SET @V_CODE = 1;
				ELSE IF @V_FLAG = 1
					SET @V_CODE = 3;
				ELSE
				BEGIN
					--RAISERROR('ERROR', 11, 3);
					RETURN
				END
			END;
		END;

		ELSE
			SET @V_CODE =-1;
	
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;
	
	END CATCH;


GO
/****** Object:  StoredProcedure [dbo].[spEventUserFlagUpdate]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*********************************************************************************************
**		Desc: 
**		Auth: 
**		Date: 
**********************************************************************************************
**		Change History
**********************************************************************************************
**		Date:		Author:	       Description:
**		--------	--------       -----------------------------------------------
**		2009-03-20	soundkey	이벤트유저 Flag Update
*********************************************************************************************/

CREATE PROCEDURE
	[dbo].[spEventUserFlagUpdate](@V_EVENTID DECIMAL(20),@V_TYPE DECIMAL(20),@V_ACCOUNTID VARCHAR(32),@V_WORLD VARCHAR(20),@V_CHARID VARCHAR(32),@V_FLAG DECIMAL(20))
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	-- 전 월드 계정 검사 
	IF @V_TYPE = 2
	BEGIN
		UPDATE ARCH_KWEBARCH.DBO.TblEventUserCheck SET FLAG = @V_FLAG , WDATE = GETDATE()
		WHERE ACCOUNTID = @V_ACCOUNTID AND EVENTID = @V_EVENTID AND TYPE = @V_TYPE;
		IF @@ROWCOUNT = 0
			INSERT INTO ARCH_KWEBARCH.DBO.TblEventUserCheck (eventid,type, accountid,world,charid,wdate,flag )
			VALUES ( @V_EVENTID,@V_TYPE,@V_ACCOUNTID,@V_WORLD,@V_CHARID,GETDATE(),@V_FLAG );
	END;
	-- 해당 월드 계정 검사
	ELSE IF @V_TYPE = 3
	BEGIN
		UPDATE ARCH_KWEBARCH.DBO.TblEventUserCheck SET FLAG = @V_FLAG , WDATE = GETDATE()
		WHERE ACCOUNTID = @V_ACCOUNTID AND WORLD = @V_WORLD AND EVENTID = @V_EVENTID AND TYPE = @V_TYPE;
		IF @@ROWCOUNT = 0
			INSERT INTO ARCH_KWEBARCH.DBO.TblEventUserCheck (eventid,type, accountid,world,charid,wdate,flag )
			VALUES ( @V_EVENTID,@V_TYPE,@V_ACCOUNTID,@V_WORLD,@V_CHARID,GETDATE(),@V_FLAG );
	END;
	-- 캐릭터 검사
	ELSE IF @V_TYPE = 1
	BEGIN
		UPDATE ARCH_KWEBARCH.DBO.TblEventUserCheck SET FLAG = @V_FLAG , WDATE = GETDATE()
		WHERE ACCOUNTID = @V_ACCOUNTID AND CHARID = @V_CHARID AND WORLD = @V_WORLD AND EVENTID = @V_EVENTID AND TYPE = @V_TYPE;
		IF @@ROWCOUNT = 0
			INSERT INTO ARCH_KWEBARCH.DBO.TblEventUserCheck (eventid,type, accountid,world,charid,wdate,flag )
			VALUES ( @V_EVENTID,@V_TYPE,@V_ACCOUNTID,@V_WORLD,@V_CHARID,GETDATE(),@V_FLAG );
	END;
	ELSE
		RAISERROR('ERROR', 11, 1);


GO
/****** Object:  StoredProcedure [dbo].[SPMAILDELETE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SPMAILDELETE](
	@V_MAILSEQ DECIMAL(20), @V_FLAG DECIMAL(10)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	BEGIN TRY
		BEGIN TRANSACTION;
		DELETE FROM dbo.MAILBOX WHERE MAILSEQ = @V_MAILSEQ;
		IF @@ROWCOUNT = 0
			RAISERROR('ERROR', 11, 1);
		COMMIT TRANSACTION;

	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;	
	END CATCH;
END;



GO
/****** Object:  StoredProcedure [dbo].[SPMAILITEMSAVE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPMAILITEMSAVE](
	@V_MAILSEQ DECIMAL(20), @V_ITEMSEQ DECIMAL(20), @V_ITEMTID DECIMAL(10),
	@V_ITEMQTY DECIMAL(10), @V_CHARID VARCHAR(32), @V_STATUS DECIMAL(10),
	@V_NEEDLEVEL DECIMAL(10) OUT, @V_CONVERT VARCHAR(128) OUT, @V_DURABILITY DECIMAL(10) OUT,
	@V_MAXDUR DECIMAL(10) OUT, @V_FLAG DECIMAL(10) OUT, @V_OPTION VARCHAR(32) OUT, @V_SKILLPLUS VARCHAR(32) OUT,
	@V_INUSE DECIMAL(10) OUT, @V_USECOUNT DECIMAL(10) OUT, @V_REMAINTIME DECIMAL(10) OUT, @V_EXPIREDATESTR VARCHAR(23) OUT,
	@V_STAMINAREMAINTIME DECIMAL(10) OUT,
	@V_RESULT DECIMAL(10) OUT
	)
AS
	DECLARE @V_MAILBOXMAILSEQ		DECIMAL(20);
	DECLARE @V_MAILBOXTOCHARID		VARCHAR(32);
	DECLARE @V_MAILBOXFROMCHARID		VARCHAR(32);
	DECLARE @V_MAILBOXFLAG			DECIMAL(10);
	DECLARE @V_MAILBOXITEMSEQ		DECIMAL(20);
	DECLARE @V_MAILBOXITEMTID		DECIMAL(10);
	DECLARE @V_MAILBOXITEMQTY		DECIMAL(10);

	DECLARE @V_STACKCOUNT	DECIMAL(10);
	DECLARE @V_EXPIREDATE	DATETIME;
	DECLARE @V_ITEMTID2		DECIMAL(10);
	DECLARE @V_CHARID2		VARCHAR(32);
	DECLARE @V_STATUS2		DECIMAL(10);

BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	/* 초기화 */
	SET @V_RESULT = 1;
	SET @V_NEEDLEVEL = 0;
	SET @V_CONVERT = ' ';
	SET @V_DURABILITY = 0;
	SET @V_MAXDUR = 0;
	SET @V_FLAG = 0;
	SET @V_OPTION = ' ';
	SET @V_SKILLPLUS = ' ';
	SET @V_INUSE = 0;
	SET @V_USECOUNT = 0;
	SET @V_REMAINTIME = 0;
	SET @V_EXPIREDATESTR = ' ';
	SET @V_ITEMTID2 = 0;

	/* 메일을 찾자 */
	SELECT
		@V_MAILBOXMAILSEQ=MAILSEQ,
		@V_MAILBOXTOCHARID=TOCHARID,
		@V_MAILBOXFROMCHARID=FROMCHARID,
		@V_MAILBOXFLAG=FLAG,
		@V_MAILBOXITEMSEQ=ITEMSEQ,
		@V_MAILBOXITEMTID=ITEMTID,
		@V_MAILBOXITEMQTY=ITEMQTY
	FROM dbo.MAILBOX
	WHERE MAILSEQ = @V_MAILSEQ;
	IF @@ROWCOUNT = 0
	BEGIN
		--RAISERROR('ERROR', 11, 1);
		RETURN
	END

	/* ITEMSEQ VALIDATION */
	SET @V_RESULT = 5;
	IF 0 = @V_MAILBOXITEMSEQ
	BEGIN
		--RAISERROR('ERROR', 11, 2);
		RETURN
	END
	
	IF @V_MAILBOXITEMSEQ <> @V_ITEMSEQ
	BEGIN
		--RAISERROR('ERROR', 11, 3);
		RETURN
	END

	/* 아이템을 찾자 */
	SELECT
		@V_CHARID2			=	CHARID,
		@V_ITEMTID2			=	ITEMTID,
		@V_STATUS2			=	STATUS,
		@V_STACKCOUNT		=	STACKCOUNT,
		@V_NEEDLEVEL		=	NEEDLEVEL,
		@V_CONVERT			=	CONVHIST,
		@V_DURABILITY		=	DURABILITY,
		@V_MAXDUR			=	MAXDUR,
		@V_FLAG				=	FLAG,
		@V_OPTION			=	OPT,
		@V_SKILLPLUS		=	SKILLPLUS,
		@V_INUSE			=	INUSE,
		@V_USECOUNT			=	USECOUNT,
		@V_REMAINTIME		=	REMAINTIME,
		@V_EXPIREDATE		=	EXPIREDATE,
		@V_STAMINAREMAINTIME=	STAMINAREMAINTIME
	FROM dbo.CHARITEM
	WHERE ITEMSEQ = @V_ITEMSEQ AND STATUS = @V_STATUS;
	--WHERE ITEMSEQ = @V_ITEMSEQ AND STATUS = @V_STATUS AND ITEMTID = @V_ITEMTID AND CHARID = @V_CHARID; -- 기존 조건

	IF @@ROWCOUNT = 0
	BEGIN
		--RAISERROR('ERROR', 11, 4);
		RETURN
	END

	/* ITEMTID VALIDATION */
	SET @V_RESULT = 5;
	IF @V_ITEMTID <> @V_ITEMTID2
	BEGIN
		--RAISERROR('ERROR', 11, 5);
		RETURN
	END

	/* CHARID VALIDATION */
	SET @V_RESULT = 5;
	IF @V_CHARID <> @V_CHARID2
	BEGIN
		--RAISERROR('ERROR', 11, 6);
		RETURN
	END

	/* ITEM STATUS VALIDATION  */
	SET @V_RESULT = 5;
	IF @V_STATUS <> @V_STATUS2
	BEGIN
		--RAISERROR('ERROR', 11, 7);
		RETURN
	END

	/* ITEMQTY VALIDATION */
	SET @V_RESULT = 5;
	IF 0 <> @V_STACKCOUNT AND @V_ITEMQTY <> @V_STACKCOUNT
	BEGIN
		--RAISERROR('ERROR', 11, 8);
		RETURN
	END

	/* OUTPUT PARAMETER SETTING */
	SET	@V_EXPIREDATESTR = CONVERT(VARCHAR, @V_EXPIREDATE, 120);


	BEGIN TRY
		BEGIN TRANSACTION;

		/* 메일에서 아이템부분을 RESET하자 */
		SET @V_RESULT = 1;
		UPDATE dbo.MAILBOX SET ITEMSEQ = 0, ITEMTID = 0, ITEMQTY = 0 WHERE MAILSEQ = @V_MAILSEQ;
		IF @@ROWCOUNT = 0
			RAISERROR('ERROR', 11, 9);

		SET @V_RESULT = 0;
		COMMIT TRANSACTION;

	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;	
	END CATCH;
END;


GO
/****** Object:  StoredProcedure [dbo].[SPMAILWRITE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPMAILWRITE](
	@V_TOCHARID VARCHAR(32), @V_FROMCHARID VARCHAR(32), @V_SUBJECT VARCHAR(50),
	@V_WDATESTR VARCHAR(23), @V_FLAG DECIMAL(10), @V_ITEMTID DECIMAL(10),
	@V_ITEMQTY DECIMAL(10), @V_ITEMSEQ DECIMAL(20), @V_STATUS DECIMAL(10),
	@V_CONTENTS VARCHAR(2000),
	@V_MAILSEQ DECIMAL(20) OUT, @V_RESULT DECIMAL(10) OUT
	)
AS
	DECLARE	@V_CHARIDDUMMY	VARCHAR(32)
BEGIN

	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	BEGIN TRY
		BEGIN TRANSACTION;
		/* 초기화 */
		SET @V_RESULT = 1;
		SET @V_MAILSEQ = 0;

		/* FIND RECEIVE CHAR ID */
		SET @V_RESULT = 2;
		SELECT @V_CHARIDDUMMY=CHARID FROM dbo.CHARMASTER WHERE CHARID = @V_TOCHARID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN
		END;	


		/* FIND ITEM */
		IF @V_ITEMSEQ <> 0
			BEGIN
				SET @V_RESULT = 5;
				SELECT ITEMTID FROM dbo.CHARITEM WHERE ITEMSEQ = @V_ITEMSEQ;
				IF @@ROWCOUNT = 0
				BEGIN
					ROLLBACK TRANSACTION;
					RETURN
				END;	


				/* UPDATE OWNER AND STATUS */
				UPDATE dbo.CHARITEM SET CHARID = @V_TOCHARID, STATUS = @V_STATUS, ACCOUNTID = NULL
				WHERE ITEMSEQ = @V_ITEMSEQ;
				IF @@ROWCOUNT = 0
				BEGIN
					ROLLBACK TRANSACTION;
					RETURN
				END;	

			END;

		/* INSERT */
		SET @V_RESULT = 1;
		INSERT INTO dbo.MAILBOX
			(TOCHARID, FROMCHARID, SUBJECT, CONTENTS, WDATE, FLAG, ITEMSEQ, ITEMTID, ITEMQTY)
		VALUES
			(@V_TOCHARID, @V_FROMCHARID, @V_SUBJECT, @V_CONTENTS, @V_WDATESTR,
			@V_FLAG, @V_ITEMSEQ, @V_ITEMTID, @V_ITEMQTY);
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN
		END;	


		SET @V_MAILSEQ = @@IDENTITY;
		SET @V_RESULT = 0;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;	
	END CATCH;
END;


GO
/****** Object:  StoredProcedure [dbo].[SPRENAMECHAR]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*********************************************************************************************						
**		Desc: 				
**		Auth: 				
**		Date: 				
**********************************************************************************************						
**		Change History				
**********************************************************************************************						
**		Date:		Author:	       Description:	
**		--------	--------       -----------------------------------------------			
**		2009-02-24	soundkey	부가서비스용 로직변경 bakcharmaster 추가						
**		2009-04-09	soundkey	flag in (2,3) 삭제						
**		2009-05-13	soundkey	CERARIUM 중복검사 추가						
**		2009-10-13	soundkey	CHARTITLE 추가						
**		2010-04-01	soundkey	V_GROUPWORLD 추가 TblEventUserCheck update						
**		2010-09-16	soundkey	TblEventUserCheck 부분 조건절 WORLD = V_GROUPWORLD AND CHARID = V_CHARID_OLD; 로 변경						
*********************************************************************************************/
/*
declare @v_code int
exec SPRENAMECHAR
	'Hohowave',	--@V_CHARID_OLD
	'Hohowave777', --@V_CHARID_NEW
	@v_code output
select @v_code
*/
CREATE PROCEDURE
	[dbo].[SPRENAMECHAR](@V_CHARID_OLD VARCHAR(32), @V_CHARID_NEW VARCHAR(32), @V_CODE DECIMAL(10) OUT)
AS
	DECLARE @V_ACCOUNTID	VARCHAR(32);
	DECLARE @V_WORLD		VARCHAR(20);
	DECLARE	@V_DUP			VARCHAR(5);
	DECLARE @V_CHARIDDUMMY	VARCHAR(32);
	DECLARE @V_GROUPWORLD	VARCHAR(20);
	DECLARE @V_CREATIONDATE	DATETIME;
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	/* OLDID, NEWID가 같은지... */
	SET @V_CODE = 2;
	IF @V_CHARID_OLD = @V_CHARID_NEW
	BEGIN
		--RAISERROR('ERROR', 11, 1);
		RETURN
	END

	/* OLDID가 있는지... */
	SET @V_CODE = 3;
	SELECT @V_CHARIDDUMMY=CHARID,@V_ACCOUNTID=ACCOUNTID,@V_WORLD=WORLD,@V_CREATIONDATE=creationdate FROM dbo.CHARMASTER WHERE CHARID = @V_CHARID_OLD;
	IF @@ROWCOUNT = 0
	BEGIN	
		--RAISERROR('ERROR', 11, 2);
		RETURN
	END

	/* NEWID가 중복인지... */
	SET @V_CODE = 4;
	SELECT @V_CHARIDDUMMY=CHARID FROM dbo.CHARMASTER WHERE CHARID = @V_CHARID_NEW;
	IF @@ROWCOUNT > 0
	BEGIN		
		--RAISERROR('ERROR', 11, 3);
		RETURN
	END
		
	SELECT @V_CHARIDDUMMY=CHARID FROM dbo.CHARDETAIL WHERE CHARID = @V_CHARID_NEW;
	IF @@ROWCOUNT > 0
	BEGIN			
		--RAISERROR('ERROR', 11, 3);
		RETURN
	END

	-- 2009/02/24 soundkey 정책변경으로 기존에 한번이라도 쓴 이름은 못쓴다									
	-- 2009/04/09 soundkey flag in (2,3) 삭제									
	SELECT @V_CHARIDDUMMY=CHARID FROM dbo.BAKCHARMASTER WHERE CHARID = @V_CHARID_NEW;
	IF @@ROWCOUNT > 0
	BEGIN				
		--RAISERROR('ERROR', 11, 3);
		RETURN
	END

	SELECT @V_CHARIDDUMMY=CHARID FROM dbo.CERARIUM WHERE CHARID = @V_CHARID_NEW;
	IF @@ROWCOUNT > 0
	BEGIN					
		--RAISERROR('ERROR', 11, 3);
		RETURN
	END


	BEGIN TRY
		BEGIN TRANSACTION;
		
		/*
		/* NEWID가 중복인지... */
		SET @V_CODE = 4;
		SELECT @V_CHARIDDUMMY=CHARID FROM dbo.COMA_CHARMASTER WHERE CHARID = @V_CHARID_NEW;
		IF @@ROWCOUNT > 0
			RAISERROR('ERROR', 11, 3);
		*/

		SET @V_CODE = 11;
		UPDATE dbo.CHARMASTER SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;

		
		SET @V_CODE = 12;
		UPDATE dbo.CHARDETAIL SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;


		SET @V_CODE = 13;
		UPDATE dbo.CHARSKILL SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;

		
		UPDATE dbo.CHARSKILLEQUIP SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		UPDATE dbo.CHARITEM SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		UPDATE dbo.CHARCASHITEM SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		UPDATE dbo.CHARQUEST SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		UPDATE dbo.GUILDMASTER SET GMCHARID = @V_CHARID_NEW WHERE GMCHARID = @V_CHARID_OLD;
		UPDATE dbo.GUILDMEMBER SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		UPDATE dbo.SALESBOARD SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		UPDATE dbo.WANTEDCRIMINAL SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		UPDATE dbo.MAILBOX SET TOCHARID = @V_CHARID_NEW WHERE TOCHARID = @V_CHARID_OLD;
		UPDATE dbo.MAILBOX SET FROMCHARID = @V_CHARID_NEW WHERE FROMCHARID = @V_CHARID_OLD;
		UPDATE dbo.CHARBUDDY SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		UPDATE dbo.CHARBUDDY SET BUDDYID = @V_CHARID_NEW WHERE BUDDYID = @V_CHARID_OLD;
		UPDATE dbo.CASHITEMBUYLIST SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		UPDATE dbo.LORDGUARD SET CHARID = @V_CHARID_NEW WHERE CHARID = @V_CHARID_OLD;
		UPDATE dbo.SALESBOUGHT	SET BUYCHARID = @V_CHARID_NEW	WHERE BUYCHARID = @V_CHARID_OLD;
		UPDATE dbo.CHARTITLE	SET CHARID = @V_CHARID_NEW	WHERE CHARID = @V_CHARID_OLD;
		
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END;
	END CATCH;

	 -- BAKCHARMASTER 에 로그기록									
	INSERT INTO BAKCHARMASTER ( charid,world,accountid,creationdate,deletiondate,flag,charid2 )									
	VALUES ( @V_CHARID_OLD,@V_WORLD,@V_ACCOUNTID,@V_CREATIONDATE,GETDATE(),2,@V_CHARID_NEW );									


	SET @V_CODE = 7;
	UPDATE Arch_KWebarch.dbo.amt_worldmapping SET CHARID = @V_CHARID_NEW WHERE
		ACCOUNTID	= @V_ACCOUNTID
	AND	CHARID		= @V_CHARID_OLD
	AND	WORLD		= @V_WORLD;

	/* GroupWorld명 얻어오기.. */
	SET @V_CODE = 8;
	SET @V_GROUPWORLD = ''

	SELECT @V_GROUPWORLD = worldname FROM Arch_KWebarch.dbo.C_ServerCode WHERE ServerName = @V_WORLD;

	/* 이벤트가 없을수도 있기때문에 에러처리 하지 않는다..*/
	UPDATE Arch_KWebarch.dbo.TblEventUserCheck SET CHARID = @V_CHARID_NEW
	WHERE ACCOUNTID = @V_ACCOUNTID AND WORLD = @V_GROUPWORLD AND CHARID = @V_CHARID_OLD;

	/* SUCCESS */
	SET @V_CODE = 0;

END;


GO
/****** Object:  StoredProcedure [dbo].[SPRENAMEGUILD]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*********************************************************************************************						
**		Desc: 				
**		Auth: 				
**		Date: 				
**********************************************************************************************						
**		Change History				
**********************************************************************************************						
**		Date:		Author:	       Description:	
**		--------	--------       -----------------------------------------------			
**		2010-01-13	soundkey		SIEGEAPPLICATION 밑의 IF @@ROWCOUNT > 0 루틴 삭제
*********************************************************************************************/						
/*
declare @v_code int
exec SPRENAMEGUILD
	'KGB',	--@V_GUILDID_NEW
	'KGB@Gaiahon', --@V_GUILDID_OLD
	@v_code output
select @v_code

*/
CREATE PROCEDURE
	[dbo].[SPRENAMEGUILD](@V_GUILDID_NEW VARCHAR(32), @V_GUILDID_OLD VARCHAR(32))
AS
	DECLARE @V_CHARIDDUMMY	VARCHAR(32)
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	/* OLDID, NEWID가 같은지... */
	IF @V_GUILDID_OLD = @V_GUILDID_NEW
	BEGIN
		--RAISERROR('ERROR', 11, 1);
		RETURN
	END

	/* 기존 길드명 존재 검사 */
	SELECT @V_CHARIDDUMMY=GUILDID FROM dbo.GUILDMASTER WHERE GUILDID = @V_GUILDID_OLD;
	IF @@ROWCOUNT = 0
	BEGIN
		--RAISERROR('ERROR', 11, 2);
		RETURN
	END

	/* NEWID가 중복인지... */
	SELECT @V_CHARIDDUMMY=GUILDID FROM dbo.GUILDMASTER WHERE GUILDID = @V_GUILDID_NEW;
	IF @@ROWCOUNT > 0
	BEGIN
		--RAISERROR('ERROR', 11, 3);
		RETURN
	END

	BEGIN TRY
		BEGIN TRANSACTION;

		UPDATE dbo.GUILDBATTLEHIST	SET GUILDID			= @V_GUILDID_NEW WHERE GUILDID		= @V_GUILDID_OLD;
		UPDATE dbo.GUILDBATTLEHIST	SET ENEMYGUILDID	= @V_GUILDID_NEW WHERE ENEMYGUILDID = @V_GUILDID_OLD;
		UPDATE dbo.GUILDMEMBER		SET GUILDID			= @V_GUILDID_NEW WHERE GUILDID		= @V_GUILDID_OLD;
		UPDATE dbo.GUILDMASTER		SET GUILDID			= @V_GUILDID_NEW WHERE GUILDID		= @V_GUILDID_OLD;
		UPDATE dbo.GUILDITEM		SET GUILDID			= @V_GUILDID_NEW WHERE GUILDID		= @V_GUILDID_OLD;
		UPDATE dbo.CASTLE			SET OWNERGUILDID	= @V_GUILDID_NEW WHERE OWNERGUILDID = @V_GUILDID_OLD;
		UPDATE dbo.SIEGE			SET GUILDID			= @V_GUILDID_NEW WHERE GUILDID		= @V_GUILDID_OLD;
		UPDATE dbo.SIEGEAPPLICATION SET GUILDID			= @V_GUILDID_NEW WHERE GUILDID		= @V_GUILDID_OLD;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;	
	END CATCH;
END;


GO
/****** Object:  StoredProcedure [dbo].[SPSALESBUY]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPSALESBUY](
	@V_DOCID DECIMAL(20), @V_BUYER VARCHAR(32), @V_BUYERMONEY DECIMAL(20), @V_STATUSFROM DECIMAL(10), @V_STATUSTO DECIMAL(10),
	@V_SELLER VARCHAR(32) OUT, @V_PRICE DECIMAL(10) OUT,
	@V_ITEMSEQ DECIMAL(20) OUT, @V_ITEMTID DECIMAL(10) OUT, @V_ITEMQTY DECIMAL(10) OUT,
	@V_NEEDLEVEL DECIMAL(10) OUT, @V_OWNTIMESTR VARCHAR(23) OUT, @V_CONVHIST VARCHAR(128) OUT,
	@V_DURABILITY DECIMAL(10) OUT, @V_MAXDUR DECIMAL(10) OUT, @V_OPT VARCHAR(32) OUT ,@V_SKILLPLUS VARCHAR(32) OUT,
	@V_INUSE DECIMAL(10) OUT, @V_USECOUNT DECIMAL(10) OUT, @V_REMAINTIME DECIMAL(10) OUT, @V_EXPIREDATESTR VARCHAR(23) OUT,
	@V_STAMINAREMAINTIME DECIMAL(10) OUT,
	@V_CODE DECIMAL(10) OUT
	)
AS
	DECLARE @V_SALESDOCID			DECIMAL(20);
	DECLARE @V_SALESCHARID			VARCHAR(32);
	DECLARE @V_SALESITEMSEQ			DECIMAL(20);
	DECLARE @V_SALESUNITPRICE		DECIMAL(10);
	DECLARE @V_SALESTOTALQTY		DECIMAL(10);
	DECLARE @V_SALESWDATE			DATETIME;
	DECLARE @V_SALESSTATUS			DECIMAL(10);
	
	DECLARE @V_OWNTIME				DATETIME;
	DECLARE @V_EXPIREDATE			DATETIME;
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	/* INIT */
	SET @V_CODE = 1;
	SET @V_SELLER = '';
	SET @V_ITEMSEQ = 0;
	SET @V_PRICE = 0;
	SET @V_ITEMQTY = 0;
	SET @V_ITEMTID = 0;
	SET @V_NEEDLEVEL = 0;
	SET @V_CONVHIST = '';
	SET @V_DURABILITY = 0;
	SET @V_MAXDUR = 0;
	SET @V_OPT = '';
	SET @V_SKILLPLUS = '';
	SET @V_OWNTIMESTR = '';
	SET @V_INUSE = 0;
	SET @V_USECOUNT = 0;
	SET @V_REMAINTIME = 0;
	SET @V_EXPIREDATESTR = '';
	SET @V_STAMINAREMAINTIME = 0;

	/* FIND SALES */
	SET @V_CODE = 9;
	SELECT
		@V_SALESDOCID=DOCID,
		@V_SALESCHARID=CHARID,
		@V_SALESITEMSEQ=ITEMSEQ,
		@V_SALESUNITPRICE=UNITPRICE,
		@V_SALESTOTALQTY=TOTALQTY,
		@V_SALESWDATE=WDATE,
		@V_SALESSTATUS=STATUS
	FROM dbo.SALESBOARD
	WHERE DOCID = @V_DOCID;
	IF @@ROWCOUNT = 0
	BEGIN
		--RAISERROR('ERROR', 11, 1);
		RETURN
	END

	SET @V_SELLER = @V_SALESCHARID;
	SET @V_ITEMSEQ = @V_SALESITEMSEQ;
	SET @V_PRICE = @V_SALESUNITPRICE;

	/* if seller = buyer */
	SET @V_CODE = 11;
	IF @V_SELLER = @V_BUYER
	BEGIN
		--RAISERROR('ERROR', 11, 2);
		RETURN
	END

	/* if status is not on sale */
	SET @V_CODE = 12;
	IF @V_SALESSTATUS <> @V_STATUSFROM
	BEGIN
		--RAISERROR('ERROR', 11, 3);
		RETURN
	END

	/* FIND ITEM */
	SET @V_CODE = 4;
	SELECT
		@V_ITEMTID=ITEMTID,
		@V_ITEMQTY=STACKCOUNT,
		@V_NEEDLEVEL=NEEDLEVEL,
		@V_OWNTIME=OWNTIME,
		@V_CONVHIST=CONVHIST,
		@V_DURABILITY=DURABILITY,
		@V_MAXDUR=MAXDUR,
		@V_OPT=OPT,
		@V_SKILLPLUS=SKILLPLUS,
		@V_INUSE=INUSE,
		@V_USECOUNT=USECOUNT,
		@V_REMAINTIME=REMAINTIME,
		@V_EXPIREDATE=EXPIREDATE
	FROM dbo.CHARITEM
	WHERE ITEMSEQ = @V_SALESITEMSEQ AND STATUS = 8;
	IF @@ROWCOUNT = 0
	BEGIN
		--RAISERROR('ERROR', 11, 4);
		RETURN
	END

	IF @V_OWNTIME <> NULL
		SET @V_OWNTIMESTR = CONVERT(VARCHAR, @V_OWNTIME, 120);

	IF @V_EXPIREDATE <> NULL
		SET @V_EXPIREDATESTR = CONVERT(VARCHAR, @V_EXPIREDATE, 120);

	/* CHECK PRICE */
	SET @V_CODE = 10;
	IF @V_BUYERMONEY < @V_PRICE
	BEGIN
		--RAISERROR('ERROR', 11, 5);
		RETURN
	END


	BEGIN TRY
		BEGIN TRANSACTION;

		/* UPDATE STATUS OF DOC. */
		SET @V_CODE = 1;
		UPDATE dbo.SALESBOARD SET STATUS = @V_STATUSTO, ITEMSEQ = NULL WHERE DOCID = @V_DOCID;
		IF @@ROWCOUNT = 0
			RAISERROR('ERROR', 11, 6);

		SET @V_CODE = 0;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;	
	END CATCH;
END;


GO
/****** Object:  StoredProcedure [dbo].[SPSALESCANCEL]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPSALESCANCEL](
	@V_DOCID DECIMAL(20), @V_CHARID VARCHAR(32), @V_STATUSFROM DECIMAL(10), @V_STATUSTO DECIMAL(10),
	@V_CODE DECIMAL(10) OUT
	)
AS
	DECLARE @V_SALESDOCID			DECIMAL(20);
	DECLARE @V_SALESCHARID			VARCHAR(32);
	DECLARE @V_SALESITEMSEQ			DECIMAL(20);
	DECLARE @V_SALESUNITPRICE		DECIMAL(10);
	DECLARE @V_SALESTOTALQTY		DECIMAL(10);
	DECLARE @V_SALESWDATE			DATETIME;
	DECLARE @V_SALESITEMTID			DECIMAL(10);
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	SET @V_CODE = 1;

	/* FIND DOC */
	SET @V_CODE = 9;
	SELECT
		@V_SALESDOCID=DOCID,
		@V_SALESCHARID=CHARID,
		@V_SALESITEMSEQ=ITEMSEQ,
		@V_SALESUNITPRICE=UNITPRICE,
		@V_SALESTOTALQTY=TOTALQTY,
		@V_SALESWDATE=WDATE,
		@V_SALESITEMTID=ITEMTID
	FROM dbo.SALESBOARD
	WHERE DOCID = @V_DOCID AND CHARID = @V_CHARID AND STATUS = @V_STATUSFROM;
	IF @@ROWCOUNT = 0
	BEGIN
		--RAISERROR('ERROR', 11, 1);
		RETURN
	END

	BEGIN TRY
		BEGIN TRANSACTION;

		/* BACKUP */
		SET @V_CODE = 1;
		INSERT INTO dbo.BAKSALESBOARD(DOCID, CHARID, ITEMSEQ, UNITPRICE, TOTALQTY, WDATE, ITEMTID, STATUS)
		VALUES (@V_SALESDOCID, @V_SALESCHARID, @V_SALESITEMSEQ, @V_SALESUNITPRICE, @V_SALESTOTALQTY,
				@V_SALESWDATE, @V_SALESITEMTID, @V_STATUSTO);
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN
		END;	


		/* DELETE */
		DELETE FROM dbo.SALESBOARD WHERE DOCID = @V_DOCID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN
		END;	


		SET @V_CODE = 0;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;	
	END CATCH;
END;


GO
/****** Object:  StoredProcedure [dbo].[SPSALESCONFIRM]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*******************************************************************

	SPSALESCONFIRM
		Confirm Item Sale Complete

*******************************************************************/

CREATE PROCEDURE [dbo].[SPSALESCONFIRM](
	@V_DOCID DECIMAL(20), @V_CHARID VARCHAR(32), @V_STATUSFROM DECIMAL(10), @V_STATUSTO DECIMAL(10),
	@V_CODE DECIMAL(10) OUT
	)
AS
	DECLARE @V_SALESDOCID			DECIMAL(20);
	DECLARE @V_SALESCHARID			VARCHAR(32);
	DECLARE @V_SALESITEMSEQ			DECIMAL(20);
	DECLARE @V_SALESUNITPRICE		DECIMAL(10);
	DECLARE @V_SALESTOTALQTY		DECIMAL(10);
	DECLARE @V_SALESWDATE			DATETIME;
	DECLARE @V_SALESITEMTID			DECIMAL(10);
	
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	/* FIND */
	SET @V_CODE = 9;
	SELECT
		@V_SALESDOCID=DOCID,
		@V_SALESCHARID=CHARID,
		@V_SALESITEMSEQ=ITEMSEQ2,
		@V_SALESUNITPRICE=UNITPRICE,
		@V_SALESTOTALQTY=TOTALQTY,
		@V_SALESWDATE=WDATE,
		@V_SALESITEMTID=ITEMTID
	FROM dbo.SALESBOARD
	WHERE DOCID = @V_DOCID AND CHARID = @V_CHARID AND STATUS = @V_STATUSFROM;
	IF @@ROWCOUNT = 0
	BEGIN
		--RAISERROR('ERROR', 11, 1);
		RETURN
	END

	BEGIN TRY
		BEGIN TRANSACTION;

		SET @V_CODE = 1;

		/* BACKUP */
		SET @V_CODE = 1;
		INSERT INTO dbo.BAKSALESBOARD(DOCID, CHARID, ITEMSEQ, UNITPRICE, TOTALQTY, WDATE, ITEMTID, STATUS)
		VALUES (@V_SALESDOCID, @V_SALESCHARID, @V_SALESITEMSEQ, @V_SALESUNITPRICE, @V_SALESTOTALQTY,
				@V_SALESWDATE, @V_SALESITEMTID, @V_STATUSTO);
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN
		END;	

		
		/* DELETE */
		DELETE FROM dbo.SALESBOARD WHERE DOCID = @V_DOCID;
		IF @@ROWCOUNT = 0
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN
		END;	

		
		SET @V_CODE = 0;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;	
	END CATCH;
END;


GO
/****** Object:  StoredProcedure [dbo].[SPSALESSELL]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPSALESSELL](
	@V_ITEMSEQ DECIMAL(20), @V_PRICE DECIMAL(10), @V_QUANTITY DECIMAL(5),
	@V_ITEMSTATUS DECIMAL(10), @V_BOARDSTATUS DECIMAL(10), @V_CHARID VARCHAR(32),
	@V_DOCID DECIMAL(20) OUT, @V_DATESTR VARCHAR(23) OUT, @V_CODE DECIMAL(10) OUT
	)
AS
	DECLARE	@V_DATE		DATETIME;
	DECLARE @V_TOTALSALES	DECIMAL(10);
	DECLARE @V_ITEMCNT	DECIMAL(10);
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	/* 초기화 */
	SET @V_CODE = 4;
	SET @V_DOCID = 0;
	SET @V_DATE = GETDATE();
	SET @V_DATESTR = CONVERT(VARCHAR, @V_DATE, 120);

	/* TOTAL COUNT */
	SET @V_CODE = 6;
	SELECT @V_TOTALSALES = COUNT(*) FROM dbo.SALESBOARD WHERE CHARID = @V_CHARID;
	IF @V_TOTALSALES >= 10
	BEGIN
		--RAISERROR('ERROR', 11, 1);
		RETURN
	END

	/* CHECK DUPLICATION */
	SET @V_CODE = 7;
	SET @V_ITEMCNT = 0;
	SELECT @V_ITEMCNT = COUNT(*) FROM dbo.SALESBOARD WHERE ITEMSEQ = @V_ITEMSEQ;
	IF (@V_ITEMCNT > 0)
	BEGIN
		--RAISERROR('ERROR', 11, 2);
		RETURN
	END


	BEGIN TRY
		BEGIN TRANSACTION;

		SET @V_CODE = 8;
		INSERT INTO dbo.SALESBOARD(CHARID, ITEMSEQ, ITEMSEQ2, UNITPRICE, TOTALQTY, WDATE, ITEMTID, STATUS)
			SELECT I.CHARID, I.ITEMSEQ, I.ITEMSEQ, @V_PRICE, @V_QUANTITY, @V_DATE, I.ITEMTID, @V_BOARDSTATUS
			FROM dbo.CHARITEM I
			WHERE ITEMSEQ = @V_ITEMSEQ AND STATUS = @V_ITEMSTATUS;
		IF @@ROWCOUNT = 0
			RAISERROR('ERROR', 11, 3);

		SET @V_DOCID = @@IDENTITY;
		SET @V_CODE = 0;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END;	
	END CATCH;
END;


GO
/****** Object:  StoredProcedure [dbo].[SpSkillEquipInsert]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*********************************************************************************************
**		Desc: 
**		Auth: 
**		Date: 
**********************************************************************************************
**		Change History
**********************************************************************************************
**		Date:		Author:	       Description:
**		--------	--------       -----------------------------------------------
**		
*********************************************************************************************/

CREATE PROCEDURE
	[dbo].[SpSkillEquipInsert](@V_CHARID VARCHAR(32),@V_SKILLTID DECIMAL(20),@V_REMAINTIME DECIMAL(20),@V_EXPIRETIME VARCHAR(32),@V_SAVETYPE DECIMAL(20))
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	DELETE FROM charskillequip WHERE charid = @V_CHARID and skilltid = @V_SKILLTID;				
	INSERT INTO charskillequip(charid, skilltid, remaintime, expiredate, savetype)				
	VALUES (@V_CHARID, @V_SKILLTID, @V_REMAINTIME, @V_EXPIRETIME, @V_SAVETYPE);



GO
/****** Object:  StoredProcedure [dbo].[spTITLEADD]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*********************************************************************************************						
**		Desc: 				
**		Auth: 				
**		Date: 				
**********************************************************************************************						
**		Change History				
**********************************************************************************************						
**		Date:		Author:	       Description:	
**		--------	--------       -----------------------------------------------			
*********************************************************************************************/
CREATE PROCEDURE	[dbo].[spTITLEADD](
		@IsComplate	INT,
		@IsEquip	INT,
		@EquipDateTime	VARCHAR(12) ,
		@CharID		VARCHAR(32),
		@TitleID	INT
		
	)
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	UPDATE dbo.CHARTITLE SET mIsComplete = @IsComplate, mIsEquip = @IsEquip, mDateEquip = dbo.ufnStringToDate( @EquipDateTime ) 
	WHERE charid = @CharID and mTitleTid = @TitleID



GO
/****** Object:  StoredProcedure [dbo].[spTITLECOMPLATE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*********************************************************************************************						
**		Desc: 				
**		Auth: 				
**		Date: 				
**********************************************************************************************						
**		Change History				
**********************************************************************************************						
**		Date:		Author:	       Description:	
**		--------	--------       -----------------------------------------------			
*********************************************************************************************/
CREATE PROCEDURE	[dbo].[spTITLECOMPLATE](
		@IsComplate	INT,
		@ComplateDateTime	VARCHAR(12) ,
		@TitleID	INT,
		@CharID		VARCHAR(32)
			
	)
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	UPDATE dbo.CHARTITLE SET mIsComplete=@IsComplate, mDateComplete = dbo.ufnStringToDate( @ComplateDateTime )  
	WHERE mtitletid= @TitleID AND charid = @CharID



GO
/****** Object:  StoredProcedure [dbo].[spTITLEINSERT]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*********************************************************************************************						
**		Desc: 				
**		Auth: 				
**		Date: 				
**********************************************************************************************						
**		Change History				
**********************************************************************************************						
**		Date:		Author:	       Description:	
**		--------	--------       -----------------------------------------------			
*********************************************************************************************/
CREATE PROCEDURE	[dbo].[spTITLEINSERT](
		@CharID		VARCHAR(32),
		@TitleID	INT,
		@DateTime	VARCHAR(12) 
	)
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	INSERT INTO dbo.CHARTITLE(charid, mTitleTid, mDateAccept, mIsComplete, mIsEquip) 
	VALUES (@CharID, @TitleID, dbo.ufnStringToDate(@DateTime) , 0, 0)



GO
/****** Object:  StoredProcedure [dbo].[spTITLEUSE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*********************************************************************************************						
**		Desc: 				
**		Auth: 				
**		Date: 				
**********************************************************************************************						
**		Change History				
**********************************************************************************************						
**		Date:		Author:	       Description:	
**		--------	--------       -----------------------------------------------			
*********************************************************************************************/
CREATE PROCEDURE	[dbo].[spTITLEUSE](
		@EquipDateTime	VARCHAR(12) ,
		@IsEquip	INT,
		@TitleID	INT,
		@CharID		VARCHAR(32)
		
	)
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	UPDATE dbo.CHARTITLE SET mDateEquip = dbo.ufnStringToDate( @EquipDateTime ), mIsEquip = @IsEquip 
	WHERE mTitleTid = @TitleID and charid = @CharID



GO
/****** Object:  StoredProcedure [dbo].[SpUpdateQuestFlag]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[SpUpdateQuestFlag]
(@V_Flag char(512), @V_Flag2 char(512), @V_Flag3 char(512), @V_CHARID VARCHAR(32))
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	update dbo.chardetail
	set flag = @V_Flag, flag2 = @V_Flag2, flag3 = @V_Flag3
	where charid = @V_CHARID



GO
/****** Object:  StoredProcedure [dbo].[USP_ACCOUNT_MOVE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*********************************************************************************************						
**		Desc:
			@ACCOUNTID_TMP : 한게임ID + @Webzen 	
			@ACCOUNTID_WEBZEN : 웹젠가입ID		
**		Auth: 				
**		Date: 				
**********************************************************************************************						
**		Change History				
**********************************************************************************************						
**		Date:		Author:	       Description:	
**		--------	--------       -----------------------------------------------			
**		2010-12-20	soundkey		처음생성
*********************************************************************************************/						
CREATE PROCEDURE
	[dbo].[USP_ACCOUNT_MOVE](@ACCOUNTID_TMP VARCHAR(32), @ACCOUNTID_WEBZEN VARCHAR(32))
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	UPDATE ACCOUNTWORLD				SET ACCOUNTID = @ACCOUNTID_WEBZEN FROM ACCOUNTWORLD				WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE BAKCHARCASHITEM			SET ACCOUNTID = @ACCOUNTID_WEBZEN FROM BAKCHARCASHITEM			WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE BAKCHARITEM				SET ACCOUNTID = @ACCOUNTID_WEBZEN FROM BAKCHARITEM				WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE BAKCHARMASTER			SET ACCOUNTID = @ACCOUNTID_WEBZEN FROM BAKCHARMASTER			WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE CASHITEMBUYLIST			SET ACCOUNTID = @ACCOUNTID_WEBZEN FROM CASHITEMBUYLIST			WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE CERARIUM_CHARCASHITEM	SET ACCOUNTID = @ACCOUNTID_WEBZEN FROM CERARIUM_CHARCASHITEM	WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE CERARIUM_CHARITEM		SET ACCOUNTID = @ACCOUNTID_WEBZEN FROM CERARIUM_CHARITEM		WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE CERARIUM_CHARMASTER		SET ACCOUNTID = @ACCOUNTID_WEBZEN FROM CERARIUM_CHARMASTER		WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE CHARCASHITEM				SET ACCOUNTID = @ACCOUNTID_WEBZEN FROM CHARCASHITEM				WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE CHARITEM					SET ACCOUNTID = @ACCOUNTID_WEBZEN FROM CHARITEM					WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE CHARMASTER				SET ACCOUNTID = @ACCOUNTID_WEBZEN FROM CHARMASTER				WHERE ACCOUNTID = @ACCOUNTID_TMP;



GO
/****** Object:  StoredProcedure [dbo].[USP_ACCOUNT_MOVE_GAME]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*********************************************************************************************						
**		Desc:
			@ACCOUNTID_TMP : 한게임ID + @Webzen 	
			@ACCOUNTID_WEBZEN : 웹젠가입ID		
**		Auth: 				
**		Date: 				
**********************************************************************************************						
**		Change History				
**********************************************************************************************						
**		Date:		Author:	       Description:	
**		--------	--------       -----------------------------------------------			
**		2010-12-20	soundkey		처음생성
**		2011-03-10	soundkey		ACCOUNTWORLD 로직 수정. 이관안하고 플레이 하다가 캐릭터 다 지워도
									ACCOUNTWORLD 는 안지워지기때문
									기존의 웹젠계정의 accountworld 를 삭제 추가
*********************************************************************************************/						
CREATE PROCEDURE
	[dbo].[USP_ACCOUNT_MOVE_GAME](@ACCOUNTID_TMP VARCHAR(32), @ACCOUNTID_WEBZEN VARCHAR(32))
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	DELETE FROM dbo.ACCOUNTWORLD WHERE ACCOUNTID = @ACCOUNTID_WEBZEN
	
	UPDATE dbo.ACCOUNTWORLD				SET ACCOUNTID = @ACCOUNTID_WEBZEN WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE dbo.BAKCHARCASHITEM			SET ACCOUNTID = @ACCOUNTID_WEBZEN WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE dbo.BAKCHARITEM				SET ACCOUNTID = @ACCOUNTID_WEBZEN WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE dbo.BAKCHARMASTER			SET ACCOUNTID = @ACCOUNTID_WEBZEN WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE dbo.CASHITEMBUYLIST			SET ACCOUNTID = @ACCOUNTID_WEBZEN WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE dbo.CERARIUM_CHARCASHITEM	SET ACCOUNTID = @ACCOUNTID_WEBZEN WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE dbo.CERARIUM_CHARITEM		SET ACCOUNTID = @ACCOUNTID_WEBZEN WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE dbo.CERARIUM_CHARMASTER		SET ACCOUNTID = @ACCOUNTID_WEBZEN WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE dbo.CHARCASHITEM				SET ACCOUNTID = @ACCOUNTID_WEBZEN WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE dbo.CHARITEM					SET ACCOUNTID = @ACCOUNTID_WEBZEN WHERE ACCOUNTID = @ACCOUNTID_TMP;
	UPDATE dbo.CHARMASTER				SET ACCOUNTID = @ACCOUNTID_WEBZEN WHERE ACCOUNTID = @ACCOUNTID_TMP;



GO
/****** Object:  StoredProcedure [dbo].[USP_CHAR_MOVE_EVENT_REGIST]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************						
**		Desc: 육성서버 캐릭터 이전 신청
**		Auth: 유효열				
**		Date: 2011-05-19				
**		EX:   

DECLARE @V_CODE tinyint
EXECUTE ARCH_KALEF1.dbo.USP_CHAR_MOVE_EVENT_REGIST
   'Moonelf'
  ,'크라우'
  ,@V_CODE OUTPUT
SELECT @V_CODE
GO

		INPUT  :
		@V_CHARID : 캐릭터이름
		@V_WORLD  : 그룹월드명


		OUTPUT :
		@V_CODE 
				0 : 신청성공
				1 : 계정 못찾음
				2 : 이미 이전 신청 하였음
				3 : 빈슬롯 없음
				4 : 캐릭터 레벨이 10레벨 미만임
				5 : 18세 미만은 크라우만 선택 가능. 스톰하이드는 18세 이상만 선택가능
				-1 : DB에러

	--#### 하드코딩부분 서버 통합,추가시 수정해줘야 한다!!!!
		
**********************************************************************************************						
**		Change History				
**********************************************************************************************						
**		Date:		Author:	       Description:	
**		--------	--------       -----------------------------------------------			
**		2011-05-19	유 효 열		처음생성
*********************************************************************************************/						
CREATE PROCEDURE	[dbo].[USP_CHAR_MOVE_EVENT_REGIST]
(
		@V_CHARID	VARCHAR(47)	-- 캐릭터이름
	,	@V_WORLD	VARCHAR(20)	-- 그룹월드명
    ,	@V_CODE		INT OUTPUT
)
AS
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	DECLARE @mACCOUNTID VARCHAR(32)
	SET @mACCOUNTID = ''

	-- 계정 못찾으면 리턴
	SET @V_CODE = 1
	SELECT @mACCOUNTID = ACCOUNTID FROM CHARMASTER WHERE CHARID = @V_CHARID
	IF @@ROWCOUNT < 1
		RETURN

	-- 이전 신청 하였는지 확인. 계정당 하나만 이전 가능.
	SET @V_CODE = 2
	IF EXISTS( SELECT 1 FROM ARCH_KWEBARCH.dbo.TblCharMoveEvent WHERE mACCOUNTID = @mACCOUNTID )
		RETURN

	-- 이전 신청 그룹월드에 빈슬롯 있는지 체크
	-- 이전 신청한 그룹월드에 총 캐릭터 갯수가 통합된 서버 총 갯수 * 3  미만이면 빈슬롯 있는것
	SET @V_CODE = 3
	
	-- Live 적용부분
	--DECLARE @mCNT INT
	--SET @mCNT = 0
	--IF @V_WORLD = '크라우'	-- 총 서버 21개 * 3 = 63개 
	--BEGIN
	--	SELECT @mCNT = COUNT(*) FROM ARCH_KALEF11.dbo.CHARMASTER WHERE ACCOUNTID = @mACCOUNTID
	--	IF @mCNT >= 63
	--	BEGIN
	--		RETURN
	--	END
	--END
	--ELSE IF @V_WORLD = '스톰하이드'	-- 총 서버 6개 * 3 = 18개 
	--BEGIN
	--	SELECT @mCNT = COUNT(*) FROM ARCH_KALEF15.dbo.CHARMASTER WHERE ACCOUNTID = @mACCOUNTID
	--	IF @mCNT >= 18
	--	BEGIN
	--		RETURN
	--	END
	--END
	--ELSE
	--BEGIN
	--	RETURN
	--END	
	

	-- 캐릭터 레벨 10 이상만 이전 가능
	SET @V_CODE = 4
	DECLARE @mLV int
	SET @mLV = 0
	SELECT @mLV = LV FROM CHARDETAIL WHERE CHARID = @V_CHARID
	IF 	@mLV < 10
		RETURN
	
	-- 스톰하이드는 18세 이상만 가능 체크
	-- 18세 이상 유저 - 크라우/스톰하이드
	-- 18세 미만 유저 - 크라우
	-- 스톰하이드에 캐릭터 하나라도 있으면 18세 이상으로 간주
	-- 스톰하이드 캐릭터 하나도 없으면 18세 미만으로 간주
	SET @V_CODE = 5
	
	-- Live 적용부분
	--IF @V_WORLD = '스톰하이드'
	--BEGIN
	--	IF NOT EXISTS( SELECT 1 FROM ARCH_KALEF15.dbo.CHARMASTER WHERE mACCOUNTID = @mACCOUNTID )
	--	RETURN
	--END

	
	SET @V_CODE = -1
	INSERT INTO ARCH_KWEBARCH.dbo.TblCharMoveEvent (mACCOUNTID, mCHARID, mWORLD, mDate)
	VALUES (@mACCOUNTID, @V_CHARID, @V_WORLD, GETDATE() )
	IF @@ERROR <> 0
		RETURN
	
	SET @V_CODE = 0
	


GO
/****** Object:  StoredProcedure [dbo].[USP_SCHEDULE_JOB_DELETE_BAK_TABLE]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******************************************************************************

TITLE
        -. 아크로드 BAKCHARITEM의 아이템 로그 삭제
        
Project  : 글로벌 사이트

CALL     : 아크로드 BAKCHARITEM의 아이템로그 삭제
           BAKCHARITEM에 기록되는 아이템 판매 로그 삭제

DATABASE : ARCH_KALEF9~14

TABLES   : 

EX       :
            EXEC dbo.USP_SCHEDULE_JOB_DELETE_BAKCHARITEM
INPUT    : 

OUTPUT : 

REVERSION
------------------------------------------------------
    Date            Author          Description
------------------------------------------------------
    2009-09-08      권 순 용        최초작성
    2009-09-17      권 순 용        삭제주기 10일에서 5일로 변경
    2009-10-14      권 순 용        삭제항목 추가
                                    Inventory:stackcount == 0
                                    stackcount == 0
                                    Throw wastebasket
                                    Bank:stackcount == 0
                                    Refine material item
	2010-06-16		유 효 열		sell to merchant 삭제주기 3일 변경
									그외 20일 이상된거 모두 삭제로 변경
									BAKSALESBOARD 추가                                
------------------------------------------------------
*****************************************************************************/
CREATE PROC [dbo].[USP_SCHEDULE_JOB_DELETE_BAK_TABLE]
AS
BEGIN

    SET NOCOUNT ON
  
    WHILE(1>0)
    BEGIN
    
        DELETE TOP (100) FROM dbo.BAKCHARITEM
        WHERE REASON ='sell to merchant'
        AND DELTIME < (getdate() - 3 )   

        IF @@ROWCOUNT = 0 BREAK
    END


    WHILE(1>0)
    BEGIN
        DELETE TOP (100) FROM dbo.BAKCHARITEM
        WHERE DELTIME < (getdate() - 20 )   
 
        IF @@ROWCOUNT = 0 BREAK
    END
    
    WHILE(1>0)
    BEGIN
    
        DELETE TOP (100) FROM dbo.BAKSALESBOARD
        WHERE WDATE < (getdate() - 20 )  

        IF @@ROWCOUNT = 0 BREAK
    END
    

    SET NOCOUNT OFF
    
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SELECT_SALESBOARD]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[USP_SELECT_SALESBOARD]
(
		@ITEMTID	DECIMAL(10,0)
	,	@STATUS		DECIMAL(10,0)
	,	@DOCID		DECIMAL(20,0)
	,	@FLAG		BIT
)
AS
/*********************************************************************************************						
**		Desc: 
**		Auth: 유효열				
**		Date: 2011-12-22
**		EX:   
		EXEC dbo.USP_SELECT_SALESBOARD 486,0,1250000,1

**********************************************************************************************						
**		Change History				
**********************************************************************************************						
**		Date:		Author:	       Description:	
**		--------	--------       -----------------------------------------------			
**		2011-12-22	유 효 열		처음생성
*********************************************************************************************/		

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
/*
545=SELECT TOP 15 B.DOCID, B.CHARID, B.ITEMSEQ, B.UNITPRICE, B.TOTALQTY, B.ITEMTID, I.STACKCOUNT, I.NEEDLEVEL, I.CONVHIST, I.DURABILITY, I.MAXDUR, I.OPT, I.SKILLPLUS 
FROM CHARITEM I, SALESBOARD B 
WHERE I.ITEMSEQ=B.ITEMSEQ AND B.ITEMTID=? AND B.STATUS=? AND DOCID<? AND 0=?
 
UNION ALL 

SELECT TOP 15 B.DOCID, B.CHARID, B.ITEMSEQ, B.UNITPRICE, B.TOTALQTY, B.ITEMTID, I.STACKCOUNT, I.NEEDLEVEL, I.CONVHIST, I.DURABILITY, I.MAXDUR, I.OPT, I.SKILLPLUS 
FROM CHARITEM I, SALESBOARD B 
WHERE I.ITEMSEQ=B.ITEMSEQ AND B.ITEMTID=? AND B.STATUS=? AND DOCID>? AND 1=? 
ORDER BY DOCID DESC
*/
IF @FLAG = 0
BEGIN
	SELECT 
		TOP 15 
		B.DOCID, B.CHARID, B.ITEMSEQ, B.UNITPRICE, B.TOTALQTY, B.ITEMTID, I.STACKCOUNT, 
		I.NEEDLEVEL, I.CONVHIST, I.DURABILITY, I.MAXDUR, I.OPT, I.SKILLPLUS 
	FROM 
		dbo.CHARITEM I INNER JOIN dbo.SALESBOARD B ON I.ITEMSEQ = B.ITEMSEQ
	WHERE 
			B.ITEMTID = @ITEMTID 
		AND B.STATUS = @STATUS 
		AND DOCID < @DOCID 
	ORDER BY DOCID DESC	
END

ELSE IF @FLAG = 1
BEGIN	
	SELECT 
		TOP 15 
		B.DOCID, B.CHARID, B.ITEMSEQ, B.UNITPRICE, B.TOTALQTY, B.ITEMTID, I.STACKCOUNT, 
		I.NEEDLEVEL, I.CONVHIST, I.DURABILITY, I.MAXDUR, I.OPT, I.SKILLPLUS 
	FROM 
		dbo.CHARITEM I INNER JOIN dbo.SALESBOARD B ON I.ITEMSEQ = B.ITEMSEQ
	WHERE 
			B.ITEMTID = @ITEMTID 
		AND B.STATUS = @STATUS 
		AND DOCID > @DOCID 
	ORDER BY DOCID DESC	
END	
GO
/****** Object:  StoredProcedure [dbo].[usp_UPDATE_PVP_RESULT]    Script Date: 5/8/2022 8:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UPDATE_PVP_RESULT]
	@V_CHARID			char(50),
	@V_TOTALWIN			INT,
	@V_TOTALLOSE		INT,
	@V_VSHUMANWIN		INT,
	@V_VSHUMANLOSE		INT,
	@V_VSORCWIN			INT,
	@V_VSORCLOSE		INT,
	@V_VSMOONELFWIN		INT,
	@V_VSMOONELFLOSE	INT,
	@V_VSSCIONWIN		INT,
	@V_VSSCIONLOSE		INT		
AS
	DECLARE @V_NUM	INT;
	
	SET @V_NUM =0;
	SELECT @V_NUM = count(*) FROM DBO.CHARPVP
	WHERE CHARID = @V_CHARID
	
	IF @V_NUM > 0
	BEGIN
		UPDATE dbo.CHARPVP 
		SET TOTALWIN = @V_TOTALWIN , TOTALLOSE = @V_TOTALLOSE , VSHUMANWIN = @V_VSHUMANWIN , VSHUMANLOSE = @V_VSHUMANLOSE , VSORCWIN = @V_VSORCWIN , VSORCLOSE = @V_VSORCLOSE , VSMOONELFWIN = @V_VSMOONELFWIN , VSMOONELFLOSE = @V_VSMOONELFLOSE , VSSCIONWIN = @V_VSSCIONWIN , VSSCIONLOSE = @V_VSSCIONLOSE
		WHERE CHARID = @V_CHARID;
	END
	ELSE
	BEGIN
		INSERT INTO dbo.CHARPVP (CHARID, TOTALWIN, TOTALLOSE, VSHUMANWIN, VSHUMANLOSE, VSORCWIN, VSORCLOSE, VSMOONELFWIN, VSMOONELFLOSE, VSSCIONWIN, VSSCIONLOSE)
		VALUES (@V_CHARID, @V_TOTALWIN, @V_TOTALLOSE, @V_VSHUMANWIN, @V_VSHUMANLOSE, @V_VSORCWIN, @V_VSORCLOSE, @V_VSMOONELFWIN, @V_VSMOONELFLOSE, @V_VSSCIONWIN, @V_VSSCIONLOSE);		
	END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'계정' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ACCOUNTWORLD', @level2type=N'COLUMN',@level2name=N'ACCOUNTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'월드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ACCOUNTWORLD', @level2type=N'COLUMN',@level2name=N'WORLD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'뱅크에 있는 돈' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ACCOUNTWORLD', @level2type=N'COLUMN',@level2name=N'BANKMONEY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'뱅크 크기 (레이어 개수)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ACCOUNTWORLD', @level2type=N'COLUMN',@level2name=N'BANKSIZE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'월드별 계정' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ACCOUNTWORLD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'ITEMSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제 캐릭터 시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'CHARSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'계정' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'ACCOUNTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'월드명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'WORLD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'ITEMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'누적 수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'STACKCOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:FIELD,2:INVENTORY,3:EQUIP,8:SalesBox,51,CashInventory,52:MailBox, 100:BANK - AgpdItemStatus 참고' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'position, status에 따라 맵포지션 또는 인벤토리 그리드 포지션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'POS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템장착 필요 레벨' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'NEEDLEVEL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'획득시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'OWNTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'개조 내역' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'CONVHIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'내구도' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'DURABILITY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최대내구도' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'MAXDUR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'플래그' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 옵션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'OPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용중 여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'INUSE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용 횟수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'USECOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'남은 시간(초, ms 1초:1000ms)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'REMAINTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'만기일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'EXPIREDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제이유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'REASON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'DELTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'스킬 레벨옵션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'SKILLPLUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'스테미나 남은시간 (펫용)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM', @level2type=N'COLUMN',@level2name=N'STAMINAREMAINTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'백업 캐쉬아이템 - 캐릭터삭제시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARCASHITEM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제캐릭터 시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'CHARSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'게임내에서 획득하게 되는 타이틀(예. 아크로드,장군,…이었으나 스킬 초기화 구분용으로 쓰인다' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'TITLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'구분용' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'POS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'범죄상태(INNOCENT, CRIMINAL,MURDERER)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'CRIMINALSTATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'범죄자 포인트 (타 캐릭터 죽일때마다 상승)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'MURDERPOINT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CRIMINAL 상태가 없어질때까지 남은 시간(remained criminal flag time)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'RCFTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MURDERER 상태가 없어질때까지 남은 시간(remained criminal flag time)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'RMFTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'인벤토리 돈' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'INVENMONEY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'hit point' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'HP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'mana point' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'MP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'stamina point' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'SP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'experience' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'EXP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'LV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'skill point' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'SKILLPOINT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'단축키' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'QUICKBELT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터가 최근 간 지역' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'LATESTREGION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'퀘스트 플레그' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'퀘스트 플레그' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'FLAG2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터 상태' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'부활 일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'RESURRECTDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'변신 일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'TRANSFORMDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최종 접속일 BIP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'CURCONNDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최종 방문일 BIP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'LASTVISITDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최종 방문IP  BIP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'LASTVISITIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'커스터마이징 헤어' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'HAIR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'커스터마이징 얼굴' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'FACE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사망시 사망 종류' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL', @level2type=N'COLUMN',@level2name=N'DEADTYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'백업 캐릭터 디테일 - 캐릭터 삭제시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARDETAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 일련번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'ITEMSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제 캐릭터 시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'CHARSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'계정' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'ACCOUNTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'월드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'WORLD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'ITEMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'누적 수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'STACKCOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:FIELD,2:INVENTORY,3:EQUIP,8:SalesBox,51,CashInventory,52:MailBox, 100:BANK - AgpdItemStatus 참고' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'position, status에 따라 맵포지션 또는 인벤토리 그리드 포지션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'POS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 장착 레벨' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'NEEDLEVEL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'획득 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'OWNTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'개조 내역' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'CONVHIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'내구도' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'DURABILITY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최대 내구도' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'MAXDUR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'플래그' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 옵션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'OPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용중 여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'INUSE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용 횟수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'USECOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'남은 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'REMAINTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'만기일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'EXPIREDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제 이유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'REASON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'DELTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'스테미나 남은 시간(펫용)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM', @level2type=N'COLUMN',@level2name=N'STAMINAREMAINTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'백업아이템 - 캐릭터 삭제시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARITEM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제 캐릭터 시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARMASTER', @level2type=N'COLUMN',@level2name=N'CHARSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARMASTER', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'월드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARMASTER', @level2type=N'COLUMN',@level2name=N'WORLD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'계정' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARMASTER', @level2type=N'COLUMN',@level2name=N'ACCOUNTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'slot index (0,1,2)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARMASTER', @level2type=N'COLUMN',@level2name=N'SLOT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARMASTER', @level2type=N'COLUMN',@level2name=N'CHARTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터 생성일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARMASTER', @level2type=N'COLUMN',@level2name=N'CREATIONDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터 삭제일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARMASTER', @level2type=N'COLUMN',@level2name=N'DELETIONDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'부가서비스 이름변경전 이름' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARMASTER', @level2type=N'COLUMN',@level2name=N'CHARID2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'백업 캐릭터마스터 - 캐릭터 삭제시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARMASTER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제 캐릭터 시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARQUEST', @level2type=N'COLUMN',@level2name=N'CHARSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARQUEST', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'퀘스트 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARQUEST', @level2type=N'COLUMN',@level2name=N'QUESTTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'시작일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARQUEST', @level2type=N'COLUMN',@level2name=N'SDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아규먼트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARQUEST', @level2type=N'COLUMN',@level2name=N'ARG1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아규먼트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARQUEST', @level2type=N'COLUMN',@level2name=N'ARG2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NPC id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARQUEST', @level2type=N'COLUMN',@level2name=N'NPCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'백업 퀘스트 - 캐릭터 삭제시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARQUEST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제 캐릭터 시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARSKILL', @level2type=N'COLUMN',@level2name=N'CHARSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARSKILL', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'스킬 (SKILLTID + '','' + POINT + '':'') 로 인코딩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARSKILL', @level2type=N'COLUMN',@level2name=N'SKILLSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'생산스킬품목리스트. (ITEMTID + '':'') 로 인코딩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARSKILL', @level2type=N'COLUMN',@level2name=N'PRODUCT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'백업 스킬 - 캐릭터 삭제시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARSKILL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'이름' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARTITLE', @level2type=N'COLUMN',@level2name=N'CharID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'타이틀ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARTITLE', @level2type=N'COLUMN',@level2name=N'mTitleTid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'완료여부 (0:미완료, 1:완료)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARTITLE', @level2type=N'COLUMN',@level2name=N'mIsComplete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'장착여부 (0:미장착, 1:장착)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARTITLE', @level2type=N'COLUMN',@level2name=N'mIsEquip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARTITLE', @level2type=N'COLUMN',@level2name=N'mValue1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARTITLE', @level2type=N'COLUMN',@level2name=N'mValue2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARTITLE', @level2type=N'COLUMN',@level2name=N'mValue3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARTITLE', @level2type=N'COLUMN',@level2name=N'mValue4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARTITLE', @level2type=N'COLUMN',@level2name=N'mValue5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'수락시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARTITLE', @level2type=N'COLUMN',@level2name=N'mDateAccept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'완료시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARTITLE', @level2type=N'COLUMN',@level2name=N'mDateComplete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'타이틀 장착시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKCHARTITLE', @level2type=N'COLUMN',@level2name=N'mDateEquip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'문서 일련번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKSALESBOARD', @level2type=N'COLUMN',@level2name=N'DOCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKSALESBOARD', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKSALESBOARD', @level2type=N'COLUMN',@level2name=N'ITEMSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가격' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKSALESBOARD', @level2type=N'COLUMN',@level2name=N'UNITPRICE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'판매수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKSALESBOARD', @level2type=N'COLUMN',@level2name=N'TOTALQTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'작성일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKSALESBOARD', @level2type=N'COLUMN',@level2name=N'WDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKSALESBOARD', @level2type=N'COLUMN',@level2name=N'ITEMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'거래상태 (2:취소,3:완료)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKSALESBOARD', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'거래 게시판 백업 - 거래 완료나 취소시 SALEBOARD에서 백업' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BAKSALESBOARD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'구매번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'BUYSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'계정' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'ACCOUNTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'CHARTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'레벨' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'CHARLV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'ITEMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'수량, 한묶음이 몇개인지' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'ITEMQTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템시퀀스, 구매완료시 주어짐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'ITEMSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'구매금액, 로니' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'MONEY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'구매일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'BUYTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'구매IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'BUYIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'주문번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'ORDERNO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'BUYREQ:구매요청,BUYCOM:구매완료,EXHAUST:소진,DRAWBACK:환물,GMGIVE:GM줬다,COUPON:쿠폰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'유료아이템 구매내역-이 데이타는 신뢰하지 않는다' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASHITEMBUYLIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'성 이름' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASTLE', @level2type=N'COLUMN',@level2name=N'CASTLEID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'소유 길드명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASTLE', @level2type=N'COLUMN',@level2name=N'OWNERGUILDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'총 세수입(일주일한번-월요일 지역세수입을 모두더한수입이 추가)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASTLE', @level2type=N'COLUMN',@level2name=N'TOTALINCOME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최근 이체일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASTLE', @level2type=N'COLUMN',@level2name=N'LATESTTRANSFER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최근 세율 수정일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASTLE', @level2type=N'COLUMN',@level2name=N'LATESTMODIFY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'지역명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASTLE', @level2type=N'COLUMN',@level2name=N'REGIONNAME1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'지역 세율' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASTLE', @level2type=N'COLUMN',@level2name=N'REGIONRATIO1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'지역 세수입' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASTLE', @level2type=N'COLUMN',@level2name=N'REGIONINCOME1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'성' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CASTLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARBUDDY', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'친구 아이디' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARBUDDY', @level2type=N'COLUMN',@level2name=N'BUDDYID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'친구,거부 플래그' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARBUDDY', @level2type=N'COLUMN',@level2name=N'FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'친구/거부 리스트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARBUDDY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'ITEMSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'계정' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'ACCOUNTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'월드명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'WORLD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'ITEMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'누적수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'STACKCOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:FIELD,2:INVENTORY,3:EQUIP,8:SalesBox,51,CashInventory,52:MailBox, 100:BANK - AgpdItemStatus 참고' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'position, status에 따라 맵포지션 또는 인벤토리 그리드 포지션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'POS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 장착레벨' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'NEEDLEVEL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'획득시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'OWNTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'개조내역' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'CONVHIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'내구도' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'DURABILITY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최대 내구도' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'MAXDUR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'플래그' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 옵션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'OPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용중 여부 (0:사용안함, 1:사용중, 2:일시중지)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'INUSE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용 횟수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'USECOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'남은 시간(ms, 1초:1000)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'REMAINTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'만기일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'EXPIREDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'스킬 레벨 옵션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'SKILLPLUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'펫 스테미나 남은시간 (ms, 1초:1000)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM', @level2type=N'COLUMN',@level2name=N'STAMINAREMAINTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐쉬(로니)아이템 - 아이템테이블과 동일구조' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARCASHITEM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'스킬 초기화 한경우 국내:치약바르자, 글로벌:Initialize  추가되는 특성을 붙여서 쓰기로 한다.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARDETAIL', @level2type=N'COLUMN',@level2name=N'TITLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'히로익 포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARDETAIL', @level2type=N'COLUMN',@level2name=N'HEROICPOINT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'배틀스퀘어 마지막 죽은 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARDETAIL', @level2type=N'COLUMN',@level2name=N'BSLastKilledTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'ITEMSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'계정' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'ACCOUNTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'월드명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'WORLD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'ITEMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'누적수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'STACKCOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:FIELD,2:INVENTORY,3:EQUIP,8:SalesBox,51,CashInventory,52:MailBox, 100:BANK - AgpdItemStatus 참고' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'position, status에 따라 맵포지션 또는 인벤토리 그리드 포지션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'POS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'장착 레벨' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'NEEDLEVEL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'획득 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'OWNTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'개조 내역' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'CONVHIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'내구도' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'DURABILITY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최대 내구도' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'MAXDUR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'플래그 - 1:획득시 귀속, 2:장착시 귀속, 4:사용시 귀속, 8: ... 9: 1+8 귀속' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 옵션 ( ItemOptionTable.xlsx 의 숫자) 예)모든 스탯 +4 (132) -> update charitem set opt =''132,0,0,0,0'' where itemseq = XX;' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'OPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용중 여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'INUSE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용 횟수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'USECOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'남은 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'REMAINTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'만기일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'EXPIREDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'스킬 레벨 옵션 ( SkillTemplate.ini ) 예)파워서지 Lv1,헬스번 Lv1, 샤우팅 Lv1 ->update charitem set opt =''351,82,129'' where itemseq = XX;' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'SKILLPLUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'펫 스테미나 남은 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM', @level2type=N'COLUMN',@level2name=N'STAMINAREMAINTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARITEM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARMASTER', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'서버통합 이전 캐릭터, 이름변경전 캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARMASTER', @level2type=N'COLUMN',@level2name=N'OLDCHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'월드명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARMASTER', @level2type=N'COLUMN',@level2name=N'WORLD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'계정' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARMASTER', @level2type=N'COLUMN',@level2name=N'ACCOUNTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'slot index (0,1,2)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARMASTER', @level2type=N'COLUMN',@level2name=N'SLOT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARMASTER', @level2type=N'COLUMN',@level2name=N'CHARTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터 생성일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARMASTER', @level2type=N'COLUMN',@level2name=N'CREATIONDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터 마스터 - 변경되지 않는 캐릭터 속성' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARMASTER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARQUEST', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'퀘스트 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARQUEST', @level2type=N'COLUMN',@level2name=N'QUESTTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'시작일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARQUEST', @level2type=N'COLUMN',@level2name=N'SDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아규먼트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARQUEST', @level2type=N'COLUMN',@level2name=N'ARG1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아규먼트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARQUEST', @level2type=N'COLUMN',@level2name=N'ARG2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NPC ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARQUEST', @level2type=N'COLUMN',@level2name=N'NPCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'진행중 퀘스트. 완료퀘스트는 CHARDETAIL.FLAG에 BIT MASK로 저장' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARQUEST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARSKILL', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'스킬. (SKILLTID + '','' + POINT + '':'' ) 로 인코딩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARSKILL', @level2type=N'COLUMN',@level2name=N'SKILLSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'생산스킬품목리스트. (조합TID + '':'') 로 인코딩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARSKILL', @level2type=N'COLUMN',@level2name=N'PRODUCT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터 소유 스킬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARSKILL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARSKILLEQUIP', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'스킬 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARSKILLEQUIP', @level2type=N'COLUMN',@level2name=N'SKILLTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'남은시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARSKILLEQUIP', @level2type=N'COLUMN',@level2name=N'REMAINTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'만료 일자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARSKILLEQUIP', @level2type=N'COLUMN',@level2name=N'EXPIREDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'저장 구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARSKILLEQUIP', @level2type=N'COLUMN',@level2name=N'SAVETYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'스킬장비 정보 저장(버프시간 저장용)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARSKILLEQUIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'이름' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARTITLE', @level2type=N'COLUMN',@level2name=N'CharID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'타이틀ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARTITLE', @level2type=N'COLUMN',@level2name=N'mTitleTid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'완료여부 (0:미완료, 1:완료)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARTITLE', @level2type=N'COLUMN',@level2name=N'mIsComplete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'장착여부 (0:미장착, 1:장착)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARTITLE', @level2type=N'COLUMN',@level2name=N'mIsEquip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARTITLE', @level2type=N'COLUMN',@level2name=N'mValue1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARTITLE', @level2type=N'COLUMN',@level2name=N'mValue2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARTITLE', @level2type=N'COLUMN',@level2name=N'mValue3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARTITLE', @level2type=N'COLUMN',@level2name=N'mValue4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARTITLE', @level2type=N'COLUMN',@level2name=N'mValue5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'수락시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARTITLE', @level2type=N'COLUMN',@level2name=N'mDateAccept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'완료시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARTITLE', @level2type=N'COLUMN',@level2name=N'mDateComplete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'타이틀 장착시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHARTITLE', @level2type=N'COLUMN',@level2name=N'mDateEquip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 아이디' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDBATTLEHIST', @level2type=N'COLUMN',@level2name=N'GUILDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'적 길드 아이디' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDBATTLEHIST', @level2type=N'COLUMN',@level2name=N'ENEMYGUILDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'결과 (1:승, 2:무, 3:패, 4:  , 5:  )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDBATTLEHIST', @level2type=N'COLUMN',@level2name=N'BATTLERESULT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'시작일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDBATTLEHIST', @level2type=N'COLUMN',@level2name=N'BATTLESTDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'기간 (단위:초)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDBATTLEHIST', @level2type=N'COLUMN',@level2name=N'BATTLEDURATION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'획득점수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDBATTLEHIST', @level2type=N'COLUMN',@level2name=N'SCORE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'적 점수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDBATTLEHIST', @level2type=N'COLUMN',@level2name=N'ENEMYSCORE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 전투 기록' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDBATTLEHIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'ITEMSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 아이디' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'GUILDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'ITEMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'누적 수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'STACKCOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'status(FIELD, INVENTORY, EQUIP)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'position, status에 따라 맵포지션 또는 인벤토리 그리드 포지션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'POS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'장착 레벨' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'NEEDLEVEL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'획득 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'OWNTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'개조 내역' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'CONVHIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'내구도' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'DURABILITY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최대 내구도' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'MAXDUR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'플래그' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 옵션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'OPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용 여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'INUSE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용 횟수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'USECOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'남은 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'REMAINTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'만기일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'EXPIREDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'스킬 옵션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'SKILLPLUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'펫 스테미나 남은 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM', @level2type=N'COLUMN',@level2name=N'STAMINAREMAINTIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 창고 아이템 - 아이템 테이블과 구조 동일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDITEM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 아이디' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'GUILDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'GUILDTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 마스터 아이디' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'GMCHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최대 인원수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'MAXMEMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'생성일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'CREATIONDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'유니온 아이디' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'UNIONID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 순위(사용안함)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'GUILDRANK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'암호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'PASSWORD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'전투중인 길드. 임시용' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'BATTLEGUILDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'전투 시작일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'BATTLESTDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'전투 기간 (사용안함)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'BATTLEDURATION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드전 스코어 ( 사용안함)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'SCORE1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드전 승리 횟수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'WIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드전 비긴 횟수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'DRAW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드전 패배 횟수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'LOSE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 마크' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'MARKID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 마크 컬러' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'COLORID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 창고 머니' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'MONEY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 창고 슬롯 (레이어 수)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'SLOT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드전 전체 점수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER', @level2type=N'COLUMN',@level2name=N'GUILDPOINT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 마스터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMASTER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMEMBER', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 아이디' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMEMBER', @level2type=N'COLUMN',@level2name=N'GUILDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'맴버 순위 - 1:일반 길드원,2:가입 신청중,3:탈퇴 신청중,10:길드 마스터,11:부 길드마스터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMEMBER', @level2type=N'COLUMN',@level2name=N'MEMBERRANK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가입일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMEMBER', @level2type=N'COLUMN',@level2name=N'JOINDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드 멤버' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDMEMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDRELATIONSHIP', @level2type=N'COLUMN',@level2name=N'GUILDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'대상 길드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDRELATIONSHIP', @level2type=N'COLUMN',@level2name=N'TARGETGUILDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'관계 (적대:10,  우호 :   등)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDRELATIONSHIP', @level2type=N'COLUMN',@level2name=N'RELATION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'날짜 (서버 머신 타임)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDRELATIONSHIP', @level2type=N'COLUMN',@level2name=N'WDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드간 관계(적대, 우호)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GUILDRELATIONSHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LORDGUARD', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'선출일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LORDGUARD', @level2type=N'COLUMN',@level2name=N'ELECDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아크로드 호위대' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LORDGUARD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'길드명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LORDOFGEN', @level2type=N'COLUMN',@level2name=N'GUILDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LORDOFGEN', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'성' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LORDOFGEN', @level2type=N'COLUMN',@level2name=N'SIEGEID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'시작일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LORDOFGEN', @level2type=N'COLUMN',@level2name=N'DATEFROM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'종료일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LORDOFGEN', @level2type=N'COLUMN',@level2name=N'DATETO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'역대 아크로드리스트. 사용안함' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LORDOFGEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'메일 시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MAILBOX', @level2type=N'COLUMN',@level2name=N'MAILSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'받는이' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MAILBOX', @level2type=N'COLUMN',@level2name=N'TOCHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'보내는이' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MAILBOX', @level2type=N'COLUMN',@level2name=N'FROMCHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'제목' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MAILBOX', @level2type=N'COLUMN',@level2name=N'SUBJECT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'내용' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MAILBOX', @level2type=N'COLUMN',@level2name=N'CONTENTS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'작성일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MAILBOX', @level2type=N'COLUMN',@level2name=N'WDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'상태 플래그' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MAILBOX', @level2type=N'COLUMN',@level2name=N'FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'첨부 아이템 시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MAILBOX', @level2type=N'COLUMN',@level2name=N'ITEMSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'첨부 아이템 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MAILBOX', @level2type=N'COLUMN',@level2name=N'ITEMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'첨부 아이템 수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MAILBOX', @level2type=N'COLUMN',@level2name=N'ITEMQTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'우편함' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MAILBOX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'서버 아이디' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RPGWT', @level2type=N'COLUMN',@level2name=N'SERVERID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RPGWT', @level2type=N'COLUMN',@level2name=N'CHARTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RPGWT', @level2type=N'COLUMN',@level2name=N'WDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'현재 동접자 수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RPGWT', @level2type=N'COLUMN',@level2name=N'CURCONN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최대 동접자 수 ( 사용 안함 )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RPGWT', @level2type=N'COLUMN',@level2name=N'MAXCONN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'동접' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RPGWT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'문서 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOARD', @level2type=N'COLUMN',@level2name=N'DOCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터 (판매자)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOARD', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOARD', @level2type=N'COLUMN',@level2name=N'ITEMSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 시퀀스 (update 안됨)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOARD', @level2type=N'COLUMN',@level2name=N'ITEMSEQ2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가격' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOARD', @level2type=N'COLUMN',@level2name=N'UNITPRICE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'판매 수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOARD', @level2type=N'COLUMN',@level2name=N'TOTALQTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOARD', @level2type=N'COLUMN',@level2name=N'WDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'아이템 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOARD', @level2type=N'COLUMN',@level2name=N'ITEMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'거래상태  (0:판매중, 1:판매완료)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOARD', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'거래 게시판' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOARD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'구매ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOUGHT', @level2type=N'COLUMN',@level2name=N'BUYID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'게시판 문서ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOUGHT', @level2type=N'COLUMN',@level2name=N'DOCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'구매자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOUGHT', @level2type=N'COLUMN',@level2name=N'BUYCHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'구매수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOUGHT', @level2type=N'COLUMN',@level2name=N'BUYQTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'구매일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOUGHT', @level2type=N'COLUMN',@level2name=N'BUYDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'구매후 새롭게 생성되는 아이템 시퀀스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOUGHT', @level2type=N'COLUMN',@level2name=N'BUYITEMSEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'거래게시판 구매내역' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SALESBOUGHT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'성 이름' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGE', @level2type=N'COLUMN',@level2name=N'CASTLEID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공성 번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGE', @level2type=N'COLUMN',@level2name=N'SIEGEID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'신청 마감날짜(컬럼이름과 다름)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGE', @level2type=N'COLUMN',@level2name=N'APPLYBEGINDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'신청 경과 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGE', @level2type=N'COLUMN',@level2name=N'APPLYELAPSED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공성 시작일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGE', @level2type=N'COLUMN',@level2name=N'SIEGEBEGINDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공성 경과 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGE', @level2type=N'COLUMN',@level2name=N'SIEGEELAPSED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공성 종료 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGE', @level2type=N'COLUMN',@level2name=N'SIEGEENDDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'이전 종료 시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGE', @level2type=N'COLUMN',@level2name=N'PREVENDDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'현재 공성 상태 2:공수성 길드신청받을수 있는 상태  3:공성 준비상태라서 신청이 안받아 짐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGE', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최종 각인 길드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGE', @level2type=N'COLUMN',@level2name=N'GUILDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공성' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'성 이름' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEAPPLICATION', @level2type=N'COLUMN',@level2name=N'CASTLEID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공성 번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEAPPLICATION', @level2type=N'COLUMN',@level2name=N'SIEGEID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'신청 길드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEAPPLICATION', @level2type=N'COLUMN',@level2name=N'GUILDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공수 선택' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEAPPLICATION', @level2type=N'COLUMN',@level2name=N'SIDE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'신청일 (의미없음. 기본값 들어감)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEAPPLICATION', @level2type=N'COLUMN',@level2name=N'APPLYDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'발탁여부 ( 0:     ,  1:수락됨 )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEAPPLICATION', @level2type=N'COLUMN',@level2name=N'ADOPTED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공성 신청' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEAPPLICATION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'성 이름' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEOBJECT', @level2type=N'COLUMN',@level2name=N'CASTLEID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'오브젝트 Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEOBJECT', @level2type=N'COLUMN',@level2name=N'OBJECTNO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'오브젝트 템플릿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEOBJECT', @level2type=N'COLUMN',@level2name=N'TID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HIT POINT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEOBJECT', @level2type=N'COLUMN',@level2name=N'HP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEOBJECT', @level2type=N'COLUMN',@level2name=N'POS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'상태' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEOBJECT', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'특수 상태' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEOBJECT', @level2type=N'COLUMN',@level2name=N'SPECIALSTATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공성 오브젝트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIEGEOBJECT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캐릭터' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WANTEDCRIMINAL', @level2type=N'COLUMN',@level2name=N'CHARID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'현상금' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WANTEDCRIMINAL', @level2type=N'COLUMN',@level2name=N'BOUNTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'현상수배자 리스트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WANTEDCRIMINAL'
GO
USE [master]
GO
ALTER DATABASE [ALEF] SET  READ_WRITE 
GO

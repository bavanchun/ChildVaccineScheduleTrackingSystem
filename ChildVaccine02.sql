USE [master]
GO
/****** Object:  Database [ChildVaccine]    Script Date: 3/27/2025 12:39:03 ******/
CREATE DATABASE [ChildVaccine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChildVaccine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS2022\MSSQL\DATA\ChildVaccine.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChildVaccine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS2022\MSSQL\DATA\ChildVaccine_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ChildVaccine] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChildVaccine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChildVaccine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChildVaccine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChildVaccine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChildVaccine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChildVaccine] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChildVaccine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChildVaccine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChildVaccine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChildVaccine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChildVaccine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChildVaccine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChildVaccine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChildVaccine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChildVaccine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChildVaccine] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChildVaccine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChildVaccine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChildVaccine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChildVaccine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChildVaccine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChildVaccine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChildVaccine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChildVaccine] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ChildVaccine] SET  MULTI_USER 
GO
ALTER DATABASE [ChildVaccine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChildVaccine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChildVaccine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChildVaccine] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChildVaccine] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChildVaccine] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ChildVaccine] SET QUERY_STORE = ON
GO
ALTER DATABASE [ChildVaccine] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ChildVaccine]
GO
/****** Object:  Table [dbo].[tblAppointments]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAppointments](
	[appointmentID] [int] IDENTITY(1,1) NOT NULL,
	[childID] [int] NOT NULL,
	[centerID] [int] NOT NULL,
	[appointmentDate] [date] NOT NULL,
	[appointmentTime] [time](7) NOT NULL,
	[serviceType] [nvarchar](50) NOT NULL,
	[notificationStatus] [nvarchar](20) NULL,
	[status] [nvarchar](20) NOT NULL,
	[vaccineID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[appointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCenters]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCenters](
	[centerID] [int] IDENTITY(1,1) NOT NULL,
	[centerName] [nvarchar](100) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[phoneNumber] [nvarchar](15) NOT NULL,
	[email] [nvarchar](100) NULL,
	[operatingHours] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[centerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChildren]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChildren](
	[childID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](20) NOT NULL,
	[childName] [nvarchar](100) NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[gender] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[childID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomers](
	[userID] [nvarchar](20) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](100) NULL,
	[roleID] [nvarchar](20) NOT NULL,
	[email] [nvarchar](100) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [nvarchar](15) NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDisease]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDisease](
	[diseaseID] [int] IDENTITY(1,1) NOT NULL,
	[childID] [int] NOT NULL,
	[vaccineID] [int] NOT NULL,
	[appointmentID] [int] NOT NULL,
	[diseaseName] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[diagnosisDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[diseaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiseaseName]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiseaseName](
	[diseaseId] [int] IDENTITY(1,1) NOT NULL,
	[vaccineID] [int] NOT NULL,
	[diseaseName] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diseaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDoctor]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDoctor](
	[doctorID] [varchar](50) NOT NULL,
	[doctorName] [nvarchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[roleID] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [varchar](20) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[doctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](20) NOT NULL,
	[centerID] [int] NOT NULL,
	[feedbackText] [nvarchar](max) NULL,
	[rating] [int] NULL,
	[feedbackDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotifications]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotifications](
	[notificationID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](20) NOT NULL,
	[notificationDate] [datetime] NOT NULL,
	[notificationText] [nvarchar](max) NOT NULL,
	[isRead] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[notificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPackageDetails]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPackageDetails](
	[packageDetailID] [int] IDENTITY(1,1) NOT NULL,
	[packageID] [int] NOT NULL,
	[vaccineID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[packageDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPackages]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPackages](
	[packageID] [int] IDENTITY(1,1) NOT NULL,
	[packageName] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[packageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayments]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayments](
	[paymentID] [int] IDENTITY(1,1) NOT NULL,
	[appointmentID] [int] NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[paymentDate] [datetime] NULL,
	[status] [varchar](20) NULL,
	[paymentMethod] [varchar](50) NOT NULL,
	[transactionCode] [varchar](100) NOT NULL,
	[updateDate] [datetime] NULL,
	[updatedBy] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReports]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReports](
	[reportID] [int] IDENTITY(1,1) NOT NULL,
	[centerID] [int] NOT NULL,
	[reportDate] [date] NOT NULL,
	[totalAppointments] [int] NULL,
	[totalRevenue] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[reportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblServiceAppointments]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServiceAppointments](
	[serviceAppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[appointmentID] [int] NOT NULL,
	[serviceID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[serviceAppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblServices]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServices](
	[serviceID] [int] IDENTITY(1,1) NOT NULL,
	[serviceName] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[serviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStaff]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStaff](
	[staffID] [varchar](50) NOT NULL,
	[staffName] [nvarchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[roleID] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [varchar](20) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[staffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVaccineReactions]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVaccineReactions](
	[reactionID] [int] IDENTITY(1,1) NOT NULL,
	[appointmentID] [int] NOT NULL,
	[reactionText] [nvarchar](max) NULL,
	[reactionDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVaccines]    Script Date: 3/27/2025 12:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVaccines](
	[vaccineID] [int] IDENTITY(1,1) NOT NULL,
	[vaccineName] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[recommendedAge] [nvarchar](50) NULL,
	[status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[vaccineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAppointments] ON 

INSERT [dbo].[tblAppointments] ([appointmentID], [childID], [centerID], [appointmentDate], [appointmentTime], [serviceType], [notificationStatus], [status], [vaccineID]) VALUES (1, 1, 1, CAST(N'2025-02-15' AS Date), CAST(N'08:00:00' AS Time), N'Single Vaccination (Tiêm lẻ)', N'Not pending', N'Pending', NULL)
INSERT [dbo].[tblAppointments] ([appointmentID], [childID], [centerID], [appointmentDate], [appointmentTime], [serviceType], [notificationStatus], [status], [vaccineID]) VALUES (2, 1, 1, CAST(N'2025-03-01' AS Date), CAST(N'08:00:00' AS Time), N'Full Package (Trọn Gói)', N'Not pending', N'Pending', NULL)
INSERT [dbo].[tblAppointments] ([appointmentID], [childID], [centerID], [appointmentDate], [appointmentTime], [serviceType], [notificationStatus], [status], [vaccineID]) VALUES (3, 2, 2, CAST(N'2025-03-10' AS Date), CAST(N'08:00:00' AS Time), N'Personalization (Cá nhân hóa)', N'Not pending', N'Confirmed', NULL)
INSERT [dbo].[tblAppointments] ([appointmentID], [childID], [centerID], [appointmentDate], [appointmentTime], [serviceType], [notificationStatus], [status], [vaccineID]) VALUES (4, 1, 1, CAST(N'2025-02-01' AS Date), CAST(N'08:00:00' AS Time), N'Single Vaccination (Tiêm lẻ)', N'Not pending', N'Done', NULL)
SET IDENTITY_INSERT [dbo].[tblAppointments] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCenters] ON 

INSERT [dbo].[tblCenters] ([centerID], [centerName], [address], [phoneNumber], [email], [operatingHours], [description]) VALUES (1, N'VNVC Ha Noi', N'So 180 Truong Chinh, Ha Noi', N'0243-1234567', N'hanoi@vnvc.vn', N'08:00 - 18:00', N'Trung tâm tiêm ch?ng VNVC t?i Ha Noi')
INSERT [dbo].[tblCenters] ([centerID], [centerName], [address], [phoneNumber], [email], [operatingHours], [description]) VALUES (2, N'VNVC Ho Chi Minh', N'So 198 Nguyen Thi Minh Khai, Quan 1, TP.HCM', N'0283-9876543', N'hcm@vnvc.vn', N'08:00 - 18:00', N'Trung tâm tiêm ch?ng VNVC t?i TP.HCM')
SET IDENTITY_INSERT [dbo].[tblCenters] OFF
GO
SET IDENTITY_INSERT [dbo].[tblChildren] ON 

INSERT [dbo].[tblChildren] ([childID], [userID], [childName], [dateOfBirth], [gender]) VALUES (1, N'admin', N'Nguyen Thi C', CAST(N'2018-03-25' AS Date), N'Female')
INSERT [dbo].[tblChildren] ([childID], [userID], [childName], [dateOfBirth], [gender]) VALUES (2, N'cus1', N'Tran Van D', CAST(N'2019-08-10' AS Date), N'Male')
SET IDENTITY_INSERT [dbo].[tblChildren] OFF
GO
INSERT [dbo].[tblCustomers] ([userID], [password], [fullName], [roleID], [email], [address], [phone], [status]) VALUES (N'admin', N'2', N'Tran Gia Huy', N'AD', N'admin@example.com', N'123 Main St', N'0123456789', 1)
INSERT [dbo].[tblCustomers] ([userID], [password], [fullName], [roleID], [email], [address], [phone], [status]) VALUES (N'cus1', N'1', N'Huynh Cong Hoa', N'AD', N'cus1@example.com', N'456 Street', N'0987654321', 1)
INSERT [dbo].[tblCustomers] ([userID], [password], [fullName], [roleID], [email], [address], [phone], [status]) VALUES (N'cus2', N'1', N'Ho Quoc Trung', N'US', N'cus2@example.com', N'789 Street', N'0989654321', 1)
INSERT [dbo].[tblCustomers] ([userID], [password], [fullName], [roleID], [email], [address], [phone], [status]) VALUES (N'cus3', N'1', N'Nhat Long', N'US', N'cus3@example.com', N'10JQ Street', N'0987254321', 1)
INSERT [dbo].[tblCustomers] ([userID], [password], [fullName], [roleID], [email], [address], [phone], [status]) VALUES (N'cus4', N'1', N'Nhat Huy', N'US', N'cus4@example.com', N'QKA Street', N'0981654321', 1)
INSERT [dbo].[tblCustomers] ([userID], [password], [fullName], [roleID], [email], [address], [phone], [status]) VALUES (N'cus5', N'1', N'Nguyen Van A', N'US', N'nguyenvana@gmail.com', N'So 10 Hoang Dieu, Ha Noi', N'0912345678', 1)
INSERT [dbo].[tblCustomers] ([userID], [password], [fullName], [roleID], [email], [address], [phone], [status]) VALUES (N'cus6', N'1', N'Tran Thi B', N'US', N'tranthib@gmail.com', N'So 5 Le Loi, TP.HCM', N'0987654321', 1)
GO
SET IDENTITY_INSERT [dbo].[tblDiseaseName] ON 

INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (1, 1, N'Bạch Hầu', N'Vaccine bach hau được sử dụng để phòng ngừa bệnh bạch hầu. Lịch tiêm: 2, 3, 4 tháng tuổi và nhắc lại lúc 18 tháng. Chỉ định: Dành cho trẻ từ 2 tháng tuổi trở lên, không có tiền sử dị ứng với thành phần vaccine. Chống chỉ định: Trẻ có tiền sử phản ứng nghiêm trọng với vaccine bạch hầu hoặc thành phần của nó. Liều lượng: 0.5 ml/dose. Thời gian cách li: 1 tháng giữa các liều ban đầu và 6 tháng cho mũi nhắc lại.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (2, 2, N'Uốn Ván', N'Vaccine uon van giúp phòng ngừa bệnh uốn ván. Lịch tiêm: 2, 3, 4 tháng tuổi và nhắc lại lúc 18 tháng. Chỉ định: Dành cho trẻ từ 2 tháng tuổi trở lên. Chống chỉ định: Trẻ dị ứng với thành phần vaccine. Liều lượng: 0.5 ml/dose. Thời gian cách li: 1 tháng giữa liều ban đầu, 6 tháng cho mũi nhắc lại.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (3, 3, N'Ho Gà', N'Vaccine ho ga được dùng để phòng ngừa bệnh ho ga. Lịch tiêm: 2, 3, 4 tháng tuổi. Chỉ định: Dành cho trẻ từ 2 tháng tuổi trở lên. Chống chỉ định: Trẻ có tiền sử dị ứng với vaccine ho ga. Liều lượng: 0.5 ml/dose. Thời gian cách li: 1 tháng giữa các liều.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (4, 4, N'Viêm Gan B', N'Vaccine viem gan B ngăn ngừa bệnh viêm gan B. Lịch tiêm: sơ sinh, 2, 3, 4 tháng tuổi và nhắc lại sau này. Chỉ định: Dành cho trẻ sơ sinh và trẻ từ 2 tháng tuổi trở lên. Chống chỉ định: Trẻ có phản ứng dị ứng nặng với thành phần vaccine. Liều lượng: 0.5 ml/dose. Thời gian cách li: Liều sơ sinh và sau đó cách nhau 1 tháng, mũi nhắc sau 6-12 tháng.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (5, 5, N'Quai Bị', N'Vaccine quai bi giúp phòng ngừa bệnh quai bị. Lịch tiêm: mũi đầu khi trẻ đủ 12 tháng và nhắc lại lúc 4-6 tuổi. Chỉ định: Dành cho trẻ từ 12 tháng trở lên. Chống chỉ định: Trẻ có tiền sử dị ứng với thành phần vaccine quai bi. Liều lượng: 0.5 ml/dose. Thời gian cách li: 4-6 tháng giữa liều đầu và liều nhắc lại.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (6, 6, N'Soi', N'Vaccine soi được sử dụng để phòng ngừa bệnh soi. Lịch tiêm: từ 1 tuổi và nhắc lại lúc 18 tháng. Chỉ định: Dành cho trẻ từ 1 tuổi trở lên. Chống chỉ định: Trẻ có tiền sử phản ứng dị ứng với vaccine soi. Liều lượng: 0.5 ml/dose. Thời gian cách li: 1 năm cho liều nhắc lại.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (7, 7, N'Rubella', N'Vaccine rubella giúp phòng ngừa bệnh rubella. Lịch tiêm: từ 1 tuổi và có thể nhắc lại. Chỉ định: Dành cho trẻ từ 1 tuổi trở lên. Chống chỉ định: Trẻ có tiền sử dị ứng với vaccine rubella. Liều lượng: 0.5 ml/dose. Thời gian cách li: Theo chỉ định của bác sĩ.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (8, 8, N'Viêm Não Mô Cầu', N'Vaccine viem nao mo cau ngăn ngừa bệnh viêm não mô cầu. Lịch tiêm: bắt đầu từ 6 tháng tuổi. Chỉ định: Dành cho trẻ từ 6 tháng tuổi trở lên. Chống chỉ định: Trẻ dị ứng với thành phần vaccine. Liều lượng: 0.5 ml/dose. Thời gian cách li: Theo phác đồ của trung tâm y tế.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (9, 9, N'Thuong Hãn', N'Vaccine thuong han phòng ngừa các biến chứng của bệnh thường hãn. Lịch tiêm: mũi chính và bổ sung ở 30 tháng (ví dụ). Chỉ định: Dành cho trẻ từ 9 tháng trở lên. Chống chỉ định: Trẻ có tiền sử dị ứng với vaccine thuong han. Liều lượng: 0.5 ml/dose. Thời gian cách li: 1 năm giữa liều chính và liều bổ sung.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (10, 10, N'Rotavirus', N'Vaccine rotavirus giúp phòng ngừa tiêu chảy do rotavirus. Lịch tiêm: 2, 3, 4 tháng tuổi. Chỉ định: Dành cho trẻ sơ sinh và trẻ nhỏ. Chống chỉ định: Trẻ có bệnh tiêu hóa nặng hoặc dị ứng với thành phần vaccine. Liều lượng: 0.2 ml/dose. Thời gian cách li: 1 tháng giữa các liều.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (11, 11, N'Ung Thư', N'Vaccine HPV giúp phòng ngừa ung thư cổ tử cung. Lịch tiêm: từ 9 tuổi trở lên. Chỉ định: Dành cho thiếu niên và người lớn từ 9 tuổi. Chống chỉ định: Phụ nữ mang thai, hoặc có tiền sử dị ứng với thành phần vaccine. Liều lượng: 0.5 ml/dose. Thời gian cách li: 2 tháng giữa liều đầu và thứ hai, 6 tháng cho liều thứ ba.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (12, 12, N'Viêm Phổi', N'Vaccine phoi cau được sử dụng để phòng ngừa bệnh viêm phổi. Lịch tiêm: 2, 3, 4 tháng tuổi và có thể nhắc lại ở 12 tháng. Chỉ định: Dành cho trẻ từ 2 tháng tuổi trở lên. Chống chỉ định: Trẻ có dị ứng với thành phần vaccine hoặc phản ứng quá mẫn với liều tiêm trước đó. Liều lượng: 0.5 ml/dose. Thời gian cách li: 1 tháng giữa các liều, mũi nhắc sau 8-12 tháng.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (13, 13, N'Viêm Phổi Lặp Lại', N'Vaccine phoi viem giúp phòng ngừa bệnh viêm phổi lặp lại. Lịch tiêm: 2, 3, 4 tháng tuổi và nhắc lại sau 6 tháng nếu cần. Chỉ định: Dành cho trẻ có nguy cơ cao mắc viêm phổi lặp lại. Chống chỉ định: Trẻ có phản ứng dị ứng với vaccine phoi viem. Liều lượng: 0.5 ml/dose. Thời gian cách li: 1 tháng giữa các liều, liều nhắc sau 6 tháng nếu cần.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (14, 14, N'Viêm Gan A', N'Vaccine viem gan A ngăn ngừa bệnh viêm gan A. Lịch tiêm: từ 1 tuổi và nhắc lại sau 6-12 tháng. Chỉ định: Dành cho trẻ từ 1 tuổi trở lên. Chống chỉ định: Trẻ có phản ứng dị ứng với vaccine viem gan A. Liều lượng: 0.5 ml/dose. Thời gian cách li: 1 năm cho liều nhắc lại.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (15, 15, N'HIB', N'Vaccine HIB được sử dụng để phòng ngừa viêm màng não do HIB. Lịch tiêm: 2 tháng tuổi và nhắc lại lúc 18 tháng. Chỉ định: Dành cho trẻ từ 2 tháng tuổi trở lên. Chống chỉ định: Trẻ có tiền sử dị ứng với thành phần HIB. Liều lượng: 0.5 ml/dose. Thời gian cách li: 1 tháng giữa các liều, mũi nhắc sau 12-18 tháng.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (16, 16, N'Tiêu Duong', N'Vaccine tieu duong giúp phòng ngừa bệnh tiêu duong. Lịch tiêm: từ 6 tuổi trở lên. Chỉ định: Dành cho trẻ em và người lớn ở độ tuổi từ 6 trở lên. Chống chỉ định: Trẻ có bệnh lý tiêu hóa nặng hoặc dị ứng với vaccine. Liều lượng: 0.5 ml/dose. Thời gian cách li: Theo phác đồ của bác sĩ.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (17, 17, N'Rotavirus Nâng Cao', N'Vaccine rota 5 trong 1 giúp phòng ngừa tiêu chảy do rota virus. Lịch tiêm: 2, 3, 4 tháng tuổi. Chỉ định: Dành cho trẻ sơ sinh và trẻ nhỏ. Chống chỉ định: Trẻ có tiền sử dị ứng với thành phần vaccine. Liều lượng: 0.2 ml/dose. Thời gian cách li: 1 tháng giữa các liều.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (18, 18, N'Thuỷ Đậu', N'Vaccine thuy dau được sử dụng để phòng ngừa bệnh thủy đậu. Lịch tiêm: từ 1 tuổi trở lên. Chỉ định: Dành cho trẻ từ 1 tuổi trở lên. Chống chỉ định: Trẻ có tiền sử dị ứng với vaccine thủy đậu. Liều lượng: 0.5 ml/dose. Thời gian cách li: 1 năm giữa liều chính và nhắc lại nếu cần.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (19, 19, N'MMR', N'Vaccine quai bi-soi-rubella được dùng để phòng ngừa bệnh quai bị, sởi và rubella. Lịch tiêm: từ 1 tuổi và nhắc lại sau 6 tháng. Chỉ định: Dành cho trẻ từ 1 tuổi trở lên. Chống chỉ định: Trẻ có tiền sử dị ứng với bất kỳ thành phần nào của vaccine. Liều lượng: 0.5 ml/dose. Thời gian cách li: 1 năm giữa liều chính và liều nhắc.')
INSERT [dbo].[tblDiseaseName] ([diseaseId], [vaccineID], [diseaseName], [description]) VALUES (20, 20, N'Phối Phúc Hợp', N'Vaccine phoi phuc hop giúp phòng ngừa các bệnh viêm phổi và các bệnh liên quan. Lịch tiêm: từ 6 tháng tuổi và có thể nhắc lại sau này. Chỉ định: Dành cho trẻ từ 6 tháng tuổi trở lên. Chống chỉ định: Trẻ dị ứng với thành phần vaccine phối phúc hợp. Liều lượng: 0.5 ml/dose. Thời gian cách li: Theo chỉ dẫn của bác sĩ.')
SET IDENTITY_INSERT [dbo].[tblDiseaseName] OFF
GO
INSERT [dbo].[tblDoctor] ([doctorID], [doctorName], [password], [roleID], [email], [address], [phone], [status]) VALUES (N'doc1', N'Nguyen Cong Son', N'2', N'doctor', N'doc1@example.com', N'123 NY St', N'036945978', 1)
INSERT [dbo].[tblDoctor] ([doctorID], [doctorName], [password], [roleID], [email], [address], [phone], [status]) VALUES (N'doc2', N'Ly Thien Long', N'2', N'doctor', N'doc2@example.com', N'456 NY Street', N'046987123', 1)
INSERT [dbo].[tblDoctor] ([doctorID], [doctorName], [password], [roleID], [email], [address], [phone], [status]) VALUES (N'doc3', N'Ly Cao Cuong', N'2', N'doctor', N'doc3@example.com', N'789 NY Street', N'014632879', 1)
GO
SET IDENTITY_INSERT [dbo].[tblFeedback] ON 

INSERT [dbo].[tblFeedback] ([feedbackID], [userID], [centerID], [feedbackText], [rating], [feedbackDate]) VALUES (1, N'admin', 1, N'Dịch vụ tốt, nhân viên nhiệt tình.', 5, CAST(N'2025-01-05' AS Date))
INSERT [dbo].[tblFeedback] ([feedbackID], [userID], [centerID], [feedbackText], [rating], [feedbackDate]) VALUES (2, N'cus1', 2, N'Trung tâm sạch sẽ, an toàn.', 4, CAST(N'2025-01-06' AS Date))
SET IDENTITY_INSERT [dbo].[tblFeedback] OFF
GO
SET IDENTITY_INSERT [dbo].[tblNotifications] ON 

INSERT [dbo].[tblNotifications] ([notificationID], [userID], [notificationDate], [notificationText], [isRead]) VALUES (1, N'admin', CAST(N'2025-01-10T00:00:00.000' AS DateTime), N'Lịch tiêm của bé Nguyễn Thị C vào ngày 2025-02-15 tại VNVC Hà Nội', 0)
INSERT [dbo].[tblNotifications] ([notificationID], [userID], [notificationDate], [notificationText], [isRead]) VALUES (2, N'cus1', CAST(N'2025-01-12T00:00:00.000' AS DateTime), N'Lịch tiêm của bé Trần Văn D vào ngày 2025-03-01 tại VNVC Hồ Chí Minh', 0)
INSERT [dbo].[tblNotifications] ([notificationID], [userID], [notificationDate], [notificationText], [isRead]) VALUES (3, N'cus1', CAST(N'2025-01-15T00:00:00.000' AS DateTime), N'Lịch tiêm của bé Trần Văn D vào ngày 2025-03-10 tại VNVC Hà Nội', 1)
SET IDENTITY_INSERT [dbo].[tblNotifications] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPackageDetails] ON 

INSERT [dbo].[tblPackageDetails] ([packageDetailID], [packageID], [vaccineID]) VALUES (1, 1, 1)
INSERT [dbo].[tblPackageDetails] ([packageDetailID], [packageID], [vaccineID]) VALUES (2, 2, 2)
SET IDENTITY_INSERT [dbo].[tblPackageDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPackages] ON 

INSERT [dbo].[tblPackages] ([packageID], [packageName], [description], [price], [status]) VALUES (1, N'Goi 5 trong 1', N'Bao gồm các mũi tiêm 5 trong 1', CAST(2500000.00 AS Decimal(10, 2)), N'Active')
INSERT [dbo].[tblPackages] ([packageID], [packageName], [description], [price], [status]) VALUES (2, N'Goi phong cum', N'Bao gồm các mũi tiêm phòng cúm mùa', CAST(1200000.00 AS Decimal(10, 2)), N'Active')
SET IDENTITY_INSERT [dbo].[tblPackages] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPayments] ON 

INSERT [dbo].[tblPayments] ([paymentID], [appointmentID], [amount], [paymentDate], [status], [paymentMethod], [transactionCode], [updateDate], [updatedBy]) VALUES (2, 1, CAST(100000.00 AS Decimal(10, 2)), CAST(N'2025-03-16T00:00:00.000' AS DateTime), N'Paid', N'MoMo', N'TR-20240316-00001', CAST(N'2025-03-24T16:54:05.137' AS DateTime), N'System')
INSERT [dbo].[tblPayments] ([paymentID], [appointmentID], [amount], [paymentDate], [status], [paymentMethod], [transactionCode], [updateDate], [updatedBy]) VALUES (3, 2, CAST(150000.00 AS Decimal(10, 2)), CAST(N'2025-03-16T00:00:00.000' AS DateTime), N'Pending', N'VNPay', N'TR-20240316-00002', CAST(N'2025-03-24T16:54:05.137' AS DateTime), N'System')
INSERT [dbo].[tblPayments] ([paymentID], [appointmentID], [amount], [paymentDate], [status], [paymentMethod], [transactionCode], [updateDate], [updatedBy]) VALUES (4, 3, CAST(200000.00 AS Decimal(10, 2)), CAST(N'2025-03-16T00:00:00.000' AS DateTime), N'Confirmed', N'Cash', N'TR-20240316-00003', CAST(N'2025-03-24T16:54:05.137' AS DateTime), N'Staff001')
SET IDENTITY_INSERT [dbo].[tblPayments] OFF
GO
SET IDENTITY_INSERT [dbo].[tblReports] ON 

INSERT [dbo].[tblReports] ([reportID], [centerID], [reportDate], [totalAppointments], [totalRevenue]) VALUES (1, 1, CAST(N'2025-01-01' AS Date), 10, CAST(7500000.00 AS Decimal(10, 2)))
INSERT [dbo].[tblReports] ([reportID], [centerID], [reportDate], [totalAppointments], [totalRevenue]) VALUES (2, 2, CAST(N'2025-01-02' AS Date), 15, CAST(12000000.00 AS Decimal(10, 2)))
INSERT [dbo].[tblReports] ([reportID], [centerID], [reportDate], [totalAppointments], [totalRevenue]) VALUES (3, 2, CAST(N'2025-01-03' AS Date), 20, CAST(15000000.00 AS Decimal(10, 2)))
INSERT [dbo].[tblReports] ([reportID], [centerID], [reportDate], [totalAppointments], [totalRevenue]) VALUES (4, 1, CAST(N'2025-01-04' AS Date), 12, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[tblReports] ([reportID], [centerID], [reportDate], [totalAppointments], [totalRevenue]) VALUES (5, 2, CAST(N'2025-01-05' AS Date), 18, CAST(13500000.00 AS Decimal(10, 2)))
INSERT [dbo].[tblReports] ([reportID], [centerID], [reportDate], [totalAppointments], [totalRevenue]) VALUES (6, 1, CAST(N'2025-01-06' AS Date), 22, CAST(16500000.00 AS Decimal(10, 2)))
INSERT [dbo].[tblReports] ([reportID], [centerID], [reportDate], [totalAppointments], [totalRevenue]) VALUES (7, 1, CAST(N'2025-01-07' AS Date), 8, CAST(6000000.00 AS Decimal(10, 2)))
INSERT [dbo].[tblReports] ([reportID], [centerID], [reportDate], [totalAppointments], [totalRevenue]) VALUES (8, 2, CAST(N'2025-01-08' AS Date), 14, CAST(10500000.00 AS Decimal(10, 2)))
INSERT [dbo].[tblReports] ([reportID], [centerID], [reportDate], [totalAppointments], [totalRevenue]) VALUES (9, 2, CAST(N'2025-01-09' AS Date), 25, CAST(18000000.00 AS Decimal(10, 2)))
INSERT [dbo].[tblReports] ([reportID], [centerID], [reportDate], [totalAppointments], [totalRevenue]) VALUES (10, 1, CAST(N'2025-01-10' AS Date), 10, CAST(7500000.00 AS Decimal(10, 2)))
INSERT [dbo].[tblReports] ([reportID], [centerID], [reportDate], [totalAppointments], [totalRevenue]) VALUES (11, 2, CAST(N'2025-01-11' AS Date), 17, CAST(12750000.00 AS Decimal(10, 2)))
INSERT [dbo].[tblReports] ([reportID], [centerID], [reportDate], [totalAppointments], [totalRevenue]) VALUES (12, 1, CAST(N'2025-01-12' AS Date), 21, CAST(15750000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[tblReports] OFF
GO
SET IDENTITY_INSERT [dbo].[tblServiceAppointments] ON 

INSERT [dbo].[tblServiceAppointments] ([serviceAppointmentID], [appointmentID], [serviceID]) VALUES (1, 1, 1)
INSERT [dbo].[tblServiceAppointments] ([serviceAppointmentID], [appointmentID], [serviceID]) VALUES (2, 2, 2)
INSERT [dbo].[tblServiceAppointments] ([serviceAppointmentID], [appointmentID], [serviceID]) VALUES (3, 2, 3)
SET IDENTITY_INSERT [dbo].[tblServiceAppointments] OFF
GO
SET IDENTITY_INSERT [dbo].[tblServices] ON 

INSERT [dbo].[tblServices] ([serviceID], [serviceName], [description], [price], [status]) VALUES (1, N'Tiem Vaccine', N'Dịch vụ tiêm lẻ các loại vaccine', CAST(500000.00 AS Decimal(10, 2)), N'Active')
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [description], [price], [status]) VALUES (2, N'Tu Van', N'Tư vấn các loại vaccine và lịch tiêm', CAST(200000.00 AS Decimal(10, 2)), N'Active')
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [description], [price], [status]) VALUES (3, N'Giam sat suc khoe', N'Dịch vụ kiểm tra và giám sát sức khỏe trước khi tiêm', CAST(300000.00 AS Decimal(10, 2)), N'Active')
SET IDENTITY_INSERT [dbo].[tblServices] OFF
GO
INSERT [dbo].[tblStaff] ([staffID], [staffName], [password], [roleID], [email], [address], [phone], [status]) VALUES (N'staff1', N'Ly Thien An', N'3', N'Staff', N'staff1@example.com', N'123 Chicago St', N'039458761', 1)
INSERT [dbo].[tblStaff] ([staffID], [staffName], [password], [roleID], [email], [address], [phone], [status]) VALUES (N'staff2', N'Ly Thien Long', N'3', N'Staff', N'staff2@example.com', N'456 Chicago Street', N'058741369', 1)
INSERT [dbo].[tblStaff] ([staffID], [staffName], [password], [roleID], [email], [address], [phone], [status]) VALUES (N'staff3', N'Ly Cao Cuong', N'3', N'Staff', N'staff3@example.com', N'789 Chicago Street', N'0369715478', 1)
GO
SET IDENTITY_INSERT [dbo].[tblVaccines] ON 

INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (1, N'Vaccine bach hau', N'Phòng ngừa bệnh bạch hầu ở trẻ em', CAST(500000.00 AS Decimal(10, 2)), N'2 thang tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (2, N'Vaccine uon van', N'Phòng chống bệnh uốn ván', CAST(450000.00 AS Decimal(10, 2)), N'2 thang tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (3, N'Vaccine ho ga', N'Phòng ngừa bệnh ho ga', CAST(400000.00 AS Decimal(10, 2)), N'2 thang tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (4, N'Vaccine viem gan B', N'Phòng bệnh viêm gan B', CAST(550000.00 AS Decimal(10, 2)), N'2 thang tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (5, N'Vaccine quai bi', N'Phòng ngừa bệnh quai bị', CAST(600000.00 AS Decimal(10, 2)), N'1 tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (6, N'Vaccine soi', N'Phòng chống bệnh soi', CAST(600000.00 AS Decimal(10, 2)), N'1 tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (7, N'Vaccine rubella', N'Phòng ngừa bệnh rubella', CAST(700000.00 AS Decimal(10, 2)), N'1 tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (8, N'Vaccine viem nao mo cau', N'Phòng ngừa bệnh viêm não mô cầu', CAST(800000.00 AS Decimal(10, 2)), N'6 thang tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (9, N'Vaccine thuong han', N'Phòng ngừa bệnh thường hãn', CAST(900000.00 AS Decimal(10, 2)), N'6 thang tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (10, N'Vaccine rotavirus', N'Phòng ngừa tiêu chảy do rotavirus', CAST(1000000.00 AS Decimal(10, 2)), N'2 thang tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (11, N'Vaccine HPV', N'Phòng ngừa ung thư cổ tử cung', CAST(1500000.00 AS Decimal(10, 2)), N'9 tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (12, N'Vaccine phoi cau', N'Phòng ngừa bệnh viêm phoi', CAST(1200000.00 AS Decimal(10, 2)), N'2 thang tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (13, N'Vaccine phoi viem', N'Phòng ngừa bệnh viêm phoi', CAST(1100000.00 AS Decimal(10, 2)), N'2 thang tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (14, N'Vaccine viem gan A', N'Phòng ngừa bệnh viêm gan A', CAST(1000000.00 AS Decimal(10, 2)), N'1 tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (15, N'Vaccine HIB', N'Phòng ngừa viêm màng não do HIB', CAST(900000.00 AS Decimal(10, 2)), N'2 thang tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (16, N'Vaccine tieu duong', N'Phòng ngừa bệnh tiêu duong', CAST(2000000.00 AS Decimal(10, 2)), N'6 tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (17, N'Vaccine rota 5 trong 1', N'Phòng ngừa bệnh do rota virus', CAST(3000000.00 AS Decimal(10, 2)), N'2 thang tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (18, N'Vaccine thuy dau', N'Phòng ngừa bệnh thủy đậu', CAST(800000.00 AS Decimal(10, 2)), N'1 tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (19, N'Vaccine quai bi-soi-rubella', N'Phòng ngừa bệnh quai bị, soi và rubella', CAST(2000000.00 AS Decimal(10, 2)), N'1 tuoi tro len', N'Active')
INSERT [dbo].[tblVaccines] ([vaccineID], [vaccineName], [description], [price], [recommendedAge], [status]) VALUES (20, N'Vaccine phoi phuc hop', N'Phòng ngừa các bệnh viêm phổi và các bệnh liên quan', CAST(2500000.00 AS Decimal(10, 2)), N'6 thang tuoi tro len', N'Active')
SET IDENTITY_INSERT [dbo].[tblVaccines] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblPayme__CF15ABA8B39DF453]    Script Date: 3/27/2025 12:39:03 ******/
ALTER TABLE [dbo].[tblPayments] ADD UNIQUE NONCLUSTERED 
(
	[transactionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAppointments] ADD  DEFAULT ('08:00:00') FOR [appointmentTime]
GO
ALTER TABLE [dbo].[tblAppointments] ADD  DEFAULT (N'Tiêm lẻ') FOR [serviceType]
GO
ALTER TABLE [dbo].[tblAppointments] ADD  DEFAULT ('Not pending') FOR [notificationStatus]
GO
ALTER TABLE [dbo].[tblAppointments] ADD  DEFAULT ('Pending') FOR [status]
GO
ALTER TABLE [dbo].[tblCustomers] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[tblDisease] ADD  DEFAULT (getdate()) FOR [diagnosisDate]
GO
ALTER TABLE [dbo].[tblDoctor] ADD  DEFAULT ('Doctor') FOR [roleID]
GO
ALTER TABLE [dbo].[tblDoctor] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[tblNotifications] ADD  DEFAULT (getdate()) FOR [notificationDate]
GO
ALTER TABLE [dbo].[tblNotifications] ADD  DEFAULT ((0)) FOR [isRead]
GO
ALTER TABLE [dbo].[tblPackages] ADD  DEFAULT ('Active') FOR [status]
GO
ALTER TABLE [dbo].[tblPayments] ADD  DEFAULT (getdate()) FOR [paymentDate]
GO
ALTER TABLE [dbo].[tblServices] ADD  DEFAULT ('Active') FOR [status]
GO
ALTER TABLE [dbo].[tblStaff] ADD  DEFAULT ('Staff') FOR [roleID]
GO
ALTER TABLE [dbo].[tblStaff] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[tblVaccineReactions] ADD  DEFAULT (getdate()) FOR [reactionDate]
GO
ALTER TABLE [dbo].[tblVaccines] ADD  DEFAULT ('Active') FOR [status]
GO
ALTER TABLE [dbo].[tblAppointments]  WITH CHECK ADD FOREIGN KEY([centerID])
REFERENCES [dbo].[tblCenters] ([centerID])
GO
ALTER TABLE [dbo].[tblAppointments]  WITH CHECK ADD FOREIGN KEY([childID])
REFERENCES [dbo].[tblChildren] ([childID])
GO
ALTER TABLE [dbo].[tblAppointments]  WITH CHECK ADD FOREIGN KEY([vaccineID])
REFERENCES [dbo].[tblVaccines] ([vaccineID])
GO
ALTER TABLE [dbo].[tblChildren]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblCustomers] ([userID])
GO
ALTER TABLE [dbo].[tblDisease]  WITH CHECK ADD  CONSTRAINT [FK_tblDisease_tblAppointments] FOREIGN KEY([appointmentID])
REFERENCES [dbo].[tblAppointments] ([appointmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblDisease] CHECK CONSTRAINT [FK_tblDisease_tblAppointments]
GO
ALTER TABLE [dbo].[tblDisease]  WITH CHECK ADD  CONSTRAINT [FK_tblDisease_tblChildren] FOREIGN KEY([childID])
REFERENCES [dbo].[tblChildren] ([childID])
GO
ALTER TABLE [dbo].[tblDisease] CHECK CONSTRAINT [FK_tblDisease_tblChildren]
GO
ALTER TABLE [dbo].[tblDisease]  WITH CHECK ADD  CONSTRAINT [FK_tblDisease_tblVaccines] FOREIGN KEY([vaccineID])
REFERENCES [dbo].[tblVaccines] ([vaccineID])
GO
ALTER TABLE [dbo].[tblDisease] CHECK CONSTRAINT [FK_tblDisease_tblVaccines]
GO
ALTER TABLE [dbo].[tblDiseaseName]  WITH CHECK ADD FOREIGN KEY([vaccineID])
REFERENCES [dbo].[tblVaccines] ([vaccineID])
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD FOREIGN KEY([centerID])
REFERENCES [dbo].[tblCenters] ([centerID])
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblCustomers] ([userID])
GO
ALTER TABLE [dbo].[tblNotifications]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblCustomers] ([userID])
GO
ALTER TABLE [dbo].[tblPackageDetails]  WITH CHECK ADD FOREIGN KEY([packageID])
REFERENCES [dbo].[tblPackages] ([packageID])
GO
ALTER TABLE [dbo].[tblPackageDetails]  WITH CHECK ADD FOREIGN KEY([vaccineID])
REFERENCES [dbo].[tblVaccines] ([vaccineID])
GO
ALTER TABLE [dbo].[tblPayments]  WITH CHECK ADD FOREIGN KEY([appointmentID])
REFERENCES [dbo].[tblAppointments] ([appointmentID])
GO
ALTER TABLE [dbo].[tblReports]  WITH CHECK ADD FOREIGN KEY([centerID])
REFERENCES [dbo].[tblCenters] ([centerID])
GO
ALTER TABLE [dbo].[tblServiceAppointments]  WITH CHECK ADD FOREIGN KEY([appointmentID])
REFERENCES [dbo].[tblAppointments] ([appointmentID])
GO
ALTER TABLE [dbo].[tblServiceAppointments]  WITH CHECK ADD FOREIGN KEY([serviceID])
REFERENCES [dbo].[tblServices] ([serviceID])
GO
ALTER TABLE [dbo].[tblVaccineReactions]  WITH CHECK ADD FOREIGN KEY([appointmentID])
REFERENCES [dbo].[tblAppointments] ([appointmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[tblPayments]  WITH CHECK ADD CHECK  (([status]='Cancelled' OR [status]='Confirmed' OR [status]='Paid' OR [status]='Pending'))
GO
USE [master]
GO
ALTER DATABASE [ChildVaccine] SET  READ_WRITE 
GO

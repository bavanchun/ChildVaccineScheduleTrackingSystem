USE [master]
GO
/****** Object:  Database [ChildVaccine]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblAppointments]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblCenters]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblChildren]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblDisease]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblDiseaseName]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblDoctor]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblNotifications]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblPackageDetails]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblPackages]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblPayments]    Script Date: 3/27/2025 12:36:35 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[transactionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReports]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblServiceAppointments]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblServices]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblStaff]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblVaccineReactions]    Script Date: 3/27/2025 12:36:35 ******/
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
/****** Object:  Table [dbo].[tblVaccines]    Script Date: 3/27/2025 12:36:35 ******/
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

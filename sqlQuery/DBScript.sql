USE [master]
GO
/****** Object:  Database [PRJ301Assignment]    Script Date: 29/06/2022 10:18:38 SA ******/
CREATE DATABASE [PRJ301Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2019\MSSQL\DATA\PRJ301Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2019\MSSQL\DATA\PRJ301Assignment_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ301Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ301Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301Assignment', N'ON'
GO
ALTER DATABASE [PRJ301Assignment] SET QUERY_STORE = OFF
GO
USE [PRJ301Assignment]
GO
/****** Object:  Table [dbo].[AttendanceReport]    Script Date: 29/06/2022 10:18:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceReport](
	[ID] [int] NOT NULL,
	[SessionID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[StudentName] [nchar](10) NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[Comment] [varchar](150) NOT NULL,
	[RecordTime] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_AttendanceGroupReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 29/06/2022 10:18:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [varchar](20) NOT NULL,
	[CourseName] [varchar](150) NOT NULL,
	[NumOfSlot] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 29/06/2022 10:18:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](20) NOT NULL,
	[CourseID] [varchar](20) NOT NULL,
	[LectureID] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupStudent]    Script Date: 29/06/2022 10:18:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupStudent](
	[GroupID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_GroupStudent] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecture]    Script Date: 29/06/2022 10:18:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecture](
	[ID] [varchar](20) NOT NULL,
	[LectureName] [varchar](150) NULL,
 CONSTRAINT [PK_Lecture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 29/06/2022 10:18:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 29/06/2022 10:18:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[TimeSlotID] [int] NOT NULL,
	[SessionNo] [int] NOT NULL,
	[SessionDate] [date] NOT NULL,
	[Room] [varchar](20) NOT NULL,
	[LectureID] [varchar](20) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 29/06/2022 10:18:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](150) NOT NULL,
	[StudentDOB] [date] NOT NULL,
	[StudentGender] [bit] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 29/06/2022 10:18:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [time](0) NOT NULL,
	[EndTime] [time](0) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Course] ([ID], [CourseName], [NumOfSlot]) VALUES (N'DBI202', N'Introduction to Database', 30)
INSERT [dbo].[Course] ([ID], [CourseName], [NumOfSlot]) VALUES (N'IOT102', N'Internet of Things', 15)
INSERT [dbo].[Course] ([ID], [CourseName], [NumOfSlot]) VALUES (N'JPD123', N'Elementary Japanese 1.A1.2', 30)
INSERT [dbo].[Course] ([ID], [CourseName], [NumOfSlot]) VALUES (N'MAS291', N'Statistic and Probability', 30)
INSERT [dbo].[Course] ([ID], [CourseName], [NumOfSlot]) VALUES (N'PRJ301', N'Java Web', 30)
INSERT [dbo].[Course] ([ID], [CourseName], [NumOfSlot]) VALUES (N'SWE201c', N'Introduce to Software Engineering', 30)
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([ID], [GroupName], [CourseID], [LectureID]) VALUES (1, N'SE1623', N'PRJ301', N'sonnt5')
INSERT [dbo].[Group] ([ID], [GroupName], [CourseID], [LectureID]) VALUES (2, N'SE1623', N'MAS291', N'tultt3')
INSERT [dbo].[Group] ([ID], [GroupName], [CourseID], [LectureID]) VALUES (3, N'SE1623', N'IOT102', N'sonhx')
INSERT [dbo].[Group] ([ID], [GroupName], [CourseID], [LectureID]) VALUES (4, N'AI1604', N'JPD123', N'hanhvb')
INSERT [dbo].[Group] ([ID], [GroupName], [CourseID], [LectureID]) VALUES (5, N'SE1624', N'SWE201c', N'trungnt')
INSERT [dbo].[Group] ([ID], [GroupName], [CourseID], [LectureID]) VALUES (6, N'SE1627', N'PRJ301', N'sonnt5')
INSERT [dbo].[Group] ([ID], [GroupName], [CourseID], [LectureID]) VALUES (8, N'SE1654', N'DBI202', N'sonnt5')
INSERT [dbo].[Group] ([ID], [GroupName], [CourseID], [LectureID]) VALUES (9, N'SE1628', N'PRJ301', N'sonnt5')
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 1)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 6)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 7)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 12)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 13)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 24)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 32)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 43)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 51)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 53)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 54)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 65)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (1, 100)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (2, 6)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (2, 12)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (2, 43)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (2, 53)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (2, 54)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (2, 98)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (2, 100)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (2, 101)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (2, 112)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (3, 12)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (3, 32)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (3, 39)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (3, 40)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (3, 48)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (3, 49)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (3, 78)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (3, 81)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (3, 84)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (3, 90)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (3, 94)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (3, 112)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (4, 12)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (4, 14)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (4, 21)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (4, 31)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (4, 32)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (4, 59)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (4, 74)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (4, 90)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (4, 93)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (4, 94)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (4, 100)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (5, 12)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (5, 13)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (5, 41)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (5, 51)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (5, 63)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (5, 65)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (5, 69)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (5, 74)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (5, 77)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (5, 82)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (5, 84)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (5, 86)
GO
INSERT [dbo].[Lecture] ([ID], [LectureName]) VALUES (N'hanhvb', N'Vu Bich Hanh')
INSERT [dbo].[Lecture] ([ID], [LectureName]) VALUES (N'sonhx', N'Hoang Xuan Son')
INSERT [dbo].[Lecture] ([ID], [LectureName]) VALUES (N'sonnt5', N'Ngo Tung Son')
INSERT [dbo].[Lecture] ([ID], [LectureName]) VALUES (N'trungnt', N'Nguyen Tat Trung')
INSERT [dbo].[Lecture] ([ID], [LectureName]) VALUES (N'tultt3', N'Le Thi Thanh Tu')
GO
INSERT [dbo].[Room] ([ID]) VALUES (N'DE-C202')
INSERT [dbo].[Room] ([ID]) VALUES (N'DE-C203')
INSERT [dbo].[Room] ([ID]) VALUES (N'DE-C204')
INSERT [dbo].[Room] ([ID]) VALUES (N'DE-C205')
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (25, 1, 5, 1, CAST(N'2022-05-09' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (26, 1, 5, 4, CAST(N'2022-05-16' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (27, 1, 5, 7, CAST(N'2022-05-23' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (28, 1, 5, 10, CAST(N'2022-05-30' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (29, 1, 5, 13, CAST(N'2022-06-06' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (30, 1, 5, 16, CAST(N'2022-06-13' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (31, 1, 5, 19, CAST(N'2022-06-20' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (32, 1, 5, 22, CAST(N'2022-06-27' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (33, 1, 5, 25, CAST(N'2022-07-04' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (34, 1, 5, 28, CAST(N'2022-07-11' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (45, 1, 5, 2, CAST(N'2022-05-11' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (46, 1, 5, 5, CAST(N'2022-05-18' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (47, 1, 5, 8, CAST(N'2022-05-25' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (48, 1, 5, 11, CAST(N'2022-06-01' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (49, 1, 5, 14, CAST(N'2022-06-08' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (50, 1, 5, 17, CAST(N'2022-06-15' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (51, 1, 5, 20, CAST(N'2022-06-22' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (52, 1, 5, 23, CAST(N'2022-06-29' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (53, 1, 5, 26, CAST(N'2022-07-06' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (54, 1, 5, 29, CAST(N'2022-07-13' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (55, 1, 5, 3, CAST(N'2022-05-13' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (56, 1, 5, 6, CAST(N'2022-05-20' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (57, 1, 5, 9, CAST(N'2022-05-27' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (58, 1, 5, 12, CAST(N'2022-06-03' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (59, 1, 5, 15, CAST(N'2022-06-10' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (60, 1, 5, 18, CAST(N'2022-06-17' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (61, 1, 5, 21, CAST(N'2022-06-24' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (62, 1, 5, 24, CAST(N'2022-07-01' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (63, 1, 5, 27, CAST(N'2022-07-08' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (64, 6, 1, 1, CAST(N'2022-05-09' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (65, 6, 1, 4, CAST(N'2022-05-16' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (66, 6, 1, 7, CAST(N'2022-05-23' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (67, 6, 1, 10, CAST(N'2022-05-30' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (68, 6, 1, 13, CAST(N'2022-06-06' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (69, 6, 1, 16, CAST(N'2022-06-13' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (70, 6, 1, 19, CAST(N'2022-06-20' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (71, 6, 1, 22, CAST(N'2022-06-27' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (72, 6, 1, 25, CAST(N'2022-07-04' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (73, 6, 1, 28, CAST(N'2022-07-11' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (74, 6, 1, 2, CAST(N'2022-05-11' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (75, 6, 1, 5, CAST(N'2022-05-18' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (76, 6, 1, 8, CAST(N'2022-05-25' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (77, 6, 1, 11, CAST(N'2022-06-01' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (78, 6, 1, 14, CAST(N'2022-06-08' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (79, 6, 1, 17, CAST(N'2022-06-15' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (80, 6, 1, 20, CAST(N'2022-06-22' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (81, 6, 1, 23, CAST(N'2022-06-29' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (82, 6, 1, 26, CAST(N'2022-07-06' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (83, 6, 1, 29, CAST(N'2022-07-13' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (84, 6, 1, 3, CAST(N'2022-05-13' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (85, 6, 1, 6, CAST(N'2022-05-20' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (86, 6, 1, 9, CAST(N'2022-05-27' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (87, 6, 1, 12, CAST(N'2022-06-03' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (88, 6, 1, 15, CAST(N'2022-06-10' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (89, 6, 1, 18, CAST(N'2022-06-17' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (90, 6, 1, 21, CAST(N'2022-06-24' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (91, 6, 1, 24, CAST(N'2022-07-01' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (92, 6, 1, 27, CAST(N'2022-07-08' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (93, 8, 2, 1, CAST(N'2022-05-09' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (94, 8, 2, 4, CAST(N'2022-05-16' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (95, 8, 2, 7, CAST(N'2022-05-23' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (96, 8, 2, 10, CAST(N'2022-05-30' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (97, 8, 2, 13, CAST(N'2022-06-06' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (98, 8, 2, 16, CAST(N'2022-06-13' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (99, 8, 2, 19, CAST(N'2022-06-20' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (100, 8, 2, 22, CAST(N'2022-06-27' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (101, 8, 2, 25, CAST(N'2022-07-04' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (102, 8, 2, 28, CAST(N'2022-07-11' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (103, 8, 2, 2, CAST(N'2022-05-11' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (104, 8, 2, 5, CAST(N'2022-05-18' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (105, 8, 2, 8, CAST(N'2022-05-25' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (106, 8, 2, 11, CAST(N'2022-06-01' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (107, 8, 2, 14, CAST(N'2022-06-08' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (108, 8, 2, 17, CAST(N'2022-06-15' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (109, 8, 2, 20, CAST(N'2022-06-22' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (110, 8, 2, 23, CAST(N'2022-06-29' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (111, 8, 2, 26, CAST(N'2022-07-06' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (112, 8, 2, 29, CAST(N'2022-07-13' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (113, 8, 2, 3, CAST(N'2022-05-13' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (114, 8, 2, 6, CAST(N'2022-05-20' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (115, 8, 2, 9, CAST(N'2022-05-27' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (116, 8, 2, 12, CAST(N'2022-06-03' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (117, 8, 2, 15, CAST(N'2022-06-10' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (118, 8, 2, 18, CAST(N'2022-06-17' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (119, 8, 2, 21, CAST(N'2022-06-24' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (120, 8, 2, 24, CAST(N'2022-07-01' AS Date), N'DE-C203', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (121, 8, 2, 27, CAST(N'2022-07-08' AS Date), N'DE-C203', N'sonnt5', 0)
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (1, N'student_name1', CAST(N'2000-12-12' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (6, N'student_name2', CAST(N'2000-02-28' AS Date), 0)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (7, N'student_name3', CAST(N'1999-03-05' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (9, N'student_name4', CAST(N'1998-01-13' AS Date), 0)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (10, N'student_name5', CAST(N'2001-02-16' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (11, N'student_name6', CAST(N'2000-09-08' AS Date), 0)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (12, N'student_name_0', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (13, N'student_name_1', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (14, N'student_name_2', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (15, N'student_name_3', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (16, N'student_name_4', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (17, N'student_name_5', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (18, N'student_name_6', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (19, N'student_name_7', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (20, N'student_name_8', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (21, N'student_name_9', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (22, N'student_name_10', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (23, N'student_name_11', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (24, N'student_name_12', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (25, N'student_name_13', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (26, N'student_name_14', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (27, N'student_name_15', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (28, N'student_name_16', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (29, N'student_name_17', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (30, N'student_name_18', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (31, N'student_name_19', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (32, N'student_name_20', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (33, N'student_name_21', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (34, N'student_name_22', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (35, N'student_name_23', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (36, N'student_name_24', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (37, N'student_name_25', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (38, N'student_name_26', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (39, N'student_name_27', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (40, N'student_name_28', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (41, N'student_name_29', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (42, N'student_name_30', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (43, N'student_name_31', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (44, N'student_name_32', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (45, N'student_name_33', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (46, N'student_name_34', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (47, N'student_name_35', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (48, N'student_name_36', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (49, N'student_name_37', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (50, N'student_name_38', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (51, N'student_name_39', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (52, N'student_name_40', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (53, N'student_name_41', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (54, N'student_name_42', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (55, N'student_name_43', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (56, N'student_name_44', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (57, N'student_name_45', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (58, N'student_name_46', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (59, N'student_name_47', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (60, N'student_name_48', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (61, N'student_name_49', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (62, N'student_name_50', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (63, N'student_name_51', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (64, N'student_name_52', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (65, N'student_name_53', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (66, N'student_name_54', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (67, N'student_name_55', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (68, N'student_name_56', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (69, N'student_name_57', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (70, N'student_name_58', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (71, N'student_name_59', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (72, N'student_name_60', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (73, N'student_name_61', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (74, N'student_name_62', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (75, N'student_name_63', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (76, N'student_name_64', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (77, N'student_name_65', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (78, N'student_name_66', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (79, N'student_name_67', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (80, N'student_name_68', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (81, N'student_name_69', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (82, N'student_name_70', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (83, N'student_name_71', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (84, N'student_name_72', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (85, N'student_name_73', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (86, N'student_name_74', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (87, N'student_name_75', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (88, N'student_name_76', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (89, N'student_name_77', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (90, N'student_name_78', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (91, N'student_name_79', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (92, N'student_name_80', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (93, N'student_name_81', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (94, N'student_name_82', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (95, N'student_name_83', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (96, N'student_name_84', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (97, N'student_name_85', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (98, N'student_name_86', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (99, N'student_name_87', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (100, N'student_name_88', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (101, N'student_name_89', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (102, N'student_name_90', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (103, N'student_name_91', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (104, N'student_name_92', CAST(N'2000-01-01' AS Date), 1)
GO
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (105, N'student_name_93', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (106, N'student_name_94', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (107, N'student_name_95', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (108, N'student_name_96', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (109, N'student_name_97', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (110, N'student_name_98', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (111, N'student_name_99', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Student] ([ID], [StudentName], [StudentDOB], [StudentGender]) VALUES (112, N'student_name_100', CAST(N'2000-01-01' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeSlot] ON 

INSERT [dbo].[TimeSlot] ([ID], [StartTime], [EndTime]) VALUES (1, CAST(N'07:30:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([ID], [StartTime], [EndTime]) VALUES (2, CAST(N'09:10:00' AS Time), CAST(N'10:40:00' AS Time))
INSERT [dbo].[TimeSlot] ([ID], [StartTime], [EndTime]) VALUES (3, CAST(N'10:50:00' AS Time), CAST(N'12:20:00' AS Time))
INSERT [dbo].[TimeSlot] ([ID], [StartTime], [EndTime]) VALUES (4, CAST(N'12:50:00' AS Time), CAST(N'14:20:00' AS Time))
INSERT [dbo].[TimeSlot] ([ID], [StartTime], [EndTime]) VALUES (5, CAST(N'14:30:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([ID], [StartTime], [EndTime]) VALUES (6, CAST(N'16:10:00' AS Time), CAST(N'17:40:00' AS Time))
INSERT [dbo].[TimeSlot] ([ID], [StartTime], [EndTime]) VALUES (7, CAST(N'17:50:00' AS Time), CAST(N'19:20:00' AS Time))
INSERT [dbo].[TimeSlot] ([ID], [StartTime], [EndTime]) VALUES (8, CAST(N'19:30:00' AS Time), CAST(N'21:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[TimeSlot] OFF
GO
/****** Object:  Index [UC_SessionNoOfGroup]    Script Date: 29/06/2022 10:18:39 SA ******/
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [UC_SessionNoOfGroup] UNIQUE NONCLUSTERED 
(
	[GroupID] ASC,
	[SessionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_SpaceTime]    Script Date: 29/06/2022 10:18:39 SA ******/
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [UC_SpaceTime] UNIQUE NONCLUSTERED 
(
	[TimeSlotID] ASC,
	[SessionDate] ASC,
	[Room] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceReport]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceReport_Session1] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([ID])
GO
ALTER TABLE [dbo].[AttendanceReport] CHECK CONSTRAINT [FK_AttendanceReport_Session1]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Course]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecture] FOREIGN KEY([LectureID])
REFERENCES [dbo].[Lecture] ([ID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecture]
GO
ALTER TABLE [dbo].[GroupStudent]  WITH CHECK ADD  CONSTRAINT [FK_GroupStudent_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([ID])
GO
ALTER TABLE [dbo].[GroupStudent] CHECK CONSTRAINT [FK_GroupStudent_Group]
GO
ALTER TABLE [dbo].[GroupStudent]  WITH CHECK ADD  CONSTRAINT [FK_GroupStudent_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[GroupStudent] CHECK CONSTRAINT [FK_GroupStudent_Student]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Lecture] FOREIGN KEY([LectureID])
REFERENCES [dbo].[Lecture] ([ID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Lecture]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Room] FOREIGN KEY([Room])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Session] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([ID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Session]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_TimeSlot] FOREIGN KEY([TimeSlotID])
REFERENCES [dbo].[TimeSlot] ([ID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_TimeSlot]
GO
USE [master]
GO
ALTER DATABASE [PRJ301Assignment] SET  READ_WRITE 
GO

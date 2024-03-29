USE [PRJ301Assignment]
GO
/****** Object:  Table [dbo].[AttendanceReport]    Script Date: 24/10/2022 11:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceReport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[StudentName] [varchar](150) NOT NULL,
	[Status] [bit] NOT NULL,
	[Comment] [varchar](150) NULL,
	[RecordTime] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_AttendanceGroupReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 24/10/2022 11:43:10 CH ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 24/10/2022 11:43:10 CH ******/
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
/****** Object:  Table [dbo].[GroupStudent]    Script Date: 24/10/2022 11:43:10 CH ******/
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
/****** Object:  Table [dbo].[Lecture]    Script Date: 24/10/2022 11:43:10 CH ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 24/10/2022 11:43:10 CH ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 24/10/2022 11:43:10 CH ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 24/10/2022 11:43:10 CH ******/
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
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 24/10/2022 11:43:10 CH ******/
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
SET IDENTITY_INSERT [dbo].[AttendanceReport] ON 

INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (1, 64, 19, N'student_name_7', 0, N'asdadasd', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (2, 64, 29, N'student_name_17', 0, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (3, 64, 32, N'student_name_20', 1, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (4, 64, 34, N'student_name_22', 0, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (5, 64, 45, N'student_name_33', 1, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (6, 64, 73, N'student_name_61', 1, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (7, 64, 88, N'student_name_76', 1, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (8, 64, 92, N'student_name_80', 0, N'afasf', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (9, 64, 94, N'student_name_82', 1, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (10, 64, 102, N'student_name_90', 1, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (11, 93, 1, N'student_name1', 1, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (12, 93, 6, N'student_name2', 0, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (13, 93, 7, N'student_name3', 0, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (14, 93, 9, N'student_name4', 1, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (15, 93, 12, N'student_name_0', 1, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (16, 93, 34, N'student_name_22', 0, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (17, 93, 52, N'student_name_40', 1, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (18, 93, 72, N'student_name_60', 1, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (19, 93, 80, N'student_name_68', 0, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (20, 93, 111, N'student_name_99', 1, N'', CAST(N'2022-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (21, 68, 19, N'student_name_7', 1, N'a', CAST(N'2022-07-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (22, 68, 29, N'student_name_17', 1, N'as', CAST(N'2022-07-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (23, 68, 32, N'student_name_20', 1, N'21', CAST(N'2022-07-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (24, 68, 34, N'student_name_22', 1, N'1', CAST(N'2022-07-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (25, 68, 45, N'student_name_33', 1, N'', CAST(N'2022-07-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (26, 68, 73, N'student_name_61', 0, N'asdsafsddfvdfvdsfvsdvd', CAST(N'2022-07-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (27, 68, 88, N'student_name_76', 1, N'', CAST(N'2022-07-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (28, 68, 92, N'student_name_80', 0, N'', CAST(N'2022-07-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (29, 68, 94, N'student_name_82', 1, N'', CAST(N'2022-07-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (30, 68, 102, N'student_name_90', 0, N'', CAST(N'2022-07-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (31, 25, 1, N'student_name1', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (32, 25, 6, N'student_name2', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (33, 25, 7, N'student_name3', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (34, 25, 12, N'student_name_0', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (35, 25, 13, N'student_name_1', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (36, 25, 24, N'student_name_12', 0, N'aaaaa', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (37, 25, 32, N'student_name_20', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (38, 25, 43, N'student_name_31', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (39, 25, 51, N'student_name_39', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (40, 25, 53, N'student_name_41', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (41, 25, 54, N'student_name_42', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (42, 25, 65, N'student_name_53', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (43, 25, 100, N'student_name_88', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (57, 122, 15, N'student_name_3', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (58, 122, 16, N'student_name_4', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (59, 122, 17, N'student_name_5', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (60, 122, 20, N'student_name_8', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (61, 122, 21, N'student_name_9', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (62, 122, 22, N'student_name_10', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (63, 122, 32, N'student_name_20', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (64, 122, 33, N'student_name_21', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (65, 122, 34, N'student_name_22', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (66, 122, 35, N'student_name_23', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (67, 65, 19, N'student_name_7', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (68, 65, 29, N'student_name_17', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (69, 65, 32, N'student_name_20', 0, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (70, 65, 34, N'student_name_22', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (71, 65, 45, N'student_name_33', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (72, 65, 73, N'student_name_61', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (73, 65, 88, N'student_name_76', 0, N'ssss', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (74, 65, 92, N'student_name_80', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (75, 65, 94, N'student_name_82', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (76, 65, 102, N'student_name_90', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (77, 94, 1, N'student_name1', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (78, 94, 6, N'student_name2', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (79, 94, 7, N'student_name3', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (80, 94, 9, N'student_name4', 0, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (81, 94, 12, N'student_name_0', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (82, 94, 34, N'student_name_22', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (83, 94, 52, N'student_name_40', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (84, 94, 72, N'student_name_60', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (85, 94, 80, N'student_name_68', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (86, 94, 111, N'student_name_99', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (87, 26, 1, N'student_name1', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (88, 26, 6, N'student_name2', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (89, 26, 7, N'student_name3', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (90, 26, 12, N'student_name_0', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (91, 26, 13, N'student_name_1', 0, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (92, 26, 24, N'student_name_12', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (93, 26, 32, N'student_name_20', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (94, 26, 43, N'student_name_31', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (95, 26, 51, N'student_name_39', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (96, 26, 53, N'student_name_41', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (97, 26, 54, N'student_name_42', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (98, 26, 65, N'student_name_53', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (99, 26, 100, N'student_name_88', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (100, 123, 15, N'student_name_3', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (101, 123, 16, N'student_name_4', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (102, 123, 17, N'student_name_5', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (103, 123, 20, N'student_name_8', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (104, 123, 21, N'student_name_9', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (105, 123, 22, N'student_name_10', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (106, 123, 32, N'student_name_20', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (107, 123, 33, N'student_name_21', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (108, 123, 34, N'student_name_22', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (109, 123, 35, N'student_name_23', 1, N'', CAST(N'2022-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (110, 146, 15, N'student_name_3', 1, N'', CAST(N'2022-07-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (111, 146, 16, N'student_name_4', 1, N'', CAST(N'2022-07-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (112, 146, 17, N'student_name_5', 1, N'', CAST(N'2022-07-18T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (113, 146, 20, N'student_name_8', 0, N'aa', CAST(N'2022-07-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (114, 146, 21, N'student_name_9', 1, N'', CAST(N'2022-07-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (115, 146, 22, N'student_name_10', 1, N'', CAST(N'2022-07-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (116, 146, 32, N'student_name_20', 1, N'', CAST(N'2022-07-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (117, 146, 33, N'student_name_21', 1, N'', CAST(N'2022-07-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (118, 146, 34, N'student_name_22', 1, N'', CAST(N'2022-07-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (119, 146, 35, N'student_name_23', 1, N'', CAST(N'2022-07-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (120, 157, 15, N'student_name_3', 1, N'', CAST(N'2022-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (121, 157, 16, N'student_name_4', 1, N'', CAST(N'2022-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (122, 157, 17, N'student_name_5', 0, N'', CAST(N'2022-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (123, 157, 20, N'student_name_8', 0, N'', CAST(N'2022-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (124, 157, 21, N'student_name_9', 0, N'', CAST(N'2022-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (125, 157, 22, N'student_name_10', 0, N'', CAST(N'2022-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (126, 157, 32, N'student_name_20', 0, N'', CAST(N'2022-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (127, 157, 33, N'student_name_21', 0, N'', CAST(N'2022-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (128, 157, 34, N'student_name_22', 0, N'', CAST(N'2022-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[AttendanceReport] ([ID], [SessionID], [StudentID], [StudentName], [Status], [Comment], [RecordTime]) VALUES (129, 157, 35, N'student_name_23', 0, N'', CAST(N'2022-10-05T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[AttendanceReport] OFF
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
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (6, 19)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (6, 29)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (6, 32)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (6, 34)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (6, 45)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (6, 73)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (6, 88)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (6, 92)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (6, 94)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (6, 102)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (8, 1)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (8, 6)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (8, 7)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (8, 9)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (8, 12)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (8, 34)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (8, 52)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (8, 72)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (8, 80)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (8, 111)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (9, 15)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (9, 16)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (9, 17)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (9, 20)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (9, 21)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (9, 22)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (9, 32)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (9, 33)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (9, 34)
INSERT [dbo].[GroupStudent] ([GroupID], [StudentID]) VALUES (9, 35)
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

INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (25, 1, 5, 1, CAST(N'2022-05-09' AS Date), N'DE-C202', N'sonnt5', 1)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (26, 1, 5, 4, CAST(N'2022-05-16' AS Date), N'DE-C202', N'sonnt5', 1)
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
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (64, 6, 1, 1, CAST(N'2022-05-09' AS Date), N'DE-C202', N'sonnt5', 1)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (65, 6, 1, 4, CAST(N'2022-05-16' AS Date), N'DE-C202', N'sonnt5', 1)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (66, 6, 1, 7, CAST(N'2022-05-23' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (67, 6, 1, 10, CAST(N'2022-05-30' AS Date), N'DE-C202', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (68, 6, 1, 13, CAST(N'2022-06-06' AS Date), N'DE-C202', N'sonnt5', 1)
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
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (93, 8, 2, 1, CAST(N'2022-05-09' AS Date), N'DE-C203', N'sonnt5', 1)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (94, 8, 2, 4, CAST(N'2022-05-16' AS Date), N'DE-C203', N'sonnt5', 1)
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
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (122, 9, 1, 1, CAST(N'2022-05-10' AS Date), N'DE-C204', N'sonnt5', 1)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (123, 9, 2, 2, CAST(N'2022-05-10' AS Date), N'DE-C204', N'sonnt5', 1)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (124, 9, 1, 4, CAST(N'2022-05-17' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (125, 9, 2, 5, CAST(N'2022-05-17' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (126, 9, 1, 7, CAST(N'2022-05-24' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (127, 9, 2, 8, CAST(N'2022-05-24' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (128, 9, 1, 10, CAST(N'2022-05-31' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (129, 9, 2, 11, CAST(N'2022-05-31' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (130, 9, 1, 13, CAST(N'2022-06-07' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (131, 9, 2, 14, CAST(N'2022-06-07' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (142, 9, 1, 16, CAST(N'2022-06-14' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (143, 9, 2, 17, CAST(N'2022-06-14' AS Date), N'DE-C204', N'sonnt5', 0)
GO
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (144, 9, 1, 19, CAST(N'2022-06-21' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (145, 9, 2, 20, CAST(N'2022-06-21' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (146, 9, 1, 22, CAST(N'2022-06-28' AS Date), N'DE-C204', N'sonnt5', 1)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (147, 9, 2, 23, CAST(N'2022-06-28' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (148, 9, 1, 25, CAST(N'2022-07-05' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (149, 9, 2, 26, CAST(N'2022-07-05' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (150, 9, 1, 28, CAST(N'2022-07-12' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (151, 9, 2, 29, CAST(N'2022-07-12' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (152, 9, 1, 3, CAST(N'2022-05-12' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (153, 9, 1, 6, CAST(N'2022-05-19' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (154, 9, 1, 9, CAST(N'2022-05-26' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (155, 9, 1, 12, CAST(N'2022-06-02' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (156, 9, 1, 15, CAST(N'2022-06-09' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (157, 9, 1, 18, CAST(N'2022-06-16' AS Date), N'DE-C204', N'sonnt5', 1)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (158, 9, 1, 21, CAST(N'2022-06-23' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (159, 9, 1, 24, CAST(N'2022-06-30' AS Date), N'DE-C204', N'sonnt5', 0)
INSERT [dbo].[Session] ([ID], [GroupID], [TimeSlotID], [SessionNo], [SessionDate], [Room], [LectureID], [Status]) VALUES (160, 9, 1, 27, CAST(N'2022-07-07' AS Date), N'DE-C204', N'sonnt5', 0)
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
/****** Object:  Index [UC_SessionNoOfGroup]    Script Date: 24/10/2022 11:43:10 CH ******/
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [UC_SessionNoOfGroup] UNIQUE NONCLUSTERED 
(
	[GroupID] ASC,
	[SessionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_SpaceTime]    Script Date: 24/10/2022 11:43:10 CH ******/
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

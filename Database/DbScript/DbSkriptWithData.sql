USE [master]
GO
/****** Object:  Database [SchoolDB]    Script Date: 29.1.2022. 02:03:08 ******/
CREATE DATABASE [SchoolDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SchoolDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SchoolDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SchoolDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SchoolDB] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SchoolDB] SET QUERY_STORE = OFF
GO
USE [SchoolDB]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountriesID] [int] IDENTITY(1,1) NOT NULL,
	[ISO] [nvarchar](10) NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
	[PhoneCode] [int] NOT NULL,
	[ISO3] [nchar](10) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouresSubjects]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouresSubjects](
	[CoursesSubjectsID] [int] IDENTITY(1,1) NOT NULL,
	[CoursesID] [int] NOT NULL,
	[SubjectsID] [int] NOT NULL,
 CONSTRAINT [PK_CouresSubjects] PRIMARY KEY CLUSTERED 
(
	[CoursesSubjectsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CoursesID] [int] IDENTITY(1,1) NOT NULL,
	[CoursesName] [nvarchar](50) NOT NULL,
	[CoursesDescription] [nvarchar](500) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CoursesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentsID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Gender] [nchar](10) NULL,
	[DateOfBirth] [datetime] NULL,
	[Adress] [nvarchar](100) NULL,
	[CountriesID] [int] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentsCourses]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsCourses](
	[StudentsCoursesID] [int] IDENTITY(1,1) NOT NULL,
	[StudentsID] [int] NOT NULL,
	[CoursesID] [int] NOT NULL,
	[Passed] [bit] NULL,
	[StartDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StudentsCourses] PRIMARY KEY CLUSTERED 
(
	[StudentsCoursesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
	[SubjectDescription] [nvarchar](500) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeachersID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](20) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Adress] [nvarchar](100) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[TeachersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersCourses]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersCourses](
	[TeachersCoursesID] [int] IDENTITY(1,1) NOT NULL,
	[TeachersID] [int] NOT NULL,
	[CoursesID] [int] NOT NULL,
 CONSTRAINT [PK_TeachersCourses] PRIMARY KEY CLUSTERED 
(
	[TeachersCoursesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UsersID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[Administrator] [bit] NULL,
	[UserEmail] [nvarchar](50) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UsersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountriesID], [ISO], [CountryName], [PhoneCode], [ISO3], [Deleted]) VALUES (5041, N'sr', N'Srbija', 381, N'srb       ', 0)
INSERT [dbo].[Countries] ([CountriesID], [ISO], [CountryName], [PhoneCode], [ISO3], [Deleted]) VALUES (5042, N'ch', N'China', 86, N'chn       ', 0)
INSERT [dbo].[Countries] ([CountriesID], [ISO], [CountryName], [PhoneCode], [ISO3], [Deleted]) VALUES (5043, N'de', N'Germany', 49, N'DEU       ', 0)
INSERT [dbo].[Countries] ([CountriesID], [ISO], [CountryName], [PhoneCode], [ISO3], [Deleted]) VALUES (5044, N'it', N'Italy', 39, N'ita       ', 0)
INSERT [dbo].[Countries] ([CountriesID], [ISO], [CountryName], [PhoneCode], [ISO3], [Deleted]) VALUES (5045, N'fr', N'France', 33, N'fra       ', 0)
INSERT [dbo].[Countries] ([CountriesID], [ISO], [CountryName], [PhoneCode], [ISO3], [Deleted]) VALUES (5046, N'tu', N'Turkey', 90, N'tur       ', 0)
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[CouresSubjects] ON 

INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8060, 8056, 5015)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8061, 8056, 5016)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8062, 8056, 5017)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8063, 8056, 5018)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8064, 8056, 5019)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8065, 8057, 5020)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8066, 8057, 5021)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8067, 8057, 5022)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8068, 8057, 5023)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8069, 8058, 5024)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8070, 8058, 5025)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8071, 8058, 5026)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8072, 8059, 5027)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8073, 8059, 5028)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8074, 8059, 5029)
SET IDENTITY_INSERT [dbo].[CouresSubjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CoursesID], [CoursesName], [CoursesDescription], [Deleted]) VALUES (8056, N'Microsoft Development ', N'Microsoft Development program obrazovanja na ITAcademy omogućiće vam da se na efikasan način upoznate sa savremenim konceptima projektovanja, implementacije, razvoja i izrade desktop aplikacija, naprednih web aplikacija i sajtova, kao i mobilnih aplikacija za iOS i Android uređaje.', 0)
INSERT [dbo].[Courses] ([CoursesID], [CoursesName], [CoursesDescription], [Deleted]) VALUES (8057, N'PHP Web Development ', N'PHP je jednostavan i istovremeno moćan Script programski jezik za izradu dinamičkog web sadržaja. Milioni web stranica na kojima se koristi PHP dokaz su njegove popularnosti i kapaciteta. Koriste ga programeri koji cene njegovu fleksibilnost i brzinu, web dizajneri kojima odgovaraju njegove mogućnosti i lakoća upotrebe. Izuzetno je jednostavan za učenje, a sa naučenim se postiže jako mnogo.', 0)
INSERT [dbo].[Courses] ([CoursesID], [CoursesName], [CoursesDescription], [Deleted]) VALUES (8058, N'Frontend JavaScript Development ', N'Razvoj interaktivnih web sajtova i web aplikacija jedno je od najtraženijih zanimanja današnjice, a nezadrživi razvoj web tehnologija i interneta samo će još više povećati potražnju za stručnjacima koji se bave frontend JavaScript programiranjem.', 0)
INSERT [dbo].[Courses] ([CoursesID], [CoursesName], [CoursesDescription], [Deleted]) VALUES (8059, N'Software Engineering', N'U savremenom svetu softver je praktično neizbežan i svuda prisutan. Danas softver predstavlja ključ uspeha većine računarskih sistema i ujedno faktor diferencijacije organizacija koje ga poseduju. Softver je postao bitna komponenta u poslovnom odlučivanju i osnova u naučnim istraživanjima i inženjerskom rešavanju problema. Takođe predstavlja značajnu komponentu u industrijskim, transportnim, medicinskim, telekomunikacionim, vojnim i brojnim drugim vrstama sistema.

', 0)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentsID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [CountriesID], [Deleted]) VALUES (5118, N'Boris', N'Paunovic', N'dimenzije23@gmail.com', N'Male      ', CAST(N'2001-11-21T01:24:40.000' AS DateTime), N'Prote mateje 4 vinca', 5041, 0)
INSERT [dbo].[Students] ([StudentsID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [CountriesID], [Deleted]) VALUES (5119, N'Borivoje', N'Shurdilovic', N'Borivoje@gmail.com', N'Male      ', CAST(N'2015-06-03T01:25:43.000' AS DateTime), N'Borivoja surdilovica 56', 5043, 0)
INSERT [dbo].[Students] ([StudentsID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [CountriesID], [Deleted]) VALUES (5120, N'Kristina', N'Ramic', N'Kika@gmail.com', N'Female    ', CAST(N'2022-01-01T01:26:36.000' AS DateTime), N'Kristine kirsanove', 5041, 0)
INSERT [dbo].[Students] ([StudentsID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [CountriesID], [Deleted]) VALUES (5121, N'Brankica', N'Branicic', N'Brankica@gmail.com', N'Female    ', CAST(N'2022-01-12T01:27:28.000' AS DateTime), N'Branislava 87', 5042, 0)
INSERT [dbo].[Students] ([StudentsID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [CountriesID], [Deleted]) VALUES (5122, N'Sonja', N'Svetlanovic', N'asidid@.com', N'Male      ', CAST(N'2003-08-08T01:28:14.000' AS DateTime), N'pabla pikasa3', 5041, 0)
INSERT [dbo].[Students] ([StudentsID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [CountriesID], [Deleted]) VALUES (5123, N'Probanka', N'probankovic', N'Proba34@.com', N'Female    ', CAST(N'2021-12-30T01:29:21.000' AS DateTime), N'Proba 34', 5042, 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentsCourses] ON 

INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7099, 5118, 8056, NULL, CAST(N'2020-07-10T01:24:40.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7100, 5119, 8056, NULL, CAST(N'2021-12-29T01:25:43.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7101, 5120, 8056, NULL, CAST(N'2021-12-30T01:26:36.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7102, 5120, 8057, NULL, CAST(N'2021-12-30T01:26:36.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7103, 5120, 8058, NULL, CAST(N'2021-12-30T01:26:36.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7104, 5120, 8059, NULL, CAST(N'2021-12-30T01:26:36.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7105, 5121, 8056, NULL, CAST(N'2022-01-06T01:27:28.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7106, 5121, 8057, NULL, CAST(N'2022-01-06T01:27:28.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7107, 5121, 8059, NULL, CAST(N'2022-01-06T01:27:28.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7108, 5122, 8056, NULL, CAST(N'2022-01-05T01:28:14.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7109, 5122, 8057, NULL, CAST(N'2022-01-05T01:28:14.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7110, 5122, 8058, NULL, CAST(N'2022-01-05T01:28:14.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7111, 5122, 8059, NULL, CAST(N'2022-01-05T01:28:14.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7112, 5123, 8056, NULL, CAST(N'2021-12-30T01:29:21.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7113, 5123, 8059, NULL, CAST(N'2021-12-30T01:29:21.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[StudentsCourses] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5015, N'Introduction to Programming in C#', N'Kurs C# programiranja omogućiće vam da steknete veoma korisna znanja i veštine jednog od najzastupljenijeg programskog jezika u IT svetu. C# (Si šarp) spada među mlađe programske jezike s obzirom da je njegova prva verzija premijerno prikazana 2002. godine kao sastavni deo Microsoft razvojnog okruženja. U unapređenim verzijama ovog programskog jezika dodavane su brojne funkcije koje korisnicima omogućavaju programiranje bez velike upotrebe izvornog koda.', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5016, N'Advanced C# Programming', N'Kurs Advanced Programming in C# koncipiran je kao logičan nastavak uvodnog kursa Introduction to Programming in C#. Tokom trajanja kursa, polaznici će se upoznati sa različitim naprednim konceptima .NET platforme, programiranjem korišćenjem C# jezika. Naučiće kako se kontroliše životni vek .NET objekata i na koji način .NET rukuje memorijom, šta su delegati, lambda izrazi i anonimne metode.', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5017, N'Application Testing and Debugging', N'Kurs Application Testing and Debugging bavi se različitim pristupima za detekciju i otklanjanje grešaka i testiranje .NET aplikacija. Polaznici prvo imaju prilike da čitaju o različitim vrstama softverskih grešaka do kojih može doći prilikom kreiranja i izvršavanja .NET aplikacija i da nauče relevantne pristupe za njihovu brzu detekciju i uklanjanje. U takvom procesu posebna pažnja je posvećena alatu Visual Studio Debugger. Reč je o alatu koji pomaže u detekciji grešaka, tako što omogućava pauzi', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5018, N'SQL Programming and Administration', N'SQL, odnosno Structured Query Language, predstavlja jezik sa relacionim modelom baza podataka. Ovakav model je danas jedan od najrasprostranjenijih za upravljanje bazama podataka. Jednostavno rečeno, relacioni model predstavlja podatke koji su organizovani u logičke skupove i relacije, odnosno veze između njih. Osim relacionog modela, koji se koristi u SQL jeziku, postoje još dva bitna modela baze podataka, a to su model objekti-veze i model objekti.', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5019, N'Data access kurs', N'Rad sa podacima predstavlja osnovu gotovo svake aplikacije bez obzira na njen tip i veličinu. U kursevima koji su se bavili razvojem desktop i web aplikacija korišćenjem Microsoft tehnologija, prikazano je kako se podacima rukuje kroz upotrebu različitih tipova aplikacija. Međutim, ovaj kurs, kao i sve njegove lekcije, baviće se obrađivanjem tehnika za upravljanje podacima kroz aplikacije koje se razvijaju korišćenjem Microsoft tehnologija.', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5020, N'Introduction to HTML and CSS', N'HTML odnosno HyperText Markup Language je opisni jezik pomoću koga se kreiraju sajtovi, tačnije funkcionalnost elemenata jedne web stranice. S druge strane, CSS (Cascading Style Sheets) predstavlja jezik koji se koristi za uređivanje samog izgleda i formatiranje svih elemenata koje vidimo na sajtu. Iako na prvi pogled možda deluje da HTML i CSS zapravo imaju istu funkciju, njihova namena je potpuno drugačija, što je doprinelo tome da se ova dva jezika idealno dopunjuju.', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5021, N'Core PHP Programming', N'Pre nego što vam pružimo najvažnije informacije o samom programskom jeziku PHP, ukratko ćemo vas upoznati sa pojmom kojim se bavi ovaj PHP kurs. Core PHP predstavlja samu osnovu ovog programskog jezika. Uz pomoć tehnika i alata koje usvojite tokom ovog kursa, bićete u stanju da kreirate dinamički sadržaj web stranice, što je minimum neophodnog znanja svakog PHP početnika ili web dizajnera.', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5022, N'Adobe Dreamweaver CC', N'Softver Adobe Dreamweaver svrstava se među najpoznatije programe za kreiranje i uređivanje sadržaja za web. Ovaj program podjednako koriste web dizajneri kao i programeri prilikom stvaranja sajtova i aplikacija za pametne mobilne telefone, tablete, računare i druge uređaje..', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5023, N'Building Web Applications – Advanced PHP Programmi', N'PHP spada među najpopularnije programske jezike, pre svega, zbog svoje jednostavnosti i lakoće koja početnicima pruža mogućnost da brzo uče. PHP je specijalizovani skriptni jezik koji se prvenstveno koristi za izradu dinamičkog web sadržaja i izvodi se na strani servera.', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5024, N'Introduction to Frontend Development', N'Introduction to Frontend Development kurs namenjen je pre svega početnicima u ovoj oblasti. On obrađuje osnovne koncepte razvoja softvera u kontekstu modernih web sajtova i aplikacija i omogućava vam da postavite kvalitetnu osnovu za dalje usavršavanje i napredovanje u oblasti programiranja.', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5025, N'HTML & CSS Fundamentals', N'Nastavne jedinice ovog kursa sadrže sve gradivne blokove potrebne za kreiranje ili modifikaciju HTML strana. HTML & CSS Fundamentals kurs objašnjava poreklo jezika HTML, način njegovog nastanka, razloge za njegovo postojanje, njegovu integraciju u različite sisteme, kao i načine njegove upotrebe.', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5026, N'JavaScript Programming Fundamentals ', N'JavaScript Programming Fundamentals kurs obrađuje skriptni programski jezik JavaScript koji je namenjen definisanju funkcionalnosti web stranica na klijentskoj strani. Međutim, ovaj skriptni jezik se može veoma efikasno koristiti i za pristup objektima u drugim aplikacijama. JavaScript je funkcionalan na mnogim internet browserima za pretragu weba, među kojima su Internet Explorer, Mozilla, Chrome, Firefox, Netscape i Opera.', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5027, N'User Requirements for Software Development', N'U 21. veku se bez softvera više ne može zamisliti svakodnevica. Softver je postao najzaslužniji za uspeh većine računarskih sistema i ujedno faktor diferencijacije organizacija koje ga poseduju. Sa druge strane, oblast softverskog zahteva predstavlja temelj od koga polaze ostale oblasti i razvoj kompletnog softvera. Upravo iz tih razloga ova oblast je široko prihvaćena i priznata u softverskoj industriji. ', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5028, N'Software Design Fundamentals', N'Kurs Software Design Fundamentals baviće se softverskim dizajnom, koji predstavlja aktivnost životnog ciklusa softverskog inženjerstva, u kome se softverski zahtevi analiziraju u cilju proizvodnje opisa interne strukture softvera. Još preciznije, softverski dizajn mora opisati softversku arhitekturu, tj. kako je softver razložen i organizovan u komponente i kakav je interfejs između ovih komponenti. Mora da opiše komponente na nivou detalja koji omogućavaju njihovu konstrukciju.', 0)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) VALUES (5029, N'Unified Modeling Language', N'Unified Modeling Language (UML) je vizuelni jezik za modeliranje koji se koristi za specificiranje, vizuelizaciju, konstrukciju i dokumentovanje softverskih sistema. Ovaj grafički jezik omogućava donošenje odluka i razumevanje sistema koji se mogu konstruisati. UML se koristi za analizu, dizajn, pretragu, konfigurisanje, održavanje i kontrolu informacija o takvim sistemima. Osim toga, pomenuti jezik obuhvata i informacije o statičkoj strukturi, kao i o dinamičkom ponašanju sistema. ', 0)
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([TeachersID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [Deleted]) VALUES (6017, N'Milan', N'Milankovic', N'Milan@gmai.com', N'Male', CAST(N'1980-11-14T01:21:23.000' AS DateTime), N'Milana milica 4', 0)
INSERT [dbo].[Teachers] ([TeachersID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [Deleted]) VALUES (6018, N'Pera', N'Peric', N'Pera@gmail.com', N'Male', CAST(N'2022-01-14T01:22:31.000' AS DateTime), N'Perijevska 45', 0)
INSERT [dbo].[Teachers] ([TeachersID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [Deleted]) VALUES (6019, N'Mira', N'Miric', N'Mira@gmail.com', N'Female', CAST(N'2022-01-21T01:23:08.000' AS DateTime), N'Mirijevska 76', 0)
INSERT [dbo].[Teachers] ([TeachersID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [Deleted]) VALUES (6020, N'Ema ', N'Fisher', N'Ema@gmail.com', N'Female', CAST(N'2022-01-15T01:23:53.000' AS DateTime), N'Some random location', 0)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET IDENTITY_INSERT [dbo].[TeachersCourses] ON 

INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6017, 6017, 8056)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6018, 6017, 8059)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6019, 6018, 8056)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6020, 6018, 8058)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6021, 6019, 8056)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6022, 6019, 8057)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6023, 6019, 8058)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6024, 6019, 8059)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6025, 6020, 8056)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6026, 6020, 8058)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6027, 6020, 8059)
SET IDENTITY_INSERT [dbo].[TeachersCourses] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UsersID], [UserName], [UserPassword], [Administrator], [UserEmail], [Deleted]) VALUES (5038, N'Boris1', N'Boris1', 1, N'Boris1@.com', 0)
INSERT [dbo].[Users] ([UsersID], [UserName], [UserPassword], [Administrator], [UserEmail], [Deleted]) VALUES (5039, N'Pera123', N'Pera123', 1, N'Pera123@gmail.com', 0)
INSERT [dbo].[Users] ([UsersID], [UserName], [UserPassword], [Administrator], [UserEmail], [Deleted]) VALUES (5040, N'Mira123', N'Mira123', 0, N'Mira123@.com', 0)
INSERT [dbo].[Users] ([UsersID], [UserName], [UserPassword], [Administrator], [UserEmail], [Deleted]) VALUES (5041, N'Kika12', N'Kika12', 0, N'Kika12@.com', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Countries] ADD  CONSTRAINT [DF_Countries_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [DF_Courses_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Subjects] ADD  CONSTRAINT [DF_Subjects_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [DF_Teachers_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CouresSubjects]  WITH CHECK ADD  CONSTRAINT [FK_CouresSubjects_Courses] FOREIGN KEY([CoursesID])
REFERENCES [dbo].[Courses] ([CoursesID])
GO
ALTER TABLE [dbo].[CouresSubjects] CHECK CONSTRAINT [FK_CouresSubjects_Courses]
GO
ALTER TABLE [dbo].[CouresSubjects]  WITH CHECK ADD  CONSTRAINT [FK_CouresSubjects_Subjects] FOREIGN KEY([SubjectsID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[CouresSubjects] CHECK CONSTRAINT [FK_CouresSubjects_Subjects]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Countries] FOREIGN KEY([CountriesID])
REFERENCES [dbo].[Countries] ([CountriesID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Countries]
GO
ALTER TABLE [dbo].[StudentsCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentsCourses_Courses] FOREIGN KEY([CoursesID])
REFERENCES [dbo].[Courses] ([CoursesID])
GO
ALTER TABLE [dbo].[StudentsCourses] CHECK CONSTRAINT [FK_StudentsCourses_Courses]
GO
ALTER TABLE [dbo].[StudentsCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentsCourses_Students] FOREIGN KEY([StudentsID])
REFERENCES [dbo].[Students] ([StudentsID])
GO
ALTER TABLE [dbo].[StudentsCourses] CHECK CONSTRAINT [FK_StudentsCourses_Students]
GO
ALTER TABLE [dbo].[TeachersCourses]  WITH CHECK ADD  CONSTRAINT [FK_TeachersCourses_Courses] FOREIGN KEY([CoursesID])
REFERENCES [dbo].[Courses] ([CoursesID])
GO
ALTER TABLE [dbo].[TeachersCourses] CHECK CONSTRAINT [FK_TeachersCourses_Courses]
GO
ALTER TABLE [dbo].[TeachersCourses]  WITH CHECK ADD  CONSTRAINT [FK_TeachersCourses_Teachers1] FOREIGN KEY([TeachersID])
REFERENCES [dbo].[Teachers] ([TeachersID])
GO
ALTER TABLE [dbo].[TeachersCourses] CHECK CONSTRAINT [FK_TeachersCourses_Teachers1]
GO
/****** Object:  StoredProcedure [dbo].[AddCourseSubject]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddCourseSubject] (@CoursesID int,@SubjectsID int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CouresSubjects(CoursesID,SubjectsID) 
	VALUES(@CoursesID,@SubjectsID)
END
GO
/****** Object:  StoredProcedure [dbo].[AddStudentCourse]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[AddStudentCourse] (@StudentId int,@CourseId int,@Startdate datetime)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO StudentsCourses(StudentsID,CoursesID,StartDate)
	VALUES(@StudentId,@CourseId,@Startdate)
END
GO
/****** Object:  StoredProcedure [dbo].[AddTeacherCourses]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[AddTeacherCourses](@TeachersID int,@CoursesID int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into TeachersCourses(TeachersID,CoursesID) values(@TeachersID,@CoursesID)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCountry]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Boris	>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCountry] (@CountryId int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	/*
   UPDATE Students 
   SET CountriesID = null WHERE CountriesID=@CountryId 
   DELETE FROM Countries WHERE CountriesID=@CountryId
   */
   
   UPDATE Countries
   SET Deleted=@CountryId
   WHERE CountriesID=@CountryId
  

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCourse]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Boris>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCourse](@CoursesID int)
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/*
DELETE FROM CouresSubjects
WHERE CoursesID=@CoursesID
DELETE FROM TeachersCourses
WHERE CoursesID = @CoursesID
DELETE FROM StudentsCourses
WHERE CoursesID = @CoursesID
DELETE FROM Courses 
WHERE CoursesID = @CoursesID*/
UPDATE Courses
   SET Deleted=1
   WHERE CoursesID=@CoursesID



END
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteStudent] (@StudentsID int)
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	/*
    -- Insert statements for procedure here
	DELETE FROM dbo.StudentsCourses 
	WHERE dbo.StudentsCourses.StudentsID=@StudentsID 
	DELETE FROM Students 
	WHERE Students.StudentsID=@StudentsID
	*/
	UPDATE Students
   SET Deleted=1
   WHERE StudentsID=@StudentsID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSubject]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSubject](@SubjectId int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/*
    -- Insert statements for procedure here
	delete from CouresSubjects
where SubjectsID=@SubjectId
delete from Subjects 
where SubjectID = @SubjectId
*/
UPDATE Subjects
   SET Deleted=1
   WHERE SubjectID=@SubjectId

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTeacher]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteTeacher](@TeachersID int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	/*
    -- Insert statements for procedure here
	delete TeachersCourses 
	where TeachersID = @TeachersID 
	delete Teachers 
	where TeachersID = @TeachersID
	*/
	UPDATE Teachers
   SET Deleted=1
   WHERE TeachersID=@TeachersID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser](@UserID int) 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	/*
    -- Insert statements for procedure here
	delete  from Users where UsersID= @UserID
	*/
	UPDATE Users
   SET Deleted=1
   WHERE UsersID=@UserID
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByUsername]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByUsername](@Username nvarchar(50)) 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select Username,UserPassword,UserEmail,Administrator 
	FROM Users 
	where Username=@Username and Deleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUser](@UserName nvarchar(50),@UserPassword nvarchar(50),@UserEmail nvarchar(50),@Administrator bit)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Users(UserName,UserPassword,UserEmail,Administrator)
	VALUES(@UserName,@UserPassword,@UserEmail,@Administrator)
END
GO
/****** Object:  StoredProcedure [dbo].[SaveCountry]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Boris>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveCountry](@ISO nvarchar(2),@CountryName nvarchar(50),@PhoneCode int,@ISO3 nvarchar(3))
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Countries(ISO,CountryName,PhoneCode,ISO3)
	VALUES(@ISO,@CountryName,@PhoneCode,@ISO3)
END
GO
/****** Object:  StoredProcedure [dbo].[SaveCourse]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveCourse](@CoursesName nvarchar(50),@CoursesDescription nvarchar(500))
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Courses(CoursesName,CoursesDescription)
	VALUES (@CoursesName,@CoursesDescription)
END
GO
/****** Object:  StoredProcedure [dbo].[SaveStudent]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveStudent](@FirstName nvarchar(50),@LastName nvarchar(50),@Email nvarchar(50),@Gender nvarchar(10),@DateOfBirth datetime,@Adress nvarchar(50),@CountriesID int) 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Students(FirstName,LastName,Email,Gender,DateOfBirth,Adress,CountriesID) 
	VALUES(@FirstName,@LastName,@Email,@Gender,@DateOfBirth,@Adress,@CountriesID)
END
GO
/****** Object:  StoredProcedure [dbo].[SaveSubject]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveSubject] (@SubjectName nvarchar(50),@SubjectDescription nvarchar (500))
	-- Add the parameters for the stored procedure here


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Subjects(SubjectName,SubjectDescription) values(@SubjectName,@SubjectDescription)
END
GO
/****** Object:  StoredProcedure [dbo].[SaveTeacher]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveTeacher](@FirstName nvarchar(50),@LastName nvarchar(50),@Email nvarchar(50),@Gender nvarchar (10),@DateOfBirth datetime,@Adress nvarchar(50))
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Teachers(FirstName,LastName,Email,Gender,DateOfBirth,Adress)
	values(@FirstName,@LastName,@Email,@Gender,@DateOfBirth,@Adress)
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllCountryes]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Boris>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllCountryes] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select countriesid,CountryName,ISO,iso3,PhoneCode,Deleted from Countries where Deleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllCourses]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SelectAllCourses]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CoursesID,CoursesName,CoursesDescription,Deleted FROM Courses where Deleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllCoursesSubjects]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllCoursesSubjects]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CoursesSubjectsID,CoursesID,SubjectsID FROM CouresSubjects
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllStudentsResault]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllStudentsResault]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT S.StudentsID ,S.FirstName,S.LastName,S.Email,s.Gender,s.DateOfBirth,s.Adress,C.CoursesName,SC.Passed,SC.StartDate,C.CoursesDescription,Co.CountryName
	FROM Students AS S 
	left join StudentsCourses AS SC ON S.StudentsID=SC.StudentsID 
	left join Courses AS C ON SC.CoursesID=C.CoursesID
	left join Countries AS Co ON S.CountriesID=Co.CountriesID
	where s.Deleted=0 and c.Deleted=0 
END

GO
/****** Object:  StoredProcedure [dbo].[SelectAllSubjects]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllSubjects]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select SubjectID,SubjectName,SubjectDescription,Deleted
	from Subjects
	where Deleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllTeachersJoinCourses]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllTeachersJoinCourses]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select T.TeachersID,T.FirstName,T.LastName,T.Email,T.Gender,T.DateOfBirth,T.Adress,TC.TeachersCoursesID,C.CoursesID,C.CoursesName,C.CoursesDescription 
	from Teachers as T
	left join TeachersCourses as TC on t.TeachersID= TC.TeachersID
	left join Courses as C on TC.CoursesID= C.CoursesID  
	where C.Deleted=0 and T.Deleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllUsers]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllUsers] 
	-- Add the parameters for the stored procedure here
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UsersID,UserName,UserEmail,UserPassword,Administrator,Deleted 
	FROM Users
	where Deleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[SelectCountryByName]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Boris Paunovic>
-- Create date: <Create Date,,>
-- Description:	<Description,, Selects country by name>
-- =============================================
CREATE PROCEDURE [dbo].[SelectCountryByName](@CountryName nvarchar(50))
	-- Add the parameters for the stored procedure here
	--select CountriesID from Countries where CountryName = @CountryName
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select CountriesID from Countries where CountryName = @CountryName and Deleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[SelectCourseByName]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectCourseByName](@CoursesName nvarchar(50))
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CoursesID,CoursesName,CoursesDescription 
	FROM Courses
	WHERE CoursesName=@CoursesName and Deleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[SelectCoursesSubjectsById]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectCoursesSubjectsById] (@CoursesID int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CoursesSubjectsID,CoursesID,SubjectsID
	FROM CouresSubjects 
	WHERE CoursesID=@CoursesID
END
GO
/****** Object:  StoredProcedure [dbo].[SelectLastStudent]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectLastStudent]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 1 StudentsID,FirstName,LastName,Email,Gender,DateOfBirth,Adress,CountriesID 
	FROM Students  
	where Deleted=0
	ORDER BY StudentsID DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SelectStudentByName]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectStudentByName](@FirstName nvarchar(50))
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select StudentsID,FirstName,LastName,Email,Gender,DateOfBirth,Adress,CountriesID
	from Students 
	where FirstName=@FirstName and Deleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[SelectSubjectByName]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectSubjectByName](@SubjectName nvarchar(50))
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select SubjectID,SubjectDescription,SubjectName
	from Subjects
	where SubjectName=@SubjectName and Deleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[SelectTeacherByName]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectTeacherByName](@FirstName nvarchar(50))
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 select TeachersID,FirstName,LastName,Email,Gender,DateOfBirth,Adress
	 from Teachers
	 where FirstName = @FirstName
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCountry]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCountry](@CountryName nvarchar(50),@ISO nvarchar(5),@ISO3 nvarchar(5), @PhoneCode int ,@CountriesID int) 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Countries 
	SET CountryName = @CountryName, ISO = @ISO,ISO3 = @ISO3, PhoneCode = @PhoneCode
	WHERE CountriesID = @CountriesID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCourse]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Boris>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCourse](@CourseName nvarchar(50),@CoursesDescription nvarchar (500),@CourseID int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Courses
	SET CoursesName=@CourseName , CoursesDescription=@CoursesDescription 
	WHERE CoursesID=@CourseID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourseSubject]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[UpdateCourseSubject](@SubjectsID int,@CoursesSubjectsID int,@CoursesID int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CouresSubjects 
	set SubjectsID=@SubjectsID 
	where CoursesSubjectsID=@CoursesSubjectsID and CoursesID=@CoursesID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourseSubjects2]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCourseSubjects2](@SubjectsID int,@CoursesID int,@CoursesSubjectsID int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CouresSubjects
	set SubjectsID=@SubjectsID
	where CoursesSubjectsID=@CoursesSubjectsID and CoursesID=@CoursesID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudent]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateStudent](@FirstName nvarchar(50),@LastName nvarchar(50),@Email nvarchar(50),@Gender nvarchar(10),@DateOfBirth datetime,@Adress nvarchar(100),@CountriesID int,@StudentsId int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Students
	SET FirstName=@FirstName,LastName=@LastName,Email=@Email,Gender=@Gender,DateOfBirth=@DateOfBirth,Adress=@Adress,CountriesID=@CountriesID
	WHERE StudentsID=@StudentsId
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudentCourse]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateStudentCourse](@CoursesID int,@Passed bit,@StudentsID int,@CourseIDFromGrid int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE StudentsCourses 
	SET CoursesID=@CoursesID,Passed=@Passed
	WHERE StudentsID=@StudentsID AND CoursesID=@CourseIDFromGrid
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSubject]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSubject] (@SubjectName nvarchar(50),@SubjectDescription nvarchar(500),@SubjectID int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Subjects
	set SubjectName=@SubjectName,SubjectDescription=@SubjectDescription
	where SubjectID=@SubjectID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTeacher]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTeacher](@FirstName nvarchar(50),@LastName nvarchar(50),@Adress nvarchar(100),@Email nvarchar(50),@DateOfBirth datetime,@Gender nvarchar(10),@TeachersId int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Teachers 
	set FirstName=@FirstName,LastName=@LastName,Adress=@Adress,Email=@Email,DateOfBirth=@DateOfBirth,Gender=@Gender
	where TeachersID= @TeachersId
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTeachersCourses]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTeachersCourses](@CoursesId int,@TeachersCoursesId int,@TeachersId int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update TeachersCourses 
	set CoursesID=@CoursesId
	where TeachersCoursesID=@TeachersCoursesId and TeachersID=@TeachersId
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 29.1.2022. 02:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUser](@Administrator bit,@UserId int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Users set Administrator=@Administrator where Usersid=@UserId 
END
GO
USE [master]
GO
ALTER DATABASE [SchoolDB] SET  READ_WRITE 
GO

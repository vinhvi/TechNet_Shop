USE [master]
GO
/****** Object:  Database [TechNetShop]    Script Date: 5/13/2023 10:23:51 AM ******/
CREATE DATABASE [TechNetShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechNetShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TechNetShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TechNetShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TechNetShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TechNetShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechNetShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechNetShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechNetShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechNetShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechNetShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechNetShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechNetShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TechNetShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechNetShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechNetShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechNetShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechNetShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechNetShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechNetShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechNetShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechNetShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TechNetShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechNetShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechNetShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechNetShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechNetShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechNetShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechNetShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechNetShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TechNetShop] SET  MULTI_USER 
GO
ALTER DATABASE [TechNetShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechNetShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechNetShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechNetShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechNetShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TechNetShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TechNetShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [TechNetShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TechNetShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/13/2023 10:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Image] [varchar](255) NULL,
	[Address] [nvarchar](100) NULL,
	[TelePhone] [char](10) NULL,
	[Reset_password] [varchar](50) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 5/13/2023 10:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NULL,
 CONSTRAINT [PK_Authorities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/13/2023 10:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 5/13/2023 10:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[FavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[FavoriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/13/2023 10:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NULL,
	[Discount] [float] NULL,
	[Quantity] [int] NULL,
	[Discription] [nvarchar](100) NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/13/2023 10:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[CreateDay] [date] NOT NULL,
	[TelePhone] [varchar](12) NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [varchar](30) NULL,
	[Total] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/13/2023 10:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Discount] [float] NULL,
	[Image1] [varchar](50) NOT NULL,
	[Image2] [varchar](50) NULL,
	[Image3] [varchar](50) NULL,
	[Image4] [varchar](50) NULL,
	[Image5] [varchar](50) NULL,
	[EnteredDay] [date] NOT NULL,
	[Discription] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[HotSale] [varchar](20) NULL,
	[OldPrice] [int] NULL,
	[TheFirm] [nvarchar](20) NULL,
	[Radius] [varchar](7) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/13/2023 10:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statitic]    Script Date: 5/13/2023 10:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statitic](
	[OrderId] [int] NOT NULL,
	[OrderDetailId] [int] NOT NULL,
	[id] [int] NULL,
	[slDoanhthu] [bigint] NOT NULL,
	[slOrder] [bigint] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'qtai0209', N'qtai0209', N'adsad', N'qtai2901@gmail.com', N'noimage.jpg', NULL, N'0316464642', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'qtai2901', N'qtai0209', N'Quốc Tài', N'qtai307@gmail.com', N'MW300RE_un_V3_28_normal_3.00_20180113082312.jpg', N'', N'0975923903', NULL)
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (1, N'qtai2901', N'DIRE')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (1, N'Router Wifi')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2, N'Wifi Mesh')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (3, N'Bộ phát Wifi di động')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (4, N'Bộ chia mạng')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (5, N'Bộ mở rộng sóng')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (6, N'USB Wifi')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([FavoriteId], [Username], [ProductId]) VALUES (1, N'qtai2901', 10)
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [ProductId]) VALUES (2, N'qtai2901', 10)
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [ProductId]) VALUES (3, N'qtai0209', 26)
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [ProductId]) VALUES (4, N'qtai2901', 9)
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [ProductId]) VALUES (5, N'qtai2901', 9)
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [ProductId]) VALUES (6, N'qtai2901', 10)
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [ProductId]) VALUES (7, N'qtai2901', 10)
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [ProductId]) VALUES (8, N'qtai2901', 11)
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [ProductId]) VALUES (9, N'qtai2901', 11)
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (1, 1, 24, 1910000, 0, 1, N'Duyệt', 1910000)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (2, 2, 8, 189000, 10, 1, N'Duyệt', 170100)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (1, N'qtai2901', CAST(N'2023-05-12' AS Date), NULL, N'adsdadaasd', N'adasda', N'qtaeoooe@gmail.com', 1940000, N'Đã giao hàng')
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (2, N'qtai2901', CAST(N'2023-05-12' AS Date), NULL, N'ácdasdas', N'ádasd', N'dsadd@adf', 219000, N'Đã giao hàng')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (8, N'Phát WIFI XIAOMI MINI Router chuẩn AC', 100, 189000, 10, N'mini.png', N'mini3.png', N'mini2.png', N'mini1.png', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Hàng chính hãng đã qua sử dụng, độ mới còn 90-95%. Nguồn loại tốt, không phải nguồn xiaomi kèm theo. 
Chỉ có router và nguồn. 
Không kèm hộp gốc. Mình đóng gói lại bằng hộp khác.
+ VIDEO HƯỚNG DẪN REPEATER: https://youtu.be/XqIGn3llSO0
+ VIDEO HƯỚNG DẪN ĐỔI TÊN WIFI, MẬT KHẨU: https://youtu.be/ueQUy6WHiWI
>>>>>GIAO DIỆN TIẾNG VIỆT ĐỘC QUYỀN<<<<<<<<<', 1, N'white-img.png', 210000, N'xiaomi', N'/ 20M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (9, N'Phát WIFI XIAOMI GEN 3 Router', 10, 255000, 0, N'gen3.jfif', N'gen3.1.jpg', N'gen3.2.jfif', N'router3_quoc_te.jpg', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Hàng chính hãng đã qua sử dụng, độ mới còn 90-98%. Nguồn loại tốt, không phải nguồn xiaomi kèm theo. 
Chỉ có router và nguồn, đóng hộp chắc chắn.
Không kèm hộp gốc. Mình đóng gói lại bằng hộp khác.
Tất cả các phiên bản đều Repeater (kích wifi, câu sóng) rất khoẻ và nhanh (không cần phải nt mình xác nhận lại nha)
>>>>>GIAO DIỆN TIẾNG VIỆT <<<<<<<
>>>>>CHẶN QUẢNG CÁO được tích hợp sẵn, đọc báo, chơi game không còn thấy quảng cáo nữa.', 1, N'hot-icon.gif', 310000, N'xiaomi', N'/ 20M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (10, N'Bộ phát wifi Router wifi Xiaomi Gen 3G Tiếng Việt', 100, 380000, 0, N'3g.jpg', N'3g.jpg', N'gen3.2.jfif', N'gen3.1.jpg', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Dòng wifi giá rẻ nhưng vô địch trong tầm giá dưới 300k. Với cấu hình khủng cpu 2 nhân RAM 256MB Lan Gigabit tốt hơn nhiều so với nhiều router khác có tầm giá hơn 1tr. Chỉ với 300k bạn sẽ có cho mình một hệ thống mạng ổn định chất lượng. Hàng đã qua sử dụng độ mới tầm 90% - 98% tùy đợt hàng.
Dòng chính của băng tần kép 2.4GHz / 5GHz AC thông minh. Bộ định tuyến nhanh hơn các bộ định tuyến không dây truyền thống gấp 3 lần, hỗ trợ giao thức 802.11ac mới nhất, tốc độ truyền tải lên tới 1167Mbps.

Bốn cột Ăng ten cao 177.3 mm hoạt động như một thành phần cốt lõi của bộ định tuyến, tăng tín hiệu mạnh hơn và ổn định hơn. Việc thiết kế ăng ten trong hiệu suất tần số kép 2.4 GHz lên đến 5dBi, 5 GHz lên đến 6dBi giúp tín hiệu tốt hơn trước. Không làm giảm chất lượng kết nối khi có nhiều thiết bị tham gia, gián đoạn các hoạt động xem phim HD, tải về...

Xiaomi wifiRouter Gen 3G AC1200 có khả năng kết nối với 128 thiết bị xung quanh nó nhờ dung lượng ROM "khủng" 128Mb, hiệu quả gấp 8 lần so với router thông thường, có khả năng thay thế 4 bộ thu phát wifi thông thường, thích hợp với những văn phòng làm việc hoặc quán café có nhiều lượt kết nối mà phạm vi phủ sóng rộng hơn và hiệu năng nhanh hơn.

Phương pháp bảo mật dữ liệu an toàn: Mỗi khi lướt web, chúng ta không đặt vấn đề bảo mật thông tin lên hàng đầu từ việc dễ dàng cung cấp dữ liệu cá nhân như số thẻ tín dụng, mật khẩu, tìm kiếm tài khoản khác ...  sẽ là miếng mồi cho những hacker nhắm tới. Điều này có thể làm ảnh hưởng đến hoạt động của hệ thống router. Xiaomi wifi Router Gen 3G AC1200 có 7 mức bảo mật an toàn thông tin cá nhân và truy cập Internet tiêu chuẩn, nhằm bảo vệ tối đa nhiều mối đe dọa trên Internet.

Và hơn thế nữa, bạn có thể tải Mi WiFi App trên điện thoại Android và iOS để điều khiển Xiaomi wifi Router Gen 3G AC1200 từ xa thông qua chính kết nối từ router này hoặc mạng ở một nơi khác. Bạn có thể theo dõi các hoạt động của router và điều chỉnh một danh sách các thiết lập như: kiểm tra và tối ưu hóa việc sử dụng dung lượng để đạt được hiệu suất tối ưu, chặn truy cập của những người dùng không rõ, thiết lập thời gian chuyển đổi và nhiều thứ khác nữa.

Thông số kỹ thuật: v1
Kích thước: 195*131*23.5 mm
Bộ xử lý: MT7621A MIPS 880MHz dual-core
ROM: 128MB Nand Flash SLC
RAM: 256MB DDR3-1200
1 đầu ra USB 3.0: 5V - 1A
LAN: 2 cổng.
WAN: 1 cổng', 1, N'white-img.png', 3800000, N'xiaomi', N'/ 25M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (11, N'Xiaomi N 300Mbps Bộ Phát Wifi R4CM', 120, 255000, 0, N'r4.jfif', N'r4.1.jpg', N'r4.2.jfif', N'r4.3.jpg', N'5sao.png', CAST(N'2023-05-12' AS Date), N'[Bản Quốc Tế] Xiaomi N 300Mbps Bộ Phát Wifi R4CM - Mi Router 4C - Quốc Tế Tiếng Anh 4 Anten rời - Hàng Chính Hãng--BH 2 năm 1 đổi 1

Router Wifi Xiaomi 4 anten Gen 4C là một chiếc Router wifi, được sản xuất bởi Xiaomi. Đây là một phiên bản thu gọn của Router Gen 4, cả về kích thước lẫn trang bị cấu hình. Với một mức giá hợp lý, đi cùng với chức năng hiện đại phù hợp với nhu cầu sử dụng gia đình, đây sẽ là một lựa chọn tuyệt vời.

Thông tin sản phẩm:
· Nhãn hiệu: Xiaomi.
· Model: Mi Router 4C.
· Màu: trắng.
· Loại: Wireless Router.
· Interface: 2 LAN, 1 WAN.
· Transmission Rate: 300Mbps.
· Số lượng Antenna: 4.
· WIFI Transmission Protocol: 802.11b / n / g, 802.3 / 3U.
· Wireless Security: WPA-PSK, WPA2-PSK.
', 1, N'white-img.png', 255000, N'xiaomi', N'/ 15M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (12, N'Bộ phát Wifi Xiaomi Mi Router 4A R4AC', 122, 369000, 9, N'4a.jfif', N'r4.2.jfif', N'4a.jfif', N'r4.2.jfif', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Bộ phát Wifi Mi Router 4A R4AC  được trang bị băng tần kép tốc độ cao, 4 ăng-ten bên ngoài và bộ nhớ lên tới 64MB  hỗ trợ kết nối ổn định các thiết bị, có khả năng điều khiển từ xa thông qua ứng dụng trên điện thoại thông minh cùng nhiều công nghệ tiên tiến hiện đại khác.', 1, N'white-img.png', 403650, N'xiaomi', N'/ 15M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (14, N'ROUTER BĂNG TẦNG KÉP AC1900 TENDA AC15', 12, 2590000, 0, N'tenda1.1.jpg', N'tenda1.2.jpg', N'tenda1.3.jpg', N'tenda1.4.jpg', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Thông số kỹ thuật

-    Chuẩn AC với tốc độ 1900M,

-    Hoạt động trên 2 băng tần 2.4Ghz và 5.0Ghz

-    Có 3 cổng LAN tốc độ 10/100/1000Mbps,  và  1 cổng WAN tốc độ 10/100/1000Mbps.

-    3 Ăng-ten 5 dBI sóng siêu khỏe .

-    Cổng USB 3.0 hết sức thuận tiện cho chia sẻ máy in và dữ liệu

-    Chức năng tiếp sóng ( Repeater chuyên biệt)

-    Tăng khả năng phát xuyên tường với công suất 200mW', 1, N'white-img.png', 2600000, N'tenda', N'/ 30M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (15, N'ROUTER WIFI BĂNG TẦNG KÉP AC1200 TENDA AC6', 10, 990000, 0, N'tenda3.1.jpg', N'tenda3.1.jpg', N'tenda3.1.jpg', N'tenda3.1.jpg', N'5sao.png', CAST(N'2023-05-10' AS Date), N'• Wifi 802.11ac tốc độ up tới 1167Mbps, cung cấp cả 867Mbps băng tần 5GHz và 300Mbps ở 2,4 GHz đồng thời. 
• Broadcom Chip với 900MHz CPU và tốc độ xử lý 3x cung cấp khả năng tương thích tốt hơn và tính ổn định cao. 
• Bộ khuếch đại công suất cao và ăng-ten bên ngoài cho vùng phủ sóng toàn bộ nhà. 
• Beamforming + công nghệ boosts range cho các thiết bị WiFi 802.11ac. 
• Quản lý thông minh của lịch WiFi, LED hiển thị và tiết kiệm năng lượng.
• Thiết lập dễ dàng trong 30 giây', 1, N'white-img.png', 1000000, N'tenda', N'/ 30M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (16, N'A3300R - Router Wi-Fi băng tần kép Gigabit AC1200', 200, 969000, 0, N'tenda4.1.png', N'tenda4.2.png', N'temda4.3.png', N'tenda4.4.png', N'5sao.png', CAST(N'2023-05-11' AS Date), N'Tương thích chuẩn Wi-Fi IEEE 802.11ac Wave 2
867Mbps trên băng tần 5G và 300Mbps trên băng tần 2.4G
Công nghệ MU - MIMO truyền tải nhiều luồng dữ liệu đồng thời
4 Cổng giao tiếp LAN, WAN chuẩn Gigabits truy cập internet tốc độ cao
Hỗ trợ IP, Port, MAC, URL filtering và Port Forwarding
Kiểm soát của phụ huynh với lịch biểu Wi-Fi
QoS – Quản lý băng thông
Bộ vi xử lý 1GHz Dual-Core
App quản lý và cài đặt hiện đại TOTOLINK ROUTER (*)', 1, N'white-img.png', 1200000, N'toto-link', N'/ 25M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (17, N'Router Wi-Fi 6 Gigabit Ba Băng Tần AX6600', 20, 6799000, 0, N'toto1.1.jpg', N'toto1.2.jpg', N'toto1.3.jpg', N'toto1.4.jpg', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Wi-Fi Ba Băng Tần AX6600 - 4804 Mbps (5 GHz) + 1201 Mbps (5 GHz) + 574 Mbps (2.4 GHz).
Kết Nối Siêu Nhanh - 1 cổng  WAN/LAN  2.5 Gbps + 1 cổng WAN/LAN 1 Gbps + 3 cổng LAN Gigabit và hai cổng USB đảm bảo tính linh hoạt tối đa và tăng cường thông lượng.
Vùng Phủ Tối Đa- Tám ăng-ten có độ lợi cao được trang bị Beamforming đảm bảo phạm vi phủ sóng rộng lớn.
Nhiều Thiết Bị Hơn, Độ Trễ Ít Hơn - Công nghệ OFDMA và MU-MIMO truyền tải dữ liệu đến nhiều thiết bị đồng thời.
TP-Link HomeShield - Bảo mật nâng cao chống lại các mối đe dọa mới nhất.
CPU Mạnh Mẽ - Bộ xử lý lõi tứ 1.5 GHz đảm bảo tốc độ truyền tải nhanh và hoạt động mượt mà cho nhiều thiết bị và ứng dụng.
Bảo Mật Cao—WPA3 củng cố mã hóa Wi-Fi để cải thiện bảo mật.', 1, N'white-img.png', 6800000, N'tp-link', N'/ 30M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (18, N'Router Wi-Fi 6 Thế Hệ Kế Tiếp AX6000', 10, 9990000, 0, N'toto2.1.jpg', N'toto2.2.jpg', N'toto2.3.jpg', N'toto2.4.jpg', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Tốc độ cực nhanh - Router Wi-FI hai băng tần AX6000 được hỗ trợ bằng công nghệ 1024QAM cho tốc độ truyền tải cực nhanh lên đến 5952Mbps: 4804Mbps (5GHz) và 1148Mbps (2.4GHz)
Kết nối tốc độ cao - 1 cổng WAN 2.5 Gbps , 8 cổng LAN Gigabit, và 2 cổng USB 3.0 Type A và Type C
Hiệu quả cao - OFDMA tăng thông lượng trung bình lên 4 lần trong các mô hình đòi hỏi nhiều kết nối so với router 802.11ac thông thường. Mu-MIMO hỗ trợ cả uplink và downlink.
Bộ xử lý mạnh mẽ - CPU 4 lõi 1.8 GHz và 2 bộ đồng xử lý giúp loại bỏ hoàn toàn độ trễ, cung cấp một kết nối cực kỳ ổn định
Kết nối thông minh - Band Steering hướng các thiết bị kết nối đến băng tần thông thoáng hơn và Airtime Fairness tối ưu hóa thời gian sử dụng.
Hệ thống bảo mật tích hợp - TP-Link HomeCareTM  cung cấp giải pháp mạng toàn diện với bộ công cụ chống phần mềm độc hại tiên tiến do Trend MicroTM cung cấp, bao gồm Chống virus, Quyền kiểm soát của phụ huynh và QoS.
Dễ dàng cài đặt - Kết nối đến router của bạn thông qua Bluetooth và hoàn tất việc cài đặt trong chớp mắt với phần mềm Tether mạnh mẽ.', 1, N'white-img.png', 10000000, N'tp-link', N'/ 25M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (19, N'Router Wi-Fi Băng tần kép AC1350', 10, 1299000, 0, N'tp1.1.jpg', N'tp1.2.jpg', N'tp1.3.jpg', N'tp1.2.jpg', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Cung cấp tốc độ Wi-Fi nhanh hơn ở cả hai băng tần 2.4GHz (450Mbps) và 5GHz (867Mbps)
Hỗ trợ chuẩn Wi-Fi AC mới nhất cho các thiết bị Wi-Fi của bạn đạt hiệu suất tối ưu
Vùng phủ Wi-Fi rộng với ba ăng ten băng tần 2.4GHz và hai ăng ten băng tần 5GHz
MU-MIMO đạt được hiệu quả gấp 2 lần bằng cách giao tiếp với tối đa 2 thiết bị đồng thời
Công nghệ Beamforming mang lại kết nối không dây hiệu quả cao (được hỗ trợ bởi Phiên bản 2.0 trở lên)
Các chức năng phần mềm nâng cao như Quyền kiểm soát của phụ huynh và Mạng khách cung cấp khả năng quản lý được cá nhân hóa
Ứng dụng Tether giúp cài đặt router dễ dàng trong lòng bàn tay. !', 1, N'white-img.png', 1300000, N'tp-link', N'/ 30M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (22, N'Router Wi-Fi 6 băng tần kép Gigabit AX1800', 10, 1890000, 0, N'toto3.1.png', N'toto3.2.png', N'toto3.3.png', N'toto3.4.png', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Chuẩn Wi-Fi 6 (IEEE 802.11ax) thế hệ mới nhất.
Tốc độ Wi-Fi 1201Mbps trên 5GHz và 573,5Mbps trên 2.4GHz.
Cổng nghệ OFDMA cải thiện băng thông và hiệu suất hoạt động hỗ trợ nhiều kết nối hơn.
Công nghệ TWT (Target Wake) tiết kiệm điện năng cho user kết nối.
Công nghệ MU-MIMO hỗ trợ nhiều thiết bị cùng lúc.
4 ăng-ten 5dBi phát sóng ở khoảng cách xa, ổn định.
Công nghệ Beamforming cải thiện khả năng truyền tín hiệu, nâng cao hiệu quả băng thông.
5 cổng Gigabit cung cấp khả năng chuyển tiếp dữ liệu lớn qua kết nối cáp.
Hỗ trợ giao thức bảo mật WPA3 đảm bảo an ninh mạng.
Hỗ trợ VPN Server đáp ứng nhu cầu làm việc từ xa.
Hỗ trợ App TOTOLINK ROUTER quản lý tiện lợi, dễ dàng.
Hỗ trợ Easy Mesh và Roaming mọi nơi.', 1, N'white-img.png', 1900000, N'toto-link', N'/ 40M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (23, N'Router Wi-Fi 6 băng tần kép Gigabit AX1500', 10, 1119000, 0, N'toto4.1.png', N'toto4.2.png', N'toto4.3.png', N'toto4.4.png', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Chuẩn Wi-Fi 6 (IEEE 802.11ax) thế hệ mới nhất.
Tốc độ Wi-Fi 1201Mbps trên 5GHz và 300Mbps trên 2.4GHz.
Cổng nghệ OFDMA cải thiện băng thông và hiệu suất hoạt động hỗ trợ nhiều kết nối hơn.
Công nghệ MU-MIMO hỗ trợ nhiều thiết bị cùng lúc.
Công nghệ TWT (Target Wake) tiết kiệm điện năng cho user kết nối.
4 ăng-ten 5dBi phát sóng ở khoảng cách xa, ổn định.
5 cổng Gigabit cung cấp khả năng chuyển tiếp dữ liệu lớn qua kết nối cáp.
Hỗ trợ giao thức bảo mật WPA3 đảm bảo an ninh mạng.', 1, N'white-img.png', 1200000, N'toto-link', N'/ 30M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (24, N'ASUS RT-AX1800HP', 10, 1910000, 0, N'asus1.1.webp', N'asus1.2.webp', N'asus1.3.webp', N'asus1.4.webp', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Chuẩn WiFi thế hệ mới – Chuẩn WiFi 6 (802.11ax) hỗ trợ công nghệ MU-MIMO và OFDMA cho hiệu quả kết nối và lưu lượng tốt hơn.
Tốc độ WiFi siêu tốc – router RT-AX1800HP hỗ trợ 1024-QAM cho kết nối không dây nhanh hơn rõ rệt. Với tổng tốc độ mạng khoảng 1800Mbps - 574 Mbps trên băng tần 2.4GHz và 1201 Mbps trên băng tần 5GHz.
Tăng dung lượng và hiệu quả kết nối – Không chỉ hỗ trợ công nghệ MU-MIMO mà còn hỗ trợ kỹ thuật OFDMA để phân bổ kênh hiệu quả, giao tiếp kết nối với nhiều thiết bị đồng thời
Bảo vệ kết nối mạng gia đình của bạn –phần mềm Aiprotection được hợp tác với Trend Micro™, giúp chặn các mối đe dọa internet, bảo mật cho tất cả các thiết bị thông minh của bạn được kết nối với router.
Người bạn đồng hành cùng gia đình với hệ thống WiFi Mesh lưới- Tương thích với hệ thống WiFi lưới ASUS AiMesh phủ sóng WiFi mọi ngóc ngách trong nhà', 1, N'white-img.png', 2000000, N'asus', N'/ 30M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (25, N'ASUS RT-AX53U', 10, 1690000, 0, N'asus2.1.webp', N'asus2.2.webp', N'asus2.3.webp', N'asus2.4.webp', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Chuẩn WiFi thế hệ mới – Chuẩn WiFi 6 (802.11ax) hỗ trợ công nghệ MU-MIMO và OFDMA cho hiệu quả kết nối và lưu lượng tốt hơn.
Kết nối theo cách của bạn – Bạn có thể chia sẻ internet từ dongle 3G/4G đến router bằng cách cắm dongle vào cổng USB của router.
Tốc độ WiFi cực nhanh – RT-AX53U hỗ trợ 1024-QAM cho kết nối không dây nhanh hơn đáng kể. Với tổng tốc độ mạng gần 1800Mbps - 574 Mbps trên băng tần 2.4GHz và 1201 Mbps trên băng tần 5GHz.
Tăng dung lượng và hiệu quả – Không chỉ hỗ trợ công nghệ MU-MIMO mà còn hỗ trợ OFDMA giúp phân bổ kênh hiệu quả, kết nối với nhiều thiết bị đồng thời
Bảo vệ kết nối mạng gia đình của bạn – phần mềm Aiprotection được hợp tác với Trend Micro™, giúp chặn các mối đe dọa internet, bảo mật cho tất cả các thiết bị thông minh của bạn được kết nối với router.
Người bạn đồng hành cùng gia đình với hệ thống WiFi Mesh lưới – Tương thích với hệ thống WiFi lưới ASUS AiMesh phủ sóng WiFi mọi ngóc ngách trong nhà', 1, N'white-img.png', 1700000, N'asus', N'/ 25M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (26, N'ASUS RT-AX55', 10, 2075000, 0, N'asus3.1.webp', N'asus3.2.webp', N'asus3.3.webp', N'asus3.4.webp', N'5sao.png', CAST(N'2023-05-12' AS Date), N'Tiêu chuẩn WiFi thế hệ mới - Hỗ trợ chuẩn WiFi 6 (802.11ax) mới nhất để có công suất và hiệu quả tốt hơn
Tốc độ WiFi siêu tốc - router RT-AX55 hỗ trợ 1024-QAM cho kết nối không dây nhanh hơn rõ rệt. Với tổng tốc độ mạng khoảng 1800Mbps - 574 Mbps trên băng tần 2.4GHz và 1201 Mbps trên băng tần 5GHz.
Tăng dung lượng và hiệu quả - Không chỉ hỗ trợ MU-MIMO mà còn hỗ trợ cả kỹ thuật OFDMA để phân bổ hiệu quả các kênh, giao tiếp với nhiều thiết bị cùng lúc
Bảo vệ cho Mạng gia đình của bạn - AiProtection miễn phí trọn đời, do Trend Micro™ cung cấp, ngăn chặn các mối đe dọa bảo mật internet cho tất cả các thiết bị thông minh được kết nối của bạn.
Tương thích tốt hơn với hệ thống Mesh - Tương thích với hệ thống WiFi ASUS AiMesh để phủ sóng mượt toàn bộ ngôi nhà.
Công nghệ NitroQAM ™ (1024-QAM) - Công nghệ NitroQAM ™ (1024-QAM) cho phép tốc độ dữ liệu lên mức 25% trong khi tiêu chuẩn cũ bị giới hạn ở 256-QAM.', 1, N'white-img.png', 2100000, N'asus', N'/ 40M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (27, N'MERCUSYS MW325R', 10, 590000, 0, N'me1.1.jpg', N'me1.2.jpg', N'me1.3.jpg', N'me1.4.jpg', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Vùng phủ sóng tối đa – bốn ăng ten 5dBi cung cấp độ phủ sóng Wi-Fi lên tới 500m2
Tăng cường tín hiệu - ăng-ten thu cao làm tăng đáng kể cường độ tín hiệu Wi-Fi kích thước và độ ổn định
Tốc độ Wi-Fi 300Mbps - lý tưởng cho việc xem video HD, chơi game online, và tải tập tin lớn
Cài đặt dễ dàng - trang web trực quan hướng dẫn bạn quá trình cài đặt chỉ trong vài phút
*Phạm vi thông số dựa trên kết quả kiểm tra hiệu suất. Hiệu suất thực sẽ khác nhau tùy theo ứng dụng và điều kiện môi trường.', 1, N'white-img.png', 600000, N'mercusys', N'/ 15M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (28, N'MERCUSYS MW305R', 10, 200000, 0, N'me2.1.jpg', N'me2.2.jpg', N'me2.3.jpg', N'me2.4.jpg', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Tốc độ Wi-Fi 300Mbps lý tưởng để xem video HD, chơi game trực tuyến và tải các file có dung lượng lớn
 

Ba ăng ten 5dBi tăng cường tín hiệu, vùng phủ và độ ổn định của Wi-Fi
 

Trang web hướng dẫn với giao diện trực quan giúp bạn dễ dàng thiết lập thiết bị chỉ trong vài phút

 ', 1, N'white-img.png', 250000, N'mercusys', N'/ 15M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (29, N'Bộ Mở Rộng Sóng Wi-Fi AX1500', 20, 1699000, 0, N'mtp1.4.jpg', N'mtp1.1.jpg', N'mtp1.2.jpg', N'mtp1.3.jpg', N'5sao.png', CAST(N'2023-05-13' AS Date), N'RE505X được trang bị công nghệ Wi-Fi 6, thế hệ Wi-Fi mới nhất, cho tốc độ nhanh hơn, dung lượng lớn hơn, và giảm thiểu tắc nghẽn mạng.
Tạo ra mạng Mesh bằng cách kết nối router TP-Link OneMesh™ để phủ sóng liền mạch toàn căn nhà.
Cổng Ethernet Gigabit – Cung cấp kết nối có dây nhanh hơn cho Tivi thông minh, máy tính và máy chơi game console
Đèn tín hiệu thông minh – Giúp chọn được vị trí tốt nhất để tối ưu vùng phủ Wi-Fi cho biết cường độ tín hiệu ở vị trí hiện tại
Chế độ AP – tạo ra một điểm truy cập Wi-Fi mới để nâng cao mạng có dây của bạn thành mạng Wi-Fi
Ứng dụng Tether TP-LINK – Truy cập và quản lý dễ dàng mạng của bạn từ bất kuf thiết bị di động iOS hay Android
Khả Năng Tương Thích Tối Ưu – Mở rộng vùng phủ router hoặc điểm truy cập Wi-Fi hiện có. /', 2, N'white-img.png', 1700000, N'tp-link', N'/ 25M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (30, N' Mesh Router Wi-Fi gia đình AC1200', 20, 1250000, 0, N'mtt1.1.png', N'mtt1.2.png', N'mtt1.2.png', N'mtt1.3.png', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Hệ thống Mesh Wi-Fi băng tần kép tốc độ 1200Mbps
Công nghệ Beamforming giúp cải thiện tốc độ truyền sóng không dây.
Hỗ trợ công nghệ Seamless Roaming và Auto Switching
Tên miền truy cập itotolink.net
Hỗ trợ APP cài đặt và quản lý TOTOLINK ROUTER*', 2, N'white-img.png', 1300000, N'toto-link', N'/ 30M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (31, N'ASUS ZenWiFi AX Mini (XD4)', 10, 6990000, 0, N'mas1.1.png', N'mas1.2.png', N'mas1.3.png', N'mas1.2.png', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Hệ thống ZenWiFi AX Mini bao gồm một bộ định tuyến ASUS AX1800 WiFi 6 và hai nốt mở rộng, một trong những bộ phát wifi được trang bị các công nghệ độc đáo mang đến cho bạn kết nối WiFi cực nhanh, đáng tin cậy và an toàn — bất kể ở trong hay ngoài nhà bạn!', 2, N'white-img.png', 7490000, N'asus', N'/ 30M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (32, N'Wi-Fi Di Động 4G LTE M7350 v5', 20, 1999000, 0, N'ptp1.1.jpg', N'ptp1.2.jpg', N'ptp1.3.jpg', N'ptp1.1.jpg', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Hỗ trợ chuẩn 4G LTE với tốc độ tải xuống lên đến 150Mbps và tốc độ tải lên lên đến 50Mbps
Hỗ trợ 10 thiết bị kết nối cùng lúc
Thông tin trực quan với màn hình hiển thị tích hợp
Pin dung lượng 2000mAh cho 8 tiếng hoạt động liên tục
Trang bị khe cắm thẻ nhớ micro SD hỗ trợ dung lượng lưu trữ lên đến 32G
Tự động nhận dạng và cấu hình thẻ SIM Việt Nam*
*Áp dụng cho thẻ SIM của Mobifone, Vinaphone và Viettel', 3, N'white-img.png', 2490000, N'tp-link', N'/ 25M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (33, N'M7000 Wi-Fi Di Động 4G LTE', 20, 1399000, 0, N'M7000.1.jpg', N'M7000.2.jpg', N'M7000.3.jpg', N'M7000.4.jpg', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Chia sẻ kết nối internet với bạn bè lên đến 10 thiết bị cùng lúc
Pin sạc 2000 mAh cho thời gian sử dụng lâu dài
Hỗ trợ 4G FDD/TDD-LTE, tương thích với mạng của hầu hết các quốc gia trên thế giới
Dễ dàng quản lý với Ứng dụng tpMiFi', 3, N'white-img.png', 1690000, N'tp-link', N'/ 25M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (34, N'MF180L_V2 - Wi-Fi di động 4G LTE 150Mbps', 20, 1290000, 0, N'mf180l.1.png', N'mf180l.2.png', N'mf180l.3.png', N'mf180l.2.png', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Tương thích chuẩn IEEE 802.11 b/g/n
Hỗ trợ LTE, TD-SCDMA, WCDMA
Dung lượng PIN lên đến 2200mAh
Hỗ trợ 10 thiết bị kết nối
Màn hình LCD hiển thị thông tin trực quan
Công nghệ tiết kiệm điện thông minh
Tương thích với SIM của các nhà mạng', 3, N'white-img.png', 1690000, N'toto-link', N'/ 20M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (35, N'TOTOLINK SW24D ', 10, 629000, 0, N'sw24d.1.png', N'sw24d.2.png', N'sw24d-1-300x300.png', N'sw24d-4-1000x1000.png', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Switch 24 cổng RJ45 10/100Mbps auto-negotiated
Hỗ trợ điều khiển phân luồng tự động IEEE 802.3x Full Duplex và Half Duplex
Bảng địa chỉ MAC 8K và học địa chỉ tự động
Tính năng MDI/ MDIX tự động nhận cáp chéo/ thẳng
Thiết kế phù hợp đặt bàn và treo tường', 4, N'white-img.png', 669000, N'toto-link', N'/ 20M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (36, N'TOTOLINK SW16D ', 20, 539000, 0, N'sw16d-3-1000x1000.png', N'sw16d-2-1000x1000.png', N'sw16d-1-1000x1000.png', N'sw16d-4-1000x1000.png', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Switch 16 cổng 10/100Mbps RJ45 auto-negotiated
Hỗ trợ kiểm soát lưu lượng IEEE 802.3x tự phân luồng Full Duplex và Half Duplex
Bảng địa chỉ MAC 4K và học địa chỉ MAC tự động
Tính năng MDI/ MDIX tự động nhận cáp chéo/ thẳng
Thiết kế phù hợp đặt bàn và treo tường', 4, N'white-img.png', 579000, N'toto-link', N'/ 15M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (39, N'TP LINK TL-SG108-M2', 10, 1500000, 0, N'1.jpg', N'w.jpg', N'03-2_normal_20230510013410p.jpg', N'w.jpg', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Tám Cổng 2.5 Gbps. 8× cổng 2.5-Gigabit mang lại hiệu suất cao nhất của băng thông Multi-Gig và thiết bị của bạn, đồng thời cung cấp dung lượng chuyển mạch lên đến 40 Gbps.
Kết Nối Siêu Nhanh. Cung cấp kết nối siêu nhanh với 2.5G NAS, Máy chủ 2.5G, máy tính chơi game, AP WiFi 6 2.5G, video 4K, v.v.
Lý Tưởng Cho Môi Trường Khác Nhau .Được thiết kế phù hợp mạng LAN, giải trí gia đình, văn phòng nhỏ và gia đình, và truyền tải tức thì cho các máy trạm.
Không Rắc Rối Cáp. Nâng cấp lên 2.5 Gbps ngay lập tức mà không cần nâng cấp lên dây Cat6, giảm chi phí đi dây và rắc rối.**
Hoạt Động Không Gây Tiếng Ồn. Thiết kế không quạt hàng đầu trong ngành đảm bảo hoạt động êm ái, lý tưởng cho bất kỳ gia đình hoặc doanh nghiệp nào.
Cắm và Chạy. Triển khai dễ dàng mà không yêu cầu kỹ thuật viên.
Vỏ Kim Loại. Vỏ kim loại bền bỉ và thiết kế gắn tường/ để bàn phù hợp cho các môi trường khác nhau.', 4, N'white-img.png', 2000000, N'tp-link', N'/ 15M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (40, N'Kích Sóng Xiaomi Mi Repeater PRO 2 Râu', 20, 250000, 0, N'group_266.webp', N'1eb52fc1142537f45a2a90ec74c8e563.webp', N'31059f0c19fcf3cb30e647a15c1481ef.webp', N'6c565bb0692f377ca8018107239c5e06.webp', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Thiết kế nhỏ gọn
Bắt sóng mạnh mẽ
Kết nối dễ dàng', 5, N'white-img.png', 300000, N'xiaomi', N'/ 25M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (41, N'MERCUSYS MW300RE ', 10, 200000, 0, N'MW300RE_un_V3_28_normal_3.00_20180113082312.jpg', N'MW300RE_un_V3_28_normal_2.00_20180113082248.jpg', N'MW300RE_un_V3_28_normal_1.00_20180113082202.jpg', N'MW300RE_un_V3_28_normal_3.00_20180113082312.jpg', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Chế độ mở rộng sóng tăng cường tín hiệu Wi-Fi  đến những nơi sóng Wi-Fi không thể tới được hoặc khu vực khó đi dây.
Ba ăng ten ngoài với công nghệ MIMO giúp MW300RE vượt trội hơn các bộ mở rộng sóng thông thường.
Dễ dàng mở rộng vùng phủ sóng Wi-Fi với bước đơn giản hoặc nhấn nút WPS.
Kích thước thu nhỏ và thiết kế gắn tường giúp dễ dàng triển khai và di chuyển linh hoạt.
Đèn LED nhiều màu giúp bạn tìm được vị trí tốt để cung cấp Wi-Fi mở rộng hiệu quả nhất. !', 5, N'white-img.png', 250000, N'mercusys', N'/ 25M')
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [Radius]) VALUES (42, N'TOTO X6100UA', 10, 689000, 0, N'x6100ua-1-1000x1000.png', N'x6100ua-2-1000x1000.png', N'x6100ua-3-1000x1000.png', N'x6100ua-4-1000x1000.png', N'5sao.png', CAST(N'2023-05-13' AS Date), N'Tương thích chuẩn Wi-Fi IEEE 802.11a/b/g/n/ac/ax.
Tốc độ Wi-Fi lên đến1774,5Mbps trên 2 băng tần 2,4GHz (573,5Mbps) và 5GHz (1201Mbps)
Cổng USB3.0 cho phép truyền dữ liệu siêu nhanh
Điều chế 1024-QAM cung cấp tốc độ truyền dữ liệu Wi-Fi mạnh mẽ, liên tục.
Công nghệ TWT (Target Wake) tiết kiệm điện năng.
Nút WPS tạo kết nối không dây an toàn và đơn giản.
Hỗ trợ Windows 10 (32 / 64bits), Win8 / 8.1 (32 / 64bits), Windows 7 (32 / 64bits).', 6, N'white-img.png', 759000, N'toto-link', N'/ 20M')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (N'STAF', N'Staffs')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK23fux5pe6yss1vck8iv9juegn]    Script Date: 5/13/2023 10:23:52 AM ******/
ALTER TABLE [dbo].[Authorities] ADD  CONSTRAINT [UK23fux5pe6yss1vck8iv9juegn] UNIQUE NONCLUSTERED 
(
	[Username] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKef7fbpy09qu6267gf071q71we]    Script Date: 5/13/2023 10:23:52 AM ******/
ALTER TABLE [dbo].[Authorities] ADD  CONSTRAINT [UKef7fbpy09qu6267gf071q71we] UNIQUE NONCLUSTERED 
(
	[Username] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Accounts]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Roles]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Accounts]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Statitic]  WITH CHECK ADD  CONSTRAINT [FK_Statitic_OrderDetails] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetails] ([OrderDetailId])
GO
ALTER TABLE [dbo].[Statitic] CHECK CONSTRAINT [FK_Statitic_OrderDetails]
GO
ALTER TABLE [dbo].[Statitic]  WITH CHECK ADD  CONSTRAINT [FK_Statitic_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Statitic] CHECK CONSTRAINT [FK_Statitic_Orders]
GO
USE [master]
GO
ALTER DATABASE [TechNetShop] SET  READ_WRITE 
GO

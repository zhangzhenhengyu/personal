USE [LAZYEATING]
GO
/****** Object:  Table [dbo].[LE_CartRecord]    Script Date: 2014/5/9 10:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LE_CartRecord](
	[UserID] [int] NOT NULL,
	[FoodID] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[UnitPrice] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_CartRecord] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LE_Food]    Script Date: 2014/5/9 10:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LE_Food](
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [varchar](30) NOT NULL,
	[FoodTypeID] [int] NOT NULL,
	[Price] [numeric](18, 2) NULL,
	[PicUrl] [text] NULL,
	[SalesVolume] [int] NOT NULL,
	[AddDate] [datetime] NOT NULL,
	[Describe] [text] NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[FoodName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LE_FoodType]    Script Date: 2014/5/9 10:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LE_FoodType](
	[FoodTypeID] [int] IDENTITY(1,1) NOT NULL,
	[foodTypeName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_FoodType] PRIMARY KEY CLUSTERED 
(
	[FoodTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[foodTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LE_Order]    Script Date: 2014/5/9 10:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LE_Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RealName] [varchar](30) NOT NULL,
	[Address] [text] NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Totle] [numeric](18, 2) NOT NULL,
	[DateCreate] [datetime] NOT NULL,
	[OrderState] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LE_OrderDetail]    Script Date: 2014/5/9 10:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LE_OrderDetail](
	[OrderID] [int] NOT NULL,
	[FoodID] [int] NOT NULL,
	[Quatity] [int] NOT NULL,
	[UnitPrice] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LE_User]    Script Date: 2014/5/9 10:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LE_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[Password] [varchar](40) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[Adress] [text] NULL,
	[Sex] [varchar](4) NULL,
	[RealName] [varchar](30) NULL,
	[Phone] [varchar](20) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LE_UserType]    Script Date: 2014/5/9 10:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LE_UserType](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[LE_Food] ADD  DEFAULT ((1)) FOR [FoodTypeID]
GO
ALTER TABLE [dbo].[LE_Food] ADD  DEFAULT ((0)) FOR [SalesVolume]
GO
ALTER TABLE [dbo].[LE_Food] ADD  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[LE_Order] ADD  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[LE_User] ADD  DEFAULT ((2)) FOR [UserTypeID]
GO
ALTER TABLE [dbo].[LE_CartRecord]  WITH CHECK ADD  CONSTRAINT [FK_LE_CartRecord_LE_Food] FOREIGN KEY([FoodID])
REFERENCES [dbo].[LE_Food] ([FoodID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LE_CartRecord] CHECK CONSTRAINT [FK_LE_CartRecord_LE_Food]
GO
ALTER TABLE [dbo].[LE_CartRecord]  WITH CHECK ADD  CONSTRAINT [FK_LE_CartRecord_LE_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[LE_User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LE_CartRecord] CHECK CONSTRAINT [FK_LE_CartRecord_LE_User]
GO
ALTER TABLE [dbo].[LE_Food]  WITH CHECK ADD  CONSTRAINT [FK_FoodTypeID] FOREIGN KEY([FoodTypeID])
REFERENCES [dbo].[LE_FoodType] ([FoodTypeID])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[LE_Food] CHECK CONSTRAINT [FK_FoodTypeID]
GO
ALTER TABLE [dbo].[LE_Order]  WITH CHECK ADD  CONSTRAINT [FK_Order] FOREIGN KEY([UserID])
REFERENCES [dbo].[LE_User] ([UserID])
GO
ALTER TABLE [dbo].[LE_Order] CHECK CONSTRAINT [FK_Order]
GO
ALTER TABLE [dbo].[LE_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_LE_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[LE_Order] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LE_OrderDetail] CHECK CONSTRAINT [FK_LE_OrderID]
GO
ALTER TABLE [dbo].[LE_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail] FOREIGN KEY([FoodID])
REFERENCES [dbo].[LE_Food] ([FoodID])
GO
ALTER TABLE [dbo].[LE_OrderDetail] CHECK CONSTRAINT [FK_OrderDetail]
GO
ALTER TABLE [dbo].[LE_User]  WITH CHECK ADD  CONSTRAINT [FK_UserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[LE_UserType] ([UserTypeID])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[LE_User] CHECK CONSTRAINT [FK_UserType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜品号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Food', @level2type=N'COLUMN',@level2name=N'FoodID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Food', @level2type=N'COLUMN',@level2name=N'FoodName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜品类型编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Food', @level2type=N'COLUMN',@level2name=N'FoodTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Food', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Food', @level2type=N'COLUMN',@level2name=N'PicUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'销量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Food', @level2type=N'COLUMN',@level2name=N'SalesVolume'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Food', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对菜品的描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Food', @level2type=N'COLUMN',@level2name=N'Describe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜品类型编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_FoodType', @level2type=N'COLUMN',@level2name=N'FoodTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜品类型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_FoodType', @level2type=N'COLUMN',@level2name=N'foodTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Order', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Order', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'送货的地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Order', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'送货时的联系方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Order', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Order', @level2type=N'COLUMN',@level2name=N'Totle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Order', @level2type=N'COLUMN',@level2name=N'DateCreate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_Order', @level2type=N'COLUMN',@level2name=N'OrderState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_OrderDetail', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜品号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_OrderDetail', @level2type=N'COLUMN',@level2name=N'FoodID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_OrderDetail', @level2type=N'COLUMN',@level2name=N'Quatity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_OrderDetail', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_User', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_User', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外键，用户类型编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_User', @level2type=N'COLUMN',@level2name=N'UserTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_User', @level2type=N'COLUMN',@level2name=N'Adress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_User', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_User', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LE_User', @level2type=N'COLUMN',@level2name=N'Phone'
GO
use LAZYEATING
go
select * from [dbo].[LE_Food]
update [dbo].[LE_Food] set AddDate=getdate() where FoodID=27
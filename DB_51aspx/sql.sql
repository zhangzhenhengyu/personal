USE [master]
GO
CREATE DATABASE [LAZYEATING]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LazyEating', FILENAME = N'E:\LazyEating.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LazyEating_log', FILENAME = N'E:\LazyEating_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LAZYEATING] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LAZYEATING].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LAZYEATING] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LAZYEATING] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LAZYEATING] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LAZYEATING] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LAZYEATING] SET ARITHABORT OFF 
GO
ALTER DATABASE [LAZYEATING] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LAZYEATING] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LAZYEATING] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LAZYEATING] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LAZYEATING] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LAZYEATING] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LAZYEATING] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LAZYEATING] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LAZYEATING] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LAZYEATING] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LAZYEATING] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LAZYEATING] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LAZYEATING] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LAZYEATING] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LAZYEATING] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LAZYEATING] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LAZYEATING] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LAZYEATING] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LAZYEATING] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LAZYEATING] SET  MULTI_USER 
GO
ALTER DATABASE [LAZYEATING] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LAZYEATING] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LAZYEATING] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LAZYEATING] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LAZYEATING', N'ON'
GO
USE [LAZYEATING]
GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
--varchar(4) 可以输入4个字线，也可以输入两个汉字
--nvarchar(4) 可以输四个汉字，也可以输4个字母，但最多四个

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
USE [master]
GO
ALTER DATABASE [LAZYEATING] SET  READ_WRITE 
GO
use LAZYEATING
go
--创建delete触发器
/*create trigger tr_LE_Food_delete on dbo.LE_Food
for delete 
as
	--select * from deleted
	if exists(select * from sysobjects where name='LE_FoodInfo')--判断(表：LE_FoodInfo)是否存在
	begin
	--将要删除的数据放到一个deleted临时表中，我们可以向读取普通的表一样，select 字段 from deleted 
		insert into LE_FoodInfo select *,getdate() from deleted
	end
	else
	begin
		select * ,getdate() deleteDate into LE_FoodInfo from deleted
	end
	print '操作纪录已经删除，并且备份到备份表中'
GO
delete from dbo.LE_Food where FoodID=59*/
GO
--创建insert触发器
create trigger trLE_Food_insert on dbo.LE_Food 
for insert
as
--在inserted表中查询已经插入记录信息
declare @name nvarchar(20)
select @name=FoodName from inserted
print '成功添加：'+@name
Go
select * from dbo.LE_Food f left join dbo.LE_FoodType t on f.FoodTypeID=t.FoodTypeID 
go
create view v_LE_Food --创建视图
with encryption as 
select FoodID,FoodName,T.FoodTypeID,T.FoodTypeName,Price,PicUrl,SalesVolume,AddDate,Describe from dbo.LE_Food F
    join LE_FoodType T ON F.FoodTypeID = T.FoodTypeID 
go 
select * from v_LE_Food
select * from v_LE_Food where FoodTypeID=6
go

----------------------------------------------------------------------
---------------分页存储过程（使用Row_Number()函数）-------------------
----------------------------------------------------------------------
GO                                                     
CREATE PROC PROC_CutPageSelect
	@Table nvarchar(256),--表名                                      
	@PageSize int,--每页显示数量                                    
	@PageIndex int,--当前显示页码                                   
	@Conditions nvarchar(300),--筛选条件    
	@UniqueColumn nvarchar(256), --唯一列 (用来排列)                        
	@Pages int output--返回总共有多少页   
AS                                                                          
	DECLARE @Start INT,                                             
	@End INT,                                                       
	@Context nvarchar(1024)--动态sql语句  
	SET @Start=(@PageIndex-1)*@PageSize+1                          
	SET @End=@Start+@PageSize-1
    --通过条件将符合要求的数据汇聚到临时表#temp上
	SET @Context='select row_number() over(order by '+@UniqueColumn+') as [No],* into #temp  from '+@Table
	--判断是否有筛选条件传入                                        
    if(@Conditions is not null and @Conditions<>'')                                     
        SET @Context=@Context+' WHERE '+@Conditions                 
	--通过查询#temp实现分页                                         
	SET @Context=@Context                                           
	+'  SELECT * FROM #temp WHERE [NO] BETWEEN '+cast(@Start as nvarchar(4))+' AND '+cast(@End as nvarchar(4))  
	--返回出总共能分成多少页                                        
	SET @Context=@Context                                              
	+'  DECLARE @count INT  SELECT @count=count(*) FROM #TEMP  SET @Pages=@count/'+cast(@PageSize as nvarchar(4))+'  if(@count%'+cast(@PageSize as nvarchar(4))+'<>0)SET @Pages=@Pages+1';
	                                                                 
	EXEC SP_EXECUTESQL @Context,N'@Pages int output',@Pages output 
go
------------------------调用存储过程----------------------------------
declare @pages int                                                
exec PROC_CutPageSelect 'LE_Food',10,19,'FoodTypeID=6','ID',@pages output         
SELECT @pages
--根据FoodTypeID排序 asc(可省略) 升序/desc 降序 
select * from LE_Food ORDER BY FoodTypeID desc
--分组查询
SELECT FoodTypeID,COUNT(*) AS 菜品数 FROM LE_Food GROUP BY (FoodTypeID);
--子查询：查询某个用户的订单
SELECT * FROM LE_Order WHERE UserID =(SELECT UserID FROM [LE_User] WHERE UserName='xiaoli')
--以降序索引某个列中的值，您可以在列名称之后添加保留字 DESC：
CREATE INDEX SalesVolumeIndex
ON LE_Food (SalesVolume DESC)
--使用索引
select FoodName,Price from LE_Food where SalesVolume>190





/*组合查询：

通过UNION运算符来将两张表纵向联接，基本方式为：

SELECT 列1 , 列2 FROM 表1
UNION
SELECT 列3 , 列4 FROM 表2;
UNION ALL为保留重复行：

SELECT 列1 , 列2 FROM 表1
UNION ALL
SELECT 列3 , 列4 FROM 表2;*/
/*在SELECT中嵌套：
SELECT s.student_id,s.student_name,(SELECT class_name FROM t_class c WHERE c.class_id=s.class_id) FROM t_student s GROUP BY s.student_id;
子查询：
现要查出C语言成绩最高的学生的信息：
SELECT * FROM t_student WHERE student_subject='C语言' AND student_score>=ALL (SELECT student_score FROM t_student WHERE student_subject='C语言')
–ALL运算符
　　和子查询的结果逐一比较，必须全部满足时表达式的值才为真。
–ANY运算符
　　和子查询的结果逐一比较，其中一条记录满足条件则表达式的值就为真。
–EXISTS/NOT EXISTS运算符
　　EXISTS判断子查询是否存在数据，如果存在则表达式为真，反之为假。NOT EXISTS相反。
在子查询或相关查询中，要求出某个列的最大值，通常都是用ALL来比较，大意为比其他行都要大的值即为最大值。
要查出C语言成绩比李四高的学生的信息：
SELECT * FROM t_student WHERE student_subject='C语言' AND student_score >(SELECT student_score FROM t_student WHERE student_name='李四' AND student_subject='C语言'); */
/*子查询的分类：

–相关子查询
　　执行依赖于外部查询的数据。
　　外部查询返回一行，子查询就执行一次。
–非相关子查询
　　独立于外部查询的子查询。
　　子查询总共执行一次，执行完毕后后将值传递给外部查询。
 
上文提到的例子中，第一个例子求学生对应班级名的即为相关子查询，其中WHERE c.class_id=s.class_id 即为相关条件。其他的例子均只对一张表进行操作，为非相关子查询。
需要注意的是相关子查询主查询执行一回，子查询就执行一回，十分耗费时间，尤其是当数据多的时候。
现在我们回到最开始的问题，怎么查出每门课最高成绩的学生的信息：

SELECT * FROM t_student s1 WHERE s1.student_score >= ALL(SELECT s2.student_score FROM t_student s2 WHERE s1.`student_subject`=s2.student_subject);*/
USE [master]
GO

/*
CREATE Database for use
*/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ERPDB')
BEGIN
CREATE DATABASE [ERPDB]
END
GO

USE [ERPDB]
GO

/****** Object:  Schema [Admin] ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Admin')
EXEC sys.sp_executesql N'CREATE SCHEMA [Admin]'
GO

/****** Object:  Schema [Management] ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Management')
EXEC sys.sp_executesql N'CREATE SCHEMA [Management]'
GO

/****** Object:  Schema [Sale] ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Sale')
EXEC sys.sp_executesql N'CREATE SCHEMA [Sale]'
GO

/****** Object:  Schema [Store] ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Store')
EXEC sys.sp_executesql N'CREATE SCHEMA [Store]'
GO

/****** Object:  Table [Admin].[ConversionRate] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[ConversionRate]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[ConversionRate](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[currency] [decimal](18, 4) NOT NULL,
	[rate] [decimal](18, 4) NOT NULL,
	[name] [varchar](500) NOT NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Gestao.TaxaConversao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[Employee] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[Employee](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[master_employee_id] [uniqueidentifier] NULL,
	[position_id] [uniqueidentifier] NOT NULL,
	[role_id] [uniqueidentifier] NOT NULL,
	[first_name] [varchar](500) NOT NULL,
	[midle_name] [varchar](500) NOT NULL,
	[last_name] [varchar](500) NOT NULL,
	[email] [varchar](500) NOT NULL,
	[work_location] [varchar](500) NOT NULL,
	[funds] [decimal](18, 0) NULL,
	[credits] [decimal](18, 0) NULL,
	[password] [varchar](255) NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[Funds] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[Funds]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[Funds](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [uniqueidentifier] NOT NULL,
	[funds] [decimal](18, 0) NOT NULL,
	[received_date] [datetime] NOT NULL,
	[notes] [varchar](2000) NOT NULL,
	[currency] [decimal](18, 4) NULL,
	[rate] [decimal](18, 4) NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[NavigationMenu] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[NavigationMenu]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[NavigationMenu](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[top_menu_id] [uniqueidentifier] NULL,
	[label] [varchar](500) NOT NULL,
	[rank] [int] NULL,
	[controller] [varchar](500) NULL,
	[action] [varchar](500) NULL,
	[help] [varchar](2000) NULL,
	[icon] [varchar](100) NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[OperationLog] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[OperationLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[OperationLog](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [uniqueidentifier] NOT NULL,
	[begin_date_time] [datetime] NOT NULL,
	[end_date_time] [datetime] NULL,
	[operation] [varchar](2000) NOT NULL,
	[description] [varchar](max) NULL,
	[error] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[OperationTransactionsLog] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[OperationTransactionsLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[OperationTransactionsLog](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[operation_log_id] [uniqueidentifier] NOT NULL,
	[begin_date_time] [datetime] NOT NULL,
	[end_date_time] [datetime] NULL,
	[transaction] [varchar](max) NOT NULL,
	[description] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[Position] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[Position]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[Position](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](500) NULL,
	[name] [varchar](250) NOT NULL,
	[eligible] [bit] NOT NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[RecommendationType] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[RecommendationType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[RecommendationType](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NULL,
	[description] [varchar](500) NOT NULL,
	[type] [smallint] NULL,
	[fixed_score] [decimal](18, 0) NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[Role] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[Role](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NOT NULL,
	[description] [varchar](1000) NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[RoleNavigationMenus] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[RoleNavigationMenus]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[RoleNavigationMenus](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [uniqueidentifier] NOT NULL,
	[navigation_menu_id] [uniqueidentifier] NOT NULL,
	[can_view] [bit] NOT NULL,
	[can_edit] [bit] NOT NULL,
	[can_delete] [bit] NOT NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[StatusTypes] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[StatusTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[StatusTypes](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](2000) NOT NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[StatusValues] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[StatusValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[StatusValues](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](2000) NOT NULL,
	[status_type_id] [uniqueidentifier] NOT NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[Store] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[Store]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[Store](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NOT NULL,
	[description] [varchar](2000) NULL,
	[location] [varchar](2000) NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[StoreEmployee] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[StoreEmployee]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[StoreEmployee](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [uniqueidentifier] NOT NULL,
	[email] [varchar](500) NOT NULL,
	[store_id] [uniqueidentifier] NOT NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [Admin].[WorkLocation] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[WorkLocation]') AND type in (N'U'))
BEGIN
CREATE TABLE [Admin].[WorkLocation](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](500) NULL,
	[name] [varchar](250) NOT NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Management].[Evaluation] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Management].[Evaluation]') AND type in (N'U'))
BEGIN
CREATE TABLE [Management].[Evaluation](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[recommendation_id] [uniqueidentifier] NOT NULL,
	[evaluator_employee_id] [uniqueidentifier] NOT NULL,
	[status_values_id] [uniqueidentifier] NOT NULL,
	[justify] [varchar](2500) NOT NULL,
	[evaluation_date_time] [datetime] NULL,
	[active] [bit] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Management].[Recommendation] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Management].[Recommendation]') AND type in (N'U'))
BEGIN
CREATE TABLE [Management].[Recommendation](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [uniqueidentifier] NOT NULL,
	[requester_employee_id] [uniqueidentifier] NOT NULL,
	[recommendation_type_id] [uniqueidentifier] NULL,
	[justify] [varchar](max) NULL,
	[quantity_credits] [decimal](18, 0) NULL,
	[status_values_id] [uniqueidentifier] NOT NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [Sale].[CreditsProductsExchange] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]') AND type in (N'U'))
BEGIN
CREATE TABLE [Sale].[CreditsProductsExchange](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[status_values_id] [uniqueidentifier] NOT NULL,
	[employee_id] [uniqueidentifier] NOT NULL,
	[employee_store_id] [uniqueidentifier] NULL,
	[product_id] [uniqueidentifier] NOT NULL,
	[product_name] [varchar](500) NOT NULL,
	[product_description] [varchar](500) NOT NULL,
	[product_credits] [decimal](18, 0) NULL,
	[product_currency] [decimal](18, 4) NULL,
	[notes] [varchar](2000) NULL,
	[credits_total] [decimal](18, 0) NULL,
	[currency_total] [decimal](18, 4) NULL,
	[rate] [decimal](18, 4) NULL,
	[justify] [varchar](2000) NULL,
	[store_id] [uniqueidentifier] NULL,
	[additional_informations] [varchar](2000) NULL,
	[deliver_option_id] [uniqueidentifier] NOT NULL,
	[label] [varchar](500) NOT NULL,
	[label_employee] [varchar](500) NOT NULL,
	[label_store] [varchar](500) NOT NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Store].[DeliverOption] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Store].[DeliverOption]') AND type in (N'U'))
BEGIN
CREATE TABLE [Store].[DeliverOption](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[label] [varchar](500) NOT NULL,
	[label_employee] [varchar](500) NOT NULL,
	[label_store] [varchar](500) NOT NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Store].[Products] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Store].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [Store].[Products](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NOT NULL,
	[description] [varchar](2000) NOT NULL,
	[b64_image] [varchar](max) NULL,
	[available] [bit] NOT NULL,
	[creditis] [decimal](18, 0) NOT NULL,
	[currency] [decimal](18, 4) NOT NULL,
	[notes] [varchar](2000) NULL,
	[active] [bit] NOT NULL,
	[creation_date_time] [datetime] NOT NULL,
	[creation_employee_id] [uniqueidentifier] NOT NULL,
	[update_date_time] [datetime] NULL,
	[update_employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  View [Management].[VW_EVALUATORS_EVALUATION_EMPLOYEE] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Management].[VW_EVALUATORS_EVALUATION_EMPLOYEE]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [Management].[VW_EVALUATORS_EVALUATION_EMPLOYEE]
AS

WITH CTE_EMPLOYEE_RECURSIVE_MANAGERS (Manager, EmployeeId, Email, name, Position, Level)
AS
(    SELECT E.master_employee_id Manager, 
            E.id EmployeeId, 
            E.email,
			EM.first_name + '' '' + EM.last_name name,
            P.name position,
            0 AS Level
       FROM Admin.Employee(NOLOCK) E
       JOIN Admin.Employee(NOLOCK) EM ON E.master_employee_id = EM.id
	   JOIN Admin.Position (NOLOCK) P ON P.id = E.position_id
  UNION ALL
     SELECT CT.Manager, 
            E.id, 
            CT.email,
			CT.name,
            CT.Position,
            Level + 1
       FROM Admin.Employee(NOLOCK) E
       JOIN Admin.Position (NOLOCK) P ON P.id = E.position_id
       JOIN CTE_EMPLOYEE_RECURSIVE_MANAGERS CT ON CT.EmployeeId = E.master_employee_id)

  SELECT EmployeeId,
		 Manager, 
         Position,
         Email,
		 name,
         Level
    FROM CTE_EMPLOYEE_RECURSIVE_MANAGERS; 
' 
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Admin].[DF__OperationLog__id__49C3F6B7]') AND type = 'D')
BEGIN
ALTER TABLE [Admin].[OperationLog] ADD  DEFAULT (newid()) FOR [id]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_Employee_Position]') AND parent_object_id = OBJECT_ID(N'[Admin].[Employee]'))
ALTER TABLE [Admin].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position] FOREIGN KEY([position_id])
REFERENCES [Admin].[Position] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_Employee_Position]') AND parent_object_id = OBJECT_ID(N'[Admin].[Employee]'))
ALTER TABLE [Admin].[Employee] CHECK CONSTRAINT [FK_Employee_Position]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_Employee_Role]') AND parent_object_id = OBJECT_ID(N'[Admin].[Employee]'))
ALTER TABLE [Admin].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([role_id])
REFERENCES [Admin].[Role] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_Employee_Role]') AND parent_object_id = OBJECT_ID(N'[Admin].[Employee]'))
ALTER TABLE [Admin].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_MasterEmployee_Employee]') AND parent_object_id = OBJECT_ID(N'[Admin].[Employee]'))
ALTER TABLE [Admin].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_MasterEmployee_Employee] FOREIGN KEY([master_employee_id])
REFERENCES [Admin].[Employee] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_MasterEmployee_Employee]') AND parent_object_id = OBJECT_ID(N'[Admin].[Employee]'))
ALTER TABLE [Admin].[Employee] CHECK CONSTRAINT [FK_MasterEmployee_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_Funds_Employee]') AND parent_object_id = OBJECT_ID(N'[Admin].[Funds]'))
ALTER TABLE [Admin].[Funds]  WITH CHECK ADD  CONSTRAINT [FK_Funds_Employee] FOREIGN KEY([employee_id])
REFERENCES [Admin].[Employee] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_Funds_Employee]') AND parent_object_id = OBJECT_ID(N'[Admin].[Funds]'))
ALTER TABLE [Admin].[Funds] CHECK CONSTRAINT [FK_Funds_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_NavigationMenu_TopNavigationMenu]') AND parent_object_id = OBJECT_ID(N'[Admin].[NavigationMenu]'))
ALTER TABLE [Admin].[NavigationMenu]  WITH CHECK ADD  CONSTRAINT [FK_NavigationMenu_TopNavigationMenu] FOREIGN KEY([top_menu_id])
REFERENCES [Admin].[NavigationMenu] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_NavigationMenu_TopNavigationMenu]') AND parent_object_id = OBJECT_ID(N'[Admin].[NavigationMenu]'))
ALTER TABLE [Admin].[NavigationMenu] CHECK CONSTRAINT [FK_NavigationMenu_TopNavigationMenu]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_OperationTransactionsLog_OperationLog]') AND parent_object_id = OBJECT_ID(N'[Admin].[OperationTransactionsLog]'))
ALTER TABLE [Admin].[OperationTransactionsLog]  WITH CHECK ADD  CONSTRAINT [FK_OperationTransactionsLog_OperationLog] FOREIGN KEY([operation_log_id])
REFERENCES [Admin].[OperationLog] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_OperationTransactionsLog_OperationLog]') AND parent_object_id = OBJECT_ID(N'[Admin].[OperationTransactionsLog]'))
ALTER TABLE [Admin].[OperationTransactionsLog] CHECK CONSTRAINT [FK_OperationTransactionsLog_OperationLog]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_RoleNavigationMenus_NavigationMenu]') AND parent_object_id = OBJECT_ID(N'[Admin].[RoleNavigationMenus]'))
ALTER TABLE [Admin].[RoleNavigationMenus]  WITH CHECK ADD  CONSTRAINT [FK_RoleNavigationMenus_NavigationMenu] FOREIGN KEY([navigation_menu_id])
REFERENCES [Admin].[NavigationMenu] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_RoleNavigationMenus_NavigationMenu]') AND parent_object_id = OBJECT_ID(N'[Admin].[RoleNavigationMenus]'))
ALTER TABLE [Admin].[RoleNavigationMenus] CHECK CONSTRAINT [FK_RoleNavigationMenus_NavigationMenu]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_RoleNavigationMenus_Role]') AND parent_object_id = OBJECT_ID(N'[Admin].[RoleNavigationMenus]'))
ALTER TABLE [Admin].[RoleNavigationMenus]  WITH CHECK ADD  CONSTRAINT [FK_RoleNavigationMenus_Role] FOREIGN KEY([role_id])
REFERENCES [Admin].[Role] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_RoleNavigationMenus_Role]') AND parent_object_id = OBJECT_ID(N'[Admin].[RoleNavigationMenus]'))
ALTER TABLE [Admin].[RoleNavigationMenus] CHECK CONSTRAINT [FK_RoleNavigationMenus_Role]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_StatusValues_StatusTypes]') AND parent_object_id = OBJECT_ID(N'[Admin].[StatusValues]'))
ALTER TABLE [Admin].[StatusValues]  WITH CHECK ADD  CONSTRAINT [FK_StatusValues_StatusTypes] FOREIGN KEY([status_type_id])
REFERENCES [Admin].[StatusTypes] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_StatusValues_StatusTypes]') AND parent_object_id = OBJECT_ID(N'[Admin].[StatusValues]'))
ALTER TABLE [Admin].[StatusValues] CHECK CONSTRAINT [FK_StatusValues_StatusTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_StoreEmployee_Employee]') AND parent_object_id = OBJECT_ID(N'[Admin].[StoreEmployee]'))
ALTER TABLE [Admin].[StoreEmployee]  WITH CHECK ADD  CONSTRAINT [FK_StoreEmployee_Employee] FOREIGN KEY([employee_id])
REFERENCES [Admin].[Employee] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_StoreEmployee_Employee]') AND parent_object_id = OBJECT_ID(N'[Admin].[StoreEmployee]'))
ALTER TABLE [Admin].[StoreEmployee] CHECK CONSTRAINT [FK_StoreEmployee_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_StoreEmployee_Store]') AND parent_object_id = OBJECT_ID(N'[Admin].[StoreEmployee]'))
ALTER TABLE [Admin].[StoreEmployee]  WITH CHECK ADD  CONSTRAINT [FK_StoreEmployee_Store] FOREIGN KEY([store_id])
REFERENCES [Admin].[Store] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Admin].[FK_StoreEmployee_Store]') AND parent_object_id = OBJECT_ID(N'[Admin].[StoreEmployee]'))
ALTER TABLE [Admin].[StoreEmployee] CHECK CONSTRAINT [FK_StoreEmployee_Store]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Evaluation_Employee]') AND parent_object_id = OBJECT_ID(N'[Management].[Evaluation]'))
ALTER TABLE [Management].[Evaluation]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_Employee] FOREIGN KEY([evaluator_employee_id])
REFERENCES [Admin].[Employee] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Evaluation_Employee]') AND parent_object_id = OBJECT_ID(N'[Management].[Evaluation]'))
ALTER TABLE [Management].[Evaluation] CHECK CONSTRAINT [FK_Evaluation_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Evaluation_Recommendation]') AND parent_object_id = OBJECT_ID(N'[Management].[Evaluation]'))
ALTER TABLE [Management].[Evaluation]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_Recommendation] FOREIGN KEY([recommendation_id])
REFERENCES [Management].[Recommendation] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Evaluation_Recommendation]') AND parent_object_id = OBJECT_ID(N'[Management].[Evaluation]'))
ALTER TABLE [Management].[Evaluation] CHECK CONSTRAINT [FK_Evaluation_Recommendation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Evaluation_StatusValues]') AND parent_object_id = OBJECT_ID(N'[Management].[Evaluation]'))
ALTER TABLE [Management].[Evaluation]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_StatusValues] FOREIGN KEY([status_values_id])
REFERENCES [Admin].[StatusValues] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Evaluation_StatusValues]') AND parent_object_id = OBJECT_ID(N'[Management].[Evaluation]'))
ALTER TABLE [Management].[Evaluation] CHECK CONSTRAINT [FK_Evaluation_StatusValues]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Recommendation_Employee]') AND parent_object_id = OBJECT_ID(N'[Management].[Recommendation]'))
ALTER TABLE [Management].[Recommendation]  WITH CHECK ADD  CONSTRAINT [FK_Recommendation_Employee] FOREIGN KEY([employee_id])
REFERENCES [Admin].[Employee] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Recommendation_Employee]') AND parent_object_id = OBJECT_ID(N'[Management].[Recommendation]'))
ALTER TABLE [Management].[Recommendation] CHECK CONSTRAINT [FK_Recommendation_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Recommendation_RecommendationType]') AND parent_object_id = OBJECT_ID(N'[Management].[Recommendation]'))
ALTER TABLE [Management].[Recommendation]  WITH CHECK ADD  CONSTRAINT [FK_Recommendation_RecommendationType] FOREIGN KEY([recommendation_type_id])
REFERENCES [Admin].[RecommendationType] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Recommendation_RecommendationType]') AND parent_object_id = OBJECT_ID(N'[Management].[Recommendation]'))
ALTER TABLE [Management].[Recommendation] CHECK CONSTRAINT [FK_Recommendation_RecommendationType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Recommendation_RequesterEmployee]') AND parent_object_id = OBJECT_ID(N'[Management].[Recommendation]'))
ALTER TABLE [Management].[Recommendation]  WITH CHECK ADD  CONSTRAINT [FK_Recommendation_RequesterEmployee] FOREIGN KEY([requester_employee_id])
REFERENCES [Admin].[Employee] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Recommendation_RequesterEmployee]') AND parent_object_id = OBJECT_ID(N'[Management].[Recommendation]'))
ALTER TABLE [Management].[Recommendation] CHECK CONSTRAINT [FK_Recommendation_RequesterEmployee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Recommendation_StatusValues]') AND parent_object_id = OBJECT_ID(N'[Management].[Recommendation]'))
ALTER TABLE [Management].[Recommendation]  WITH CHECK ADD  CONSTRAINT [FK_Recommendation_StatusValues] FOREIGN KEY([status_values_id])
REFERENCES [Admin].[StatusValues] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Management].[FK_Recommendation_StatusValues]') AND parent_object_id = OBJECT_ID(N'[Management].[Recommendation]'))
ALTER TABLE [Management].[Recommendation] CHECK CONSTRAINT [FK_Recommendation_StatusValues]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sale].[FK_CreditsProductsExchange_DeliverOption]') AND parent_object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]'))
ALTER TABLE [Sale].[CreditsProductsExchange]  WITH CHECK ADD  CONSTRAINT [FK_CreditsProductsExchange_DeliverOption] FOREIGN KEY([deliver_option_id])
REFERENCES [Store].[DeliverOption] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sale].[FK_CreditsProductsExchange_DeliverOption]') AND parent_object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]'))
ALTER TABLE [Sale].[CreditsProductsExchange] CHECK CONSTRAINT [FK_CreditsProductsExchange_DeliverOption]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sale].[FK_CreditsProductsExchange_Employee]') AND parent_object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]'))
ALTER TABLE [Sale].[CreditsProductsExchange]  WITH CHECK ADD  CONSTRAINT [FK_CreditsProductsExchange_Employee] FOREIGN KEY([employee_id])
REFERENCES [Admin].[Employee] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sale].[FK_CreditsProductsExchange_Employee]') AND parent_object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]'))
ALTER TABLE [Sale].[CreditsProductsExchange] CHECK CONSTRAINT [FK_CreditsProductsExchange_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sale].[FK_CreditsProductsExchange_EmployeeOfStore]') AND parent_object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]'))
ALTER TABLE [Sale].[CreditsProductsExchange]  WITH CHECK ADD  CONSTRAINT [FK_CreditsProductsExchange_EmployeeOfStore] FOREIGN KEY([employee_store_id])
REFERENCES [Admin].[Employee] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sale].[FK_CreditsProductsExchange_EmployeeOfStore]') AND parent_object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]'))
ALTER TABLE [Sale].[CreditsProductsExchange] CHECK CONSTRAINT [FK_CreditsProductsExchange_EmployeeOfStore]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sale].[FK_CreditsProductsExchange_Products]') AND parent_object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]'))
ALTER TABLE [Sale].[CreditsProductsExchange]  WITH CHECK ADD  CONSTRAINT [FK_CreditsProductsExchange_Products] FOREIGN KEY([product_id])
REFERENCES [Store].[Products] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sale].[FK_CreditsProductsExchange_Products]') AND parent_object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]'))
ALTER TABLE [Sale].[CreditsProductsExchange] CHECK CONSTRAINT [FK_CreditsProductsExchange_Products]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sale].[FK_CreditsProductsExchange_StatusValues]') AND parent_object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]'))
ALTER TABLE [Sale].[CreditsProductsExchange]  WITH CHECK ADD  CONSTRAINT [FK_CreditsProductsExchange_StatusValues] FOREIGN KEY([status_values_id])
REFERENCES [Admin].[StatusValues] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sale].[FK_CreditsProductsExchange_StatusValues]') AND parent_object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]'))
ALTER TABLE [Sale].[CreditsProductsExchange] CHECK CONSTRAINT [FK_CreditsProductsExchange_StatusValues]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sale].[FK_CreditsProductsExchange_Store]') AND parent_object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]'))
ALTER TABLE [Sale].[CreditsProductsExchange]  WITH CHECK ADD  CONSTRAINT [FK_CreditsProductsExchange_Store] FOREIGN KEY([store_id])
REFERENCES [Admin].[Store] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sale].[FK_CreditsProductsExchange_Store]') AND parent_object_id = OBJECT_ID(N'[Sale].[CreditsProductsExchange]'))
ALTER TABLE [Sale].[CreditsProductsExchange] CHECK CONSTRAINT [FK_CreditsProductsExchange_Store]
GO
USE [master]
GO
ALTER DATABASE [ERPDB] SET  READ_WRITE 
GO

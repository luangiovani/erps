USE [master]
GO

CREATE DATABASE [ERPDB]
GO

USE [ERPDB]
GO

CREATE SCHEMA [Admin]
GO

CREATE SCHEMA [Management]
GO

CREATE SCHEMA [Store]
GO

CREATE SCHEMA [Sale]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[OperationTransactionsLog](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[operation_log_id] [uniqueidentifier] NOT NULL,
	[begin_date_time] [datetime] NOT NULL,
	[end_date_time] [datetime] NULL,
	[transaction] [varchar](max) NOT NULL,
	[description] [varchar](2000) NULL
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[Evaluation](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[recommendation_id] [uniqueidentifier] NOT NULL,
	[evaluator_user_id] [uniqueidentifier] NOT NULL,
	[status_evaluation_id] [uniqueidentifier] NOT NULL,
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
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[Position](
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
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[Employee](
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
GO

/****** Object:  Table [Management].[ColaboradorLoja]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[StoreEmployee](
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
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[Store](
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
GO
/****** Object:  Table [Management].[MeioDeCompra]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[MeioDeCompra](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
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
GO
/****** Object:  Table [Management].[Recomendacao]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[Recomendacao](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[cs_colaborador] [varchar](20) NOT NULL,
	[cs_colaborador_solicitante] [varchar](20) NOT NULL,
	[subordinado] [bit] NOT NULL,
	[tipo_recomendacao_id] [uniqueidentifier] NULL,
	[justificativa] [varchar](max) NULL,
	[qtde_pontos] [decimal](18, 0) NULL,
	[situacao_recomendacao_id] [uniqueidentifier] NOT NULL,
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
GO
/****** Object:  Table [Management].[SituacaoAvaliacao]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[SituacaoAvaliacao](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NOT NULL,
	[descricao] [varchar](500) NOT NULL,
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
GO
/****** Object:  Table [Management].[SituacaoRecomendacao]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[SituacaoRecomendacao](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NOT NULL,
	[descricao] [varchar](500) NOT NULL,
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
GO
/****** Object:  Table [Management].[TaxaConversao]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[TaxaConversao](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[valor_moeda] [decimal](18, 4) NOT NULL,
	[fator] [decimal](18, 4) NOT NULL,
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
GO
/****** Object:  Table [Management].[TipoRecomendacao]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[TipoRecomendacao](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NULL,
	[descricao] [varchar](500) NOT NULL,
	[tipo_pontuacao] [smallint] NULL,
	[pontos_fixos] [decimal](18, 0) NULL,
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
GO
/****** Object:  Table [Management].[TrocaMensagens]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[TrocaMensagens](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[cs_colaborador_remetente] [varchar](20) NOT NULL,
	[cs_colaborador_destinatario] [varchar](20) NOT NULL,
	[assunto] [varchar](250) NOT NULL,
	[mensagem] [varchar](max) NOT NULL,
	[lida] [bit] NOT NULL,
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
GO
/****** Object:  Table [Management].[Verba]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[Verba](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[cs_colaborador] [varchar](20) NOT NULL,
	[valor_pontos] [decimal](18, 0) NOT NULL,
	[data_atribuicao] [datetime] NOT NULL,
	[observacao] [varchar](2000) NOT NULL,
	[valor_moeda] [decimal](18, 4) NULL,
	[taxa_conversao] [decimal](18, 4) NULL,
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
GO
/****** Object:  Table [Shop].[OpcaoEntrega]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Shop].[OpcaoEntrega](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[label] [varchar](500) NOT NULL,
	[label_colaborador] [varchar](500) NOT NULL,
	[label_loja] [varchar](500) NOT NULL,
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
GO
/****** Object:  Table [Shop].[Opcoes]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Shop].[Opcoes](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NOT NULL,
	[observacao] [varchar](500) NULL,
	[tipo_opcao_id] [uniqueidentifier] NULL,
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
GO
/****** Object:  Table [Shop].[Produto]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Shop].[Produto](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[loja_id] [uniqueidentifier] NOT NULL,
	[name] [varchar](500) NOT NULL,
	[descricao] [varchar](2000) NOT NULL,
	[b64_imagem] [varchar](max) NULL,
	[disponibilidade] [bit] NOT NULL,
	[data_disponibilidade] [date] NULL,
	[valor_pontos] [decimal](18, 0) NOT NULL,
	[valor_monetario] [decimal](18, 4) NOT NULL,
	[observacao] [varchar](2000) NULL,
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
GO
/****** Object:  Table [Shop].[ProdutoOpcoes]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Shop].[ProdutoOpcoes](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[produto_id] [uniqueidentifier] NOT NULL,
	[opcao_id] [uniqueidentifier] NOT NULL,
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
GO
/****** Object:  Table [Shop].[ProdutoOpcoesValores]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Shop].[ProdutoOpcoesValores](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[produto_opcao_id] [uniqueidentifier] NOT NULL,
	[valor] [varchar](500) NOT NULL,
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
GO
/****** Object:  Table [Shop].[TipoOpcao]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Shop].[TipoOpcao](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](500) NULL,
	[name] [varchar](500) NOT NULL,
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
GO
/****** Object:  Table [Shop].[ValoresOpcoes]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Shop].[ValoresOpcoes](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[opcao_id] [uniqueidentifier] NOT NULL,
	[valor] [varchar](500) NOT NULL,
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
GO
/****** Object:  Table [Sale].[Compra]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[Compra](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[opcao_entrega_id] [uniqueidentifier] NOT NULL,
	[situacao_compra_id] [uniqueidentifier] NULL,
	[meio_de_compra_id] [uniqueidentifier] NULL,
	[cs_colaborador] [varchar](20) NOT NULL,
	[cs_colaborador_loja] [varchar](20) NULL,
	[total_pontos] [decimal](18, 0) NULL,
	[total_valor] [decimal](18, 4) NULL,
	[taxa_conversao] [decimal](18, 4) NULL,
	[justificativa] [varchar](2000) NULL,
	[loja_id] [uniqueidentifier] NULL,
	[informacoes_complementares] [varchar](2000) NULL,
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
GO
/****** Object:  Table [Sale].[ItemCompra]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[ItemCompra](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[compra_id] [uniqueidentifier] NOT NULL,
	[name] [varchar](500) NOT NULL,
	[descricao] [varchar](500) NOT NULL,
	[valor_pontos] [decimal](18, 0) NULL,
	[valor_monetario] [decimal](18, 4) NULL,
	[observacao] [varchar](500) NULL,
	[produto_id] [uniqueidentifier] NOT NULL,
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
GO
/****** Object:  Table [Sale].[ItemCompraOpcaoValor]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[ItemCompraOpcaoValor](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[item_compra_id] [uniqueidentifier] NOT NULL,
	[opcao] [varchar](500) NOT NULL,
	[observacao] [varchar](500) NULL,
	[valor] [varchar](500) NOT NULL,
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
GO
/****** Object:  Table [Sale].[OpcaoEntregaCompra]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[OpcaoEntregaCompra](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[compra_id] [uniqueidentifier] NOT NULL,
	[label_colaborador] [varchar](500) NOT NULL,
	[label_loja] [varchar](500) NOT NULL,
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
GO
/****** Object:  Table [Sale].[SituacaoCompra]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SituacaoCompra](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](500) NOT NULL,
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
GO
/****** Object:  Table [Sale].[SituacaoTroca]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SituacaoTroca](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](500) NOT NULL,
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
GO
/****** Object:  Table [Sale].[Troca]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[Troca](
	[id] [uniqueidentifier] NOT NULL,
	[order] [int] IDENTITY(1,1) NOT NULL,
	[compra_id] [uniqueidentifier] NOT NULL,
	[item_compra_troca_id] [uniqueidentifier] NOT NULL,
	[item_compra_novo_id] [uniqueidentifier] NOT NULL,
	[situacao_troca_id] [uniqueidentifier] NOT NULL,
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
GO
/****** Object:  View [Management].[VW_AVALIADORES_COLABORADOR]    Script Date: 29/10/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Management].[VW_AVALIADORES_COLABORADOR]
AS

WITH CTE_COLABORADOR (CS_Gestor, CS, Email, name, Cargo, Nivel)
AS
(    SELECT CO.cs_superior_imediato CS_Gestor, 
            CO.cs CS, 
            CS.email,
			CS.name,
            C.namenclatura Cargo,
            0 AS Nivel
       FROM Gestao.Colaborador(NOLOCK) CO
       JOIN Gestao.Colaborador(NOLOCK) CS ON CO.cs_superior_imediato = CS.cs
	   JOIN Gestao.Cargo (NOLOCK) C ON C.cd_cargo = CS.cd_cargo
  UNION ALL
     SELECT CT.CS_Gestor, 
            CO.cs CS, 
            CT.email,
			CT.name,
            CT.Cargo,
            Nivel + 1
       FROM Gestao.Colaborador(NOLOCK) CO
       JOIN Gestao.Cargo (NOLOCK) C ON C.cd_cargo = CO.cd_cargo
       JOIN CTE_COLABORADOR CT ON CT.CS = CO.cs_superior_imediato)

  SELECT CS,
		 CS_Gestor, 
         Cargo,
         Email,
		 name,
         Nivel
    FROM CTE_COLABORADOR; 
   --WHERE CS = '262642'
--ORDER BY Nivel;

--SELECT * FROM Gestao.Colaborador WHERE CS IN('314314','262039','263989','165888')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_COLAB_ID_CS_PERFIL_ATIVO]    Script Date: 29/10/2019 13:56:04 ******/
CREATE NONCLUSTERED INDEX [IDX_COLAB_ID_CS_PERFIL_ATIVO] ON [Management].[Colaborador]
(
	[id] ASC,
	[cs] ASC,
	[perfil_id] ASC,
	[active] ASC
)
INCLUDE([order],[cs_superior_imediato],[cd_cargo],[name],[email]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Admin].[Aplicacao] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Admin].[LogOperacoes] ADD  CONSTRAINT [DF_LogOperacoes_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Admin].[LogTransacoes] ADD  CONSTRAINT [DF_LogTransacoes_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Admin].[MenuDeNavegacao] ADD  CONSTRAINT [DF_MenuDeNavegacao_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Admin].[Perfil] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Admin].[PerfilMenuDeNavegacao] ADD  CONSTRAINT [DF_PerfilMenuDeNavegacao_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[BalancoTrocas] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[Cargo] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[Colaborador] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[ColaboradorGestorSaldoVerba] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[ColaboradorLoja] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[ConfiguracaoDistribuicaoVerbas] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[ConfiguracaoExpiracaoPontos] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[ExpiracaoPontosColaborador] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[Shop] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[MeioDeCompra] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[Recomendacao] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[SituacaoAvaliacao] ADD  CONSTRAINT [DF_SituacaoAvaliacao_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[SituacaoRecomendacao] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[TaxaConversao] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[TipoRecomendacao] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[TrocaMensagens] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[Verba] ADD  CONSTRAINT [DF_Verba_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Shop].[OpcaoEntrega] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Shop].[Opcoes] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Shop].[Produto] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Shop].[ProdutoOpcoes] ADD  CONSTRAINT [DF_ProdutoOpcoes_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Shop].[ProdutoOpcoesValores] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Shop].[TipoOpcao] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Shop].[ValoresOpcoes] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Sale].[Compra] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Sale].[ItemCompra] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Sale].[ItemCompraOpcaoValor] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Sale].[OpcaoEntregaCompra] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Sale].[SituacaoCompra] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Sale].[SituacaoTroca] ADD  CONSTRAINT [DF_SituacaoTroca_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Sale].[Troca] ADD  CONSTRAINT [DF_Troca_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [Management].[Avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_Avaliacao_Colaborador] FOREIGN KEY([cs_colaborador_avaliador])
REFERENCES [Management].[Colaborador] ([cs])
GO
ALTER TABLE [Management].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_Colaborador]
GO
ALTER TABLE [Management].[Avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_Avaliacao_Recomendacao] FOREIGN KEY([recomendacao_id])
REFERENCES [Management].[Recomendacao] ([id])
GO
ALTER TABLE [Management].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_Recomendacao]
GO
ALTER TABLE [Management].[Avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_Avaliacao_SituacaoAvaliacao] FOREIGN KEY([situacao_avaliacao_id])
REFERENCES [Management].[SituacaoAvaliacao] ([id])
GO
ALTER TABLE [Management].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_SituacaoAvaliacao]
GO
ALTER TABLE [Management].[BalancoTrocas]  WITH CHECK ADD  CONSTRAINT [FK_BalancoTrocas_Compra] FOREIGN KEY([compra_id])
REFERENCES [Sale].[Compra] ([id])
GO
ALTER TABLE [Management].[BalancoTrocas] CHECK CONSTRAINT [FK_BalancoTrocas_Compra]
GO
ALTER TABLE [Management].[ColaboradorLoja]  WITH CHECK ADD  CONSTRAINT [FK_ColaboradorLoja_Loja] FOREIGN KEY([loja_id])
REFERENCES [Management].[Shop] ([id])
GO
ALTER TABLE [Management].[ColaboradorLoja] CHECK CONSTRAINT [FK_ColaboradorLoja_Loja]
GO
ALTER TABLE [Management].[ExpiracaoPontosColaborador]  WITH CHECK ADD  CONSTRAINT [FK_ExpiracaoPontosColaborador_Recomendacao] FOREIGN KEY([recomendacao_id])
REFERENCES [Management].[Recomendacao] ([id])
GO
ALTER TABLE [Management].[ExpiracaoPontosColaborador] CHECK CONSTRAINT [FK_ExpiracaoPontosColaborador_Recomendacao]
GO
ALTER TABLE [Management].[Recomendacao]  WITH CHECK ADD  CONSTRAINT [FK_Recomendacao_Colaborador] FOREIGN KEY([cs_colaborador])
REFERENCES [Management].[Colaborador] ([cs])
GO
ALTER TABLE [Management].[Recomendacao] CHECK CONSTRAINT [FK_Recomendacao_Colaborador]
GO
ALTER TABLE [Management].[Recomendacao]  WITH CHECK ADD  CONSTRAINT [FK_Recomendacao_ColaboradorSolicitante] FOREIGN KEY([cs_colaborador_solicitante])
REFERENCES [Management].[Colaborador] ([cs])
GO
ALTER TABLE [Management].[Recomendacao] CHECK CONSTRAINT [FK_Recomendacao_ColaboradorSolicitante]
GO
ALTER TABLE [Management].[Recomendacao]  WITH CHECK ADD  CONSTRAINT [FK_Recomendacao_SituacaoRecomendacao] FOREIGN KEY([situacao_recomendacao_id])
REFERENCES [Management].[SituacaoRecomendacao] ([id])
GO
ALTER TABLE [Management].[Recomendacao] CHECK CONSTRAINT [FK_Recomendacao_SituacaoRecomendacao]
GO
ALTER TABLE [Management].[Recomendacao]  WITH CHECK ADD  CONSTRAINT [FK_Recomendacao_TipoRecomendacao] FOREIGN KEY([tipo_recomendacao_id])
REFERENCES [Management].[TipoRecomendacao] ([id])
GO
ALTER TABLE [Management].[Recomendacao] CHECK CONSTRAINT [FK_Recomendacao_TipoRecomendacao]
GO
ALTER TABLE [Management].[TrocaMensagens]  WITH CHECK ADD  CONSTRAINT [FK_TrocaMensagens_Colaborador_Destinatario] FOREIGN KEY([cs_colaborador_destinatario])
REFERENCES [Management].[Colaborador] ([cs])
GO
ALTER TABLE [Management].[TrocaMensagens] CHECK CONSTRAINT [FK_TrocaMensagens_Colaborador_Destinatario]
GO
ALTER TABLE [Management].[TrocaMensagens]  WITH CHECK ADD  CONSTRAINT [FK_TrocaMensagens_Colaborador_Remetente] FOREIGN KEY([cs_colaborador_remetente])
REFERENCES [Management].[Colaborador] ([cs])
GO
ALTER TABLE [Management].[TrocaMensagens] CHECK CONSTRAINT [FK_TrocaMensagens_Colaborador_Remetente]
GO
ALTER TABLE [Management].[Verba]  WITH CHECK ADD  CONSTRAINT [FK_Verba_Colaborador] FOREIGN KEY([cs_colaborador])
REFERENCES [Management].[Colaborador] ([cs])
GO
ALTER TABLE [Management].[Verba] CHECK CONSTRAINT [FK_Verba_Colaborador]
GO
ALTER TABLE [Shop].[Opcoes]  WITH CHECK ADD  CONSTRAINT [FK_Opcoes_TipoOpcao] FOREIGN KEY([tipo_opcao_id])
REFERENCES [Shop].[TipoOpcao] ([id])
GO
ALTER TABLE [Shop].[Opcoes] CHECK CONSTRAINT [FK_Opcoes_TipoOpcao]
GO
ALTER TABLE [Shop].[ProdutoOpcoes]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoOpcoes_Opcoes] FOREIGN KEY([opcao_id])
REFERENCES [Shop].[Opcoes] ([id])
GO
ALTER TABLE [Shop].[ProdutoOpcoes] CHECK CONSTRAINT [FK_ProdutoOpcoes_Opcoes]
GO
ALTER TABLE [Shop].[ProdutoOpcoes]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoOpcoes_Produto] FOREIGN KEY([produto_id])
REFERENCES [Shop].[Produto] ([id])
GO
ALTER TABLE [Shop].[ProdutoOpcoes] CHECK CONSTRAINT [FK_ProdutoOpcoes_Produto]
GO
ALTER TABLE [Shop].[ProdutoOpcoesValores]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoOpcoesValores_ProdutoOpcoes] FOREIGN KEY([produto_opcao_id])
REFERENCES [Shop].[ProdutoOpcoes] ([id])
GO
ALTER TABLE [Shop].[ProdutoOpcoesValores] CHECK CONSTRAINT [FK_ProdutoOpcoesValores_ProdutoOpcoes]
GO
ALTER TABLE [Shop].[ValoresOpcoes]  WITH CHECK ADD  CONSTRAINT [FK_ValoresOpcoes_Opcoes] FOREIGN KEY([opcao_id])
REFERENCES [Shop].[Opcoes] ([id])
GO
ALTER TABLE [Shop].[ValoresOpcoes] CHECK CONSTRAINT [FK_ValoresOpcoes_Opcoes]
GO
ALTER TABLE [Sale].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Colaborador] FOREIGN KEY([cs_colaborador])
REFERENCES [Management].[Colaborador] ([cs])
GO
ALTER TABLE [Sale].[Compra] CHECK CONSTRAINT [FK_Compra_Colaborador]
GO
ALTER TABLE [Sale].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_ColaboradorLoja] FOREIGN KEY([cs_colaborador_loja])
REFERENCES [Management].[Colaborador] ([cs])
GO
ALTER TABLE [Sale].[Compra] CHECK CONSTRAINT [FK_Compra_ColaboradorLoja]
GO
ALTER TABLE [Sale].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_MeioDeCompra] FOREIGN KEY([meio_de_compra_id])
REFERENCES [Management].[MeioDeCompra] ([id])
GO
ALTER TABLE [Sale].[Compra] CHECK CONSTRAINT [FK_Compra_MeioDeCompra]
GO
ALTER TABLE [Sale].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_OpcaoEntrega] FOREIGN KEY([opcao_entrega_id])
REFERENCES [Shop].[OpcaoEntrega] ([id])
GO
ALTER TABLE [Sale].[Compra] CHECK CONSTRAINT [FK_Compra_OpcaoEntrega]
GO
ALTER TABLE [Sale].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_SituacaoCompra] FOREIGN KEY([situacao_compra_id])
REFERENCES [Sale].[SituacaoCompra] ([id])
GO
ALTER TABLE [Sale].[Compra] CHECK CONSTRAINT [FK_Compra_SituacaoCompra]
GO
ALTER TABLE [Sale].[ItemCompra]  WITH CHECK ADD  CONSTRAINT [FK_ItemCompra_Compra] FOREIGN KEY([compra_id])
REFERENCES [Sale].[Compra] ([id])
GO
ALTER TABLE [Sale].[ItemCompra] CHECK CONSTRAINT [FK_ItemCompra_Compra]
GO
ALTER TABLE [Sale].[ItemCompraOpcaoValor]  WITH CHECK ADD  CONSTRAINT [FK_ItemCompraOpcaoValor_ItemCompra] FOREIGN KEY([item_compra_id])
REFERENCES [Sale].[ItemCompra] ([id])
GO
ALTER TABLE [Sale].[ItemCompraOpcaoValor] CHECK CONSTRAINT [FK_ItemCompraOpcaoValor_ItemCompra]
GO
ALTER TABLE [Sale].[OpcaoEntregaCompra]  WITH CHECK ADD  CONSTRAINT [FK_OpcaoEntregaCompra_Compra] FOREIGN KEY([compra_id])
REFERENCES [Sale].[Compra] ([id])
GO
ALTER TABLE [Sale].[OpcaoEntregaCompra] CHECK CONSTRAINT [FK_OpcaoEntregaCompra_Compra]
GO
ALTER TABLE [Sale].[Troca]  WITH CHECK ADD  CONSTRAINT [FK_Troca_Compra] FOREIGN KEY([compra_id])
REFERENCES [Sale].[Compra] ([id])
GO
ALTER TABLE [Sale].[Troca] CHECK CONSTRAINT [FK_Troca_Compra]
GO
ALTER TABLE [Sale].[Troca]  WITH CHECK ADD  CONSTRAINT [FK_Troca_ItemCompra_Novo] FOREIGN KEY([item_compra_novo_id])
REFERENCES [Sale].[ItemCompra] ([id])
GO
ALTER TABLE [Sale].[Troca] CHECK CONSTRAINT [FK_Troca_ItemCompra_Novo]
GO
ALTER TABLE [Sale].[Troca]  WITH CHECK ADD  CONSTRAINT [FK_Troca_ItemCompra_Troca] FOREIGN KEY([item_compra_troca_id])
REFERENCES [Sale].[ItemCompra] ([id])
GO
ALTER TABLE [Sale].[Troca] CHECK CONSTRAINT [FK_Troca_ItemCompra_Troca]
GO
ALTER TABLE [Sale].[Troca]  WITH CHECK ADD  CONSTRAINT [FK_Troca_SituacaoTroca] FOREIGN KEY([situacao_troca_id])
REFERENCES [Sale].[SituacaoTroca] ([id])
GO
ALTER TABLE [Sale].[Troca] CHECK CONSTRAINT [FK_Troca_SituacaoTroca]
GO
USE [master]
GO
ALTER DATABASE [ERPDB] SET  READ_WRITE 
GO

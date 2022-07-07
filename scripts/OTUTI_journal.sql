USE [portalFGU59]
GO

/****** Object:  Table [dbo].[OTUTI_journal]    Script Date: 02/11/2016 20:25:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OTUTI_journal](
	[id_otuti_journal] [int] IDENTITY(1,1) NOT NULL,
	[reg_num] [nvarchar](10) NULL,
	[reg_date] [datetime] NULL,
	[number_request] [nvarchar](50) NULL,
	[request_date] [datetime] NULL,
	[category_request] [nvarchar](50) NULL,
	[FIO] [nvarchar](255) NULL,
	[object_type] [nvarchar](50) NULL,
	[address] [nvarchar](255) NULL,
	[number_inv] [nvarchar](50) NULL,
	[litera] [nvarchar](50) NULL,
	[number_if] [nvarchar](50) NULL,
	[name_doc] [nvarchar](255) NULL,
	[id_sotrudnik] [int] NULL,
	[control_date] [datetime] NULL,
	[status_int] [int] NULL,
	[status_str] [nvarchar](50) NULL,
	[otuty] [nvarchar](255) NULL,
	[ready_dateCTY] [datetime] NULL,
	[ready_dateRosreh] [datetime] NULL,
	[ready_dateChBTY] [datetime] NULL,
	[ready_dateOBTY] [datetime] NULL,
	[ready_dateVBTY] [datetime] NULL,
	[ready_dateVBTY_zkp] [datetime] NULL,
	[ready_dateOMS] [datetime] NULL,
	[items] [nvarchar](50) NULL,
	[CTY] [bit] NULL,
	[Rosreh] [bit] NULL,
	[ChBTY] [bit] NULL,
	[OBTY] [bit] NULL,
	[VBTY] [bit] NULL,
	[VBTY_zkp] [bit] NULL,
	[OMS] [bit] NULL,
	[comments] [nvarchar](255) NULL,
	[inoe] [nvarchar](255) NULL,
	[control_date_old] [datetime] NULL,
	[CTY_data] [bit] NULL,
	[Rosreh_data] [bit] NULL,
	[ChBTY_data] [bit] NULL,
	[OBTY_data] [bit] NULL,
	[VBTY_data] [bit] NULL,
	[VBTY_data_zkp] [bit] NULL,
	[CTY_status] [int] NULL,
	[Rosreh_status] [int] NULL,
	[ChBTY_status] [int] NULL,
	[OBTY_status] [int] NULL,
	[VBTY_status] [int] NULL,
	[VBTY_status_zkp] [int] NULL,
	[OMS_status] [int] NULL,
	[cad_num] [nvarchar](50) NULL,
	[text_message] [nvarchar](500) NULL,
	[sotrudnik_send] [nvarchar](150) NULL,
	[cad_number] [nvarchar](50) NULL,
	[number_ais_gkn] [nvarchar](100) NULL,
	[send_doc_users] [nvarchar](50) NULL,
	[name_org_zu] [nvarchar](255) NULL,
	[date_update] [datetime] NULL,
	[items_files] [nvarchar](50) NULL,
 CONSTRAINT [PK_OTUTI_journal] PRIMARY KEY CLUSTERED 
(
	[id_otuti_journal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



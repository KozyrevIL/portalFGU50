USE [portalFGU59]
GO

/****** Object:  StoredProcedure [dbo].[OTUTI_journalDelete]    Script Date: 02/11/2016 20:33:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[OTUTI_journalDelete]
(
	@id_otuti_journal int
)
as

DELETE FROM [portalfgu59].[dbo].[OTUTI_journal]
      WHERE id_otuti_journal=@id_otuti_journal
GO



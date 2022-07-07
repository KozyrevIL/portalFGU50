USE [portalFGU59]
GO

/****** Object:  StoredProcedure [dbo].[OTUTI_journalSelectAll]    Script Date: 02/11/2016 20:33:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OTUTI_journalSelectAll]
 @state nvarchar(100) = 'в работе'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select a.number_request "«а€вка", 
		   a.reg_date "ƒата_регистрации", 
		   dbo.WorkdaysSelectedControlDay1(a.reg_date,5) " онтрольна€ дата", 
		   a.ready_date "ƒата завершени€", 
		   dbo.to_date(getdate()) "“екуща€ дата",
		   case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and ready_date is null then 'в работе'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and ready_date is null then 'последний день в работе'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_date is null then 'просрочен и все еще в работе'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_date is not null and 
				 dbo.to_date(ready_date) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт с просроком'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_date is not null and 
				 dbo.to_date(ready_date) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт'
		   end "—осто€ние"
	from OTUTI_journal a
    where case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and ready_date is null then 'в работе'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and ready_date is null then 'последний день в работе'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_date is null then 'просрочен и все еще в работе'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_date is not null and 
				 dbo.to_date(ready_date) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт с просроком'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_date is not null and 
				 dbo.to_date(ready_date) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт'
		   end = @state

	order by  a.reg_date desc
END



GO



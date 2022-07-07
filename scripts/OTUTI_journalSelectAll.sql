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
 @state nvarchar(100) = '� ������'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select a.number_request "������", 
		   a.reg_date "����_�����������", 
		   dbo.WorkdaysSelectedControlDay1(a.reg_date,5) "����������� ����", 
		   a.ready_date "���� ����������", 
		   dbo.to_date(getdate()) "������� ����",
		   case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and ready_date is null then '� ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and ready_date is null then '��������� ���� � ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_date is null then '��������� � ��� ��� � ������'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_date is not null and 
				 dbo.to_date(ready_date) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������ � ���������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_date is not null and 
				 dbo.to_date(ready_date) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������'
		   end "���������"
	from OTUTI_journal a
    where case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and ready_date is null then '� ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and ready_date is null then '��������� ���� � ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_date is null then '��������� � ��� ��� � ������'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_date is not null and 
				 dbo.to_date(ready_date) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������ � ���������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_date is not null and 
				 dbo.to_date(ready_date) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������'
		   end = @state

	order by  a.reg_date desc
END



GO



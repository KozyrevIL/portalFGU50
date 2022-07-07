UPDATE [PortalFGU59].[dbo].[Megved]
   SET 
      [date_control] = convert(datetime,'2015-08-10')
      
 where [date_reg] =convert(datetime,'2015-08-03')
GO

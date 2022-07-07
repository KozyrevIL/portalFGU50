--SELECT TOP 1000 [id_sotrudnik]
--      ,[id_otdel]
--      ,[id_otdel_fact]
--      ,[id_dolgnost]
--      ,[id_filial]
--      ,[first_name]
--      ,[last_name]
--      ,[middle_name]
 
  
--  FROM [portalFGU59].[dbo].[Sotrudnik]
--  where last_name='Стряпунина'
  
update Sotrudnik set id_filial=77 where last_name='Стряпунина'
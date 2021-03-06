USE [portalFGU59]
GO
/****** Object:  StoredProcedure [dbo].[OTUTI_journalSelect]    Script Date: 02/11/2016 21:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[OTUTI_journalSelect]
(
	@mask nvarchar (255),
	@top int
)
as
if (@top!=0)
BEGIN
SELECT TOP (@top)
	  o.id_otuti_journal,
      o.reg_num,
      o.reg_date,
      o.number_request,
      o.request_date,
      o.category_request,
      o.FIO,
      o.object_type,
      o.address,
      o.number_inv,
      o.litera,
      o.number_if,
      o.name_doc,
      o.id_sotrudnik,
	  s.last_name+ ' '+s.first_name+' '+s.middle_name as full_name,
	  o.control_date,
	  o.status_int,
	  o.status_str,
	  o.otuty,
	  o.ready_dateCTY,
	  o.ready_dateRosreh,
	  o.ready_dateChBTY,
	  o.ready_dateOBTY,
      o.ready_dateVBTY,
      o.ready_dateVBTY_zkp,
      o.ready_dateOMS,
	  o.items,
	  f.fileNames,
	  f.filePath,
	  f.fileGUIDNames,
	  CTY,
	  Rosreh,
	  ChBTY,
	  OBTY,
	  VBTY,
	  VBTY_zkp,
	  OMS,
	  o.comments,
	  o.inoe,
	  o.CTY_status,
	  o.Rosreh_status,
	  o.ChBTY_status,
	  o.OBTY_status,
	  o.VBTY_status,
	  o.VBTY_status_zkp,
	  
	  o.OMS_status,
	  
	  o.cad_num,
	  o.text_message,
	  o.sotrudnik_send,
	  cad_number,
	  o.number_ais_gkn,
	  o.send_doc_users,
	  o.name_org_zu,
	  
	  o.date_update,
	  
	  o.items_files,
	  
	  f2.fileNames as fileNames_files,
	  f2.filePath as filePath_files,
	  f2.fileGUIDNames as fileGUIDNames_files

  FROM [OTUTI_journal] o left join 
		Sotrudnik s on o.id_sotrudnik=s.id_sotrudnik left join
		FilesItem fi on o.items=fi.items left join
		Files f on fi.id_files=f.id_files
		
		left join
		
		FilesItem fil on o.items_files=fil.items left join
		Files f2 on fil.id_files=f2.id_files 
 where
		((	
			o.reg_num like '%'+@mask+'%' or 
			o.reg_date like '%'+@mask+'%' or
			o.number_request like '%'+@mask+'%' or
			o.request_date like '%'+@mask+'%' or
			o.category_request like '%'+@mask+'%' or
			o.FIO like '%'+@mask+'%' or
			o.object_type like '%'+@mask+'%' or
			o.address like '%'+@mask+'%' or
			o.number_inv like '%'+@mask+'%' or
			o.litera like '%'+@mask+'%' or
			o.number_if like '%'+@mask+'%' or
			o.name_doc like '%'+@mask+'%' or
			s.last_name like '%'+@mask+'%' or
			o.status_str like '%'+@mask+'%' or
			o.control_date like '%'+@mask+'%' or
			o.number_ais_gkn like '%'+@mask+'%' or
			o.send_doc_users like '%'+@mask+'%' or
			o.name_org_zu like '%'+@mask+'%' or
			o.date_update like '%'+@mask+'%' or
			o.otuty like '%'+@mask +'%'

		) or @mask='-1')

order by id_otuti_journal desc
END
ELSE
--выборка по всем строкам
BEGIN
SELECT 
	  o.id_otuti_journal,
      o.reg_num,
      o.reg_date,
      o.number_request,
      o.request_date,
      o.category_request,
      o.FIO,
      o.object_type,
      o.address,
      o.number_inv,
      o.litera,
      o.number_if,
      o.name_doc,
      o.id_sotrudnik,
	  s.last_name+ ' '+s.first_name+' '+s.middle_name as full_name,
	  o.control_date,
	  o.status_int,
	  o.status_str,
	  o.otuty,
	  o.ready_dateCTY,
	  o.ready_dateRosreh,
	  o.ready_dateChBTY,
	  o.ready_dateOBTY,
      o.ready_dateVBTY,
      o.ready_dateVBTY_zkp,
      
      o.ready_dateOMS,
      
	  o.items,
	  f.fileNames,
	  f.filePath,
	  f.fileGUIDNames,
	  CTY,
	  Rosreh,
	  ChBTY,
	  OBTY,
	  VBTY,
	  VBTY_zkp,
	  
	  OMS,
	  
	  o.comments,
	  o.inoe,
	  o.CTY_status,
	  o.Rosreh_status,
	  o.ChBTY_status,
	  o.OBTY_status,
	  o.VBTY_status,
	  o.VBTY_status_zkp,
	  
	  o.OMS_status,
	  
	  o.cad_num,
	  o.text_message,
	  o.sotrudnik_send,
	  cad_number,
	  o.number_ais_gkn,
	  o.send_doc_users,
	  o.name_org_zu,
	  
	  o.date_update,
	  
	  o.items_files,
	  
	  f2.fileNames as fileNames_files,
	  f2.filePath as filePath_files,
	  f2.fileGUIDNames as fileGUIDNames_files
	    

  FROM [OTUTI_journal] o left join 
		Sotrudnik s on o.id_sotrudnik=s.id_sotrudnik left join
		FilesItem fi on o.items=fi.items left join
		Files f on fi.id_files=f.id_files
		
		left join
		
		FilesItem fil on o.items_files=fil.items left join
		Files f2 on fil.id_files=f2.id_files 
 where
		((	
			o.reg_num like '%'+@mask+'%' or 
			o.reg_date like '%'+@mask+'%' or
			o.number_request like '%'+@mask+'%' or
			o.request_date like '%'+@mask+'%' or
			o.category_request like '%'+@mask+'%' or
			o.FIO like '%'+@mask+'%' or
			o.object_type like '%'+@mask+'%' or
			o.address like '%'+@mask+'%' or
			o.number_inv like '%'+@mask+'%' or
			o.litera like '%'+@mask+'%' or
			o.number_if like '%'+@mask+'%' or
			o.name_doc like '%'+@mask+'%' or
			s.last_name like '%'+@mask+'%' or
			o.status_str like '%'+@mask+'%' or
			o.control_date like '%'+@mask+'%' or
			o.number_ais_gkn like '%'+@mask+'%' or
			o.send_doc_users like '%'+@mask+'%' or
			o.name_org_zu like '%'+@mask+'%' or
			o.date_update like '%'+@mask+'%' or
			o.otuty like '%'+@mask +'%'

		) or @mask='-1')

order by id_otuti_journal desc
END
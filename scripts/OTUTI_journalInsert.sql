USE [portalFGU59]
GO

/****** Object:  StoredProcedure [dbo].[OTUTI_journalInsert]    Script Date: 02/11/2016 20:33:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[OTUTI_journalInsert]
(
   @reg_num nvarchar(10),
   @reg_date datetime,
   @number_request nvarchar(50),
   @request_date datetime,
   @category_request nvarchar(50),
   @FIO nvarchar(255),
   @object_type nvarchar(50),
   @address nvarchar(255),
   @number_inv nvarchar(50),
   @litera nvarchar(50),
   @number_if nvarchar(50),
   @name_doc nvarchar(255),
   @id_sotrudnik int,
   @control_date datetime,
   @status_int int,
   @status_str nvarchar(50),
   @otuty nvarchar(255),
   @CTY bit,
   @Rosreh bit,
   @ChBTY bit,
   @OBTY bit,
   @VBTY bit,
   @inoe nvarchar(255),
   @number_ais_gkn nvarchar(100),
   @name_org_zu nvarchar(255)
)
as

INSERT INTO [dbo].[OTUTI_journal]
           ([reg_num]
           ,[reg_date]
           ,[number_request]
           ,[request_date]
           ,[category_request]
           ,[FIO]
           ,[object_type]
           ,[address]
           ,[number_inv]
           ,[litera]
           ,[number_if]
           ,[name_doc]
           ,[id_sotrudnik]
			,control_date
			,status_int
			,status_str
			,otuty
			,CTY
		    ,Rosreh
		    ,ChBTY
		    ,OBTY
			,VBTY
			,inoe
			
			 ,CTY_status
			 ,Rosreh_status
			 ,ChBTY_status
			 ,OBTY_status
			 ,VBTY_status
		     ,VBTY_status_zkp
		     ,OMS_status
		     ,number_ais_gkn
		     
		     ,name_org_zu
		)	
     VALUES
			(
			   @reg_num,
			   @reg_date,
			   @number_request,
			   @request_date,
			   @category_request,
			   @FIO,
			   @object_type,
			   @address,
			   @number_inv,
			   @litera,
			   @number_if,
			   @name_doc,
			   @id_sotrudnik,
				@control_date,
				@status_int,
				@status_str,
				@otuty,
				@CTY,
				@Rosreh,
				@ChBTY,
				@OBTY,
				@VBTY,
				@inoe,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				@number_ais_gkn,
				@name_org_zu
			)
UPDATE
	[dbo].[OTUTI_journal]
SET
	reg_num = 'O-' + CONVERT(NVARCHAR, id_otuti_journal)
WHERE 
	id_otuti_journal = @@IDENTITY
GO



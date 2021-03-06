USE [portalFGU59]
GO
/****** Object:  StoredProcedure [dbo].[OTUTI_journalUpdate]    Script Date: 02/11/2016 21:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[OTUTI_journalUpdate]
(

   @id_otuti_journal int,
   --@reg_num nvarchar(10),
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
   --@id_sotrudnik int,
	--@control_date datetime,
   @status_int int,
   @status_str nvarchar(50),
   @otuty nvarchar(255),
   @ready_dateCTY datetime,
	@ready_dateRosreh datetime,
	@ready_dateChBTY datetime,
	@ready_dateOBTY datetime,
	
@ready_dateVBTY datetime,
@ready_dateVBTY_zkp datetime,
@ready_dateOMS datetime,

   @items nvarchar(50),
	 @CTY bit,
   @Rosreh bit,
   @ChBTY bit,
   @OBTY bit,
   @VBTY bit,
   @VBTY_zkp bit,
   
   @OMS bit,
   
	@comments nvarchar (255),
	@inoe nvarchar (255),

    @CTY_status int,
   @Rosreh_status int,
   @ChBTY_status int,
   @OBTY_status int,
   @VBTY_status int,
   @VBTY_status_zkp int,
   
   @OMS_status int,
   
   @cad_num nvarchar(50),
   @text_message nvarchar(500),
   @sotrudnik_send nvarchar(150),

   @cad_number nvarchar(50),
   @number_ais_gkn nvarchar(100),
   @send_doc_users nvarchar(50),
   @name_org_zu nvarchar(255),
   @date_update datetime,
   
   @items_files nvarchar(50)

	
)
as

UPDATE [portalfgu59].[dbo].[OTUTI_journal]
   SET 
		   --reg_num=@reg_num,
		   reg_date=@reg_date,
		   number_request=@number_request,
		   request_date=@request_date,
		   category_request=@category_request,
		   FIO=@FIO,
		   object_type=@object_type,
		   address=@address,
		   number_inv=@number_inv,
		   litera=@litera,
		   number_if=@number_if,
		   name_doc=@name_doc,
		   --id_sotrudnik=@id_sotrudnik,
			--control_date=@control_date,
			status_int=@status_int,
			status_str=@status_str,
			otuty=@otuty,

			ready_dateCTY=@ready_dateCTY,
			ready_dateRosreh=@ready_dateRosreh,
			ready_dateChBTY=@ready_dateChBTY,
			ready_dateOBTY=@ready_dateOBTY,
			ready_dateVBTY=@ready_dateVBTY,
			ready_dateVBTY_zkp=@ready_dateVBTY_zkp,
			ready_dateOMS=@ready_dateOMS,

			items=@items,
			 CTY=@CTY,
		   Rosreh=@Rosreh,
		   ChBTY=@ChBTY,
		   OBTY=@OBTY,
           VBTY=@VBTY,
           VBTY_zkp=@VBTY_zkp,
           
           OMS=@OMS,
                      
           OMS_status=@OMS_status,
           
			comments=@comments ,
			inoe=@inoe,

            CTY_status=@CTY_status,
			 Rosreh_status=@Rosreh_status,
			 ChBTY_status=@ChBTY_status,
			 OBTY_status=@OBTY_status,
			 VBTY_status=@VBTY_status,
			 VBTY_status_zkp=@VBTY_status_zkp,
		     cad_num=@cad_num,
		     text_message=@text_message,
		     sotrudnik_send=@text_message,
			 cad_number=@cad_number,
			 number_ais_gkn=@number_ais_gkn,
			 send_doc_users=@send_doc_users,
			 name_org_zu=@name_org_zu,
			 
			 date_update=@date_update,
			 
			 items_files=@items_files

 WHERE id_otuti_journal=@id_otuti_journal














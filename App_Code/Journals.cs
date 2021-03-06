using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Journals
/// </summary>
public class Journals
{
	public Journals()
	{
		//
		// TODO: Add constructor logic here
		//

    }
        public void InsertJournal_VPN
        (
           
           
	       String name_filial,
	       String ip_address_vpn,
           String date_test,
           String time_test,
	       bool status_vpn,
	       int time_send_packets,
           String date_correct_vpn,
           String time_correct_vpn,
	       bool status_ftp,
           String date_correct_ftp,
           String time_correct_ftp,
	       String comments_vpn,
	       String user_test

                    
          
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_VPNInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;
   
        SqlParameter parametername_filial = new SqlParameter("@name_filial", SqlDbType.NVarChar,255);
        parametername_filial.Value = name_filial;
        myCommand.Parameters.Add(parametername_filial);

        SqlParameter parameterip_address_vpn = new SqlParameter("@ip_address_vpn", SqlDbType.NVarChar, 50);
        parameterip_address_vpn.Value = ip_address_vpn;
        myCommand.Parameters.Add(parameterip_address_vpn);

        SqlParameter parameterdate_test = new SqlParameter("@date_test", SqlDbType.NVarChar, 15);
        parameterdate_test.Value = date_test;
        myCommand.Parameters.Add(parameterdate_test);

        SqlParameter parametertime_test = new SqlParameter("@time_test", SqlDbType.NVarChar, 15);
        parametertime_test.Value = time_test;
        myCommand.Parameters.Add(parametertime_test);

        SqlParameter parameterstatus_vpn = new SqlParameter("@status_vpn", SqlDbType.Bit);
        parameterstatus_vpn.Value = status_vpn;
        myCommand.Parameters.Add(parameterstatus_vpn);

        SqlParameter parametertime_send_packets = new SqlParameter("@time_send_packets", SqlDbType.Int);
        parametertime_send_packets.Value = time_send_packets;
        myCommand.Parameters.Add(parametertime_send_packets);

        SqlParameter parameterdate_correct_vpn = new SqlParameter("@date_correct_vpn", SqlDbType.NVarChar, 15);
        parameterdate_correct_vpn.Value = date_correct_vpn;
        myCommand.Parameters.Add(parameterdate_correct_vpn);

        SqlParameter parametertime_correct_vpn = new SqlParameter("@time_correct_vpn", SqlDbType.NVarChar, 15);
        parametertime_correct_vpn.Value = time_correct_vpn;
        myCommand.Parameters.Add(parametertime_correct_vpn);

        SqlParameter parameterstatus_ftp = new SqlParameter("@status_ftp", SqlDbType.Bit);
        parameterstatus_ftp.Value = status_ftp;
        myCommand.Parameters.Add(parameterstatus_ftp);

        SqlParameter parameterdate_correct_ftp = new SqlParameter("@date_correct_ftp", SqlDbType.NVarChar, 15);
        parameterdate_correct_ftp.Value = date_correct_ftp;
        myCommand.Parameters.Add(parameterdate_correct_ftp);

        SqlParameter parametertime_correct_ftp = new SqlParameter("@time_correct_ftp", SqlDbType.NVarChar, 15);
        parametertime_correct_ftp.Value = time_correct_ftp;
        myCommand.Parameters.Add(parametertime_correct_ftp);

        SqlParameter parametercomments_vpn = new SqlParameter("@comments_vpn", SqlDbType.Text);
        parametercomments_vpn.Value = comments_vpn;
        myCommand.Parameters.Add(parametercomments_vpn);

        SqlParameter parameteruser_test = new SqlParameter("@user_test", SqlDbType.NVarChar,200);
        parameteruser_test.Value = user_test;
        myCommand.Parameters.Add(parameteruser_test);
    

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
	
    //------- ?????? ???????? ?????????

    public void InsertJournal_phone
        (


           String name_filial,
           String number_phone,
           String date_test,
           String time_test,
           bool status_phone,
           String comments_phone,
           String user_test



        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_phoneInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametername_filial = new SqlParameter("@name_filial", SqlDbType.NVarChar, 255);
        parametername_filial.Value = name_filial;
        myCommand.Parameters.Add(parametername_filial);

        SqlParameter parameternumber_phone = new SqlParameter("@number_phone", SqlDbType.NVarChar, 20);
        parameternumber_phone.Value = number_phone;
        myCommand.Parameters.Add(parameternumber_phone);

        SqlParameter parameterdate_test = new SqlParameter("@date_test", SqlDbType.NVarChar, 15);
        parameterdate_test.Value = date_test;
        myCommand.Parameters.Add(parameterdate_test);

        SqlParameter parametertime_test = new SqlParameter("@time_test", SqlDbType.NVarChar, 15);
        parametertime_test.Value = time_test;
        myCommand.Parameters.Add(parametertime_test);

        SqlParameter parameterstatus_phone = new SqlParameter("@status_phone", SqlDbType.Bit);
        parameterstatus_phone.Value = status_phone;
        myCommand.Parameters.Add(parameterstatus_phone);

        SqlParameter parametercomments_phone = new SqlParameter("@comments_phone", SqlDbType.Text);
        parametercomments_phone.Value = comments_phone;
        myCommand.Parameters.Add(parametercomments_phone);

        SqlParameter parameteruser_test = new SqlParameter("@user_test", SqlDbType.NVarChar, 200);
        parameteruser_test.Value = user_test;
        myCommand.Parameters.Add(parameteruser_test);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    //------- ?????? ???????? email

    public void InsertJournal_email
        (


           String name_filial,
           String email,
           String date_test,
           String time_test,
           bool status_email,
           String comments_email,
           String user_test

        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_emailInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametername_filial = new SqlParameter("@name_filial", SqlDbType.NVarChar, 255);
        parametername_filial.Value = name_filial;
        myCommand.Parameters.Add(parametername_filial);

        SqlParameter parameteremail = new SqlParameter("@email", SqlDbType.NVarChar, 255);
        parameteremail.Value = email;
        myCommand.Parameters.Add(parameteremail);

        SqlParameter parameterdate_test = new SqlParameter("@date_test", SqlDbType.NVarChar, 15);
        parameterdate_test.Value = date_test;
        myCommand.Parameters.Add(parameterdate_test);

        SqlParameter parametertime_test = new SqlParameter("@time_test", SqlDbType.NVarChar, 15);
        parametertime_test.Value = time_test;
        myCommand.Parameters.Add(parametertime_test);

        SqlParameter parameterstatus_email = new SqlParameter("@status_email", SqlDbType.Bit);
        parameterstatus_email.Value = status_email;
        myCommand.Parameters.Add(parameterstatus_email);

        SqlParameter parametercomments_email = new SqlParameter("@comments_email", SqlDbType.Text);
        parametercomments_email.Value = comments_email;
        myCommand.Parameters.Add(parametercomments_email);

        SqlParameter parameteruser_test = new SqlParameter("@user_test", SqlDbType.NVarChar, 200);
        parameteruser_test.Value = user_test;
        myCommand.Parameters.Add(parameteruser_test);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    //------- ?????? ???????? ?????????? ???????????

    public void InsertJournal_backup
    (

            String object_backup,
            String date_test,
            String time_test,
	        String date_begin,
	        String time_begin,
	        String date_end,
	        String time_end,
	        bool status,
	        String comments,
	        String user_test

        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_backupInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterobject_backup = new SqlParameter("@object_backup", SqlDbType.NVarChar, 255);
        parameterobject_backup.Value = object_backup;
        myCommand.Parameters.Add(parameterobject_backup);

        SqlParameter parameterdate_test = new SqlParameter("@date_test", SqlDbType.NVarChar, 15);
        parameterdate_test.Value = date_test;
        myCommand.Parameters.Add(parameterdate_test);

        SqlParameter parametertime_test = new SqlParameter("@time_test", SqlDbType.NVarChar, 15);
        parametertime_test.Value = time_test;
        myCommand.Parameters.Add(parametertime_test);

        SqlParameter parameterdate_begin = new SqlParameter("@date_begin", SqlDbType.NVarChar, 10);
        parameterdate_begin.Value = date_begin;
        myCommand.Parameters.Add(parameterdate_begin);

        SqlParameter parametertime_begin = new SqlParameter("@time_begin", SqlDbType.NVarChar, 10);
        parametertime_begin.Value = time_begin;
        myCommand.Parameters.Add(parametertime_begin);

        SqlParameter parameterdate_end = new SqlParameter("@date_end", SqlDbType.NVarChar, 10);
        parameterdate_end.Value = date_end;
        myCommand.Parameters.Add(parameterdate_end);

        SqlParameter parametertime_end = new SqlParameter("@time_end", SqlDbType.NVarChar, 10);
        parametertime_end.Value = time_end;
        myCommand.Parameters.Add(parametertime_end);

        SqlParameter parameterstatus = new SqlParameter("@status", SqlDbType.Bit);
        parameterstatus.Value = status;
        myCommand.Parameters.Add(parameterstatus);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.Text);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameteruser_test = new SqlParameter("@user_test", SqlDbType.NVarChar, 200);
        parameteruser_test.Value = user_test;
        myCommand.Parameters.Add(parameteruser_test);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }

    public void InsertJournal_serv_teh
      (

        String number_acts,
        String name_filial,
        String control_filial_sotrudnik,
        String user_test,
        String works,
        String comments,
        String date_acts,
        String time_acts

      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_serv_tehInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameternumber_acts = new SqlParameter("@number_acts", SqlDbType.NVarChar, 50);
        parameternumber_acts.Value = number_acts;
        myCommand.Parameters.Add(parameternumber_acts);

        SqlParameter parametername_filial = new SqlParameter("@name_filial", SqlDbType.NVarChar, 255);
        parametername_filial.Value = name_filial;
        myCommand.Parameters.Add(parametername_filial);

        SqlParameter parametercontrol_filial_sotrudnik = new SqlParameter("@control_filial_sotrudnik", SqlDbType.NVarChar, 200);
        parametercontrol_filial_sotrudnik.Value = control_filial_sotrudnik;
        myCommand.Parameters.Add(parametercontrol_filial_sotrudnik);

        SqlParameter parameteruser_test = new SqlParameter("@user_test", SqlDbType.NVarChar, 200);
        parameteruser_test.Value = user_test;
        myCommand.Parameters.Add(parameteruser_test);

        SqlParameter parameterworks = new SqlParameter("@works", SqlDbType.Text);
        parameterworks.Value = works;
        myCommand.Parameters.Add(parameterworks);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar, 1000);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameterdate_acts = new SqlParameter("@date_acts", SqlDbType.NVarChar, 20);
        parameterdate_acts.Value = date_acts;
        myCommand.Parameters.Add(parameterdate_acts);

        SqlParameter parametertime_acts = new SqlParameter("@time_acts", SqlDbType.NVarChar, 20);
        parametertime_acts.Value = time_acts;
        myCommand.Parameters.Add(parametertime_acts);
        

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertJournal_backup_fil
       (

          
           int id_filial,
            bool base_copy,
            bool second_copy,
            String status_energo,
            String comments,
            String user_test,
            String data_log
            

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_backup_filInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_filial = new SqlParameter("@id_filial", SqlDbType.Int);
        parameterid_filial.Value = id_filial;
        myCommand.Parameters.Add(parameterid_filial);

        SqlParameter parameterbase_copy = new SqlParameter("@base_copy", SqlDbType.Bit);
        parameterbase_copy.Value = base_copy;
        myCommand.Parameters.Add(parameterbase_copy);

        SqlParameter parametersecond_copy = new SqlParameter("@second_copy", SqlDbType.Bit);
        parametersecond_copy.Value = second_copy;
        myCommand.Parameters.Add(parametersecond_copy);

        SqlParameter parameterstatus_energo = new SqlParameter("@status_energo", SqlDbType.NVarChar, 20);
        parameterstatus_energo.Value = status_energo;
        myCommand.Parameters.Add(parameterstatus_energo);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar, 1000);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameteruser_test = new SqlParameter("@user_test", SqlDbType.NVarChar, 200);
        parameteruser_test.Value = user_test;
        myCommand.Parameters.Add(parameteruser_test);

        SqlParameter parameterdata_log = new SqlParameter("@data_log", SqlDbType.NVarChar, 20);
        parameterdata_log.Value = data_log;
        myCommand.Parameters.Add(parameterdata_log);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertJournal_portal_rosreestr
        (
            String category,
	        String date_in_portal_rosreestr,
	        String date_in_journal,
	        int period_in_portal_rosreestr,
	        String user_add_doc,
	        String user_control,
	        bool status,
	        String comments
        
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_portal_rosreestrInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametercategory = new SqlParameter("@category", SqlDbType.NVarChar, 1000);
        parametercategory.Value = category;
        myCommand.Parameters.Add(parametercategory);

        SqlParameter parameterdate_in_portal_rosreestr = new SqlParameter("@date_in_portal_rosreestr", SqlDbType.NVarChar, 10);
        parameterdate_in_portal_rosreestr.Value = date_in_portal_rosreestr;
        myCommand.Parameters.Add(parameterdate_in_portal_rosreestr);

        SqlParameter parameterdate_in_journal = new SqlParameter("@date_in_journal", SqlDbType.NVarChar, 10);
        parameterdate_in_journal.Value = date_in_journal;
        myCommand.Parameters.Add(parameterdate_in_journal);

        SqlParameter parameterperiod_in_portal_rosreestr = new SqlParameter("@period_in_portal_rosreestr", SqlDbType.Int);
        parameterperiod_in_portal_rosreestr.Value = period_in_portal_rosreestr;
        myCommand.Parameters.Add(parameterperiod_in_portal_rosreestr);

        SqlParameter parameteruser_add_doc = new SqlParameter("@user_add_doc", SqlDbType.NVarChar,200);
        parameteruser_add_doc.Value = user_add_doc;
        myCommand.Parameters.Add(parameteruser_add_doc);

        SqlParameter parameteruser_control = new SqlParameter("@user_control", SqlDbType.NVarChar, 200);
        parameteruser_control.Value = user_control;
        myCommand.Parameters.Add(parameteruser_control);

        SqlParameter parameterstatus = new SqlParameter("@status", SqlDbType.Bit);
        parameterstatus.Value = status;
        myCommand.Parameters.Add(parameterstatus);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.Text);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertJournal_duty_servers
        (
            String date_duty,
            String time_duty,
	        String user_add_doc,
	        bool work_condishen1,
	        bool work_condishen2,
	        bool error_condishen1,
	        bool error_condishen2,
	        double t_servers_room,
	        double w_servers_room,
            bool work_servers,
            bool montag_in_servers_room,
	        String comments

        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_duty_serversInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterdate_duty = new SqlParameter("@date_duty", SqlDbType.NVarChar, 10);
        parameterdate_duty.Value = date_duty;
        myCommand.Parameters.Add(parameterdate_duty);

        SqlParameter parametertime_duty = new SqlParameter("@time_duty", SqlDbType.NVarChar, 10);
        parametertime_duty.Value = time_duty;
        myCommand.Parameters.Add(parametertime_duty);

        SqlParameter parameteruser_add_doc = new SqlParameter("@user_add_doc", SqlDbType.NVarChar, 200);
        parameteruser_add_doc.Value = user_add_doc;
        myCommand.Parameters.Add(parameteruser_add_doc);

        SqlParameter parameterwork_condishen1 = new SqlParameter("@work_condishen1", SqlDbType.Bit);
        parameterwork_condishen1.Value = work_condishen1;
        myCommand.Parameters.Add(parameterwork_condishen1);

        SqlParameter parameterwork_condishen2 = new SqlParameter("@work_condishen2", SqlDbType.Bit);
        parameterwork_condishen2.Value = work_condishen2;
        myCommand.Parameters.Add(parameterwork_condishen2);

        SqlParameter parametererror_condishen1 = new SqlParameter("@error_condishen1", SqlDbType.Bit);
        parametererror_condishen1.Value = error_condishen1;
        myCommand.Parameters.Add(parametererror_condishen1);

        SqlParameter parametererror_condishen2 = new SqlParameter("@error_condishen2", SqlDbType.Bit);
        parametererror_condishen2.Value = error_condishen2;
        myCommand.Parameters.Add(parametererror_condishen2);

        SqlParameter parametert_servers_room = new SqlParameter("@t_servers_room", SqlDbType.Real);
        parametert_servers_room.Value = t_servers_room;
        myCommand.Parameters.Add(parametert_servers_room);

        SqlParameter parameterw_servers_room= new SqlParameter("@w_servers_room", SqlDbType.Real);
        parameterw_servers_room.Value = w_servers_room;
        myCommand.Parameters.Add(parameterw_servers_room);

        SqlParameter parameterwork_servers = new SqlParameter("@work_servers", SqlDbType.Bit);
        parameterwork_servers.Value = work_servers;
        myCommand.Parameters.Add(parameterwork_servers);

        SqlParameter parametermontag_in_servers_room = new SqlParameter("@montag_in_servers_room", SqlDbType.Bit);
        parametermontag_in_servers_room.Value = montag_in_servers_room;
        myCommand.Parameters.Add(parametermontag_in_servers_room);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar, 1000);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertJournal_data_base
        (
            int id_filial,
            int id_users,
            String date_in,
            String comments,
            bool copyBD_PVD,
            bool copyTO_ARM,
            String work_server,
            bool workUPS

        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_data_baseInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_filial = new SqlParameter("@id_filial", SqlDbType.Int);
        parameterid_filial.Value = id_filial;
        myCommand.Parameters.Add(parameterid_filial);

        SqlParameter parameterid_users = new SqlParameter("@id_users", SqlDbType.Int);
        parameterid_users.Value = id_users;
        myCommand.Parameters.Add(parameterid_users);


        SqlParameter parameterdate_in = new SqlParameter("@date_in", SqlDbType.NVarChar, 10);
        parameterdate_in.Value = date_in;
        myCommand.Parameters.Add(parameterdate_in);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar, 255);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parametercopyBD_PVD = new SqlParameter("@copyBD_PVD", SqlDbType.Bit);
        parametercopyBD_PVD.Value = copyBD_PVD;
        myCommand.Parameters.Add(parametercopyBD_PVD);

        SqlParameter parametercopyTO_ARM = new SqlParameter("@copyTO_ARM", SqlDbType.Bit);
        parametercopyTO_ARM.Value = copyTO_ARM;
        myCommand.Parameters.Add(parametercopyTO_ARM);

        SqlParameter parameterwork_server = new SqlParameter("@work_server", SqlDbType.NVarChar, 255);
        parameterwork_server.Value = work_server;
        myCommand.Parameters.Add(parameterwork_server);

        SqlParameter parameterworkUPS = new SqlParameter("@workUPS", SqlDbType.Bit);
        parameterworkUPS.Value = workUPS;
        myCommand.Parameters.Add(parameterworkUPS);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertMonitoring_kvartals
      (
            String name_filial,
		    bool border_raion,
		    int ready_kvartal,
		    String date_ready,
		    String number_documents,
		    int kvartalov_SBD,
		    int kvartalov_GBD,
		    String worker_filial,
		    String date_ready_filials,
		    String user_add_doc,
            String date_control,
            String close_border,
            String worker_filial2,
            String date_ready_filials2,
            String date_control2,
            String begin_EGRZ_GKN,
            String ready

          

      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Monitoring_kvartalsInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametername_filial = new SqlParameter("@name_filial", SqlDbType.NVarChar,255);
        parametername_filial.Value = name_filial;
        myCommand.Parameters.Add(parametername_filial);

        SqlParameter parameterborder_raion = new SqlParameter("@border_raion", SqlDbType.Bit);
        parameterborder_raion.Value = border_raion;
        myCommand.Parameters.Add(parameterborder_raion);

        SqlParameter parameterready_kvartal = new SqlParameter("@ready_kvartal", SqlDbType.Int);
        parameterready_kvartal.Value = ready_kvartal;
        myCommand.Parameters.Add(parameterready_kvartal);

        SqlParameter parameterdate_ready = new SqlParameter("@date_ready", SqlDbType.NVarChar,10);
        parameterdate_ready.Value = date_ready;
        myCommand.Parameters.Add(parameterdate_ready);

        SqlParameter parameternumber_documents = new SqlParameter("@number_documents", SqlDbType.NVarChar, 50);
        parameternumber_documents.Value = number_documents;
        myCommand.Parameters.Add(parameternumber_documents);

        SqlParameter parameterkvartalov_SBD = new SqlParameter("@kvartalov_SBD", SqlDbType.Int);
        parameterkvartalov_SBD.Value = kvartalov_SBD;
        myCommand.Parameters.Add(parameterkvartalov_SBD);

        SqlParameter parameterkvartalov_GBD = new SqlParameter("@kvartalov_GBD", SqlDbType.Int);
        parameterkvartalov_GBD.Value = kvartalov_GBD;
        myCommand.Parameters.Add(parameterkvartalov_GBD);

        SqlParameter parameterworker_filial = new SqlParameter("@worker_filial", SqlDbType.NVarChar,255);
        parameterworker_filial.Value = worker_filial;
        myCommand.Parameters.Add(parameterworker_filial);

        SqlParameter parameterdate_ready_filials = new SqlParameter("@date_ready_filials", SqlDbType.NVarChar, 255);
        parameterdate_ready_filials.Value = date_ready_filials;
        myCommand.Parameters.Add(parameterdate_ready_filials);

        SqlParameter parameteruser_add_doc = new SqlParameter("@user_add_doc", SqlDbType.NVarChar, 255);
        parameteruser_add_doc.Value = user_add_doc;
        myCommand.Parameters.Add(parameteruser_add_doc);

        SqlParameter parameterdate_control = new SqlParameter("@date_control", SqlDbType.NVarChar, 10);
        parameterdate_control.Value = date_control;
        myCommand.Parameters.Add(parameterdate_control);

        SqlParameter parameterclose_border = new SqlParameter("@close_border", SqlDbType.NVarChar, 10);
        parameterclose_border.Value = close_border;
        myCommand.Parameters.Add(parameterclose_border);

        SqlParameter parameterworker_filial2 = new SqlParameter("@worker_filial2", SqlDbType.NVarChar, 255);
        parameterworker_filial2.Value = worker_filial2;
        myCommand.Parameters.Add(parameterworker_filial2);

        SqlParameter parameterdate_ready_filials2 = new SqlParameter("@date_ready_filials2", SqlDbType.NVarChar, 10);
        parameterdate_ready_filials2.Value = date_ready_filials2;
        myCommand.Parameters.Add(parameterdate_ready_filials2);

        SqlParameter parameterdate_control2 = new SqlParameter("@date_control2", SqlDbType.NVarChar, 10);
        parameterdate_control2.Value = date_control2;
        myCommand.Parameters.Add(parameterdate_control2);

        SqlParameter parameterbegin_EGRZ_GKN = new SqlParameter("@begin_EGRZ_GKN", SqlDbType.NVarChar, 50);
        parameterbegin_EGRZ_GKN.Value = begin_EGRZ_GKN;
        myCommand.Parameters.Add(parameterbegin_EGRZ_GKN);

        SqlParameter parameterready = new SqlParameter("@ready", SqlDbType.NVarChar, 10);
        parameterready.Value = ready;
        myCommand.Parameters.Add(parameterready);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertJournal_antivir
       (
           
            String name_filial,
            String date_antivir,
            int count_comp,
            int count_comp_lan,
            int count_comp_antivir,
            String source_BD_antivir,
            String alert_filial,
            String date_actial,
            String user_add_doc,
            String name_object,
            String type_antivir

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_antivirInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametername_filial = new SqlParameter("@name_filial", SqlDbType.NVarChar,255);
        parametername_filial.Value = name_filial;
        myCommand.Parameters.Add(parametername_filial);

        SqlParameter parameterdate_antivir = new SqlParameter("@date_antivir", SqlDbType.NVarChar, 10);
        parameterdate_antivir.Value = date_antivir;
        myCommand.Parameters.Add(parameterdate_antivir);

        SqlParameter parametercount_comp = new SqlParameter("@count_comp", SqlDbType.Int);
        parametercount_comp.Value = count_comp;
        myCommand.Parameters.Add(parametercount_comp);

        SqlParameter parametercount_comp_lan = new SqlParameter("@count_comp_lan", SqlDbType.Int);
        parametercount_comp_lan.Value = count_comp_lan;
        myCommand.Parameters.Add(parametercount_comp_lan);

        SqlParameter parametercount_comp_antivir = new SqlParameter("@count_comp_antivir", SqlDbType.Int);
        parametercount_comp_antivir.Value = count_comp_antivir;
        myCommand.Parameters.Add(parametercount_comp_antivir);

        SqlParameter parametersource_BD_antivir = new SqlParameter("@source_BD_antivir", SqlDbType.NVarChar ,50);
        parametersource_BD_antivir.Value = source_BD_antivir;
        myCommand.Parameters.Add(parametersource_BD_antivir);

        SqlParameter parameteralert_filial = new SqlParameter("@alert_filial", SqlDbType.NVarChar, 255);
        parameteralert_filial.Value = alert_filial;
        myCommand.Parameters.Add(parameteralert_filial);

        SqlParameter parameterdate_actial = new SqlParameter("@date_actial", SqlDbType.NVarChar, 10);
        parameterdate_actial.Value = date_actial;
        myCommand.Parameters.Add(parameterdate_actial);

        SqlParameter parameteruser_add_doc = new SqlParameter("@user_add_doc", SqlDbType.NVarChar, 255);
        parameteruser_add_doc.Value = user_add_doc;
        myCommand.Parameters.Add(parameteruser_add_doc);

        SqlParameter parametername_object = new SqlParameter("@name_object", SqlDbType.NVarChar, 50);
        parametername_object.Value = name_object;
        myCommand.Parameters.Add(parametername_object);

        SqlParameter parametertype_antivir = new SqlParameter("@type_antivir", SqlDbType.NVarChar, 50);
        parametertype_antivir.Value = type_antivir;
        myCommand.Parameters.Add(parametertype_antivir);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void DeleteJournal_antivir
       (

            int id_antivir

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_antivirDelete", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_antivir = new SqlParameter("@id_antivir", SqlDbType.Int);
        parameterid_antivir.Value = id_antivir;
        myCommand.Parameters.Add(parameterid_antivir);

       

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }

    public void UpdateJournal_antivir
       (
            int id_antivir,
            String name_filial,
            String date_antivir,
            int count_comp,
            int count_comp_lan,
            int count_comp_antivir,
            String source_BD_antivir,
            String alert_filial,
            String date_actial,
            String user_add_doc

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_antivirUpdate", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_antivir = new SqlParameter("@id_antivir", SqlDbType.Int);
        parameterid_antivir.Value = id_antivir;
        myCommand.Parameters.Add(parameterid_antivir);

        SqlParameter parametername_filial = new SqlParameter("@name_filial", SqlDbType.NVarChar, 255);
        parametername_filial.Value = name_filial;
        myCommand.Parameters.Add(parametername_filial);

        SqlParameter parameterdate_antivir = new SqlParameter("@date_antivir", SqlDbType.NVarChar, 10);
        parameterdate_antivir.Value = date_antivir;
        myCommand.Parameters.Add(parameterdate_antivir);

        SqlParameter parametercount_comp = new SqlParameter("@count_comp", SqlDbType.Int);
        parametercount_comp.Value = count_comp;
        myCommand.Parameters.Add(parametercount_comp);

        SqlParameter parametercount_comp_lan = new SqlParameter("@count_comp_lan", SqlDbType.Int);
        parametercount_comp_lan.Value = count_comp_lan;
        myCommand.Parameters.Add(parametercount_comp_lan);

        SqlParameter parametercount_comp_antivir = new SqlParameter("@count_comp_antivir", SqlDbType.Int);
        parametercount_comp_antivir.Value = count_comp_antivir;
        myCommand.Parameters.Add(parametercount_comp_antivir);

        SqlParameter parametersource_BD_antivir = new SqlParameter("@source_BD_antivir", SqlDbType.NVarChar, 50);
        parametersource_BD_antivir.Value = source_BD_antivir;
        myCommand.Parameters.Add(parametersource_BD_antivir);

        SqlParameter parameteralert_filial = new SqlParameter("@alert_filial", SqlDbType.NVarChar, 255);
        parameteralert_filial.Value = alert_filial;
        myCommand.Parameters.Add(parameteralert_filial);

        SqlParameter parameterdate_actial = new SqlParameter("@date_actial", SqlDbType.NVarChar, 10);
        parameterdate_actial.Value = date_actial;
        myCommand.Parameters.Add(parameterdate_actial);

        SqlParameter parameteruser_add_doc = new SqlParameter("@user_add_doc", SqlDbType.NVarChar, 255);
        parameteruser_add_doc.Value = user_add_doc;
        myCommand.Parameters.Add(parameteruser_add_doc);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertJournal_db2
      (
        
           String kad_number, 
           String name_filial, 
           DateTime date_create_db2, 
           String name_test, 
           int count_error, 
           int not_correctable,
           int total,
           DateTime date_correct_end,
           String type_db2,
           DateTime date_actual,
           String user_add_doc,
            int number_db

      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_db2Insert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterkad_number = new SqlParameter("@kad_number", SqlDbType.NVarChar,50);
        parameterkad_number.Value = kad_number;
        myCommand.Parameters.Add(parameterkad_number);

        SqlParameter parametername_filial = new SqlParameter("@name_filial", SqlDbType.NVarChar,255);
        parametername_filial.Value = name_filial;
        myCommand.Parameters.Add(parametername_filial);

        SqlParameter parameterdate_create_db2 = new SqlParameter("@date_create_db2", SqlDbType.SmallDateTime);
        parameterdate_create_db2.Value = date_create_db2;
        myCommand.Parameters.Add(parameterdate_create_db2);

        SqlParameter parametername_test = new SqlParameter("@name_test", SqlDbType.NVarChar,50);
        parametername_test.Value = name_test;
        myCommand.Parameters.Add(parametername_test);

        SqlParameter parametercount_error = new SqlParameter("@count_error", SqlDbType.Int);
        parametercount_error.Value = count_error;
        myCommand.Parameters.Add(parametercount_error);

        SqlParameter parameternot_correctable = new SqlParameter("@not_correctable", SqlDbType.Int);
        parameternot_correctable.Value = not_correctable;
        myCommand.Parameters.Add(parameternot_correctable);

        SqlParameter parametertotal = new SqlParameter("@total", SqlDbType.Int);
        parametertotal.Value = total;
        myCommand.Parameters.Add(parametertotal);

        SqlParameter parameterdate_correct_end = new SqlParameter("@date_correct_end", SqlDbType.SmallDateTime);
        parameterdate_correct_end.Value = date_correct_end;
        myCommand.Parameters.Add(parameterdate_correct_end);

        SqlParameter parametertype_db2 = new SqlParameter("@type_db2", SqlDbType.NVarChar,50);
        parametertype_db2.Value = type_db2;
        myCommand.Parameters.Add(parametertype_db2);

        SqlParameter parameterdate_actual = new SqlParameter("@date_actual", SqlDbType.SmallDateTime);
        parameterdate_actual.Value = date_actual;
        myCommand.Parameters.Add(parameterdate_actual);

        SqlParameter parameteruser_add_doc = new SqlParameter("@user_add_doc", SqlDbType.NVarChar,255);
        parameteruser_add_doc.Value = user_add_doc;
        myCommand.Parameters.Add(parameteruser_add_doc);

        SqlParameter parameternumber_db = new SqlParameter("@number_db", SqlDbType.Int);
        parameternumber_db.Value = number_db;
        myCommand.Parameters.Add(parameternumber_db);
       
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertJournal_Error
      (
        DateTime date_sz,
           String number_sz,
           int id_filial,
           String comments,
           DateTime date_in_it,
           DateTime date_correct_error,
        String items,
          bool have_file,
            String user_add_doc

      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Journal_ErrorInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterdate_sz = new SqlParameter("@date_sz", SqlDbType.SmallDateTime);
        parameterdate_sz.Value = date_sz;
        myCommand.Parameters.Add(parameterdate_sz);

        SqlParameter parameternumber_sz = new SqlParameter("@number_sz", SqlDbType.NVarChar, 10);
        parameternumber_sz.Value = number_sz;
        myCommand.Parameters.Add(parameternumber_sz);

        SqlParameter parameterid_filial = new SqlParameter("@id_filial", SqlDbType.Int);
        parameterid_filial.Value = id_filial;
        myCommand.Parameters.Add(parameterid_filial);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar,255);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameterdate_in_it = new SqlParameter("@date_in_it", SqlDbType.SmallDateTime);
        parameterdate_in_it.Value = date_in_it;
        myCommand.Parameters.Add(parameterdate_in_it);

        SqlParameter parameterdate_correct_error = new SqlParameter("@date_correct_error", SqlDbType.SmallDateTime);
        parameterdate_correct_error.Value = date_correct_error;
        myCommand.Parameters.Add(parameterdate_correct_error);

        SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 255);
        parameteritems.Value = items;
        myCommand.Parameters.Add(parameteritems);

        SqlParameter parameterhave_file = new SqlParameter("@have_file", SqlDbType.Bit);
        parameterhave_file.Value = have_file;
        myCommand.Parameters.Add(parameterhave_file);

        SqlParameter parameteruser_add_doc = new SqlParameter("@user_add_doc", SqlDbType.NVarChar,255);
        parameteruser_add_doc.Value = user_add_doc;
        myCommand.Parameters.Add(parameteruser_add_doc); 

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
      public void UpdateCTI_compare
       (
           int id,
           //int id_filial,
          // int id_sotrudnik int,
           int count_all ,
            string step1,
           string step2,
           string step3 //,
           //DateTime date_begin ,
          // DateTime date_end 

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("CTI_compareUpdate", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid = new SqlParameter("@id", SqlDbType.Int);
        parameterid.Value = id;
        myCommand.Parameters.Add(parameterid);

        SqlParameter parameterid_count_all = new SqlParameter("@count_all", SqlDbType.Int);
        parameterid_count_all.Value = count_all;
        myCommand.Parameters.Add(parameterid_count_all);

        SqlParameter parameterstep1 = new SqlParameter("@step1", SqlDbType.NVarChar,10);
        parameterstep1.Value = step1;
        myCommand.Parameters.Add(parameterstep1);

        SqlParameter parameterstep2 = new SqlParameter("@step2", SqlDbType.NVarChar, 10);
        parameterstep2.Value = step2;
        myCommand.Parameters.Add(parameterstep2);

        SqlParameter parameterstep3 = new SqlParameter("@step3", SqlDbType.NVarChar, 10);
        parameterstep3.Value = step3;
        myCommand.Parameters.Add(parameterstep3);

       
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    
}
    public SqlDataReader ActivitiesSelect(string type_stored)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand(type_stored, myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);
    }
    public SqlDataReader ActivitiesSelect(string type_stored, int id_otdel)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand(type_stored, myConnection);

        SqlParameter parameterid_otdel = new SqlParameter("@id_otdel", SqlDbType.Int);
        parameterid_otdel.Value = id_otdel;
        myCommand.Parameters.Add(parameterid_otdel);

        myCommand.CommandType = CommandType.StoredProcedure;

        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);
    }

    public SqlDataReader JornalItemsSelect(string type_items)
      {
          ConnectionStringSettings settings;
          settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

          string str = @"
                            SELECT 
	                            id,
	                            type_items,
	                            param0_str50,
	                            param1_str255,
	                            param2_str255,
	                            param4_str1000,
	                            param1_date,
	                            param1_int,
	                            param2_int
      
                            FROM [dbo].[JornalItems] ji
  
                            where [type_items]=

                     " + type_items;

          SqlConnection myConnection = new SqlConnection(settings.ToString());
          SqlCommand myCommand = new SqlCommand(str, myConnection);

          myCommand.CommandType = CommandType.Text;

          myConnection.Open();

          return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

      }
}


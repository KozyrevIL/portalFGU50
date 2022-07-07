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
/// Summary description for Computer
/// </summary>
public class Computer
{
	public Computer()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void InsertBox
       (
       
        String name_box,
        int power_box,
        String type_box,
        String comments_box
       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("BoxInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametername_box = new SqlParameter("@name_box", SqlDbType.NVarChar, 255);
        parametername_box.Value = name_box;
        myCommand.Parameters.Add(parametername_box);

        SqlParameter parameterpower_box = new SqlParameter("@power_box", SqlDbType.Int);
        parameterpower_box.Value = power_box;
        myCommand.Parameters.Add(parameterpower_box);

        SqlParameter parametertype_box = new SqlParameter("@type_box", SqlDbType.NVarChar, 20);
        parametertype_box.Value = type_box;
        myCommand.Parameters.Add(parametertype_box);

        SqlParameter parametercomments_box = new SqlParameter("@comments_box", SqlDbType.NVarChar, 255);
        parametercomments_box.Value = comments_box;
        myCommand.Parameters.Add(parametercomments_box);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertComputer
       (
        int id_processor,
        String cooler,
        int id_motherboard,
        int id_video,
        int id_osu,
        int id_hdd,
        String DVD,
        int id_box,
        String keyboard,
        String mouse,
        String other_device,
        String comments_computer 
        
       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("ComputerInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_processor = new SqlParameter("@id_processor", SqlDbType.Int);
        parameterid_processor.Value = id_processor;
        myCommand.Parameters.Add(parameterid_processor);

        SqlParameter parametercooler = new SqlParameter("@cooler", SqlDbType.NVarChar, 255);
        parametercooler.Value = cooler;
        myCommand.Parameters.Add(parametercooler);

        SqlParameter parameterid_motherboard = new SqlParameter("@id_motherboard", SqlDbType.Int);
        parameterid_motherboard.Value = id_motherboard;
        myCommand.Parameters.Add(parameterid_motherboard);

        SqlParameter parameterid_video = new SqlParameter("@id_video", SqlDbType.Int);
        parameterid_video.Value = id_video;
        myCommand.Parameters.Add(parameterid_video);

        SqlParameter parameterid_osu = new SqlParameter("@id_osu", SqlDbType.Int);
        parameterid_osu.Value = id_osu;
        myCommand.Parameters.Add(parameterid_osu);

        SqlParameter parameterid_hdd = new SqlParameter("@id_hdd", SqlDbType.Int);
        parameterid_hdd.Value = id_hdd;
        myCommand.Parameters.Add(parameterid_hdd);

        SqlParameter parameterDVD = new SqlParameter("@DVD", SqlDbType.NVarChar, 255);
        parameterDVD.Value = DVD;
        myCommand.Parameters.Add(parameterDVD);

        SqlParameter parameterid_box = new SqlParameter("@id_box", SqlDbType.Int);
        parameterid_box.Value = id_box;
        myCommand.Parameters.Add(parameterid_box);

        SqlParameter parameterkeyboard = new SqlParameter("@keyboard", SqlDbType.NVarChar, 255);
        parameterkeyboard.Value = keyboard;
        myCommand.Parameters.Add(parameterkeyboard);

        SqlParameter parametermouse = new SqlParameter("@mouse", SqlDbType.NVarChar, 255);
        parametermouse.Value = mouse;
        myCommand.Parameters.Add(parametermouse);

        SqlParameter parameterother_device = new SqlParameter("@other_device", SqlDbType.NVarChar, 255);
        parameterother_device.Value = other_device;
        myCommand.Parameters.Add(parameterother_device);

        SqlParameter parametercomments_computer = new SqlParameter("@comments_computer", SqlDbType.NVarChar, 255);
        parametercomments_computer.Value = comments_computer;
        myCommand.Parameters.Add(parametercomments_computer);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertHdd
    (
       
        int v_hdd,
        String name_hdd,
        int cache_hdd,
        String tyre_hdd,
        String brand_hdd,
        String comments_hdd 
       
    )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("HddInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterv_hdd = new SqlParameter("@v_hdd", SqlDbType.Int);
        parameterv_hdd.Value = v_hdd;
        myCommand.Parameters.Add(parameterv_hdd);

        SqlParameter parametername_hdd = new SqlParameter("@name_hdd", SqlDbType.NVarChar,255);
        parametername_hdd.Value = name_hdd;
        myCommand.Parameters.Add(parametername_hdd);

        SqlParameter parametercache_hdd = new SqlParameter("@cache_hdd", SqlDbType.Int);
        parametercache_hdd.Value = cache_hdd;
        myCommand.Parameters.Add(parametercache_hdd);

        SqlParameter parametertyre_hdd = new SqlParameter("@tyre_hdd", SqlDbType.NVarChar, 20);
        parametertyre_hdd.Value = tyre_hdd;
        myCommand.Parameters.Add(parametertyre_hdd);

        SqlParameter parameterbrand_hdd = new SqlParameter("@brand_hdd", SqlDbType.NVarChar,20);
        parameterbrand_hdd.Value = brand_hdd;
        myCommand.Parameters.Add(parameterbrand_hdd);

        SqlParameter parametercomments_hdd = new SqlParameter("@comments_hdd", SqlDbType.NVarChar, 20);
        parametercomments_hdd.Value = comments_hdd;
        myCommand.Parameters.Add(parametercomments_hdd);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertMotherboard
    (
        String name_motherboard,
        String brand_motherboard,
        String chipset,
        String coket,
        String comments_motherboard
        
    )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("MotherboardInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametername_motherboard = new SqlParameter("@name_motherboard", SqlDbType.NVarChar,255);
        parametername_motherboard.Value = name_motherboard;
        myCommand.Parameters.Add(parametername_motherboard);

        SqlParameter parameterbrand_motherboard = new SqlParameter("@brand_motherboard", SqlDbType.NVarChar, 20);
        parameterbrand_motherboard.Value = brand_motherboard;
        myCommand.Parameters.Add(parameterbrand_motherboard);

        SqlParameter parameterchipset = new SqlParameter("@chipset", SqlDbType.NVarChar, 20);
        parameterchipset.Value = chipset;
        myCommand.Parameters.Add(parameterchipset);

        SqlParameter parametercoket = new SqlParameter("@coket", SqlDbType.NVarChar, 10);
        parametercoket.Value = coket;
        myCommand.Parameters.Add(parametercoket);

        SqlParameter parametercomments_motherboard = new SqlParameter("@comments_motherboard", SqlDbType.NVarChar, 255);
        parametercomments_motherboard.Value = comments_motherboard;
        myCommand.Parameters.Add(parametercomments_motherboard);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    
    public void InsertNetwork
    (
        String name_network,
        String brand_network,
        int speed_network,
        String comments_network
        
    )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("NetworkInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametername_network = new SqlParameter("@name_network", SqlDbType.NVarChar, 255);
        parametername_network.Value = name_network;
        myCommand.Parameters.Add(parametername_network);

        SqlParameter parameterbrand_network = new SqlParameter("@brand_network", SqlDbType.NVarChar, 20);
        parameterbrand_network.Value = brand_network;
        myCommand.Parameters.Add(parameterbrand_network);

        SqlParameter parameterspeed_network = new SqlParameter("@speed_network", SqlDbType.NVarChar, 10);
        parameterspeed_network.Value = speed_network;
        myCommand.Parameters.Add(parameterspeed_network);

        SqlParameter parametercomments_network = new SqlParameter("@comments_network", SqlDbType.NVarChar, 255);
        parametercomments_network.Value = comments_network;
        myCommand.Parameters.Add(parametercomments_network);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertOsu
    (
        int v_osu,
        String technology_osu,
        int frequency_osu,
        String name_osu,
        String brand_osu,
        String comments_osu
        

    )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("OsuInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterv_osu = new SqlParameter("@v_osu", SqlDbType.Int);
        parameterv_osu.Value = v_osu;
        myCommand.Parameters.Add(parameterv_osu);

        SqlParameter parametertechnology_osu = new SqlParameter("@technology_osu", SqlDbType.NVarChar, 255);
        parametertechnology_osu.Value = technology_osu;
        myCommand.Parameters.Add(parametertechnology_osu);

        SqlParameter parameterfrequency_osu = new SqlParameter("@frequency_osu", SqlDbType.Int);
        parameterfrequency_osu.Value = frequency_osu;
        myCommand.Parameters.Add(parameterfrequency_osu);

        SqlParameter parametername_osu = new SqlParameter("@name_osu", SqlDbType.NVarChar, 255);
        parametername_osu.Value = name_osu;
        myCommand.Parameters.Add(parametername_osu);

        SqlParameter parameterbrand_osu = new SqlParameter("@brand_osu", SqlDbType.NVarChar, 20);
        parameterbrand_osu.Value = brand_osu;
        myCommand.Parameters.Add(parameterbrand_osu);

        SqlParameter parametercomments_osu = new SqlParameter("@comments_osu", SqlDbType.NVarChar, 255);
        parametercomments_osu.Value = comments_osu;
        myCommand.Parameters.Add(parametercomments_osu);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertProcessor
    (
       String brand_processor,
       String name_core,
        double technology,
        double frequency_core,
        int count_core,
        int cache_L1,
        int cache_L2,
        int frequency_tyre,
        String socket,
        String comments_processor

    )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("ProcessorInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterbrand_processor = new SqlParameter("@brand_processor", SqlDbType.NVarChar, 20);
        parameterbrand_processor.Value = brand_processor;
        myCommand.Parameters.Add(parameterbrand_processor);

        SqlParameter parametername_core = new SqlParameter("@name_core", SqlDbType.NVarChar, 50);
        parametername_core.Value = name_core;
        myCommand.Parameters.Add(parametername_core);

        SqlParameter parametertechnology = new SqlParameter("@technology", SqlDbType.Real);
        parametertechnology.Value = technology;
        myCommand.Parameters.Add(parametertechnology);

        SqlParameter parameterfrequency_core = new SqlParameter("@frequency_core", SqlDbType.Real);
        parameterfrequency_core.Value = frequency_core;
        myCommand.Parameters.Add(parameterfrequency_core);

        SqlParameter parametercount_core = new SqlParameter("@count_core", SqlDbType.Int);
        parametercount_core.Value = count_core;
        myCommand.Parameters.Add(parametercount_core);

        SqlParameter parametercache_L1 = new SqlParameter("@cache_L1", SqlDbType.Int);
        parametercache_L1.Value = cache_L1;
        myCommand.Parameters.Add(parametercache_L1);

        SqlParameter parametercache_L2 = new SqlParameter("@cache_L2", SqlDbType.Int);
        parametercache_L2.Value = cache_L2;
        myCommand.Parameters.Add(parametercache_L2);

        SqlParameter parameterfrequency_tyre = new SqlParameter("@frequency_tyre", SqlDbType.Int);
        parameterfrequency_tyre.Value = frequency_tyre;
        myCommand.Parameters.Add(parameterfrequency_tyre);

        SqlParameter parametersocket = new SqlParameter("@socket", SqlDbType.NVarChar, 20);
        parametersocket.Value = socket;
        myCommand.Parameters.Add(parametersocket);

        SqlParameter parametercomments_processor = new SqlParameter("@comments_processor", SqlDbType.NVarChar, 255);
        parametercomments_processor.Value = comments_processor;
        myCommand.Parameters.Add(parametercomments_processor);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertVideo
    (
        String slot,
        String name_video,
        String brand_video,
        String comments_video
       
    )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("VideoInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterslot = new SqlParameter("@slot", SqlDbType.NVarChar, 50);
        parameterslot.Value = slot;
        myCommand.Parameters.Add(parameterslot);

        SqlParameter parametername_video = new SqlParameter("@name_video", SqlDbType.NVarChar, 255);
        parametername_video.Value = name_video;
        myCommand.Parameters.Add(parametername_video);

        SqlParameter parameterbrand_video = new SqlParameter("@brand_video", SqlDbType.NVarChar, 20);
        parameterbrand_video.Value = brand_video;
        myCommand.Parameters.Add(parameterbrand_video);

        SqlParameter parametercomments_video = new SqlParameter("@comments_video", SqlDbType.NVarChar, 255);
        parametercomments_video.Value = comments_video;
        myCommand.Parameters.Add(parametercomments_video);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
    }
     public void InsertComp_BD
    (
      
	    int id_filial,
	    int id_computer,
	    int id_sotrudnik,
	    String date_in_work,
	    String join_comp,
	    String inv_number,
	    String serial_number,
	    String status_comp,
	    String uses_comp,
        String date_actual,
         String room
       
    )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Comp_BDInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_filial = new SqlParameter("@id_filial", SqlDbType.Int);
        parameterid_filial.Value = id_filial;
        myCommand.Parameters.Add(parameterid_filial);

        SqlParameter parameterid_computer = new SqlParameter("@id_computer", SqlDbType.Int);
        parameterid_computer.Value = id_computer;
        myCommand.Parameters.Add(parameterid_computer);

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);
         
        SqlParameter parameterdate_in_work = new SqlParameter("@date_in_work", SqlDbType.NVarChar, 20);
        parameterdate_in_work.Value = date_in_work;
        myCommand.Parameters.Add(parameterdate_in_work);

        SqlParameter parameterjoin_comp = new SqlParameter("@join_comp", SqlDbType.NVarChar,50);
        parameterjoin_comp.Value = join_comp;
        myCommand.Parameters.Add(parameterjoin_comp);

        SqlParameter parameterinv_number = new SqlParameter("@inv_number", SqlDbType.NVarChar, 50);
        parameterinv_number.Value = inv_number;
        myCommand.Parameters.Add(parameterinv_number);

        SqlParameter parameterserial_number = new SqlParameter("@serial_number", SqlDbType.NVarChar, 50);
        parameterserial_number.Value = serial_number;
        myCommand.Parameters.Add(parameterserial_number);

        SqlParameter parameterstatus_comp = new SqlParameter("@status_comp", SqlDbType.NVarChar, 50);
        parameterstatus_comp.Value = status_comp;
        myCommand.Parameters.Add(parameterstatus_comp);

        SqlParameter parameteruses_comp = new SqlParameter("@uses_comp", SqlDbType.NVarChar, 50);
        parameteruses_comp.Value = uses_comp;
        myCommand.Parameters.Add(parameteruses_comp);

        SqlParameter parameterdate_actual = new SqlParameter("@date_actual", SqlDbType.NVarChar, 20);
        parameterdate_actual.Value = date_actual;
        myCommand.Parameters.Add(parameterdate_actual);

        SqlParameter parameterroom = new SqlParameter("@room", SqlDbType.NVarChar, 255);
        parameterroom.Value = room;
        myCommand.Parameters.Add(parameterroom);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
    }
     public void UpdateComp_BD
    (
        int id_comp_bd,
        int id_filial,
        int id_computer,
        int id_sotrudnik,
        String date_in_work,
        String join_comp,
        String inv_number,
        String serial_number,
        String status_comp,
        String uses_comp,
        String date_actual,
        String room

    )
     {
         ConnectionStringSettings settings;
         settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

         SqlConnection myConnection = new SqlConnection(settings.ToString());
         SqlCommand myCommand = new SqlCommand("Comp_BDUpdate", myConnection);

         myCommand.CommandType = CommandType.StoredProcedure;

         SqlParameter parameterid_comp_bd = new SqlParameter("@id_comp_bd", SqlDbType.Int);
         parameterid_comp_bd.Value = id_comp_bd;
         myCommand.Parameters.Add(parameterid_comp_bd);

         SqlParameter parameterid_filial = new SqlParameter("@id_filial", SqlDbType.Int);
         parameterid_filial.Value = id_filial;
         myCommand.Parameters.Add(parameterid_filial);

         SqlParameter parameterid_computer = new SqlParameter("@id_computer", SqlDbType.Int);
         parameterid_computer.Value = id_computer;
         myCommand.Parameters.Add(parameterid_computer);

         SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
         parameterid_sotrudnik.Value = id_sotrudnik;
         myCommand.Parameters.Add(parameterid_sotrudnik);

         SqlParameter parameterdate_in_work = new SqlParameter("@date_in_work", SqlDbType.NVarChar, 20);
         parameterdate_in_work.Value = date_in_work;
         myCommand.Parameters.Add(parameterdate_in_work);

         SqlParameter parameterjoin_comp = new SqlParameter("@join_comp", SqlDbType.NVarChar, 50);
         parameterjoin_comp.Value = join_comp;
         myCommand.Parameters.Add(parameterjoin_comp);

         SqlParameter parameterinv_number = new SqlParameter("@inv_number", SqlDbType.NVarChar, 50);
         parameterinv_number.Value = inv_number;
         myCommand.Parameters.Add(parameterinv_number);

         SqlParameter parameterserial_number = new SqlParameter("@serial_number", SqlDbType.NVarChar, 50);
         parameterserial_number.Value = serial_number;
         myCommand.Parameters.Add(parameterserial_number);

         SqlParameter parameterstatus_comp = new SqlParameter("@status_comp", SqlDbType.NVarChar, 50);
         parameterstatus_comp.Value = status_comp;
         myCommand.Parameters.Add(parameterstatus_comp);

         SqlParameter parameteruses_comp = new SqlParameter("@uses_comp", SqlDbType.NVarChar, 50);
         parameteruses_comp.Value = uses_comp;
         myCommand.Parameters.Add(parameteruses_comp);

         SqlParameter parameterdate_actual = new SqlParameter("@date_actual", SqlDbType.NVarChar, 20);
         parameterdate_actual.Value = date_actual;
         myCommand.Parameters.Add(parameterdate_actual);

         SqlParameter parameterroom = new SqlParameter("@room", SqlDbType.NVarChar, 255);
         parameterroom.Value = room;
         myCommand.Parameters.Add(parameterroom);

         myConnection.Open();
         myCommand.ExecuteNonQuery();
         myConnection.Close();
     }
}

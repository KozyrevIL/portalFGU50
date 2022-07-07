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
public class Printers
{
	public Printers()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void InsertPrinters
       ( 
            String type_org,
            String name_printers,
            bool color,
            int speed_print,
            int max_page_month,
            int power_printers,
            bool duplex,
            String interface_printers,
            String format,
            String kachestvo_print,
            bool network_printers,
            String comments,
            int id_cartridg,
            bool use_reports,
	        int prioritet_reports

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("PrintersInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametertype_org = new SqlParameter("@type_org", SqlDbType.NVarChar, 50);
        parametertype_org.Value = type_org;
        myCommand.Parameters.Add(parametertype_org);

        SqlParameter parametername_printers = new SqlParameter("@name_printers", SqlDbType.NVarChar, 50);
        parametername_printers.Value = name_printers;
        myCommand.Parameters.Add(parametername_printers);

        SqlParameter parametercolor = new SqlParameter("@color", SqlDbType.Bit);
        parametercolor.Value = color;
        myCommand.Parameters.Add(parametercolor);

        SqlParameter parameterspeed_print = new SqlParameter("@speed_print", SqlDbType.Int);
        parameterspeed_print.Value = speed_print;
        myCommand.Parameters.Add(parameterspeed_print);

        SqlParameter parametermax_page_month = new SqlParameter("@max_page_month", SqlDbType.Int);
        parametermax_page_month.Value = max_page_month;
        myCommand.Parameters.Add(parametermax_page_month);

        SqlParameter parameterpower_printers = new SqlParameter("@power_printers", SqlDbType.Int);
        parameterpower_printers.Value = power_printers;
        myCommand.Parameters.Add(parameterpower_printers);

        SqlParameter parameterduplex = new SqlParameter("@duplex", SqlDbType.Bit);
        parameterduplex.Value = duplex;
        myCommand.Parameters.Add(parameterduplex);

        SqlParameter parameterinterface_printers = new SqlParameter("@interface_printers", SqlDbType.NVarChar, 50);
        parameterinterface_printers.Value = interface_printers;
        myCommand.Parameters.Add(parameterinterface_printers);

        SqlParameter parameterformat = new SqlParameter("@format", SqlDbType.NVarChar, 10);
        parameterformat.Value = format;
        myCommand.Parameters.Add(parameterformat);

        SqlParameter parameterkachestvo_print = new SqlParameter("@kachestvo_print", SqlDbType.NVarChar, 20);
        parameterkachestvo_print.Value = kachestvo_print;
        myCommand.Parameters.Add(parameterkachestvo_print);

        SqlParameter parameternetwork_printers = new SqlParameter("@network_printers", SqlDbType.Bit);
        parameternetwork_printers.Value = network_printers;
        myCommand.Parameters.Add(parameternetwork_printers);

        SqlParameter parameterid_cartridg = new SqlParameter("@id_cartridg", SqlDbType.Int);
        parameterid_cartridg.Value = id_cartridg;
        myCommand.Parameters.Add(parameterid_cartridg);

        SqlParameter parameteruse_reports = new SqlParameter("@use_reports", SqlDbType.Bit);
        parameteruse_reports.Value = use_reports;
        myCommand.Parameters.Add(parameteruse_reports);

        SqlParameter parameterprioritet_reports = new SqlParameter("@prioritet_reports", SqlDbType.Int);
        parameterprioritet_reports.Value = prioritet_reports;
        myCommand.Parameters.Add(parameterprioritet_reports);

        /*SqlParameter parameterinventar_number = new SqlParameter("@inventar_number", SqlDbType.NVarChar, 50);
        parameterinventar_number.Value = inventar_number;
        myCommand.Parameters.Add(parameterinventar_number);

        SqlParameter parameteryear_printers = new SqlParameter("@year_printers", SqlDbType.Int);
        parameteryear_printers.Value = year_printers;
        myCommand.Parameters.Add(parameteryear_printers);

        SqlParameter parameterstatus = new SqlParameter("@status", SqlDbType.NVarChar, 20);
        parameterstatus.Value = status;
        myCommand.Parameters.Add(parameterstatus);

        SqlParameter parameterowner = new SqlParameter("@owner", SqlDbType.NVarChar, 20);
        parameterowner.Value = owner;
        myCommand.Parameters.Add(parameterowner);*/

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar, 255);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);
       


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertPrinters_BD
       (
            
        int id_printers,
	    int id_filial,
	    String inventar_number,
	    String serial_number,
	    int year_printers,
	    String status,
	    String owner,
	    String date_actual,
        String user_actual,
	    String comments,
        String place_tech,
        String name_PTK

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Printers_BDInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_printers = new SqlParameter("@id_printers", SqlDbType.Int);
        parameterid_printers.Value = id_printers;
        myCommand.Parameters.Add(parameterid_printers);

        SqlParameter parameterid_filial = new SqlParameter("@id_filial", SqlDbType.Int);
        parameterid_filial.Value = id_filial;
        myCommand.Parameters.Add(parameterid_filial);

        
        SqlParameter parameterinventar_number = new SqlParameter("@inventar_number", SqlDbType.NVarChar, 50);
        parameterinventar_number.Value = inventar_number;
        myCommand.Parameters.Add(parameterinventar_number);

        SqlParameter parameterserial_number = new SqlParameter("@serial_number", SqlDbType.NVarChar, 50);
        parameterserial_number.Value = serial_number;
        myCommand.Parameters.Add(parameterserial_number);

        SqlParameter parameteryear_printers = new SqlParameter("@year_printers", SqlDbType.Int);
        parameteryear_printers.Value = year_printers;
        myCommand.Parameters.Add(parameteryear_printers);

        SqlParameter parameterstatus = new SqlParameter("@status", SqlDbType.NVarChar, 20);
        parameterstatus.Value = status;
        myCommand.Parameters.Add(parameterstatus);

        SqlParameter parameterowner = new SqlParameter("@owner", SqlDbType.NVarChar, 20);
        parameterowner.Value = owner;
        myCommand.Parameters.Add(parameterowner);

        SqlParameter parameterdate_actual = new SqlParameter("@date_actual", SqlDbType.NVarChar, 10);
        parameterdate_actual.Value = date_actual;
        myCommand.Parameters.Add(parameterdate_actual);

        SqlParameter parameteruser_actual = new SqlParameter("@user_actual", SqlDbType.NVarChar, 50);
        parameteruser_actual.Value = user_actual;
        myCommand.Parameters.Add(parameteruser_actual);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar, 255);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameterplace_tech = new SqlParameter("@place_tech", SqlDbType.NVarChar, 50);
        parameterplace_tech.Value = place_tech;
        myCommand.Parameters.Add(parameterplace_tech);

        SqlParameter parameterName_PTK = new SqlParameter("@name_PTK", SqlDbType.NVarChar, 50);
        parameterName_PTK.Value = name_PTK;
        myCommand.Parameters.Add(parameterName_PTK);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void UpdatePrinters_BD
       (
        
        int id_printers_BD,
        int id_printers,
        int id_filial,
        String inventar_number,
        String serial_number,
        int year_printers,
        String status,
        String owner,
        String date_actual,
        String user_actual,
        String comments,
        String place_tech,
        String name_PTK

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Printers_BDUpdate", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        

        SqlParameter parameterid_printers_BD = new SqlParameter("@id_printers_BD", SqlDbType.Int);
        parameterid_printers_BD.Value = id_printers_BD;
        myCommand.Parameters.Add(parameterid_printers_BD);

        SqlParameter parameterid_printers = new SqlParameter("@id_printers", SqlDbType.Int);
        parameterid_printers.Value = id_printers;
        myCommand.Parameters.Add(parameterid_printers);

        SqlParameter parameterid_filial = new SqlParameter("@id_filial", SqlDbType.Int);
        parameterid_filial.Value = id_filial;
        myCommand.Parameters.Add(parameterid_filial);


        SqlParameter parameterinventar_number = new SqlParameter("@inventar_number", SqlDbType.NVarChar, 50);
        parameterinventar_number.Value = inventar_number;
        myCommand.Parameters.Add(parameterinventar_number);

        SqlParameter parameterserial_number = new SqlParameter("@serial_number", SqlDbType.NVarChar, 50);
        parameterserial_number.Value = serial_number;
        myCommand.Parameters.Add(parameterserial_number);

        SqlParameter parameteryear_printers = new SqlParameter("@year_printers", SqlDbType.Int);
        parameteryear_printers.Value = year_printers;
        myCommand.Parameters.Add(parameteryear_printers);

        SqlParameter parameterstatus = new SqlParameter("@status", SqlDbType.NVarChar, 20);
        parameterstatus.Value = status;
        myCommand.Parameters.Add(parameterstatus);

        SqlParameter parameterowner = new SqlParameter("@owner", SqlDbType.NVarChar, 20);
        parameterowner.Value = owner;
        myCommand.Parameters.Add(parameterowner);

        SqlParameter parameterdate_actual = new SqlParameter("@date_actual", SqlDbType.NVarChar, 10);
        parameterdate_actual.Value = date_actual;
        myCommand.Parameters.Add(parameterdate_actual);

        SqlParameter parameteruser_actual = new SqlParameter("@user_actual", SqlDbType.NVarChar, 50);
        parameteruser_actual.Value = user_actual;
        myCommand.Parameters.Add(parameteruser_actual);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar, 255);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameterplace_tech = new SqlParameter("@place_tech", SqlDbType.NVarChar, 50);
        parameterplace_tech.Value = place_tech;
        myCommand.Parameters.Add(parameterplace_tech);

        SqlParameter parameterName_PTK = new SqlParameter("@name_PTK", SqlDbType.NVarChar, 50);
        parameterName_PTK.Value = name_PTK;
        myCommand.Parameters.Add(parameterName_PTK);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void DeletePrinters
       (

        int id_printers
        

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("PrintersDelete", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_printers = new SqlParameter("@id_printers", SqlDbType.Int);
        parameterid_printers.Value = id_printers;
        myCommand.Parameters.Add(parameterid_printers);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertCartridg
      (
            int id_baraban,
            String model_cartridg,
            String manufacturer_cartridg,
            String kod_manufacturer,
            int resurces_5_A4,
            int count_load


      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("CartridgInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_baraban = new SqlParameter("@id_baraban", SqlDbType.Int);
        parameterid_baraban.Value = id_baraban;
        myCommand.Parameters.Add(parameterid_baraban);

        SqlParameter parametermodel_cartridg = new SqlParameter("@model_cartridg", SqlDbType.NVarChar, 50);
        parametermodel_cartridg.Value = model_cartridg;
        myCommand.Parameters.Add(parametermodel_cartridg);

        SqlParameter parametermanufacturer_cartridg = new SqlParameter("@manufacturer_cartridg", SqlDbType.NVarChar, 20);
        parametermanufacturer_cartridg.Value = manufacturer_cartridg;
        myCommand.Parameters.Add(parametermanufacturer_cartridg);

        SqlParameter parameterkod_manufacturer = new SqlParameter("@kod_manufacturer", SqlDbType.NVarChar, 20);
        parameterkod_manufacturer.Value = kod_manufacturer;
        myCommand.Parameters.Add(parameterkod_manufacturer);

        SqlParameter parameterresurces_5_A4 = new SqlParameter("@resurces_5_A4", SqlDbType.Int);
        parameterresurces_5_A4.Value = resurces_5_A4;
        myCommand.Parameters.Add(parameterresurces_5_A4);

        SqlParameter parametercount_load = new SqlParameter("@count_load", SqlDbType.Int);
        parametercount_load.Value = count_load;
        myCommand.Parameters.Add(parametercount_load);
        

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertBaraban
      (
            String model_baraban,
            String manufacturer_baraban,
            String kod_manufacturer_baraban,
            int resurces_baraban
            /*@model_baraban nvarchar (50),
	        @manufacturer_baraban nvarchar (20),
	        @kod_manufacturer_baraban nvarchar (20),
	        @resurces_baraban int*/
      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("BarabanInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametermodel_baraban = new SqlParameter("@model_baraban", SqlDbType.NVarChar, 50);
        parametermodel_baraban.Value = model_baraban;
        myCommand.Parameters.Add(parametermodel_baraban);

        SqlParameter parametermanufacturer_baraban = new SqlParameter("@manufacturer_baraban", SqlDbType.NVarChar, 20);
        parametermanufacturer_baraban.Value = manufacturer_baraban;
        myCommand.Parameters.Add(parametermanufacturer_baraban);

        SqlParameter parameterkod_manufacturer_baraban = new SqlParameter("@kod_manufacturer_baraban", SqlDbType.NVarChar, 20);
        parameterkod_manufacturer_baraban.Value = kod_manufacturer_baraban;
        myCommand.Parameters.Add(parameterkod_manufacturer_baraban);

        SqlParameter parameterresurces_baraban = new SqlParameter("@resurces_baraban", SqlDbType.Int);
        parameterresurces_baraban.Value = resurces_baraban;
        myCommand.Parameters.Add(parameterresurces_baraban);

        

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void UpdateBaraban
      (
            int id_baraban,
            String model_baraban,
            String manufacturer_baraban,
            String kod_manufacturer_baraban,
            int resurces_baraban
        /*@model_baraban nvarchar (50),
        @manufacturer_baraban nvarchar (20),
        @kod_manufacturer_baraban nvarchar (20),
        @resurces_baraban int*/
      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("BarabanUpdate", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_baraban = new SqlParameter("@id_baraban", SqlDbType.Int);
        parameterid_baraban.Value = id_baraban;
        myCommand.Parameters.Add(parameterid_baraban);

        SqlParameter parametermodel_baraban = new SqlParameter("@model_baraban", SqlDbType.NVarChar, 50);
        parametermodel_baraban.Value = model_baraban;
        myCommand.Parameters.Add(parametermodel_baraban);

        SqlParameter parametermanufacturer_baraban = new SqlParameter("@manufacturer_baraban", SqlDbType.NVarChar, 20);
        parametermanufacturer_baraban.Value = manufacturer_baraban;
        myCommand.Parameters.Add(parametermanufacturer_baraban);

        SqlParameter parameterkod_manufacturer_baraban = new SqlParameter("@kod_manufacturer_baraban", SqlDbType.NVarChar, 20);
        parameterkod_manufacturer_baraban.Value = kod_manufacturer_baraban;
        myCommand.Parameters.Add(parameterkod_manufacturer_baraban);

        SqlParameter parameterresurces_baraban = new SqlParameter("@resurces_baraban", SqlDbType.Int);
        parameterresurces_baraban.Value = resurces_baraban;
        myCommand.Parameters.Add(parameterresurces_baraban);



        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void DeleteBaraban
      (
            int id_baraban
           
      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("BarabanDelete", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_baraban = new SqlParameter("@id_baraban", SqlDbType.Int);
        parameterid_baraban.Value = id_baraban;
        myCommand.Parameters.Add(parameterid_baraban);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
}

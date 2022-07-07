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
/// Summary description for Doc
/// </summary>
public class Doc
{
	public Doc()
	{
		//
		// TODO: Add constructor logic here
		//

    }
   /* public DataView GetActs(int beginMonth, int endMonth, String sortfield)
    {
        SqlConnection myConnection = new SqlConnection("User ID=ASPDOTNET; data source=FS1-ITCPERM;; Password=000000;  database=" + System.Web.HttpContext.Current.Request.Cookies["ITC_Acts"]["CurrentNameBase"]);
        SqlDataAdapter myCommand = new SqlDataAdapter("GetActs", myConnection);
        //String ss=System.Web.HttpContext.Current.Session["NameBD"].ToString();
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterbeginMonth = new SqlParameter("@beginMonth", SqlDbType.Int);
        parameterbeginMonth.Value = beginMonth;
        myCommand.SelectCommand.Parameters.Add(parameterbeginMonth);

        SqlParameter parameterendMonth = new SqlParameter("@endMonth", SqlDbType.Int);
        parameterendMonth.Value = endMonth;
        myCommand.SelectCommand.Parameters.Add(parameterendMonth);

        DataSet ds = new DataSet();
        //Заливка данных в DataSet
        myCommand.Fill(ds);
        myConnection.Close();
        DataView dv = new DataView(ds.Tables[0]);
        dv.Sort = sortfield;
        return dv;

    }*/
    public DataView GetDocs(int id_sotrudnik, String sortfield)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlDataAdapter myCommand = new SqlDataAdapter("DocSelectNew1", myConnection);

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.SelectCommand.Parameters.Add(parameterid_sotrudnik);

      

        DataSet ds = new DataSet();
        //Заливка данных в DataSet
        myCommand.Fill(ds);
        myConnection.Close();
        DataView dv = new DataView(ds.Tables[0]);
        dv.Sort = sortfield;
        return dv;

    }
    public DataView DocSelectObj(String begin_date, String end_date, int top, int id_sotrudnik, int id_sotrudnik_control)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlDataAdapter myCommand = new SqlDataAdapter("DocSelectObj", myConnection);

        SqlParameter parameterbegin_date = new SqlParameter("@begin_date", SqlDbType.NVarChar, 20);
        parameterbegin_date.Value = begin_date;
        myCommand.SelectCommand.Parameters.Add(parameterbegin_date);

        SqlParameter parameterend_date = new SqlParameter("@end_date", SqlDbType.NVarChar, 20);
        parameterend_date.Value = end_date;
        myCommand.SelectCommand.Parameters.Add(parameterend_date);

        SqlParameter parametertop = new SqlParameter("@top", SqlDbType.Int);
        parametertop.Value = top;
        myCommand.SelectCommand.Parameters.Add(parametertop);

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.SelectCommand.Parameters.Add(parameterid_sotrudnik);

        SqlParameter parameterid_sotrudnik_control = new SqlParameter("@id_sotrudnik_control", SqlDbType.Int);
        parameterid_sotrudnik_control.Value = id_sotrudnik_control;
        myCommand.SelectCommand.Parameters.Add(parameterid_sotrudnik_control);

        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

        myConnection.Open();
       
        DataSet ds = new DataSet();
        //Заливка данных в DataSet
        myCommand.Fill(ds);
        myConnection.Close();
        DataView dv = new DataView(ds.Tables[0]);
       // dv.Sort = sortfield;
        return dv;

    }
    public DataView DocSelectObjFiltr(int id_sotrudnik)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlDataAdapter myCommand = new SqlDataAdapter("DocSelectNoReady", myConnection);

       

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.SelectCommand.Parameters.Add(parameterid_sotrudnik);

        

        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

        myConnection.Open();

        DataSet ds = new DataSet();
        //Заливка данных в DataSet
        myCommand.Fill(ds);
        myConnection.Close();
        DataView dv = new DataView(ds.Tables[0]);
        // dv.Sort = sortfield;
        return dv;

    }
  /*  public DataView DocSelectForDate(String date_begin, String date_end)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlDataAdapter myCommand = new SqlDataAdapter("DocSelectForDate", myConnection);

        SqlParameter parameterdate_begin = new SqlParameter("@date_begin", SqlDbType.NVarChar, 20);
        parameterdate_begin.Value = date_begin;
        myCommand.SelectCommand.Parameters.Add(parameterdate_begin);

        SqlParameter parameterdate_end = new SqlParameter("@date_end", SqlDbType.NVarChar, 20);
        parameterdate_end.Value = date_end;
        myCommand.SelectCommand.Parameters.Add(parameterdate_end);

        myCommand.SelectCommand.CommandType= CommandType.StoredProcedure;

        myConnection.Open();

        DataSet ds = new DataSet();
        //Заливка данных в DataSet
        myCommand.Fill(ds);
        myConnection.Close();
        DataView dv = new DataView(ds.Tables[0]);
        
        return dv;
    }*/
        public void InsertDoc
        (
           
           
	        String number_in_doc,
	        String number_out_doc,
	        String avtor_send_doc,
            String tema,
	        String delo,
	        String vid_doc,
	        String date_reg,
	        String time_reg,
	        String date_control,
	        String time_control,
	        String date_ready,
	        String time_ready,
            String date_in,
            String date_out,
	        String user_add_doc,
	        String user_work,
	        String user_control,
	        String status_doc,
	        String comments,
            String items, 
            int prioritet,
            String prioritet_str,
            int id_sotrudnik_work,
            int id_sotrudnik_control,
            int id_groupQuery,
            int id_sotrudnik_executive,
            String docs_links
	       
          
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("DocInsertNewObj", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameternumber_in_doc = new SqlParameter("@number_in_doc", SqlDbType.NVarChar,10);
        parameternumber_in_doc.Value = number_in_doc;
        myCommand.Parameters.Add(parameternumber_in_doc);

        SqlParameter parameternumber_out_doc = new SqlParameter("@number_out_doc", SqlDbType.NVarChar, 10);
        parameternumber_out_doc.Value = number_out_doc;
        myCommand.Parameters.Add(parameternumber_out_doc);

        SqlParameter parameteravtor_send_doc = new SqlParameter("@avtor_send_doc", SqlDbType.NVarChar, 255);
        parameteravtor_send_doc.Value = avtor_send_doc;
        myCommand.Parameters.Add(parameteravtor_send_doc);

        SqlParameter parametertema = new SqlParameter("@tema", SqlDbType.Text);
        parametertema.Value = tema;
        myCommand.Parameters.Add(parametertema);

        SqlParameter parameterdelo = new SqlParameter("@delo", SqlDbType.NVarChar, 10);
        parameterdelo.Value = delo;
        myCommand.Parameters.Add(parameterdelo);

        SqlParameter parametervid_doc = new SqlParameter("@vid_doc", SqlDbType.NVarChar, 50);
        parametervid_doc.Value = vid_doc;
        myCommand.Parameters.Add(parametervid_doc);

        SqlParameter parameterdate_reg = new SqlParameter("@date_reg", SqlDbType.NVarChar, 10);
        parameterdate_reg.Value = date_reg;
        myCommand.Parameters.Add(parameterdate_reg);

        SqlParameter parametertime_reg = new SqlParameter("@time_reg", SqlDbType.NVarChar, 10);
        parametertime_reg.Value = time_reg;
        myCommand.Parameters.Add(parametertime_reg);

        SqlParameter parameterdate_control = new SqlParameter("@date_control", SqlDbType.NVarChar, 10);
        parameterdate_control.Value = date_control;
        myCommand.Parameters.Add(parameterdate_control);

        SqlParameter parametertime_control = new SqlParameter("@time_control", SqlDbType.NVarChar, 10);
        parametertime_control.Value = time_control;
        myCommand.Parameters.Add(parametertime_control);

        SqlParameter parameterdate_ready = new SqlParameter("@date_ready", SqlDbType.NVarChar, 10);
        parameterdate_ready.Value = date_ready;
        myCommand.Parameters.Add(parameterdate_ready);

        SqlParameter parametertime_ready = new SqlParameter("@time_ready", SqlDbType.NVarChar, 10);
        parametertime_ready.Value = time_ready;
        myCommand.Parameters.Add(parametertime_ready);

        SqlParameter parameterdate_in = new SqlParameter("@date_in", SqlDbType.NVarChar, 10);
        parameterdate_in.Value = date_in;
        myCommand.Parameters.Add(parameterdate_in);

        SqlParameter parameterdate_out = new SqlParameter("@date_out", SqlDbType.NVarChar, 10);
        parameterdate_out.Value = date_out;
        myCommand.Parameters.Add(parameterdate_out);

        SqlParameter parameteruser_add_doc = new SqlParameter("@user_add_doc", SqlDbType.NVarChar, 200);
        parameteruser_add_doc.Value = user_add_doc;
        myCommand.Parameters.Add(parameteruser_add_doc);

        SqlParameter parameteruser_work = new SqlParameter("@user_work", SqlDbType.NVarChar, 200);
        parameteruser_work.Value = user_work;
        myCommand.Parameters.Add(parameteruser_work);

        SqlParameter parameteruser_control = new SqlParameter("@user_control", SqlDbType.NVarChar, 200);
        parameteruser_control.Value = user_control;
        myCommand.Parameters.Add(parameteruser_control);

        SqlParameter parameterstatus_doc = new SqlParameter("@status_doc", SqlDbType.NVarChar, 20);
        parameterstatus_doc.Value = status_doc;
        myCommand.Parameters.Add(parameterstatus_doc);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.Text);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 100);
        parameteritems.Value = items;
        myCommand.Parameters.Add(parameteritems);

        SqlParameter parameterprioritet = new SqlParameter("@prioritet", SqlDbType.Int);
        parameterprioritet.Value = prioritet;
        myCommand.Parameters.Add(parameterprioritet);

        SqlParameter parameterprioritet_str = new SqlParameter("@prioritet_str", SqlDbType.NVarChar, 50);
        parameterprioritet_str.Value = prioritet_str;
        myCommand.Parameters.Add(parameterprioritet_str);

        SqlParameter parameterid_sotrudnik_work = new SqlParameter("@id_sotrudnik_work", SqlDbType.Int);
        parameterid_sotrudnik_work.Value = id_sotrudnik_work;
        myCommand.Parameters.Add(parameterid_sotrudnik_work);

        SqlParameter parameterid_sotrudnik_control = new SqlParameter("@id_sotrudnik_control", SqlDbType.Int);
        parameterid_sotrudnik_control.Value = id_sotrudnik_control;
        myCommand.Parameters.Add(parameterid_sotrudnik_control);

        SqlParameter parameterid_groupQuery = new SqlParameter("@id_groupQuery", SqlDbType.Int);
        parameterid_groupQuery.Value = id_groupQuery;
        myCommand.Parameters.Add(parameterid_groupQuery);

        SqlParameter parameterid_sotrudnik_executive = new SqlParameter("@id_sotrudnik_executive", SqlDbType.Int);
        parameterid_sotrudnik_executive.Value = id_sotrudnik_executive;
        myCommand.Parameters.Add(parameterid_sotrudnik_executive);

        SqlParameter parameterdocs_links = new SqlParameter("@docs_links", SqlDbType.NVarChar, 300);
        parameterdocs_links.Value = docs_links;
        myCommand.Parameters.Add(parameterdocs_links);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertDocPlusImg
       (


           String number_in_doc,
           String number_out_doc,
           String avtor_send_doc,
           String tema,
           String delo,
           String vid_doc,
           String date_reg,
           String time_reg,
           String date_control,
           String time_control,
           String date_ready,
           String time_ready,
           String date_in,
           String date_out,
           String user_add_doc,
           String user_work,
           String user_control,
           String status_doc,
           String comments,
           int number_poruchenie,
           int prioritet,
           String prioritet_str,
             
            String item,
            byte[] images,
            String name_images,
            String type_images,
            int size_images,
            String alt_images


       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("DocInsertPlusImg", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameternumber_in_doc = new SqlParameter("@number_in_doc", SqlDbType.NVarChar, 10);
        parameternumber_in_doc.Value = number_in_doc;
        myCommand.Parameters.Add(parameternumber_in_doc);

        SqlParameter parameternumber_out_doc = new SqlParameter("@number_out_doc", SqlDbType.NVarChar, 10);
        parameternumber_out_doc.Value = number_out_doc;
        myCommand.Parameters.Add(parameternumber_out_doc);

        SqlParameter parameteravtor_send_doc = new SqlParameter("@avtor_send_doc", SqlDbType.NVarChar, 255);
        parameteravtor_send_doc.Value = avtor_send_doc;
        myCommand.Parameters.Add(parameteravtor_send_doc);

        SqlParameter parametertema = new SqlParameter("@tema", SqlDbType.Text);
        parametertema.Value = tema;
        myCommand.Parameters.Add(parametertema);

        SqlParameter parameterdelo = new SqlParameter("@delo", SqlDbType.NVarChar, 10);
        parameterdelo.Value = delo;
        myCommand.Parameters.Add(parameterdelo);

        SqlParameter parametervid_doc = new SqlParameter("@vid_doc", SqlDbType.NVarChar, 50);
        parametervid_doc.Value = vid_doc;
        myCommand.Parameters.Add(parametervid_doc);

        SqlParameter parameterdate_reg = new SqlParameter("@date_reg", SqlDbType.NVarChar, 10);
        parameterdate_reg.Value = date_reg;
        myCommand.Parameters.Add(parameterdate_reg);

        SqlParameter parametertime_reg = new SqlParameter("@time_reg", SqlDbType.NVarChar, 10);
        parametertime_reg.Value = time_reg;
        myCommand.Parameters.Add(parametertime_reg);

        SqlParameter parameterdate_control = new SqlParameter("@date_control", SqlDbType.NVarChar, 10);
        parameterdate_control.Value = date_control;
        myCommand.Parameters.Add(parameterdate_control);

        SqlParameter parametertime_control = new SqlParameter("@time_control", SqlDbType.NVarChar, 10);
        parametertime_control.Value = time_control;
        myCommand.Parameters.Add(parametertime_control);

        SqlParameter parameterdate_ready = new SqlParameter("@date_ready", SqlDbType.NVarChar, 10);
        parameterdate_ready.Value = date_ready;
        myCommand.Parameters.Add(parameterdate_ready);

        SqlParameter parametertime_ready = new SqlParameter("@time_ready", SqlDbType.NVarChar, 10);
        parametertime_ready.Value = time_ready;
        myCommand.Parameters.Add(parametertime_ready);

        SqlParameter parameterdate_in = new SqlParameter("@date_in", SqlDbType.NVarChar, 10);
        parameterdate_in.Value = date_in;
        myCommand.Parameters.Add(parameterdate_in);

        SqlParameter parameterdate_out = new SqlParameter("@date_out", SqlDbType.NVarChar, 10);
        parameterdate_out.Value = date_out;
        myCommand.Parameters.Add(parameterdate_out);

        SqlParameter parameteruser_add_doc = new SqlParameter("@user_add_doc", SqlDbType.NVarChar, 200);
        parameteruser_add_doc.Value = user_add_doc;
        myCommand.Parameters.Add(parameteruser_add_doc);

        SqlParameter parameteruser_work = new SqlParameter("@user_work", SqlDbType.NVarChar, 200);
        parameteruser_work.Value = user_work;
        myCommand.Parameters.Add(parameteruser_work);

        SqlParameter parameteruser_control = new SqlParameter("@user_control", SqlDbType.NVarChar, 200);
        parameteruser_control.Value = user_control;
        myCommand.Parameters.Add(parameteruser_control);

        SqlParameter parameterstatus_doc = new SqlParameter("@status_doc", SqlDbType.NVarChar, 20);
        parameterstatus_doc.Value = status_doc;
        myCommand.Parameters.Add(parameterstatus_doc);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.Text);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameternumber_poruchenie = new SqlParameter("@number_poruchenie", SqlDbType.Int);
        parameternumber_poruchenie.Value = number_poruchenie;
        myCommand.Parameters.Add(parameternumber_poruchenie);

        SqlParameter parameterprioritet = new SqlParameter("@prioritet", SqlDbType.Int);
        parameterprioritet.Value = prioritet;
        myCommand.Parameters.Add(parameterprioritet);

        SqlParameter parameterprioritet_str = new SqlParameter("@prioritet_str", SqlDbType.NVarChar, 50);
        parameterprioritet_str.Value = prioritet_str;
        myCommand.Parameters.Add(parameterprioritet_str);


        SqlParameter parameteritem = new SqlParameter("@item", SqlDbType.NVarChar, 50);
        parameteritem.Value = item;
        myCommand.Parameters.Add(parameteritem);

        SqlParameter parameterimages = new SqlParameter("@images", SqlDbType.Image);
        parameterimages.Value = images;
        myCommand.Parameters.Add(parameterimages);

        SqlParameter parametername_images = new SqlParameter("@name_images", SqlDbType.NVarChar, 50);
        parametername_images.Value = name_images;
        myCommand.Parameters.Add(parametername_images);

        SqlParameter parametertype_images = new SqlParameter("@type_images", SqlDbType.NVarChar, 30);
        parametertype_images.Value = type_images;
        myCommand.Parameters.Add(parametertype_images);

        SqlParameter parametersize_images = new SqlParameter("@size_images", SqlDbType.Int);
        parametersize_images.Value = size_images;
        myCommand.Parameters.Add(parametersize_images);

        SqlParameter parameteralt_images = new SqlParameter("@alt_images", SqlDbType.NVarChar, 50);
        parameteralt_images.Value = alt_images;
        myCommand.Parameters.Add(parameteralt_images);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void UpdateDoc
        (
            
            int id_doc,
	        String number_in_doc,
	        String tema,
	        String date_reg,
	        String date_control,
	        String date_ready,
	        String time_ready,
	        String user_add_doc,
	        String status_doc,
	        String comments,
	        int id_sotrudnik_control,
	        int id_docs_sotrudnik,
	        int status_under_type,
	        String items_under_type,
	        int id_sotrudnik,
	        String comments_under_type,
	        int id_sotrudnik_executive,
	        String docs_links
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("DocUpdateNewObj", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_doc = new SqlParameter("@id_doc", SqlDbType.Int);
        parameterid_doc.Value = id_doc;
        myCommand.Parameters.Add(parameterid_doc);

        SqlParameter parameternumber_in_doc = new SqlParameter("@number_in_doc", SqlDbType.NVarChar, 10);
        parameternumber_in_doc.Value = number_in_doc;
        myCommand.Parameters.Add(parameternumber_in_doc);

        SqlParameter parametertema = new SqlParameter("@tema", SqlDbType.Text);
        parametertema.Value = tema;
        myCommand.Parameters.Add(parametertema);

        SqlParameter parameterdate_reg = new SqlParameter("@date_reg", SqlDbType.NVarChar, 10);
        parameterdate_reg.Value = date_reg;
        myCommand.Parameters.Add(parameterdate_reg);

        SqlParameter parameterdate_control = new SqlParameter("@date_control", SqlDbType.NVarChar, 10);
        parameterdate_control.Value = date_control;
        myCommand.Parameters.Add(parameterdate_control);

        SqlParameter parameterdate_ready = new SqlParameter("@date_ready", SqlDbType.NVarChar, 10);
        parameterdate_ready.Value = date_ready;
        myCommand.Parameters.Add(parameterdate_ready);

        SqlParameter parametertime_ready = new SqlParameter("@time_ready", SqlDbType.NVarChar, 10);
        parametertime_ready.Value = time_ready;
        myCommand.Parameters.Add(parametertime_ready);

        SqlParameter parameteruser_add_doc = new SqlParameter("@user_add_doc", SqlDbType.NVarChar, 200);
        parameteruser_add_doc.Value = user_add_doc;
        myCommand.Parameters.Add(parameteruser_add_doc);

        SqlParameter parameterstatus_doc = new SqlParameter("@status_doc", SqlDbType.NVarChar, 20);
        parameterstatus_doc.Value = status_doc;
        myCommand.Parameters.Add(parameterstatus_doc);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.Text);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameterid_sotrudnik_control = new SqlParameter("@id_sotrudnik_control", SqlDbType.Int);
        parameterid_sotrudnik_control.Value = id_sotrudnik_control;
        myCommand.Parameters.Add(parameterid_sotrudnik_control);

        SqlParameter parameterid_docs_sotrudnik = new SqlParameter("@id_docs_sotrudnik", SqlDbType.Int);
        parameterid_docs_sotrudnik.Value = id_docs_sotrudnik;
        myCommand.Parameters.Add(parameterid_docs_sotrudnik);

        SqlParameter parameterstatus_under_type = new SqlParameter("@status_under_type", SqlDbType.Int);
        parameterstatus_under_type.Value = status_under_type;
        myCommand.Parameters.Add(parameterstatus_under_type);

        SqlParameter parameteritems_under_type = new SqlParameter("@items_under_type", SqlDbType.NVarChar, 255);
        parameteritems_under_type.Value = items_under_type;
        myCommand.Parameters.Add(parameteritems_under_type);

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);

        

        SqlParameter parametercomments_under_type = new SqlParameter("@comments_under_type", SqlDbType.NVarChar, 255);
        parametercomments_under_type.Value = comments_under_type;
        myCommand.Parameters.Add(parametercomments_under_type);

        SqlParameter parameterid_sotrudnik_executive = new SqlParameter("@id_sotrudnik_executive", SqlDbType.Int);
        parameterid_sotrudnik_executive.Value = id_sotrudnik_executive;
        myCommand.Parameters.Add(parameterid_sotrudnik_executive);

        SqlParameter parameterdocs_links = new SqlParameter("@docs_links", SqlDbType.NVarChar, 300);
        parameterdocs_links.Value = docs_links;
        myCommand.Parameters.Add(parameterdocs_links);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public SqlDataReader DocReportCountNoReadyForOtdel
      (
          string begin_date,
            string end_date
      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("DocReportCountNoReadyForOtdel", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterbegin_date = new SqlParameter("@begin_date", SqlDbType.NVarChar,20);
        parameterbegin_date.Value = begin_date;
        myCommand.Parameters.Add(parameterbegin_date);

        SqlParameter parameterend_date = new SqlParameter("@end_date", SqlDbType.NVarChar, 20);
        parameterend_date.Value = end_date;
        myCommand.Parameters.Add(parameterend_date);

        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

    }
    public SqlDataReader DocReportCountIn
     (
         string begin_date,
         string end_date

          
     )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("DocReportCountIn", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterbegin_date = new SqlParameter("@begin_date", SqlDbType.NVarChar, 20);
        parameterbegin_date.Value = begin_date;
        myCommand.Parameters.Add(parameterbegin_date);


        SqlParameter parameterend_date = new SqlParameter("@end_date", SqlDbType.NVarChar, 20);
        parameterend_date.Value = end_date;
        myCommand.Parameters.Add(parameterend_date);
       

        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

    }
    public SqlDataReader DocReportCountInForOtdel
     (
         string begin_date,
         string end_date
     )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("DocReportCountInForOtdel", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterbegin_date = new SqlParameter("@begin_date", SqlDbType.NVarChar, 20);
        parameterbegin_date.Value = begin_date;
        myCommand.Parameters.Add(parameterbegin_date);


        SqlParameter parameterend_date = new SqlParameter("@end_date", SqlDbType.NVarChar, 20);
        parameterend_date.Value = end_date;
        myCommand.Parameters.Add(parameterend_date);


        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

    }
    public void DocDelete
        (
            int id_doc,
            int id_docs_sotrudnik
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("DocDeleteNewObj", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_doc = new SqlParameter("@id_doc", SqlDbType.Int);
        parameterid_doc.Value = id_doc;
        myCommand.Parameters.Add(parameterid_doc);

        SqlParameter parameterid_docs_sotrudnik = new SqlParameter("@id_docs_sotrudnik", SqlDbType.Int);
        parameterid_docs_sotrudnik.Value = id_docs_sotrudnik;
        myCommand.Parameters.Add(parameterid_docs_sotrudnik);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }

	
}

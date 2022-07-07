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
/// Summary description for News
/// </summary>
public class News
{
	public News()
	{
		//
		// TODO: Add constructor logic here
		//

    }
        public void InsertNews
        (
           
          

            int id_sotrudnik,
	        int prioritet_news,
	        String header_news,
	        String text_news,
	        String date_news,
            String time_news,
	        bool have_file,
	        String path_file,
	        bool have_images,
	        int type_news,
            String items
           
          
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("NewsInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;


        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);

        SqlParameter parameterprioritet_news = new SqlParameter("@prioritet_news", SqlDbType.Int);
        parameterprioritet_news.Value = prioritet_news;
        myCommand.Parameters.Add(parameterprioritet_news);

        SqlParameter parameterheader_news = new SqlParameter("@header_news", SqlDbType.NVarChar,255);
        parameterheader_news.Value = header_news;
        myCommand.Parameters.Add(parameterheader_news);

        SqlParameter parametertext_news = new SqlParameter("@text_news", SqlDbType.Text);
        parametertext_news.Value = text_news;
        myCommand.Parameters.Add(parametertext_news);

        SqlParameter parameterdate_news = new SqlParameter("@date_news", SqlDbType.NVarChar, 10);
        parameterdate_news.Value = date_news;
        myCommand.Parameters.Add(parameterdate_news);

        SqlParameter parametertime_news = new SqlParameter("@time_news", SqlDbType.NVarChar, 10);
        parametertime_news.Value = time_news;
        myCommand.Parameters.Add(parametertime_news);

        SqlParameter parameterhave_file = new SqlParameter("@have_file", SqlDbType.Bit);
        parameterhave_file.Value = have_file;
        myCommand.Parameters.Add(parameterhave_file);

        SqlParameter parameterpath_file = new SqlParameter("@path_file", SqlDbType.NVarChar, 255);
        parameterpath_file.Value = path_file;
        myCommand.Parameters.Add(parameterpath_file);

        SqlParameter parameterhave_images = new SqlParameter("@have_images", SqlDbType.Bit);
        parameterhave_images.Value = have_images;
        myCommand.Parameters.Add(parameterhave_images);

        SqlParameter parametertype_news = new SqlParameter("@type_news", SqlDbType.Int);
        parametertype_news.Value = type_news;
        myCommand.Parameters.Add(parametertype_news);

        SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar,100);
        parameteritems.Value = items;
        myCommand.Parameters.Add(parameteritems);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
	
}

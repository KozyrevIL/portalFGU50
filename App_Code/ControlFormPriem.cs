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
public class ControlFormPriem
{
	public  ControlFormPriem()
	{
		//
		// TODO: Add constructor logic here
		//

    }

    public void InsertControlFormPriem
        (
           

            int statements,
            int inquiries,
            int informobmen,
            String name_filial,
            DateTime reg_date,
            String user_add_doc,
            String comments,
            DateTime actual_date
            
          
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("ControlFormPriemInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterstatements = new SqlParameter("@statements", SqlDbType.Int);
        parameterstatements.Value = statements;
        myCommand.Parameters.Add(parameterstatements);

        SqlParameter parameterinquiries = new SqlParameter("@inquiries", SqlDbType.Int);
        parameterinquiries.Value = inquiries;
        myCommand.Parameters.Add(parameterinquiries);

        SqlParameter parameterinformobmen = new SqlParameter("@informobmen", SqlDbType.Int);
        parameterinformobmen.Value = informobmen;
        myCommand.Parameters.Add(parameterinformobmen);

        SqlParameter parametername_filial = new SqlParameter("@name_filial", SqlDbType.NVarChar,255);
        parametername_filial.Value = name_filial;
        myCommand.Parameters.Add(parametername_filial);

        SqlParameter parameterreg_date = new SqlParameter("@reg_date", SqlDbType.DateTime);
        parameterreg_date.Value = reg_date;
        myCommand.Parameters.Add(parameterreg_date);

        SqlParameter parameteruser_add_doc = new SqlParameter("@user_add_doc", SqlDbType.NVarChar,255);
        parameteruser_add_doc.Value = user_add_doc;
        myCommand.Parameters.Add(parameteruser_add_doc);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar,100);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameteractual_date = new SqlParameter("@actual_date", SqlDbType.DateTime);
        parameteractual_date.Value = actual_date;
        myCommand.Parameters.Add(parameteractual_date);
    

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
   
	
}

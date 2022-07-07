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
/// Summary description for Counts
/// </summary>
public class Emails
{
    public Emails()
	{
		//
		// TODO: Add constructor logic here
		//

    }
        

   
    public SqlDataReader SelectEmailsOTUTI
       (
           int id_otuti
       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("OTUTISelectForEmails", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_otuti = new SqlParameter("@id_otuti", SqlDbType.Int);
        parameterid_otuti.Value = id_otuti;
        myCommand.Parameters.Add(parameterid_otuti);

        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

    }
    public SqlDataReader SelectEmailsOTUTI ()
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("SELECT email FROM OTUTI", myConnection);

        myCommand.CommandType = CommandType.Text;

       
        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

    }

   

   
  
}

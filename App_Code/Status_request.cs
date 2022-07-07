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
public class Status_request
{
    public Status_request()
	{
		//
		// TODO: Add constructor logic here
		//

    }

    public bool? SelectStatus_request(String REQUEST_NUMBER)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("REQUEST_INFO_GET_END_STATE", myConnection);

        myCommand.Parameters.AddWithValue("REQUEST_NUMBER", REQUEST_NUMBER);
        myCommand.Parameters.Add("RESULT", SqlDbType.Bit).Direction = ParameterDirection.Output;
        myCommand.CommandType = CommandType.StoredProcedure;

        myConnection.Open();
        //int result = -1;

        bool? result_obj = null;

        try
        {
            myCommand.ExecuteNonQuery();
            result_obj = (bool?)myCommand.Parameters["RESULT"].Value;
        }
        catch
        {
            myConnection.Close();
        }

        return result_obj;
    }
  
}

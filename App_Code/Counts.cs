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
public class Counts
{
	public Counts()
	{
		//
		// TODO: Add constructor logic here
		//

    }
        public void InsertCounts
        (
        
	        int counts,
	        String numerators,
	        String id_object_str
          
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("CountsInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametercounts = new SqlParameter("@counts", SqlDbType.Int);
        parametercounts.Value = counts;
        myCommand.Parameters.Add(parametercounts);

        SqlParameter parameternumerators = new SqlParameter("@numerators", SqlDbType.NVarChar, 50);
        parameternumerators.Value = numerators;
        myCommand.Parameters.Add(parameternumerators);

        SqlParameter parameterid_object_str = new SqlParameter("@id_object_str", SqlDbType.NVarChar, 50);
        parameterid_object_str.Value = id_object_str;
        myCommand.Parameters.Add(parameterid_object_str);

       
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void UpdateCounts
       (
           
           int counts,
           String numerators,
           String id_object_str

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("CountsUpdate", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

      
        SqlParameter parametercounts = new SqlParameter("@counts", SqlDbType.Int);
        parametercounts.Value = counts;
        myCommand.Parameters.Add(parametercounts);

        SqlParameter parameternumerators = new SqlParameter("@numerators", SqlDbType.NVarChar, 50);
        parameternumerators.Value = numerators;
        myCommand.Parameters.Add(parameternumerators);

        SqlParameter parameterid_object_str = new SqlParameter("@id_object_str", SqlDbType.NVarChar, 50);
        parameterid_object_str.Value = id_object_str;
        myCommand.Parameters.Add(parameterid_object_str);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public SqlDataReader SelectCounts (String numerators, String id_object_str)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("CountsSelect", myConnection);

        SqlParameter parameternumerators = new SqlParameter("@numerators", SqlDbType.NVarChar, 50);
        parameternumerators.Value = numerators;
        myCommand.Parameters.Add(parameternumerators);

        SqlParameter parameterid_object_str = new SqlParameter("@id_object_str", SqlDbType.NVarChar, 50);
        parameterid_object_str.Value = id_object_str;
        myCommand.Parameters.Add(parameterid_object_str);

        myCommand.CommandType = CommandType.StoredProcedure;

        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);
    }
    public int CountsRowInformobmen(String mask, String filial_number, String current_date, bool docs_no_works, bool send_out_date, bool docs_in_works, bool list_for_send, bool list_sended, bool list_docs_out_date)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("InformobmenSelectRepCount", myConnection);

        SqlParameter parametermask = new SqlParameter("@mask", SqlDbType.NVarChar, 255);
        parametermask.Value = mask;
        myCommand.Parameters.Add(parametermask);

        SqlParameter parameterfilial_number = new SqlParameter("@filial_number", SqlDbType.NVarChar, 255);
        parameterfilial_number.Value = filial_number;
        myCommand.Parameters.Add(parameterfilial_number);

        SqlParameter parametercurrent_date = new SqlParameter("@current_date", SqlDbType.NVarChar, 50);
        parametercurrent_date.Value = current_date;
        myCommand.Parameters.Add(parametercurrent_date);

        SqlParameter parameterdocs_no_works = new SqlParameter("@docs_no_works", SqlDbType.Bit);
        parameterdocs_no_works.Value = docs_no_works;
        myCommand.Parameters.Add(parameterdocs_no_works);

        SqlParameter parametersend_out_date = new SqlParameter("@send_out_date", SqlDbType.Bit);
        parametersend_out_date.Value = send_out_date;
        myCommand.Parameters.Add(parametersend_out_date);

        SqlParameter parameterdocs_in_works = new SqlParameter("@docs_in_works", SqlDbType.Bit);
        parameterdocs_in_works.Value = docs_in_works;
        myCommand.Parameters.Add(parameterdocs_in_works);

        SqlParameter parameterlist_for_send = new SqlParameter("@list_for_send", SqlDbType.Bit);
        parameterlist_for_send.Value = list_for_send;
        myCommand.Parameters.Add(parameterlist_for_send);

        SqlParameter parameterlist_sended = new SqlParameter("@list_sended", SqlDbType.Bit);
        parameterlist_sended.Value = list_sended;
        myCommand.Parameters.Add(parameterlist_sended);

        SqlParameter parameterlist_docs_out_date = new SqlParameter("@list_docs_out_date", SqlDbType.Bit);
        parameterlist_docs_out_date.Value = list_docs_out_date;
        myCommand.Parameters.Add(parameterlist_docs_out_date);

        myCommand.CommandType = CommandType.StoredProcedure;

        myConnection.Open();

        
        try
        {
            int id = (int)myCommand.ExecuteScalar();
            if (id > 0)
            {
                myConnection.Close();
                return id;
            }
            else
            {
                myConnection.Close();
                return -1;
            }
        }
        catch
        {
            myConnection.Close();
            return -1;
        }
        finally
        {
            myConnection.Close();
        }

     
        
    }
  
}

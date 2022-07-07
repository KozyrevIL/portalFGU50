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
/// Summary description for pp
/// </summary>
public class pp
{
	public pp()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void ppInsert
        (
           
        String pp_number,
        
        int id_sotrudnik,
        String type_query,
        String view_object,
        int count_clients,
        String cabinet,
        DateTime pp_time,
        DateTime pp_date,
        String comments,
        int id_organization,
        
        String first_name,
	    String last_name,
	    String middle_name,
	    String clients_phone,
	    String clients_email,

        int id_filial,
        DateTime save_date,
        DateTime save_time

        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("ppInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterpp_number = new SqlParameter("@pp_number", SqlDbType.NVarChar,10);
        parameterpp_number.Value = pp_number;
        myCommand.Parameters.Add(parameterpp_number);

        

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);

        SqlParameter parametertype_query = new SqlParameter("@type_query", SqlDbType.NVarChar,255);
        parametertype_query.Value = type_query;
        myCommand.Parameters.Add(parametertype_query);

        SqlParameter parameterview_object = new SqlParameter("@view_object", SqlDbType.NVarChar, 50);
        parameterview_object.Value = view_object;
        myCommand.Parameters.Add(parameterview_object);

        SqlParameter parametercount_clients = new SqlParameter("@count_clients", SqlDbType.Int);
        parametercount_clients.Value = count_clients;
        myCommand.Parameters.Add(parametercount_clients);

        SqlParameter parametercabinet = new SqlParameter("@cabinet", SqlDbType.NVarChar,50);
        parametercabinet.Value = cabinet;
        myCommand.Parameters.Add(parametercabinet);

        SqlParameter parameterpp_time = new SqlParameter("@pp_time", SqlDbType.SmallDateTime);
        parameterpp_time.Value = pp_time;
        myCommand.Parameters.Add(parameterpp_time);

        SqlParameter parameterpp_date = new SqlParameter("@pp_date", SqlDbType.SmallDateTime);
        parameterpp_date.Value = pp_date;
        myCommand.Parameters.Add(parameterpp_date);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar,255);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameterid_organization = new SqlParameter("@id_organization", SqlDbType.Int);
        parameterid_organization.Value = id_organization;
        myCommand.Parameters.Add(parameterid_organization);

        SqlParameter parameterfirst_name = new SqlParameter("@first_name", SqlDbType.NVarChar,50);
        parameterfirst_name.Value = first_name;
        myCommand.Parameters.Add(parameterfirst_name);

        SqlParameter parameterlast_name = new SqlParameter("@last_name", SqlDbType.NVarChar, 50);
        parameterlast_name.Value = last_name;
        myCommand.Parameters.Add(parameterlast_name);

        SqlParameter parametermiddle_name = new SqlParameter("@middle_name", SqlDbType.NVarChar, 50);
        parametermiddle_name.Value = middle_name;
        myCommand.Parameters.Add(parametermiddle_name);

        SqlParameter parameterclients_phone = new SqlParameter("@clients_phone", SqlDbType.NVarChar, 20);
        parameterclients_phone.Value = clients_phone;
        myCommand.Parameters.Add(parameterclients_phone);

        SqlParameter parameterclients_email = new SqlParameter("@clients_email", SqlDbType.NVarChar, 20);
        parameterclients_email.Value = clients_email;
        myCommand.Parameters.Add(parameterclients_email);

        SqlParameter parameterid_filial = new SqlParameter("@id_filial", SqlDbType.Int);
        parameterid_filial.Value = id_filial;
        myCommand.Parameters.Add(parameterid_filial);

        SqlParameter parametersave_date = new SqlParameter("@save_date", SqlDbType.SmallDateTime);
        parametersave_date.Value = save_date;
        myCommand.Parameters.Add(parametersave_date);

        SqlParameter parametersave_time = new SqlParameter("@save_time", SqlDbType.SmallDateTime);
        parametersave_time.Value = save_time;
        myCommand.Parameters.Add(parametersave_time);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
}

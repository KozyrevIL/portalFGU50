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
/// Summary description for Organiser
/// </summary>
public class Organiser
{
	public Organiser()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public SqlDataReader OrganiserSelect()
     
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("OrganiserSelect", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

       

        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

    }
    public SqlDataReader OrganiserSelectForDate
       (
           DateTime date_events
       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("OrganiserSelectForDate", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterdate_events = new SqlParameter("@date_events", SqlDbType.SmallDateTime);
        parameterdate_events.Value = date_events;
        myCommand.Parameters.Add(parameterdate_events);

        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

    }
    public void OrganiserInsert
   (
        int id_sotrudnik,
        DateTime date_events,
        String name_events,
        String description_events,
        bool status

   )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("OrganiserInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);

        SqlParameter parameterdate_events = new SqlParameter("@date_events", SqlDbType.DateTime);
        parameterdate_events.Value = date_events;
        myCommand.Parameters.Add(parameterdate_events);

        SqlParameter parametername_events = new SqlParameter("@name_events", SqlDbType.NVarChar, 255);
        parametername_events.Value = name_events;
        myCommand.Parameters.Add(parametername_events);

        SqlParameter parameterdescription_events = new SqlParameter("@description_events", SqlDbType.Text);
        parameterdescription_events.Value = description_events;
        myCommand.Parameters.Add(parameterdescription_events);

        SqlParameter parameterstatus = new SqlParameter("@status", SqlDbType.Bit);
        parameterstatus.Value = status;
        myCommand.Parameters.Add(parameterstatus);

     

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
}

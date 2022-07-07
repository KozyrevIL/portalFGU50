using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


/// <summary>
/// Сводное описание для WorkDay
/// </summary>
public class WorkDays
{
	public WorkDays()
	{
		//
		// TODO: добавьте логику конструктора
		//
	}
    public void WorkDaysInsert
        (
            DateTime work_date
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("WorkDaysInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterwork_date = new SqlParameter("@date", SqlDbType.DateTime);
        parameterwork_date.Value = work_date;
        myCommand.Parameters.Add(parameterwork_date);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
    }
    public SqlDataReader WorkDaysSelect(int work_year, int work_month)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("WorkDaysSelect", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterwork_year = new SqlParameter("@work_year", SqlDbType.Int);
        parameterwork_year.Value = work_year;
        myCommand.Parameters.Add(parameterwork_year);

        SqlParameter parameterwork_month = new SqlParameter("@work_month", SqlDbType.Int);
        parameterwork_month.Value = work_month;
        myCommand.Parameters.Add(parameterwork_month);



        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);
    }
    public SqlDataReader WorkDaysSelectControlDay(DateTime currentDate, int countPeriod)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("WorkdaysSelectedControlDay", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametercurrentDate = new SqlParameter("@currentDate", SqlDbType.DateTime);
        parametercurrentDate.Value = currentDate;
        myCommand.Parameters.Add(parametercurrentDate);

        SqlParameter parametercurrentPeriod = new SqlParameter("@countPeriod", SqlDbType.Int);
        parametercurrentPeriod.Value = countPeriod;
        myCommand.Parameters.Add(parametercurrentPeriod);

        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);
    }
}

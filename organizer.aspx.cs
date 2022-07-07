using System;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class filial : System.Web.UI.Page 
{

    private DataTable GetEvents()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("EventDate", Type.GetType("System.DateTime"));
        dt.Columns.Add("EventHeader", Type.GetType("System.String"));
        dt.Columns.Add("EventDescription", Type.GetType("System.String"));

        DataRow dr;

        // Last Week's Events
        dr = dt.NewRow();
        dr["EventDate"] = DateTime.Now.AddDays(-7);
        dr["EventHeader"] = "My Last Week's Event 1";
        dr["EventDescription"] = "My Last Week's Event 1 Description";
        dt.Rows.Add(dr);

        // Yesterday's Events
        dr = dt.NewRow();
        dr["EventDate"] = DateTime.Now.AddDays(-1);
        dr["EventHeader"] = "My Yesterday's Event 1";
        dr["EventDescription"] = "My Yesterday's Event 1 Description";
        dt.Rows.Add(dr);

        // Todays Events
        dr = dt.NewRow();
        dr["EventDate"] = DateTime.Now;
        dr["EventHeader"] = "My Todays Event 1";
        dr["EventDescription"] = "My Todays Event 1 Description";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["EventDate"] = DateTime.Now;
        dr["EventHeader"] = "My Todays Event 2";
        dr["EventDescription"] = "My Todays Event 2 Description";
        dt.Rows.Add(dr);

        // Tomorrow's Events
        dr = dt.NewRow();
        dr["EventDate"] = DateTime.Now.AddDays(1);
        dr["EventHeader"] = "My Tomorrow's Event 1";
        dr["EventDescription"] = "My Tomorrow's Event 1 Description";
        dt.Rows.Add(dr);

        // Tomorrow's Events
        dr = dt.NewRow();
        dr["EventDate"] = DateTime.Now.AddDays(1);
        dr["EventHeader"] = "Командировка";
        dr["EventDescription"] = "Соликамск";
        dt.Rows.Add(dr);

        return dt;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Calendar1.EventDateColumnName = "Дата";
        Calendar1.EventDescriptionColumnName = "Описание";
        Calendar1.EventHeaderColumnName = "Заголовок";

        Organiser objOrg = new Organiser();
        SqlDataReader readerOrganiser = objOrg.OrganiserSelect();

        DataTable dt = new DataTable();
        dt.Columns.Add("Дата", Type.GetType("System.DateTime"));
        dt.Columns.Add("Заголовок", Type.GetType("System.String"));
        dt.Columns.Add("Описание", Type.GetType("System.String"));
        DataRow dr;
        while (readerOrganiser.Read())
        {

            String date_events = readerOrganiser["date_events"].ToString();
            String name_events = readerOrganiser["name_events"].ToString();
            String description_events = readerOrganiser["description_events"].ToString();

            dr = dt.NewRow();
            dr["Дата"] = Convert.ToDateTime(date_events);
            dr["Заголовок"] = name_events;
            dr["Описание"] = description_events;
            dt.Rows.Add(dr);
        }

        readerOrganiser.Close();

        Calendar1.EventSource = dt;//GetEvents();
        Calendar1.DataBind();
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        SelectedDatesCollection theDates = Calendar1.SelectedDates;
        DataTable dtEvents = Calendar1.EventSource;

        DataTable dtSelectedDateEvents = dtEvents.Clone();
        DataRow dr;

        foreach (DataRow drEvent in dtEvents.Rows)
            foreach (DateTime selectedDate in theDates)
                if ((Convert.ToDateTime(drEvent[Calendar1.EventDateColumnName])).ToShortDateString() == selectedDate.ToShortDateString())
                {
                    dr = dtSelectedDateEvents.NewRow();
                    dr[Calendar1.EventDateColumnName] = drEvent[Calendar1.EventDateColumnName];
                    dr[Calendar1.EventHeaderColumnName] = drEvent[Calendar1.EventHeaderColumnName];
                    dr[Calendar1.EventDescriptionColumnName] = drEvent[Calendar1.EventDescriptionColumnName];
                    dtSelectedDateEvents.Rows.Add(dr);
                }

        gvSelectedDateEvents.DataSource = dtSelectedDateEvents;
        gvSelectedDateEvents.DataBind();

    }
}

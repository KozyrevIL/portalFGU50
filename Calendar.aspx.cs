using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Calendar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string selected = Request.QueryString["selected"];
            string id = Request.QueryString["id"];
            string form = Request.QueryString["formname"];
            string postBack = Request.QueryString["postBack"];

            // Cast first day of the week from web.config file.  Set it to the calendar
            Cal.FirstDayOfWeek = System.Web.UI.WebControls.FirstDayOfWeek.Sunday;

            // Select the Correct date for Calendar from query string
            // If fails, pick the current date on Calendar
            try
            {
                Cal.SelectedDate = Cal.VisibleDate = Convert.ToDateTime(selected);
            }
            catch
            {
                Cal.SelectedDate = Cal.VisibleDate = DateTime.Today;
            }

            // Fills in correct values for the dropdown menus
            FillCalendarChoices();
            SelectCorrectValues();

            // Add JScript to the OK button so that when the user clicks on it, the selected date
            // is passed back to the calling page.
            OKButton.Attributes.Add("onClick", "window.opener.SetDate('" + form + "','" + id + "', this.form.datechosen.value," + postBack + ");");
            CancelButton.Attributes.Add("onClick", "CloseWindow()");
        }
    }
    //***************************************************************
    //
    // FillCalendarChoices method is used to fill dropdowns with month and year values 
    // 
    //***************************************************************

    private void FillCalendarChoices()
    {
        DateTime thisdate = new DateTime(DateTime.Today.Year, 1, 1);

        // Fills in month values
        for (int x = 0; x < 12; x++)
        {
            // Loops through 12 months of the year and fills in each month value
            ListItem li = new ListItem(thisdate.ToString("MMMM"), thisdate.Month.ToString());
            MonthSelect.Items.Add(li);
            thisdate = thisdate.AddMonths(1);
        }

        // Fills in year values and change y value to other years if necessary
        for (int y = 1994; y <= thisdate.Year; y++)
        {
            YearSelect.Items.Add(y.ToString());
        }
    }

    //***************************************************************************
    //
    // The SelectCorrectValues method is used to select the correct values in dropdowns 
    // according to the selected date on Calendar
    //
    //***************************************************************************

    private void SelectCorrectValues()
    {
        lblDate.Text = Cal.SelectedDate.ToShortDateString();
        datechosen.Value = lblDate.Text;
        MonthSelect.SelectedIndex = MonthSelect.Items.IndexOf(MonthSelect.Items.FindByValue(Cal.SelectedDate.Month.ToString()));
        YearSelect.SelectedIndex = YearSelect.Items.IndexOf(YearSelect.Items.FindByValue(Cal.SelectedDate.Year.ToString()));
    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        InitializeComponent();
        base.OnInit(e);
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        this.MonthSelect.SelectedIndexChanged += new System.EventHandler(this.MonthSelect_SelectedIndexChanged);
        this.YearSelect.SelectedIndexChanged += new System.EventHandler(this.YearSelect_SelectedIndexChanged);
        this.Cal.SelectionChanged += new System.EventHandler(this.Cal_SelectionChanged);
        this.ID = "form1";
        this.Load += new System.EventHandler(this.Page_Load);

    }
    #endregion

    //**************************************************************************
    //
    // Cal_SelectionChanged event handler highlights the selected date on the Calendar and
    // calls SelectCorrectValues() to synchronize to correct values on dropdowns.
    //
    //**************************************************************************

    private void Cal_SelectionChanged(object sender, System.EventArgs e)
    {
        Cal.VisibleDate = Cal.SelectedDate;
        SelectCorrectValues();
    }

    //**************************************************************************
    //
    // MonthSelect_SelectedIndexChanged event handler selects the first day of the month when
    // a month selection has being changed.
    //
    //**************************************************************************

    private void MonthSelect_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        Cal.SelectedDate = Cal.VisibleDate
            = new DateTime(Convert.ToInt32(YearSelect.SelectedItem.Value),
                           Convert.ToInt32(MonthSelect.SelectedItem.Value), 1); ;
        SelectCorrectValues();
    }

    //**************************************************************************
    //
    // YearSelect_SelectedIndexChanged event handler selects a year value on the Calendar control
    // when a year selection has being changed.
    //
    //**************************************************************************

    private void YearSelect_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        Cal.SelectedDate = Cal.VisibleDate
            = new DateTime(Convert.ToInt32(YearSelect.SelectedItem.Value),
                           Convert.ToInt32(MonthSelect.SelectedItem.Value), 1); ;
        SelectCorrectValues();
    }
}

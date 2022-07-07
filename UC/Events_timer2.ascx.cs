using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Events_timer : System.Web.UI.UserControl
{
    public int currentYear;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            currentYear = DateTime.Now.Year+1;
            int countDayForNewYear = (DateTime.IsLeapYear(currentYear-1) ? 366 : 365) - DateTime.Now.DayOfYear;
            LabelCountDayForNewYear.Text = countDayForNewYear.ToString();
        }
        
    }
}
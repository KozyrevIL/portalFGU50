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
        currentYear = DateTime.Now.Year+1;
    }
}
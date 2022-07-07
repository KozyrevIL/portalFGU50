using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_admin_bootstrap_no_banner : System.Web.UI.MasterPage
{
    private String _header = "";

    public string header
    {
        get
        {
            return _header;
        }
        set
        {
            _header = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Page.Title = header;
        }
    }
    
}

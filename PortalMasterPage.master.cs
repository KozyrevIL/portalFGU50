using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PortalMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		Page.MaintainScrollPositionOnPostBack = true;

		if (Page.IsPostBack == false)
		{
			PortalPrincipal user = HttpContext.Current.User as PortalPrincipal;

			if (user != null)
			{
				LabelLogonText.Text = Server.HtmlEncode( string.Format( "Добро пожаловать {0}!", user.UserFullName ) );
				LabelOtdel.Text = Server.HtmlEncode( user.UserOtdelName );
			}
			else
			{
				LabelLogonText.Text = "Добро пожаловать!";
				LabelOtdel.Text = "Вы не авторизированы";
			}

			TreeView1.CollapseAll();
		}
    }
}

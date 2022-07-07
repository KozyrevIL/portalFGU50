using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class UC_LogonPanel : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
		bool authenticated = Request.IsAuthenticated;

		panelLogin.Visible = !authenticated;
		panelLogout.Visible = authenticated;
    }

	protected void btnLogin_Click( object sender, EventArgs e )
	{
		string loing = LOGIN.Text;
		string password = PASSWORD.Text;

		int id_user = -1;

		Page.Validate();
		if (!Page.IsValid)
			return;

		Users objUsers = new Users();
		try
		{
			id_user = objUsers.SelectLogonUsers( loing, password );
		}
		catch
		{
		}

		if (id_user > 0)
		{
			Response.Cookies[ "id_userFGU59" ].Value = id_user.ToString();
			Response.Cookies[ "loginFGU59" ].Value = loing;
			//FormsAuthentication.RedirectFromLoginPage( tbUserId.Text, chkRemember.Checked );
			FormsAuthentication.SetAuthCookie( loing, chkRemember.Checked );
			Response.Redirect( Page.Request.Url.AbsolutePath );
		}
		else
		{
			labelError.Text = "Неверное имя пользователя/пароль!";
			labelError.Visible = true;
		}
	}
	protected void btnLogout_Click( object sender, EventArgs e )
	{
		FormsAuthentication.SignOut();
		Response.Redirect( Page.Request.Url.AbsolutePath );
	}
}

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

public partial class logon : System.Web.UI.Page
{
	protected void Page_Load( object sender, EventArgs e )
	{

	}
	protected void ButtonLogon_Click( object sender, EventArgs e )
	{
		int id_user = -1;
		Page.Validate();
		if (!Page.IsValid)
			return;

		//if (FormsAuthentication.Authenticate(UsernameText.Text, PasswordText.Text)) FormsAuthentication.RedirectFromLoginPage(UsernameText.Text, false);

		Users objUsers = new Users();
		try
		{
			id_user = objUsers.SelectLogonUsers( UsernameText.Text, PasswordText.Text );
		}
		catch
		{
		}

		if (id_user > 0)
		{

			//FormsAuthentication.RedirectFromLoginPage( UsernameText.Text, false );

			//HttpCookie AuthCookie;
			//AuthCookie=FormsAuthentication.GetAuthCookie(UsernameText.Text, false);
			//AuthCookie.Expires = DateTime.Now.AddDays(3);
			//Response.Cookies.Add(AuthCookie);
			Response.Cookies[ "id_userFGU59" ].Value = id_user.ToString();
			Response.Cookies[ "loginFGU59" ].Value = UsernameText.Text;

//			Response.AddHeader("set-cookie", "id_userFGU59="+ id_user.ToString() + "; path=/; SameSite=None; Secure");
//			Response.AddHeader("set-cookie", "loginFGU59=" + UsernameText.Text + "; path=/; SameSite=None; Secure");
//; Secure; HttpOnly


			FormsAuthentication.RedirectFromLoginPage( UsernameText.Text, true );
			//Response.Redirect(FormsAuthentication.GetRedirectUrl(UsernameText.Text, true));
		}
		else
		{
			LegendStatus.Text = "Неверные входные данные!";
		}
	}
}

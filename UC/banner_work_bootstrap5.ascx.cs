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

public partial class UC_banner_work_bootstrap5 : System.Web.UI.UserControl
{
    private String _header = "";
    private bool _showReturnDefault = false;

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
    public bool showReturnDefault
    {
        get
        {
            return _showReturnDefault;
        }
        set
        {
            _showReturnDefault = value;
        }
    }
    


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            /*String login = Request.Cookies["loginFGU59"].Value;
            int id_users = Convert.ToInt32(Request.Cookies["id_userFGU59"].Value);

            Users objUsers = new Users();
            SqlDataReader readerUsers = objUsers.SelectLogonRoles(id_users);

            readerUsers.Read();
            user_logon = readerUsers["full_name"].ToString();
            ViewState["user_logon"] = user_logon;
            name_roles = readerUsers["name_roles"].ToString();
            ViewState["name_roles"] = name_roles;
            readerUsers.Close();*/


            //LabelUserLogon.Text = "Добро пожаловать " + user_logon;

            LabelHeader.Text = header;

            linkReturnDefault.Visible = showReturnDefault;
        }
    }
    protected void LinkButtonOutConsol_Click(object sender, EventArgs e)
    {

        //FormsAuthentication.SignOut();
        //Response.Redirect("./../Default.aspx");

    }
}

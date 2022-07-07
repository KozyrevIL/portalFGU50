using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class UC_admin_banner_RND : System.Web.UI.UserControl
{

    private String _header = "";
    private String _name_roles = "";
    private String _user_logon = "";

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
    public string name_roles
    {
        get
        {
            return _name_roles;
        }
        set
        {
            _name_roles = value;
        }
    }
    public string user_logon
    {
        get
        {
           
            return _user_logon;
        }
        set
        {
            _user_logon = value;
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


            LabelUserLogon.Text = "Текущий пользователь: " + user_logon;

            LabelAdminHeader.Text = header;
        }
    }
    protected void LinkButtonOutConsol_Click(object sender, EventArgs e)
    {

        FormsAuthentication.SignOut();
        Response.Redirect("./../Default.aspx");
       
    }
}

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

public partial class Admin_admin_dolgnost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Настройка страницы под текущего пользователя


            String login = Request.Cookies["loginFGU59"].Value;
            int id_users = Convert.ToInt32(Request.Cookies["id_userFGU59"].Value);

            Users objUsers = new Users();
            SqlDataReader readerUsers = objUsers.SelectLogonRoles(id_users);

            readerUsers.Read();
            String user_logon = readerUsers["full_name"].ToString();
            ViewState["user_logon"] = user_logon;
            String name_roles = readerUsers["name_roles"].ToString();
            ViewState["name_roles"] = name_roles;
            readerUsers.Close();

            //Admin_banner1.user_logon = user_logon;

            Master.header = "Справочник сотрудников";

            String[] names = user_logon.Split();
            String last_name = names[0];

            //Выставляем ДД по индексу

            /*DropDownList ddUser_add_doc;
            ddUser_add_doc = DropDownListUser_add_doc;
            int index = 0;
            foreach (object objLast_name in ddUser_add_doc.Items)
            {
                if (objLast_name.ToString() == last_name) ddUser_add_doc.SelectedIndex = index;
                index = index + 1;
            }*/
            //-------------------------------------------------------
            //--Конец настройки текущего пользователя
            //-------------------------------------------------------
        }
        
        
    }
   
    protected void ButtonInsertDolgnost_Click(object sender, EventArgs e)
    {
        String name_dolgnost = TextBoxName_dolgnost.Text;
        String name_dolgnost_for_doc = TextBoxName_dolgnost_for_doc.Text;

        Dolgnost objdolgnost = new Dolgnost();
        objdolgnost.InsertDolgnost(name_dolgnost, name_dolgnost_for_doc);
        GridView1.DataBind();
    }
}

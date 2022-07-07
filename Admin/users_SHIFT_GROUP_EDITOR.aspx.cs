using System;
using System.IO;
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

public partial class Admin_admin_filial: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
       {
		   ddlOtdel.SelectedValue = PortalPrincipal.Current.OtdelId.ToString();
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

           Admin_banner1.user_logon = user_logon;

           String[] names = user_logon.Split();
           String last_name = names[0];
           String first_name = names[1];
           String middle_name = names[2];

           Session["last_name"] = last_name;
           Session["first_name"] = first_name;
           Session["middle_name"] = middle_name;

           ViewState["last_name"] = last_name;
           //LabelUserAdd_doc.Text = last_name;


            //Подгрузка номер офиса---------------------------------------------------


           //------ Запреты по умолчанию -----------------------------

              GridView1.Columns[0].Visible = false;

               //----------------------------------------------------
              if (Utilites.IsAdministratorRole(Page))
              {
                  GridView1.Columns[0].Visible = true;
              }
         

         
          
       }
       
      
        
    }

    

    protected void ButtonInsertFilial_Click(object sender, EventArgs e)
    {


        sdsShiftCount.Insert();
        GridView1.DataBind();
        
    }





    protected void sdsShiftCount_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        int id = Convert.ToInt16(Session["id"].ToString());
        e.Command.Parameters["@SHIFT_GROUP_ID"].Value = id;
        e.Command.Parameters["@SOTRUDNIK_ID"].Value = Convert.ToInt32(ddlSotrudnik.SelectedValue);
        e.Command.Parameters["@COUNT_SHIFT"].Value = Convert.ToInt32(tbShiftCount.Text);
        e.Command.Parameters["@COUNT_HOURS"].Value = Convert.ToInt32(tbHoursCount.Text);
    }
    protected void ddlOtdel_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["id"] = Convert.ToInt16(ddlOtdel.SelectedValue);
    }
    protected void tbShiftCount_TextChanged(object sender, EventArgs e)
    {
        try
        {
            int nShift = int.Parse(tbShiftCount.Text);
            tbHoursCount.Text = (nShift * 8).ToString();
        }
        catch { }
    }
}

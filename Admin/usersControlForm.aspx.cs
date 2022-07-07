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

              DropDownListNum_office.DataSource = SqlDataSourceFilial;
              DropDownListNum_office.DataTextField = "name_filial";
              DropDownListNum_office.DataValueField = "name_filial";
              DropDownListNum_office.DataBind();

              ListItem obj = new ListItem("Выбор", "-");

              DropDownListNum_office.Items.Insert(0, obj);

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

        if (DropDownListNum_office.SelectedValue != "-")
        {

                int statements=0;
				int inquiries=0;
				int informobmen=0;
				String name_filial="";
				DateTime reg_date;
                DateTime actual_date;

                String user_add_doc = Session["last_name"].ToString() + " " + Session["first_name"].ToString() + " " + Session["middle_name"].ToString();
                String comments = "";

                try
                {
                    statements = Convert.ToInt16(TextBoxStatements.Text);
                }
                catch { }
                try
                {
                    inquiries = Convert.ToInt16(TextBoxInquiries.Text);
                }
                catch { }
                try
                {
                    informobmen = Convert.ToInt16(TextBoxInformobmen.Text);
                }
                catch { }

                name_filial = DropDownListNum_office.SelectedItem.ToString();
                reg_date = DateTime.Now;
                //user_add_doc = "";
                comments = TextBoxСomments.Text;

                try
                {
                    actual_date = Convert.ToDateTime(date.Value);
                }
                catch
                {
                    actual_date = DateTime.Now;
                }


                ControlFormPriem con = new ControlFormPriem();
                con.InsertControlFormPriem
                    (
                        statements,
                        inquiries,
                        informobmen,
                        name_filial,
                        reg_date,
                        user_add_doc,
                        comments,
                        actual_date
                    );

            
            GridView1.DataBind();
        }
    }
    
    
    
  
    protected void ButtonViewAll_Click(object sender, EventArgs e)
    {
        Session["filial"] = "-1"; //DropDownListNum_office.SelectedValue.ToString();
        
        
        //begin_date = Convert.ToDateTime(ViewState["begin_date"].ToString());
        //end_date = Convert.ToDateTime(ViewState["end_date"].ToString());
        //String name_filial = DropDownListFilial.SelectedItem.Text;

        /*this.SqlDataSourceRegistr.SelectParameters[0].DefaultValue = Convert.ToString("-1") ;


        object data = SqlDataSourceRegistr.Select(DataSourceSelectArguments.Empty);

        GridView1.DataSourceID = data.ToString();*/
        GridView1.DataBind();
    }
    protected void DropDownListNum_office_SelectedIndexChanged(object sender, EventArgs e)
    {
        
       Session["filial"] = DropDownListNum_office.SelectedValue.ToString();
       Session["begin_date"] = "01.01.1901";//date.Value;
       Session["end_date"] = "01.01.1901";// date1.Value;
       GridView1.DataBind();
    }

    protected void SqlDataSourceControlFormPriem_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}

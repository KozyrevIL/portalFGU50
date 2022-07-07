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

               //DropDownListNum_office.DataSource = SqlDataSourceNum_office;
               //DropDownListNum_office.DataTextField = "name_num_office";
               //DropDownListNum_office.DataValueField = "name_num_office";
               //DropDownListNum_office.DataBind();

               //ListItem obj = new ListItem("Выбор", "-");

               //DropDownListNum_office.Items.Insert(0, obj);

               //----------------------------------------------------


           if (name_roles == "Гость")
           {
               GridView1.Columns[0].Visible = false;
               PanelFGU.Visible = false;
               PanelElectron_date.Visible = false;
               PanelManual_date.Visible = false;
               ButtonViewAll.Visible = false;


               //Подгрузка номер офиса---------------------------------------------------

                //DropDownListNum_office.DataSource = SqlDataSourceNum_officeForSotrudnik;
                //DropDownListNum_office.DataTextField = "name_num_office";
                //DropDownListNum_office.DataValueField = "name_num_office";
                //DropDownListNum_office.DataBind();
               //
                //obj = new ListItem("Выбор", "-");

                //DropDownListNum_office.Items.Insert(0, obj);

               //----------------------------------------------------

           }
           if (name_roles == "Информобмен")
           {
               ButtonViewAll.Visible = true;
               PanelFilial.Visible = false;
               //PanelFGU.Visible = false;
               PanelElectron_date.Visible = false;
               PanelManual_date.Visible = false;

               ButtonInsert.Enabled = false;

              
           }


          
           

           ClearFoms();
          
       }
       
      

     
        
        
    }

    protected void ClearFoms()
    {
        ButtonInsert.Visible = true;
        ButtonEdit.Visible = false;
        ButtonCancel.Visible = false;

        TextBoxReg_date.Text = "";
        TextBoxIn_doc.Text = "";
        TextBoxWork_date.Text = "";
        TextBoxExec_date.Text = "";
        TextBoxManual_date.Text = "";


        DropDownListResult_work.SelectedIndex = 0;
        TextBoxСomments.Text = "";

        TextBoxElectron_date.Text = "";
        
    }



    protected void ButtonInsertFilial_Click(object sender, EventArgs e)
    {

        if (DropDownListNum_office.SelectedValue != "-")
        {

            String num_office = DropDownListNum_office.SelectedItem.Text;

            DateTime reg_date = DateTime.Now;
            String in_doc = TextBoxIn_doc.Text;
            DateTime work_date = DateTime.Now;

            String result_work = "";

            //if (DropDownListResult_work.Visible == true)
            // {
            // result_work = DropDownListResult_work.SelectedValue;
            //}

            DateTime exec_date = DateTime.Now;
            DateTime electron_date = DateTime.Now;
            DateTime manual_date = DateTime.Now;
            String operator_name = Session["last_name"].ToString();// LabelUserAdd_doc.Text;

            TextBoxReg_date.Text = DateTime.Now.ToShortDateString();
            try
            {
                reg_date = Convert.ToDateTime(TextBoxReg_date.Text);
            }
            catch
            {
            }
            try
            {
                work_date = Convert.ToDateTime(TextBoxWork_date.Text);
            }
            catch
            {
                work_date = Convert.ToDateTime("01.01.1900");
            }

            try
            {
                exec_date = Convert.ToDateTime(TextBoxExec_date.Text);
            }
            catch
            {
                exec_date = Convert.ToDateTime("01.01.1900");
            }
            try
            {
                electron_date = Convert.ToDateTime(TextBoxElectron_date.Text);
            }
            catch
            {
                electron_date = Convert.ToDateTime("01.01.1900");
            }
            try
            {
                manual_date = Convert.ToDateTime(TextBoxManual_date.Text);
            }
            catch
            {
                manual_date = Convert.ToDateTime("01.01.1900");
            }

            DateTime date_return_doc;
                try
                {
                    date_return_doc = DateTime.Now;
                }
                catch
                {
                    date_return_doc = Convert.ToDateTime("01.01.1900");
                }

            String comments = TextBoxСomments.Text;
            String filial_number = "";

             // Новый блок данных

            DateTime control_date=DateTime.Now;
		    String number_notice="";
		    bool status_notice=false;
            DateTime send_notice_date = DateTime.Now;
            String reg_num_out_post = "";

            Registr reg = new Registr();
            reg.InsertRegistr
                (
                    "portalFGU59ConnectionString",
                    num_office,
                    filial_number,
                    reg_date,
                    in_doc,
                    work_date,
                    result_work,
                    exec_date,
                    electron_date,
                    manual_date,
                    operator_name,
                    comments,

                    control_date,
                    number_notice,
                    status_notice,
                    send_notice_date,
                    reg_num_out_post,
                    date_return_doc,
                    ""
                );
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        try
        {

            String reg_date = ((Label)e.Row.FindControl("LabelItemReg_date")).Text;
            String work_date = ((Label)e.Row.FindControl("LabelItemWork_date")).Text;
            String exec_date = ((Label)e.Row.FindControl("LabelItemExec_date")).Text;
            String electron_date = ((Label)e.Row.FindControl("LabelItemElectron_date")).Text;
            String manual_date = ((Label)e.Row.FindControl("LabelItemManual_date")).Text;


            try
            {
                ((Label)e.Row.FindControl("LabelItemReg_date")).Text = reg_date.Remove(10);
                ((Label)e.Row.FindControl("LabelItemWork_date")).Text = work_date.Remove(10);
                ((Label)e.Row.FindControl("LabelItemExec_date")).Text = exec_date.Remove(10);
                ((Label)e.Row.FindControl("LabelItemElectron_date")).Text = electron_date.Remove(10);
                ((Label)e.Row.FindControl("LabelItemManual_date")).Text = manual_date.Remove(10);
            }
            catch { }
            //Convert.ToDateTime(((Label)e.Row.FindControl("LabelItemReg_date")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);

            if (((Label)e.Row.FindControl("LabelItemWork_date")).Text == "01.01.1900")
            {

                ((Label)e.Row.FindControl("LabelItemWork_date")).Visible = false;

            }
            if (((Label)e.Row.FindControl("LabelItemExec_date")).Text == "01.01.1900")
            {

                ((Label)e.Row.FindControl("LabelItemExec_date")).Visible = false;

            }
            if (((Label)e.Row.FindControl("LabelItemElectron_date")).Text == "01.01.1900")
            {

                ((Label)e.Row.FindControl("LabelItemElectron_date")).Visible = false;

            }
            if (((Label)e.Row.FindControl("LabelItemManual_date")).Text == "01.01.1900")
            {

                ((Label)e.Row.FindControl("LabelItemManual_date")).Visible = false;

            }

           
        }
        catch
        {
        }
      
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       // SqlDataSourceRegistr.UpdateParameters["have_file"].DefaultValue = "true";

        //e.OldValues.Remove("manual_date");
       //e.NewValues.Remove("manual_date");
        //e.NewValues.Remove("have_file");

        //e.NewValues.Add("manual_date", have_file_new);
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //int id_filial = Convert.ToInt16(((DropDownList)(GridView1.Rows[e.RowIndex].FindControl("DropDownListEditFilial"))).SelectedValue);

       
        //DateTime manual_date1 = Convert.ToDateTime("01.01.1900");

        
        //e.OldValues.Remove("manual_date");
        //e.NewValues.Add("manual_date", manual_date1);
        
        
       // e.NewValues.Remove("manual_date");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       /* String id_doc = ((Label)GridView1.SelectedRow.FindControl("LabelItemId_doc")).Text;

        String num_office = DropDownListNum_office.SelectedItem.Text;

        DateTime reg_date = DateTime.Now;
        String in_doc = TextBoxIn_doc.Text;
        DateTime work_date = DateTime.Now;
        String result_work = TextBoxResult_work.Text;
        DateTime exec_date = DateTime.Now;
        DateTime electron_date = DateTime.Now;
        DateTime manual_date = DateTime.Now;
        String operator_name = LabelUserAdd_doc.Text;*/

        ClearFoms();

        if (((Label)GridView1.SelectedRow.FindControl("LabelItemReg_date")).Text != "01.01.1900")
        {
            TextBoxReg_date.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemReg_date")).Text;
        }
       
            TextBoxIn_doc.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemIn_doc")).Text;

            if (((Label)GridView1.SelectedRow.FindControl("LabelItemWork_date")).Text != "01.01.1900")
        {
            TextBoxWork_date.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemWork_date")).Text;
        }



        //DropDownListResult_work.SelectedIndex=result_work;
            if (((Label)GridView1.SelectedRow.FindControl("LabelItemExec_date")).Text != "01.01.1900")
        {
            TextBoxExec_date.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemExec_date")).Text;
        }
            if (((Label)GridView1.SelectedRow.FindControl("LabelItemElectron_date")).Text != "01.01.1900")
        {
            TextBoxElectron_date.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemElectron_date")).Text;
        }
            if (((Label)GridView1.SelectedRow.FindControl("LabelItemManual_date")).Text != "01.01.1900")
        {
            TextBoxManual_date.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemManual_date")).Text;
        }

           ViewState["ItemId"] = ((Label)GridView1.SelectedRow.FindControl("LabelItemId")).Text;

           String Num_office = ((Label)GridView1.SelectedRow.FindControl("LabelItemNum_office")).Text;


           //Выставляем Номер офиса по индексу

           DropDownList ddNum_office;
           
           ddNum_office = DropDownListNum_office;

           ddNum_office.SelectedIndex = 0;

           int index = 0;
           foreach (object dd in ddNum_office.Items)
           {
               if (dd.ToString() == Num_office)
                   ddNum_office.SelectedIndex = index;
               index = index + 1;

           }


           String result_work = ((Label)GridView1.SelectedRow.FindControl("LabelItemResult_work")).Text;
           //Выставляем Результат работы по индексу

           DropDownList ddDropDownListResult_work;

           ddDropDownListResult_work = DropDownListResult_work;

           ddDropDownListResult_work.SelectedIndex = 0;

           index = 0;
           foreach (object dd in ddDropDownListResult_work.Items)
           {
               if (dd.ToString() == result_work)
                   ddDropDownListResult_work.SelectedIndex = index;
               index = index + 1;

           }


            ButtonInsert.Visible = false;
            ButtonEdit.Visible = true;
            ButtonCancel.Visible = true;
    }
    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        ClearFoms();
    }
    protected void ButtonViewAll_Click(object sender, EventArgs e)
    {
        Session["num_office"] = "-1"; //DropDownListNum_office.SelectedValue.ToString();
        
        
        //begin_date = Convert.ToDateTime(ViewState["begin_date"].ToString());
        //end_date = Convert.ToDateTime(ViewState["end_date"].ToString());
        //String name_filial = DropDownListFilial.SelectedItem.Text;

        /*this.SqlDataSourceRegistr.SelectParameters[0].DefaultValue = Convert.ToString("-1") ;


        object data = SqlDataSourceRegistr.Select(DataSourceSelectArguments.Empty);

        GridView1.DataSourceID = data.ToString();
        GridView1.DataBind();*/
    }
    protected void DropDownListNum_office_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["num_office"] = DropDownListNum_office.SelectedValue.ToString();
    }
    protected void ButtonEdit_Click(object sender, EventArgs e)
    {
         if (DropDownListNum_office.SelectedValue != "-")
                {
                    int id = Convert.ToInt16(ViewState["ItemId"]);

                    String num_office = DropDownListNum_office.SelectedItem.Text;

                    DateTime reg_date = DateTime.Now;
                    String in_doc = TextBoxIn_doc.Text;
                    DateTime work_date = DateTime.Now;
                    String result_work = DropDownListResult_work.SelectedValue;
                    DateTime exec_date = DateTime.Now;
                    DateTime electron_date = DateTime.Now;
                    DateTime manual_date = DateTime.Now;
                    String operator_name = Session["last_name"].ToString();

                    //TextBoxReg_date.Text = DateTime.Now.ToShortDateString();
                    try
                    {
                        reg_date = Convert.ToDateTime(TextBoxReg_date.Text);
                    }
                    catch
                    {
                    }
                    try
                    {
                        work_date = Convert.ToDateTime(TextBoxWork_date.Text);
                    }
                    catch
                    {
                        work_date = Convert.ToDateTime("01.01.1900");
                    }

                    try
                    {
                        exec_date = Convert.ToDateTime(TextBoxExec_date.Text);
                    }
                    catch
                    {
                        exec_date = Convert.ToDateTime("01.01.1900");
                    }
                    try
                    {
                        electron_date = Convert.ToDateTime(TextBoxElectron_date.Text);
                    }
                    catch
                    {
                        electron_date = Convert.ToDateTime("01.01.1900");
                    }
                    try
                    {
                        manual_date = Convert.ToDateTime(TextBoxManual_date.Text);
                    }
                    catch
                    {
                        manual_date = Convert.ToDateTime("01.01.1900");
                    }

                    DateTime date_return_doc;
                    try
                    {
                        date_return_doc = DateTime.Now;
                    }
                    catch
                    {
                        date_return_doc = Convert.ToDateTime("01.01.1900");
                    }

                    String comments = this.TextBoxСomments.Text;

                    String filial_number = "";



                    // Новый блок данных

                    DateTime control_date=DateTime.Now;
                  
                    String number_notice = "";
                    bool status_notice = false;

                    DateTime send_notice_date=DateTime.Now;
                    

                    String reg_num_out_post = "";

                    Registr reg = new Registr();
                    reg.UpdateRegistr
                        (
                        "portalFGU59ConnectionString",
                        id,
                        num_office,
                        filial_number,
                        reg_date,
                        in_doc,
                        work_date,
                        result_work,
                        exec_date,
                        electron_date,
                        manual_date,
                        operator_name,
                        comments,

                        control_date,
                    number_notice,
                    status_notice,
                    send_notice_date,
                    reg_num_out_post,
                    date_return_doc
                        );
                    GridView1.DataBind();

                    ClearFoms();
                }
    }
}

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

public partial class Admin_admin_journal_serv_teh: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
       {
           DropDownListFilial.DataSource = SqlDataSourceFilial;
           DropDownListFilial.DataTextField = "name_filial";
           DropDownListFilial.DataValueField = "id_filial";
           DropDownListFilial.DataBind();

           ListItem objFilial = new ListItem("выбор","-1");

           DropDownListFilial.Items.Insert(0, objFilial);

           //---------------------------------------------------------

           //DropDownListUser_test.DataSource = SqlDataSourceSotrudnik;
           //DropDownListUser_test.DataTextField = "last_name";
           //DropDownListUser_test.DataValueField = "id_sotrudnik";
          // DropDownListUser_test.DataBind();

           //ListItem objUser_test = new ListItem("выбор", "-1");

           //DropDownListUser_test.Items.Insert(0, objUser_test);

           //DropDownListUser_test.SelectedIndex = 17;

           //----------------------------------------------------------

           DateTime dateDefault = Convert.ToDateTime(DateTime.Now.ToShortDateString());
           DateTime timeDefault = Convert.ToDateTime(DateTime.Now.ToShortTimeString());

           TextBoxDate_acts.Text = dateDefault.ToShortDateString();
           TextBoxTime_acts.Text = timeDefault.ToShortTimeString();

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
           ViewState["last_name"] = last_name;
           LabelUserAdd_doc.Text = last_name;

           //Выставляем ДД по индексу

           //ropDownList ddUser_add_doc;
           //ddUser_add_doc = DropDownListUser_test;
           //int index = 0;
           //foreach (object objLast_name in ddUser_add_doc.Items)
           //{
               //if (objLast_name.ToString() == last_name) ddUser_add_doc.SelectedIndex = index;
              // index = index + 1;
           //}
           //-------------------------------------------------------
           //--Конец настройки текущего пользователя
           //-------------------------------------------------------

          
       }
        LabelError.Visible = false;
        
    }
   
    

    
    protected void ButtonInsertFilial_Click1(object sender, EventArgs e)
    {
       
           
        

            /*if (id_otdel != -1 && id_dolgnost != -1 && id_filial != -1)
           {

               

                GridView1.DataBind();
            }
            else
            {
                LabelError.Visible = true;
                LabelError.Text = "Ошибка заполнения формы!";
            }*/
       
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState == DataControlRowState.Edit)
        {
            /*((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).DataSource = SqlDataSourceOtdel;
            ((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).DataTextField = "name_otdel";
            ((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).DataValueField = "id_otdel";
            ((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).SelectedValue = DataBinder.Eval(e.Row.DataItem, "id_otdel").ToString();
            ((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).DataBind();
            */

        }
    }
    protected void ClearFoms()
    {
        /*DropDownListOtdel.SelectedIndex=0;
        DropDownListDolgnost.SelectedIndex=0;
        DropDownListFilial.SelectedIndex = 0;
        TextBoxFirst_name.Text="";
        TextBoxLast_name.Text="";
        TextBoxMiddle_name.Text="";
        ButtonInsertFilial.Text = "Добавить сотрудника";*/
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
                
        ClearFoms();  
       
        /*TextBoxFirst_name.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemFirst_name")).Text;
        TextBoxLast_name.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemLast_name")).Text;
        TextBoxMiddle_name.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemMiddle_name")).Text;
        String name_otdel = ((Label)GridView1.SelectedRow.FindControl("LabelItemOtdel")).Text;
        String name_dolgnost = ((Label)GridView1.SelectedRow.FindControl("LabelItemDolgnost")).Text;
        String name_filial = ((Label)GridView1.SelectedRow.FindControl("LabelItemFilial")).Text;
 
        int id_journal_email = Convert.ToInt32(((Label)GridView1.SelectedRow.FindControl("LabelItemId_journal_email")).Text);
        int id_otdel = Convert.ToInt32(((Label)GridView1.SelectedRow.FindControl("LabelItemId_otdel")).Text);
        int id_filial = Convert.ToInt32(((Label)GridView1.SelectedRow.FindControl("LabelItemId_filial")).Text);
        int id_dolgnost = Convert.ToInt32(((Label)GridView1.SelectedRow.FindControl("LabelItemId_dolgnost")).Text);

        //Выставляем ДД по индексу
        DropDownList ddOtdel;
        ddOtdel=DropDownListOtdel;
        int index = 0;
        foreach (object str_otdel in ddOtdel.Items)
        {
            if (str_otdel.ToString() == name_otdel) ddOtdel.SelectedIndex = index;
            index = index + 1;
        }

        //Выставляем ДД по индексу
        DropDownList ddFilial;
        ddFilial = DropDownListFilial;
        index = 0;
        foreach (object str_filial in ddFilial.Items)
        {
            if (str_filial.ToString() == name_filial) ddFilial.SelectedIndex = index;
            index = index + 1;
        }

        //Выставляем ДД по индексу
        DropDownList ddDolgnost;
        ddDolgnost = DropDownListDolgnost;
        index = 0;
        foreach (object str_dolgnost in ddDolgnost.Items)
        {
            if (str_dolgnost.ToString() == name_dolgnost) ddDolgnost.SelectedIndex = index;
            index = index + 1;
        }

        ViewState["id_journal_email"] = id_journal_email;*/
        ButtonInsertJournal_VPN.Text = "Редактировать";
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
       
    }
    protected void ButtonInsertJournal_VPN_Click(object sender, EventArgs e)
    {
        String dateDefault=DateTime.Now.ToShortDateString();
        String timeDefault = DateTime.Now.ToShortTimeString();

        String number_acts="";
        String name_filial="";
        String control_filial_sotrudnik="";
        String user_test="";
        String works="";
        String comments="";
        String date_acts="";
        String time_acts = "";


        number_acts = TextBoxNumber_acts.Text; ;
        name_filial = DropDownListFilial.SelectedItem.ToString();
        control_filial_sotrudnik = TextBoxControl_filial_sotrudnik.Text;
        user_test = LabelUserAdd_doc.Text;
        works = TextBoxWorks.Text;
        comments = TextBoxComments.Text;
        date_acts = TextBoxDate_acts.Text;
        time_acts = TextBoxTime_acts.Text;



       //if (Convert.ToInt16(DropDownListUser_test.SelectedValue) != -1 && DropDownListFilial.SelectedValue.ToString()!= "-1")
       //{

           Journals objJournal = new Journals();
           objJournal.InsertJournal_serv_teh
           (

                number_acts,
                name_filial,
                control_filial_sotrudnik,
                user_test,
                works,
                comments,
                date_acts,
                time_acts

           );
           GridView1.DataBind();
       //}
      // else
       //{
         //  LabelError.Visible = true;
          // LabelError.Text = "Ошибка заполнения формы!";
      // }
    }
    
    
    protected void DropDownListFilial_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void TextBoxIP_address_email_TextChanged(object sender, EventArgs e)
    {
        
    }
}

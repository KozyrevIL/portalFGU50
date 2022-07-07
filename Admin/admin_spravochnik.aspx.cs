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

public partial class Admin_admin_spravochnik: System.Web.UI.Page
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

           //----------------------------------------------

           DropDownListDolgnost.DataSource = SqlDataSourceDolgnost;
           DropDownListDolgnost.DataTextField = "name_dolgnost";
           DropDownListDolgnost.DataValueField = "id_dolgnost";
           DropDownListDolgnost.DataBind();

           ListItem objDolgnost = new ListItem("выбор", "-1");
           DropDownListDolgnost.Items.Insert(0, objDolgnost);

           //----------------------------------------------

           DropDownListOtdel.DataSource = SqlDataSourceOtdel;
           DropDownListOtdel.DataTextField = "name_otdel";
           DropDownListOtdel.DataValueField = "id_otdel";
           DropDownListOtdel.DataBind();

           ListItem objOtdel = new ListItem("выбор", "-1");
           DropDownListOtdel.Items.Insert(0, objOtdel);

           //----------------------------------------------

           DropDownListSotrudnik.DataSource = SqlDataSourceSotrudnikForOtdel;
           DropDownListSotrudnik.DataTextField = "name_sotrudnik";
           DropDownListSotrudnik.DataValueField = "id_sotrudnik";
           DropDownListSotrudnik.DataBind();

           ListItem objSotrudnik = new ListItem("выбор", "-1");
           DropDownListSotrudnik.Items.Insert(0, objSotrudnik);



           

       }
        LabelError.Visible = false;
        
    }
   
    

    
    protected void ButtonInsertFilial_Click1(object sender, EventArgs e)
    {

            int id_spravochnik = 0;
            int id_sotrudnik=0;
            int id_filial=0;
	        int id_otdel=0;
            int id_dolgnost=0;
	        String number_cab="";
	        String number_phone="";
	        String number_ip_phone="";
            String email="";

            String first_name = "";
            String middle_name = "";
            String last_name = "";

            String[] full_name=(DropDownListSotrudnik.SelectedItem.ToString().Split());

            id_sotrudnik = Convert.ToInt32(DropDownListSotrudnik.SelectedValue);
            id_otdel = Convert.ToInt32(DropDownListOtdel.SelectedValue);
            id_dolgnost = Convert.ToInt32(DropDownListDolgnost.SelectedValue);
            id_filial = Convert.ToInt32(DropDownListFilial.SelectedValue);

            //TextBoxFirst_name.Text = full_name[0];
            //TextBoxMiddle_name.Text = full_name[2];

            first_name = TextBoxFirst_name.Text;
            last_name = full_name[1];
            middle_name = TextBoxMiddle_name.Text;

            number_cab = TextBoxNumber_cab.Text;
            number_phone = TextBoxNumber_phone.Text;
            number_ip_phone = TextBoxNumber_ip_phone.Text;
            email = TextBoxEmail.Text;
        

            if (id_otdel != -1 && id_dolgnost != -1 && id_filial != -1)
            {

                Spravochnik objSpravochnik = new Spravochnik();

                if (ButtonInsertFilial.Text != "Редактировать")
                {

                    objSpravochnik.InsertSpravochnik
                    (
                        id_sotrudnik,
                        id_filial,
	                    id_otdel,
                        id_dolgnost,
	                    number_cab,
	                    number_phone,
	                    number_ip_phone,
                        email
                    ); 
                }
                else
                {
                    objSpravochnik.UpdateSpravochnik
                     (
                         Convert.ToInt32(ViewState["id_spravochnik"].ToString()),
                         id_sotrudnik,
                         id_filial,
                         id_otdel,
                         id_dolgnost,
                         number_cab,
                         number_phone,
                         number_ip_phone,
                         email
                     );
                    
                }
                ClearFoms();
                GridView1.DataBind();
            }
            else
            {
                LabelError.Visible = true;
                LabelError.Text = "Ошибка заполнения формы!";
            }
       
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState == DataControlRowState.Edit)
        {
            ((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).DataSource = SqlDataSourceOtdel;
            ((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).DataTextField = "name_otdel";
            ((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).DataValueField = "id_otdel";
            ((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).SelectedValue = DataBinder.Eval(e.Row.DataItem, "id_otdel").ToString();
            ((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).DataBind();


        }
    }
    protected void ClearFoms()
    {
        DropDownListOtdel.SelectedIndex=0;
        DropDownListDolgnost.SelectedIndex=0;
        DropDownListFilial.SelectedIndex = 0;
        DropDownListSotrudnik.SelectedIndex = 0;
        TextBoxFirst_name.Text="";
        //TextBoxLast_name.Text="";
        TextBoxMiddle_name.Text="";
        ButtonInsertFilial.Text = "Добавить сотрудника";
        TextBoxNumber_cab.Text = "";
        TextBoxNumber_phone.Text = "";
        TextBoxNumber_ip_phone.Text = "";
        TextBoxEmail.Text = "";

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
                
        ClearFoms();

        String first_name = ((Label)GridView1.SelectedRow.FindControl("LabelItemFirst_name")).Text;
        String last_name = ((Label)GridView1.SelectedRow.FindControl("LabelItemLast_name")).Text;
        String middle_name = ((Label)GridView1.SelectedRow.FindControl("LabelItemMiddle_name")).Text;


        TextBoxFirst_name.Text = first_name;
        //TextBoxLast_name.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemLast_name")).Text;
        TextBoxMiddle_name.Text = middle_name;
        TextBoxNumber_cab.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemNumber_cab")).Text;
        TextBoxNumber_phone.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemNumber_phone")).Text;
        TextBoxNumber_ip_phone.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemNumber_ip_phone")).Text;
        TextBoxEmail.Text = ((Label)GridView1.SelectedRow.FindControl("LabelItemEmail")).Text;

        String name_otdel = ((Label)GridView1.SelectedRow.FindControl("LabelItemOtdel")).Text;
        String name_dolgnost = ((Label)GridView1.SelectedRow.FindControl("LabelItemDolgnost")).Text;
        String name_filial = ((Label)GridView1.SelectedRow.FindControl("LabelItemFilial")).Text;
        String full_name = last_name + " " + first_name + " " + middle_name;

 
        int id_spravochnik = Convert.ToInt32(((Label)GridView1.SelectedRow.FindControl("LabelItemId_spravochnik")).Text);
        ViewState["id_spravochnik"] = id_spravochnik;
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

        //Выставляем ДД по индексу
        //----------------------------------------------

        DropDownListSotrudnik.DataSource = SqlDataSourceSotrudnikForOtdel;
        DropDownListSotrudnik.DataTextField = "full_name";
        DropDownListSotrudnik.DataValueField = "id_sotrudnik";
        DropDownListSotrudnik.DataBind();

        //TextBoxFirst_name.Text=

        ListItem objSotrudnik = new ListItem("выбор", "-1");
        DropDownListSotrudnik.Items.Insert(0, objSotrudnik);
        DropDownList ddSotrudnik;
        ddSotrudnik = DropDownListSotrudnik;
        index = 0;
        foreach (object str_sotrudnik in ddSotrudnik.Items)
        {
            if (str_sotrudnik.ToString() == full_name) ddSotrudnik.SelectedIndex = index;
            index = index + 1;
        }

        ViewState["id_spravochnik"] = id_spravochnik;
        ButtonInsertFilial.Text = "Редактировать";
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int index = Convert.ToInt16(GridView1.SelectedIndex.ToString());
        GridViewRow row = GridView1.SelectedRow;
        ClearFoms();
        //TextBoxFirst_name.Text = ((TextBox)row.FindControl("TextBoxFirst_name")).Text;
    }
    protected void DropDownListOtdel_SelectedIndexChanged(object sender, EventArgs e)
    {

       
        //----------------------------------------------

        DropDownListSotrudnik.DataSource = SqlDataSourceSotrudnikForOtdel;
        DropDownListSotrudnik.DataTextField = "full_name";
        DropDownListSotrudnik.DataValueField = "id_sotrudnik";
        DropDownListSotrudnik.DataBind();

        //TextBoxFirst_name.Text=

        ListItem objSotrudnik = new ListItem("выбор", "-1");
        DropDownListSotrudnik.Items.Insert(0, objSotrudnik);
    }
    protected void DropDownListSotrudnik_SelectedIndexChanged(object sender, EventArgs e)
    {
        String[] full_name = (DropDownListSotrudnik.SelectedItem.ToString().Split());
        
        TextBoxFirst_name.Text = full_name[1];
        String last_name = full_name[0];
        TextBoxMiddle_name.Text = full_name[2];



        Sotrudnik objSotrudnik = new Sotrudnik();
        //objSotrudnik.SotrudnikSelectDolgnost(Convert.ToInt32(DropDownListSotrudnik.SelectedValue));

        SqlDataReader readSotrudnik = objSotrudnik.SotrudnikSelectDolgnost(Convert.ToInt32(DropDownListSotrudnik.SelectedValue));
        readSotrudnik.Read();
        String name_dolgnost = readSotrudnik["name_dolgnost"].ToString();

        readSotrudnik.Close();
        //Выставляем ДД по индексу
        DropDownList ddDolgnost;
        ddDolgnost=DropDownListDolgnost;
        int index = 0;

        foreach (object str_dolgnost in ddDolgnost.Items)
        {
            if (str_dolgnost.ToString() == name_dolgnost) ddDolgnost.SelectedIndex = index;
            index = index + 1;
        }
        
    }
    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        ClearFoms();
    }
    protected void ButtonFindDoc_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
}

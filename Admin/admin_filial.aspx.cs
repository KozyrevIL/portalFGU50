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

public partial class Admin_admin_filial: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
       {
           

            DropDownListKanal.DataSource = SqlDataSourceTypeKanal;
            DropDownListKanal.DataTextField = "type_kanal";
            DropDownListKanal.DataValueField = "id_type_kanal";
            DropDownListKanal.DataBind();

            ListItem obj1 = new ListItem("нет","0");

            DropDownListKanal.Items.Insert(0, obj1);

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

           LabelError.Visible = false;
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

           ButtonDelete.Visible = false;
       }
        
        
    }

    protected void BindGrid(string id_filial)
    {
        

        this.SqlDataSourceFilialSelectlinks.SelectParameters[0].DefaultValue = id_filial;


        object data = SqlDataSourceFilialSelectlinks.Select(DataSourceSelectArguments.Empty);

        this.GridViewLinks.DataSource = data;
        GridViewLinks.DataBind();
    }

    protected void ButtonInsertFilial_Click(object sender, EventArgs e)
    {
           int kad_number = 0;   
           String name_filial="";
	       String city_filial="";
	       String street_filial="";
	       String home_filial="";
           int index_filial = 0;
	       int id_type_kanal=0;
	       String tarif_kanal="";
	       int v_kanal=-1;
           String ip_address_vpn = "";
	       String provayder_kanal="";
           bool have_vpn = false;
	       bool have_ip_phone=false;
	       bool have_ftp=false;
	       bool have_rnd=false;
	       String number_phone="";
           String number_ip_phone = "";
           String name_email = "";
           String type_router = "";
           String ip_lan="";
           String ip_lan_mask="";
           String ip_lan_router="";
           String ip_address_vpn_mask = "";
           String type_phone = "";
           bool placeRnd = false;
            String id_address_server = "";

           try
           {
               kad_number = Convert.ToInt32(TextBoxKad_number.Text);
           }
           catch
           {
               kad_number = 0;
           }
           try
           {
               name_filial = TextBoxName_filial.Text;
               city_filial = TextBoxCity_filial.Text;
               street_filial = TextBoxStreet_filial.Text;
               home_filial = TextBoxHome_filial.Text;
               try
               {
                   index_filial = Convert.ToInt32(TextBoxIndex.Text);
               }
               catch
               {
                   index_filial = 0;
               }

               id_type_kanal = Convert.ToInt16(DropDownListKanal.SelectedValue.ToString());
               tarif_kanal = DropDownListTarif_kanal.SelectedValue.ToString();
               v_kanal = Convert.ToInt32(DropDownListV_kanal.SelectedValue);
               ip_address_vpn = TextBoxIP_address_vpn.Text;

               type_router = DropDownListType_router.SelectedValue.ToString();
               ip_lan = TextBoxIp_lan.Text;
               ip_lan_mask = TextBoxIp_lan_mask.Text;
               ip_lan_router = TextBoxIp_lan_router.Text;
              
               number_ip_phone = TextBoxNumber_ip_phone.Text;
              

               provayder_kanal = DropDownListProvayder_kanal.SelectedValue.ToString();
               if (CheckBoxHave_vpn.Checked) have_vpn = true;
               if (number_ip_phone != "") have_ip_phone = true;
               if (CheckBoxHave_ftp.Checked) have_ftp = true;
               if (CheckBoxHave_rnd.Checked) have_rnd = true;
               number_phone = TextBoxNumber_phone.Text;

               name_email = TextBoxName_email.Text;

               type_phone = DropDownListType_phone.SelectedItem.ToString();

            id_address_server = TextBoxIP_adddress_server.Text;

               Filial objfilial = new Filial();
               objfilial.InsertFilial
               (
                   kad_number,
                   name_filial,
                   city_filial,
                   street_filial,
                   home_filial,
                   index_filial,
                   id_type_kanal,
                   tarif_kanal,
                   v_kanal,
                   ip_address_vpn,
                   provayder_kanal,
                   have_vpn,
                   have_ip_phone,
                   have_ftp,
                   have_rnd,
                   number_phone,
                   number_ip_phone,
                   name_email,
                   type_router,
                   ip_lan,
                   ip_lan_mask,
                   ip_lan_router,
                   ip_address_vpn_mask,
                   type_phone,
                   placeRnd,
                   id_address_server

               );
               GridView1.DataBind();
           }
           catch (Exception exp)
           {
               LabelError.Visible = true;
               LabelError.Text = exp.Message;
           }
    }

    protected void DropDownListKanal_SelectedIndexChanged(object sender, EventArgs e)
    {
        /*if (DropDownListKanal.SelectedValue != "нет")
        {
            DropDownListProvayder_kanal.Enabled = true;
            DropDownListTarif_kanal.Enabled = true;
            DropDownListV_kanal.Enabled = true;
            CheckBoxHave_ftp.Enabled = true;
            CheckBoxHave_vpn.Enabled = true;
            TextBoxNumber_ip_phone.Enabled = true;
        }
        else
        {
            DropDownListProvayder_kanal.Enabled = false;
            DropDownListProvayder_kanal.SelectedIndex = 0;
            DropDownListTarif_kanal.Enabled = false;
            DropDownListTarif_kanal.SelectedIndex = 0;
            DropDownListV_kanal.Enabled = false;
            DropDownListV_kanal.SelectedIndex = 0;
            CheckBoxHave_ftp.Enabled = false;
            CheckBoxHave_ftp.Checked = false;
            CheckBoxHave_vpn.Enabled = false;
            CheckBoxHave_vpn.Checked = false;
            TextBoxNumber_ip_phone.Enabled = false;
            TextBoxNumber_ip_phone.Text = "";
        }*/
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string type_users="";
        if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_ADMIN)) type_users = "admin";

        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            ((LinkButton)e.Row.FindControl("LinkButtonItemDelete")).Visible = false;
            //if (((Label)e.Row.FindControl("LabelItemActive")).Text=="False")
            //{
                //e.Row.BackColor = System.Drawing.Color.LightPink;
           // }else
                 if (((Label)e.Row.FindControl("LabelItemFor_report")).Text.ToUpper() == "TRUE")
                {
                    e.Row.BackColor = System.Drawing.Color.LightGreen;
                }else
            {
                e.Row.BackColor = System.Drawing.Color.LightPink;
            }
                     //if (((Label)e.Row.FindControl("LabelItemFor_delete")).Text.ToUpper() == "TRUE")
                    //{
                        //e.Row.BackColor = System.Drawing.Color.LightPink;
                    //}

            if (type_users == "admin" || type_users == "del_mv")
            {
                ((LinkButton)e.Row.FindControl("LinkButtonItemDelete")).Visible = true;
            }
           
        }
        if ((e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate)) || (e.Row.RowState == DataControlRowState.Edit))
        {
           

            //Подгружаем канал связи
            String kanal = ((Label)e.Row.FindControl("LabelEditId_type_kanal")).Text;
            DropDownList dd = (DropDownList)e.Row.FindControl("DropDownListEditType_kanal");
            try
            {
                dd.DataSource = SqlDataSourceTypeKanal;
                dd.DataTextField = "type_kanal";
                dd.DataValueField = "id_type_kanal";
                dd.SelectedValue = kanal;
                dd.DataBind();

               
            }
            catch
            { 
                ListItem obj1 = new ListItem("нет", "5");

                dd.Items.Insert(0, obj1);
                dd.SelectedIndex = 0;

                
            }
        }
    }
    protected void SqlDataSourceFilial_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        //(DropDownList)GridView1.Rows[e.RowIndex].FindControl("txtCity");
      
        
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        

        GridViewRow row = GridView1.Rows[e.RowIndex];
        if (row != null)
        {

            int id_type_kanal = Convert.ToInt16(((DropDownList)row.FindControl("DropDownListEditType_kanal")).SelectedValue);  // Convert.ToInt16(((Label)row.FindControl("LabelEditId_type_kanal")).Text);


            e.NewValues.Remove("id_type_kanal");

            e.OldValues.Remove("id_type_kanal");
            e.NewValues.Remove("id_type_kanal");

            e.NewValues.Add("id_type_kanal", id_type_kanal);
        }
    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            this.LabelError.Visible = true;
            this.LabelError.Text = "Ошибка при обновлении документа! Текст ошибки: " + e.Exception.Message;
            e.ExceptionHandled = true;


        }
        else
        {
            LabelError.ForeColor = System.Drawing.Color.DarkGreen;
            this.LabelError.Visible = true;
            this.LabelError.Text = "Документ успешно обновлен!";
        }
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            LabelError.ForeColor = System.Drawing.Color.Red;
            this.LabelError.Visible = true;
            this.LabelError.Text = "Ошибка при удалении документа! Возможно существуют связи с другими таблицами. Текст ошибки: " + e.Exception.Message;
            e.ExceptionHandled = true;

            string id_filial = ViewState["id_filial"].ToString();

            ButtonDelete.Visible = true;
            //BindGrid(id_filial);
        }
        else
        {
            LabelError.ForeColor = System.Drawing.Color.DarkGreen;
            this.LabelError.Visible = true;
            this.LabelError.Text = "Запись успешна удалена!";
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        ViewState["id_filial"] = (e.CommandArgument.ToString());
    }
    protected void ButtonDelete_Click(object sender, EventArgs e)
    {

    }
}

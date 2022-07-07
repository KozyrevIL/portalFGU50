using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Text;
using System.Net.Mail;
using System.Web.Mail;

public partial class Admin_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
			

            //-----------------------------------------------------------------

            //Настройка страницы под текущего пользователя
            String user_logon = "";

            String login = Request.Cookies["loginFGU59"].Value;
            int id_users = Convert.ToInt32(Request.Cookies["id_userFGU59"].Value);

            Users objUsers = new Users();
            SqlDataReader readerUsers = objUsers.SelectLogonRoles(id_users);

            try
            {
                readerUsers.Read();
                //Полное имя пользователя
                user_logon = readerUsers["full_name"].ToString();
                ViewState["user_logon"] = user_logon;
                //Роль
                String name_roles = readerUsers["name_roles"].ToString();
                ViewState["name_roles"] = name_roles;
                //Отдел
                String name_otdel = readerUsers["name_otdel"].ToString();
                ViewState["name_otdel"] = name_otdel;
                String id_otdel = readerUsers["id_otdel"].ToString();

                Session["id_otdel"] = id_otdel;
                Session["id_otdel2"] = id_otdel;

                //Электронный адрес пользователя
                String email = "";//readerUsers["email"].ToString();
                ViewState["email"] = email;
                //Электронный адрес пользователя
                String id_sotrudnik = readerUsers["id_sotrudnik"].ToString();
                Session["id_sotrudnik"] = id_sotrudnik;
            }
            catch
            {
            }
            finally
            {
                readerUsers.Close();
            }
           


           // Admin_banner1.user_logon = PortalPrincipal.Current.UserFullName;
            

            String[] names = user_logon.Split();
            String last_name = names[0];
            String first_name = "";
            String middle_name = "";
            try
            {
                first_name = names[2];
                middle_name = names[3];
            }
            catch
            {
                first_name = names[1];
                middle_name = names[2];
            }

            ViewState["last_name"] = last_name;
            //LabelUserAdd_doc.Text = last_name;
           ViewState["full_name"] = last_name + " " + first_name + " " + middle_name;

           

        }
        
            
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        String type_users = "";

        int intStatus_under_type = 0;


       // if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_ADMIN)) type_users = "admin";
        //if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_GUEST)) type_users = "guest";
        //if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_USER)) type_users = "user";


        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            try
            {

                intStatus_under_type = Convert.ToInt16(((Label)e.Row.FindControl("LabelItemStatus_under_type")).Text);
            }
            catch
            {

            }
            //Выделение текущей задачи или задачи по запросу с email
            /*if (ViewState["items_select"].ToString() != "")
            {
                if (((Label)e.Row.FindControl("LabelItemItems")).Text == ViewState["items_select"].ToString())
                {
                    e.Row.Focus();
                    e.Row.BackColor = System.Drawing.Color.Yellow;

                }

            }*/

            //Инициализация переменных 

            string number_in_doc = ((Label)e.Row.FindControl("LabelItemNumber_in_doc")).Text;
            string tema = ((Label)e.Row.FindControl("LabelItemTema")).Text;

            string fileNames = ((Label)e.Row.FindControl("LabelItemFileGUIDNames")).Text;
            string fileNames2 = ((Label)e.Row.FindControl("LabelItemFileGUIDNames2")).Text;


            if (fileNames == "")
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFilesItem")).Visible = false;
                ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).Visible = false;
            }
            if (fileNames2 == "")
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFilesItem2")).Visible = false;
                ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath2")).Visible = false;
            }

            //int strStatus_doc = Convert.ToInt16(((DropDownList)e.Row.FindControl("DropDownListEditStatus_under_type")).SelectedValue);//((Label)e.Row.FindControl("LabelItemStatus_doc")).Text;



            Label labelDateControl = (Label)e.Row.FindControl("LabelItemDate_control");
            Label labelTimeControl = (Label)e.Row.FindControl("LabelItemTime_control");

            DateTime full_date_control = Convert.ToDateTime("01.01.1901");

            try
            {
                full_date_control = Convert.ToDateTime(labelDateControl.Text + " " + labelTimeControl.Text);
            }
            catch
            {
                e.Row.BackColor = System.Drawing.Color.Yellow;
                e.Row.BorderColor = System.Drawing.Color.DarkRed;
                e.Row.ForeColor = System.Drawing.Color.Red;
                //LabelError.Visible = true;
                //LabelError.Text = "НЕ КОРРЕКТНОЕ ВРЕМЯ КОНТРОЛЯ (ПОЛЕ: СРОК ИСПОЛ.)!!! Необходимо внести правильное значение!";

            }

            // DateTime date_control = Convert.ToDateTime(labelDateControl.Text);
            //DateTime time_control = Convert.ToDateTime(((Label)e.Row.FindControl("LabelItemTime_control")).Text);

            DateTime currentDate = DateTime.Now;

            string strFileGUIDNames = ((Label)e.Row.FindControl("LabelItemFileGUIDNames")).Text;
            string strFilePath = ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl;

            ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl = Path.Combine("./../Upload/Doc", strFileGUIDNames);


            string strFileGUIDNames2 = ((Label)e.Row.FindControl("LabelItemFileGUIDNames2")).Text;
            string strFilePath2 = ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath2")).NavigateUrl;

            ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath2")).NavigateUrl = Path.Combine("./../Upload/Doc", strFileGUIDNames2);


            if (currentDate > full_date_control && intStatus_under_type == 0)
            {

                e.Row.BackColor = Color.FromArgb(255, 204, 204);
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemStatus")).ImageUrl = "~/images/16х16/ball_red.gif";


            }
            if (intStatus_under_type == 1)
            {
                e.Row.BackColor = Color.FromArgb(204, 255, 204);
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemStatus")).ImageUrl = "~/images/16х16/ball_green.gif";

            }
            if (intStatus_under_type == 2)
            {
                e.Row.BackColor = Color.FromArgb(223, 237, 253);
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemStatus")).ImageUrl = "~/images/16х16/ball_green.gif";

            }



            if (type_users == "admin")
            {
                ((LinkButton)e.Row.FindControl("LinkButtonItemDelete")).Visible = true;
            }
            else
            {
                ((LinkButton)e.Row.FindControl("LinkButtonItemDelete")).Visible = false;
            }

            //string findStrMask = TextBoxMask.Text;
            //int intMask = tema.IndexOf(findStrMask);

            //if (findStrMask == number_in_doc) ((Label)e.Row.FindControl("LabelItemNumber_in_doc")).BackColor = System.Drawing.Color.Yellow;
            //if (intMask != 0)
            //{
                //((Label)e.Row.FindControl("LabelItemTema")).BackColor = System.Drawing.Color.Yellow;
            //}





        }
        if ((e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate)) || (e.Row.RowState == DataControlRowState.Edit))
        {



            String status = ((Label)e.Row.FindControl("LabelEditStatus_doc")).Text;

            /*if (status == "Исполнено")
            {
                ((CheckBox)e.Row.FindControl("CheckBoxStatus_doc")).Checked = true;
               
            }
            else
            {
                ((CheckBox)e.Row.FindControl("CheckBoxStatus_doc")).Checked = false;LabelItemFileGUIDNames2
               
            }*/

            string fileNames = ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFilesEdit")).AlternateText;
            string fileNames2 = ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFilesEdit2")).AlternateText;
            //string fileNames = ((Label)e.Row.FindControl("LabelItemFileGUIDNames")).Text;
            // string fileNames2 = ((Label)e.Row.FindControl("LabelItemFileGUIDNames2")).Text;


            if (fileNames == "")
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFilesEdit")).Visible = false;
                // ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).Visible = false; 
            }
            if (fileNames2 == "")
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFilesEdit2")).Visible = false;
                //((HyperLink)e.Row.FindControl("HyperLinkItemFilePath2")).Visible = false; 
            }

            //----------- Вставка динамического календаря в Грид Вьюв -----------

            TextBox date_ready = ((TextBox)e.Row.FindControl("TextBoxEditDate_ready"));
            string clientid = date_ready.ClientID;
            TextBox date_control = ((TextBox)e.Row.FindControl("TextBoxEditDate_control"));
            string clientid2 = date_control.ClientID;

            // Define the name and type of the client script on the page.
            String csName = "DateInsert";
            Type csType = this.GetType();

            // Get a ClientScriptManager reference from the Page class.
            ClientScriptManager cs = Page.ClientScript;

            // Check to see if the client script is already registered.
            if (!cs.IsClientScriptBlockRegistered(csType, csName))
            {

                StringBuilder csText = new StringBuilder();
                csText.Append("<script>");
                csText.Append("$(function() {");
                string strid = "$('#" + clientid + "').datepicker();";
                string strid2 = "$('#" + clientid2 + "').datepicker();";
                csText.Append(strid);
                csText.Append(strid2);
                csText.Append("});");
                csText.Append("</script>");
                cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
            }
            //---------------- Конец блока вставки календаря -------------------------
            //
            String id_sotrudnik_executive = ((Label)e.Row.FindControl("LabelEditId_sotrudnik_executive")).Text;
            DropDownList dd = (DropDownList)e.Row.FindControl("DropDownListFull_name_executive");
            try
            {
                dd.DataSource = SqlDataSourceSotrudnik;
                dd.DataTextField = "full_name";
                dd.DataValueField = "id_sotrudnik";
                dd.SelectedValue = id_sotrudnik_executive;
                dd.DataBind();
            }
            catch
            {
                ListItem obj1 = new ListItem("нет", "5");
                dd.Items.Insert(0, obj1);
                dd.SelectedIndex = 0;
            }
            //
            String id_sotrudnik_control = ((Label)e.Row.FindControl("LabelEditId_sotrudnik_control")).Text;
            dd = (DropDownList)e.Row.FindControl("DropDownListFull_name_control");
            try
            {
                dd.DataSource = SqlDataSourceSotrudnik;
                dd.DataTextField = "full_name";
                dd.DataValueField = "id_sotrudnik";
                dd.SelectedValue = id_sotrudnik_control;
                dd.DataBind();
            }
            catch
            {
                ListItem obj1 = new ListItem("нет", "5");
                dd.Items.Insert(0, obj1);
                dd.SelectedIndex = 0;
            }

            //
            String id_sotrudnik = ((Label)e.Row.FindControl("LabelEditId_sotrudnik")).Text;
            DropDownList dd1 = (DropDownList)e.Row.FindControl("DropDownListEditFull_name");
            try
            {
                dd1.DataSource = SqlDataSourceSotrudnik;
                dd1.DataTextField = "full_name";
                dd1.DataValueField = "id_sotrudnik";
                dd1.SelectedValue = id_sotrudnik;
                dd1.DataBind();
            }
            catch
            {
                ListItem obj1 = new ListItem("нет", "5");
                dd1.Items.Insert(0, obj1);
                dd1.SelectedIndex = 0;
            }


            if (type_users == "guest")
            {
                ((TextBox)e.Row.FindControl("TextBoxEditNumber_in_doc")).Enabled = false;
                ((TextBox)e.Row.FindControl("TextBoxEditTema")).Enabled = false;

                ((CheckBox)e.Row.FindControl("CheckBoxFileDelete")).Enabled = false;
                ((CheckBox)e.Row.FindControl("CheckBoxFileDelete2")).Enabled = false;
                ((FileUpload)e.Row.FindControl("FileUploadEdit")).Enabled = false;

                ((DropDownList)e.Row.FindControl("DropDownListFull_name_executive")).Enabled = false;
                ((DropDownList)e.Row.FindControl("DropDownListFull_name_control")).Enabled = false;
                ((DropDownList)e.Row.FindControl("DropDownListEditFull_name")).Enabled = false;
            }
            else
            {
                ((TextBox)e.Row.FindControl("TextBoxEditNumber_in_doc")).Enabled = true;
                ((TextBox)e.Row.FindControl("TextBoxEditTema")).Enabled = true;
                ((DropDownList)e.Row.FindControl("DropDownListFull_name_control")).Enabled = true;
                ((FileUpload)e.Row.FindControl("FileUploadEdit")).Enabled = true;
            }

        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            String items = (e.CommandArgument.ToString());

            if (e.CommandName == "Delete")
            {

                String filePath = "";
                String fileNames = "";
                // String items = ViewState["items"].ToString();

                Files objFiles = new Files();
                SqlDataReader readerFiles = objFiles.FilesSelect(items);



                try
                {
                    readerFiles.Read();

                    filePath = readerFiles["filePath"].ToString();
                    fileNames = readerFiles["fileNames"].ToString();
                    //fileType = readerFiles["fileType"].ToString();
                    //fileLength = Convert.ToInt32(readerFiles["fileLength"].ToString());
                }
                catch
                {

                }
                finally
                {
                    readerFiles.Close();
                }

                

                if (fileNames != "")
                {

                    try
                    {
                        FileInfo TheFile = new FileInfo(filePath);
                        if (TheFile.Exists)
                        {
                            File.Delete(filePath);
                        };
                    }
                    catch
                    {

                    }
                }
            }
        }
        catch (Exception ex)
        {
            //LabelError.Text = ex.Message;
            //LabelError.Visible = true;

        }
    }
  

   
}

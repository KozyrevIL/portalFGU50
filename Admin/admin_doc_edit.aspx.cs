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

public partial class Admin_admin_doc : System.Web.UI.Page
{
    public int countQuery = 0;
    public string id_object_str = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int minutesCurrent=DateTime.Now.Minute;
            int intMinutes=0;

            try
            {
                if (minutesCurrent < 3 || minutesCurrent > 55) intMinutes = 0;
                if (minutesCurrent < 5) intMinutes = 5;
                if (minutesCurrent >= 5 && minutesCurrent < 10) intMinutes = 10;
                if (minutesCurrent >= 10 && minutesCurrent < 15) intMinutes = 15;
                if (minutesCurrent >= 15 && minutesCurrent < 20) intMinutes = 20;
                if (minutesCurrent >= 20 && minutesCurrent < 25) intMinutes = 25;
                if (minutesCurrent >= 25 && minutesCurrent < 30) intMinutes = 30;
                if (minutesCurrent >= 30 && minutesCurrent < 35) intMinutes = 35;
                if (minutesCurrent >= 35 && minutesCurrent < 40) intMinutes = 40;
                if (minutesCurrent >= 40 && minutesCurrent < 45) intMinutes = 45;
                if (minutesCurrent >= 45 && minutesCurrent < 50) intMinutes = 50;
                if (minutesCurrent >= 50 && minutesCurrent < 55) intMinutes = 55;
            }
            catch
            {
            }
           

            //this.DropDownListHours.SelectedValue = DateTime.Now.Hour.ToString();
            //this.DropDownListMinutes.SelectedValue = intMinutes.ToString();

            //DropDownListOtdel1.DataSource = SqlDataSourceOtdel;
            //DropDownListOtdel1.DataTextField = "name_otdel";
            //DropDownListOtdel1.DataValueField = "id_otdel";
            //DropDownListOtdel1.DataBind();

            //DropDownListOtdel2.DataSource = SqlDataSourceOtdel;
            //DropDownListOtdel2.DataTextField = "name_otdel";
            //DropDownListOtdel2.DataValueField = "id_otdel";
            //DropDownListOtdel2.DataBind();

            DropDownListUserWorksFiltr.DataSource = this.SqlDataSourceSotrudnik;
            DropDownListUserWorksFiltr.DataTextField = "full_name";
            DropDownListUserWorksFiltr.DataValueField = "id_sotrudnik";
            DropDownListUserWorksFiltr.DataBind();

            
            ListItem objSotrudnik = new ListItem("Выбор", "-1");
            ListItem objSotrudnik1 = new ListItem("Показать всех", "-1");

            //DropDownListOtdel1.Items.Insert(0, objSotrudnik);
            //DropDownListOtdel2.Items.Insert(0, objSotrudnik);
            DropDownListUserWorksFiltr.Items.Insert(0, objSotrudnik1);
            

            //TextBoxDate_reg.Text = DateTime.Now.ToShortDateString();
            //TextBoxTime_reg.Text = DateTime.Now.ToShortTimeString();

            //TextBoxDate_control.Text = DateTime.Now.ToShortDateString();
            

         
            //ButtonInsertDoc.Text = "Добавить";


            ViewState["FindDoc"] = "0";
            ViewState["id_object_str"] = "-1";

            //PanelDataTimeReg.Visible = false;

            //Настройка фильтра вывода данных по дате

            String currentDate = DateTime.Now.ToShortDateString();

            //Инициализация вывода документов по диапазону
            //в источнике данных настроен дефолт "01.01.1901"
            //для минимизации данных делаем вывод в 7 дней
            //--------------------------------------------------------------

                String strEnd_date = DateTime.Now.ToShortDateString();
                String strBegin_date = DateTime.Now.AddDays(-7).ToShortDateString();

            //-----------------------------------------------------------------

            //Настройка страницы под текущего пользователя


            String login = Request.Cookies["loginFGU59"].Value;
            int id_users = Convert.ToInt32(Request.Cookies["id_userFGU59"].Value);

            Users objUsers = new Users();
            SqlDataReader readerUsers = objUsers.SelectLogonRoles(id_users);

            readerUsers.Read();
            //Полное имя пользователя
            String user_logon = readerUsers["full_name"].ToString();
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
            ViewState["id_sotrudnik"] = id_sotrudnik;
            readerUsers.Close();
            

            Admin_banner1.user_logon = user_logon;

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

           

            //Выставляем Отдел Исполнителя по индексу

            /*DropDownList ddOtdel;
            ddOtdel = DropDownListOtdel1;
            int index = 0;
            foreach (object objOtdel in ddOtdel.Items)
            {
                if (objOtdel.ToString() == name_otdel)
                    ddOtdel.SelectedIndex = index;
                index = index + 1;
                
            }*/
            //Выставляем Отдел Контроля по индексу
            /*
            DropDownList ddOtdel2;
            ddOtdel2 = DropDownListOtdel2;
            index = 0;
            foreach (object objOtdel2 in ddOtdel2.Items)
            {
                if (objOtdel2.ToString() == name_otdel)
                    ddOtdel2.SelectedIndex = index;
                index = index + 1;
            }
            */
             //Выставляем фильтр

            DropDownListUserWorksFiltr.SelectedValue = id_sotrudnik;

            DropDownListUser_control.SelectedValue = id_sotrudnik;

            if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_GUEST))
            {

                DropDownListUserWorksFiltr.Enabled = false;
                //DropDownListOtdel2.Enabled = false;
                DropDownListUser_control.Enabled = false;
                //DropDownListType_otdel.Enabled = false;
                //TextBoxNumber_in_doc.Enabled = false;
                //TextBoxDateReg.Enabled = false;
                //TextBoxDate_control.Enabled = false;
                //DropDownListHours.Enabled = false;
                //DropDownListMinutes.Enabled = false;
                CheckBoxHistory.Enabled = false;
            }

            //-------------------------------------------------------
            //--Конец настройки текущего пользователя
            //-------------------------------------------------------

            //TextBoxDateReg.Text = DateTime.Now.ToShortDateString();
            Session["UserWorksFiltr"] = DropDownListUserWorksFiltr.SelectedValue.ToString();

            Session["mask"] = "";
        }
        //LabelError.Visible = false;

        
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Session["id_otdel"] = DropDownListOtdel1.SelectedValue.ToString();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)

    {
        //Session["id_otdel2"] = DropDownListOtdel2.SelectedValue.ToString();
    }
    protected void GridViewParent_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        bool guest = false;
        if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_GUEST)) guest = true;
      
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))   
        {

            int intStatus_under_type=Convert.ToInt16(((Label)e.Row.FindControl("LabelItemStatus_under_type")).Text);

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

            DateTime full_date_control = Convert.ToDateTime(labelDateControl.Text + " " + labelTimeControl.Text);

            DateTime date_control = Convert.ToDateTime(labelDateControl.Text);
                DateTime time_control = Convert.ToDateTime(((Label)e.Row.FindControl("LabelItemTime_control")).Text);
                
                DateTime currentDate = DateTime.Now;

            string strFileGUIDNames = ((Label)e.Row.FindControl("LabelItemFileGUIDNames")).Text;
            string strFilePath = ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl;

            ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl = Path.Combine("./../Upload/Doc", strFileGUIDNames);


            string strFileGUIDNames2 = ((Label)e.Row.FindControl("LabelItemFileGUIDNames2")).Text;
            string strFilePath2 = ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath2")).NavigateUrl;

            ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath2")).NavigateUrl = Path.Combine("./../Upload/Doc", strFileGUIDNames2);


            if (currentDate > full_date_control && intStatus_under_type == 0)
            {
                
                e.Row.BackColor = Color.FromArgb(255,204,204);
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemStatus")).ImageUrl = "~/images/16х16/ball_red.gif";
              
               
            }
            if (intStatus_under_type > 0)
            {
                e.Row.BackColor = Color.FromArgb(204,255,204);
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemStatus")).ImageUrl = "~/images/16х16/ball_green.gif";
               
            }

            if (guest)
            {
                ((LinkButton)e.Row.FindControl("LinkButtonItemDelete")).Visible = false;
            }

            string findStrMask=TextBoxMask.Text;
            int intMask = tema.IndexOf(findStrMask);

            if (findStrMask == number_in_doc) ((Label)e.Row.FindControl("LabelItemNumber_in_doc")).BackColor = System.Drawing.Color.Yellow;
            if (intMask != 0)
            {
                ((Label)e.Row.FindControl("LabelItemTema")).BackColor = System.Drawing.Color.Yellow;
            }
            

            


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
            string clientid=date_ready.ClientID;

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
                string strid="$('#"+clientid+"').datepicker();";
                csText.Append(strid);
                csText.Append("});");
                csText.Append("</script>");
                cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
            }
            //---------------- Конец блока вставки календаря -------------------------

            //Подгружаем канал связи
            String id_sotrudnik_control = ((Label)e.Row.FindControl("LabelEditId_sotrudnik_control")).Text;
            DropDownList dd = (DropDownList)e.Row.FindControl("DropDownListFull_name_control");
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
            if (guest)
            {
                ((TextBox)e.Row.FindControl("TextBoxEditNumber_in_doc")).Enabled = false;
                ((TextBox)e.Row.FindControl("TextBoxEditTema")).Enabled = false;
                ((DropDownList)e.Row.FindControl("DropDownListFull_name_control")).Enabled = false;
                ((CheckBox)e.Row.FindControl("CheckBoxFileDelete")).Enabled = false;
                ((CheckBox)e.Row.FindControl("CheckBoxFileDelete2")).Enabled = false;
                
            }

           
            //GridViewParent.Columns[12].Visible = false;
			
			//e.Row.Cells[12].ColumnSpan = 2;
			//e.Row.Cells.RemoveAt(13);
            
        }
    }
    
    
    protected void GridViewParent_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String items = (e.CommandArgument.ToString());
       
        if (e.CommandName == "Delete")
        {

            String filePath = "";
            String fileNames = "";
            // String items = ViewState["items"].ToString();

            Files objFiles = new Files();
            SqlDataReader readerFiles = objFiles.FilesSelect(items);

            readerFiles.Read();

            try
            {
                filePath = readerFiles["filePath"].ToString();
                fileNames = readerFiles["fileNames"].ToString();
                //fileType = readerFiles["fileType"].ToString();
                //fileLength = Convert.ToInt32(readerFiles["fileLength"].ToString());
            }
            catch
            {
            }


            readerFiles.Close();

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

    protected void GridViewParent_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridViewParent.Rows[e.RowIndex];
        if (row != null)
        {

            int id_sotrudnik_control = Convert.ToInt16(((DropDownList)row.FindControl("DropDownListFull_name_control")).SelectedValue);  // Convert.ToInt16(((Label)row.FindControl("LabelEditId_type_kanal")).Text);
            int id_sotrudnik = Convert.ToInt16(((DropDownList)row.FindControl("DropDownListEditFull_name")).SelectedValue);
            int status_under_type = Convert.ToInt16(((DropDownList)row.FindControl("DropDownListEditStatus_under_type")).SelectedValue);
            String status_doc = ((DropDownList)row.FindControl("DropDownListEditStatus_under_type")).SelectedItem.Text;
            String user_add_doc = ViewState["full_name"].ToString();

            e.NewValues.Remove("id_sotrudnik_control");
            e.OldValues.Remove("id_sotrudnik_control");
            e.NewValues.Remove("id_sotrudnik_control");
            e.NewValues.Add("id_sotrudnik_control", id_sotrudnik_control);

            e.NewValues.Remove("id_sotrudnik");
            e.OldValues.Remove("id_sotrudnik");
            e.NewValues.Remove("id_sotrudnik");
            e.NewValues.Add("id_sotrudnik", id_sotrudnik);

            e.NewValues.Remove("status_under_type");
            e.OldValues.Remove("status_under_type");
            e.NewValues.Remove("status_under_type");
            e.NewValues.Add("status_under_type", status_under_type);

            e.NewValues.Remove("status_doc");
            e.OldValues.Remove("status_doc");
            e.NewValues.Remove("status_doc");
            e.NewValues.Add("status_doc", status_doc);

            e.NewValues.Remove("user_add_doc");
            e.OldValues.Remove("user_add_doc");
            e.NewValues.Remove("user_add_doc");
            e.NewValues.Add("user_add_doc", user_add_doc);
        }

        //Признак удаления файла
        CheckBox checkBoxFileDelete;
        checkBoxFileDelete = (CheckBox)(GridViewParent.Rows[e.RowIndex].FindControl("CheckBoxFileDelete"));
        CheckBox checkBoxFileDelete2;
        checkBoxFileDelete2 = (CheckBox)(GridViewParent.Rows[e.RowIndex].FindControl("CheckBoxFileDelete2"));

        if ((((TextBox)(GridViewParent.Rows[e.RowIndex].FindControl("TextBoxEditDate_ready"))).Text) == "" && Convert.ToInt16((((DropDownList)(GridViewParent.Rows[e.RowIndex].FindControl("DropDownListEditStatus_under_type"))).SelectedValue)) > 0)
        {
            ((TextBox)(GridViewParent.Rows[e.RowIndex].FindControl("TextBoxEditDate_ready"))).Text = DateTime.Now.ToShortDateString();
            //((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBoxEditTime_ready"))).Text = DateTime.Now.ToShortTimeString();

            e.OldValues.Remove("date_ready");
            e.NewValues.Remove("date_ready");
            e.NewValues.Add("date_ready", DateTime.Now.ToShortDateString());

            e.OldValues.Remove("time_ready");
            e.NewValues.Remove("time_ready");
            e.NewValues.Add("time_ready", DateTime.Now.ToShortTimeString());
        }


        //Загрузка файла на сервер



        /*if (((CheckBox)GridView1.Rows[e.RowIndex].FindControl("CheckBoxStatus_doc")).Checked == true)
        {
            e.OldValues.Remove("status_doc");
            e.NewValues.Remove("status_doc");
            e.NewValues.Add("status_doc", "Исполнено");
        }
        else
        {
            e.OldValues.Remove("status_doc");
            e.NewValues.Remove("status_doc");
            e.NewValues.Add("status_doc", "В работу");
        }*/

        FileUpload FileUpload = (FileUpload)GridViewParent.Rows[e.RowIndex].FindControl("FileUploadEdit");
        FileUpload FileUpload2 = (FileUpload)GridViewParent.Rows[e.RowIndex].FindControl("FileUploadEdit2");

        String items = ((Label)(GridViewParent.Rows[e.RowIndex].FindControl("LabelEditItems"))).Text;
        String items2 = ((Label)(GridViewParent.Rows[e.RowIndex].FindControl("LabelItemEdit_under_type"))).Text;


        String fileNamesLoad = ((Label)(GridViewParent.Rows[e.RowIndex].FindControl("LabelFileNames"))).Text;
        String fileNamesLoad2 = ((Label)(GridViewParent.Rows[e.RowIndex].FindControl("LabelFileNames2"))).Text;

        int fileLength = FileUpload.PostedFile.ContentLength;
        int fileLength2 = FileUpload2.PostedFile.ContentLength;




        Files objFiles = new Files();

        if (checkBoxFileDelete.Checked == true)
        {
            // Удаление старого файла с диска
            // ---------------------------------------------------------------------------------------

            string filePathOld = "";
            string fileNamesOld = "";

            SqlDataReader readerFiles = objFiles.FilesSelect(items);

            readerFiles.Read();

            try
            {
                filePathOld = readerFiles["filePath"].ToString();
                fileNamesOld = readerFiles["fileNames"].ToString();
                //fileType = readerFiles["fileType"].ToString();
                //fileLength = Convert.ToInt32(readerFiles["fileLength"].ToString());
            }
            catch
            {
            }

            readerFiles.Close();

            if (fileNamesOld != "")
            {

                try
                {
                    FileInfo TheFile = new FileInfo(filePathOld);
                    if (TheFile.Exists)
                    {
                        File.Delete(filePathOld);
                    };

                    //Удаленине файла из базы

                    objFiles.FilesItemsDelete(items);
                }
                catch (Exception ex)
                {
                    //LabelError.Text = ex.Message;
                    //LabelError.Visible = true;
                    //e.Cancel = true;
                }
            }
        }

        if (checkBoxFileDelete2.Checked == true)
        {
            // Удаление старого файла с диска
            // ---------------------------------------------------------------------------------------

            string filePathOld = "";
            string fileNamesOld = "";

            SqlDataReader readerFiles = objFiles.FilesSelect(items2);

            readerFiles.Read();

            try
            {
                filePathOld = readerFiles["filePath"].ToString();
                fileNamesOld = readerFiles["fileNames"].ToString();
                //fileType = readerFiles["fileType"].ToString();
                //fileLength = Convert.ToInt32(readerFiles["fileLength"].ToString());
            }
            catch
            {
            }

            readerFiles.Close();

            if (fileNamesOld != "")
            {

                try
                {
                    FileInfo TheFile = new FileInfo(filePathOld);
                    if (TheFile.Exists)
                    {
                        File.Delete(filePathOld);
                    };

                    //Удаленине файла из базы

                    objFiles.FilesItemsDelete(items);
                }
                catch (Exception ex)
                {
                    //LabelError.Text = ex.Message;
                    //LabelError.Visible = true;
                    e.Cancel = true;
                }
            }
        }




        if (fileLength != 0)
        {
            string fileName = Path.GetFileName(FileUpload.PostedFile.FileName);
            string destDir = Server.MapPath("./../Upload/Doc");
            int countLength = Path.GetFileName(FileUpload.PostedFile.FileName).Length;
            int indexPoint = fileName.LastIndexOf(".");

            //string fileNamesShort = Path.GetFileName(FileUpload2.PostedFile.FileName).Substring(0, countLength - 4);

            string fileNameRashirenie = Path.GetFileName(fileName.Substring(indexPoint + 1));
            string fileNames = fileName;// +"." + fileNameRashirenie;

            //Получение уникального имени файла

            string fileGUIDNames = items + "." + fileNameRashirenie;
            string filePath = Path.Combine(destDir, fileGUIDNames);

            string fileType = FileUpload.PostedFile.ContentType;
            string fileDate = DateTime.Now.ToShortDateString();
            string fileComments = "";


            //Сохраняем данные в БД

            if (fileNamesLoad != "")
            {
                objFiles.FilesUpdate
                    (
                           fileNames,
                           fileGUIDNames,
                           fileLength,
                           filePath,
                           fileType,
                           fileDate,
                           fileComments,
                           items

                    );

            }
            else
            {
                objFiles.FilesInsert
                    (
                           fileNames,
                           fileGUIDNames,
                           fileLength,
                           filePath,
                           fileType,
                           fileDate,
                           fileComments,
                           items

                    );

            }

            //Загружаем файл на сервер
            FileUpload.PostedFile.SaveAs(filePath);



        }
        //Загружаем файл исполнителя

        if (fileLength2 != 0)
        {

            if (items2 == "")
            {
                items2 = System.Guid.NewGuid().ToString();

                e.OldValues.Remove("items_under_type");
                e.NewValues.Remove("items_under_type");
                e.NewValues.Add("items_under_type", items2);

            }


            string fileName2 = Path.GetFileName(FileUpload2.PostedFile.FileName);
            string destDir2 = Server.MapPath("./../Upload/Doc");
            int countLength2 = Path.GetFileName(FileUpload2.PostedFile.FileName).Length;
            int indexPoint = fileName2.LastIndexOf(".");

            //string fileNamesShort = Path.GetFileName(FileUpload2.PostedFile.FileName).Substring(0, countLength - 4);

            string fileNameRashirenie2 = Path.GetFileName(fileName2.Substring(indexPoint + 1));
            string fileNames2 = fileName2;// +"." + fileNameRashirenie2;

            //Получение уникального имени файла

            string fileGUIDNames2 = items2 + "." + fileNameRashirenie2;
            string filePath2 = Path.Combine(destDir2, fileGUIDNames2);

            string fileType2 = FileUpload2.PostedFile.ContentType;
            string fileDate2 = DateTime.Now.ToShortDateString();
            string fileComments2 = "";


            //Сохраняем данные в БД

            if (fileNamesLoad2 != "")
            {
                objFiles.FilesUpdate
                    (
                           fileNames2,
                           fileGUIDNames2,
                           fileLength2,
                           filePath2,
                           fileType2,
                           fileDate2,
                           fileComments2,
                           items2

                    );

            }
            else
            {
                objFiles.FilesInsert
                    (
                           fileNames2,
                           fileGUIDNames2,
                           fileLength2,
                           filePath2,
                           fileType2,
                           fileDate2,
                           fileComments2,
                           items2

                    );

            }

            //Загружаем файл на сервер
            FileUpload2.PostedFile.SaveAs(filePath2);



        }

    }

    protected void GridViewParent_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
       
    }
    protected void GridViewParent_SelectedIndexChanged(object sender, EventArgs e)
    {
        String filePath = "";
        String fileNames = "";
        String fileType = "";
        int fileLength = 0;

        ImageButton imagebutton_avtor = ((ImageButton)GridViewParent.SelectedRow.FindControl("ImageButtonFiles"));
        ImageButton imagebutton_ispol = ((ImageButton)GridViewParent.SelectedRow.FindControl("ImageButtonFiles2"));

        String items = imagebutton_avtor.CommandArgument;
        String items2 = imagebutton_ispol.CommandArgument;

        if (imagebutton_avtor.Visible==true)
        {
            Files objFiles = new Files();
            SqlDataReader readerFiles = objFiles.FilesSelect(items);

            readerFiles.Read();

            try
            {
                filePath = readerFiles["filePath"].ToString();
                fileNames = readerFiles["fileNames"].ToString();
                fileType = readerFiles["fileType"].ToString();
                fileLength = Convert.ToInt32(readerFiles["fileLength"].ToString());
            }
            catch
            {
            }


            readerFiles.Close();

            if (fileNames != "")
            {
                try
                {
                    FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                    byte[] MyData = new byte[fs.Length];
                    fs.Read(MyData, 0, System.Convert.ToInt32(fs.Length));
                    fs.Close();

                    Response.ContentType = fileType;
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + fileNames);
                    Response.Cache.SetCacheability(HttpCacheability.Public);
                    Response.BufferOutput = true;
                    Response.OutputStream.Write(MyData, 0, fileLength);
                    Response.Flush();
                }
                catch (Exception ex)
                {
                    //LabelError.Text = ex.Message;
                   // LabelError.Visible = true;
                    
                }
            }
        }
        if (imagebutton_ispol.Visible == true)
        {
            Files objFiles = new Files();
            SqlDataReader readerFiles = objFiles.FilesSelect(items2);

            readerFiles.Read();

            try
            {
                filePath = readerFiles["filePath"].ToString();
                fileNames = readerFiles["fileNames"].ToString();
                fileType = readerFiles["fileType"].ToString();
                fileLength = Convert.ToInt32(readerFiles["fileLength"].ToString());
            }
            catch
            {

            }


            readerFiles.Close();

            if (fileNames != "")
            {
                try
                {
                    FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                    byte[] MyData = new byte[fs.Length];
                    fs.Read(MyData, 0, System.Convert.ToInt32(fs.Length));
                    fs.Close();

                    Response.ContentType = fileType;
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + fileNames);
                    Response.Cache.SetCacheability(HttpCacheability.Public);
                    Response.BufferOutput = true;
                    Response.OutputStream.Write(MyData, 0, fileLength);
                    Response.Flush();
                }
                catch (Exception ex)
                {
                   // LabelError.Text = ex.Message;
                   // LabelError.Visible = true;
                }
            }
        }
    }
    protected void CheckBoxStatus_doc_CheckedChanged(object sender, EventArgs e)
    {

        
    }
    protected void ButtonFind_Click(object sender, EventArgs e)
    {
        Session["mask"] = TextBoxMask.Text;
        Session["UserWorksFiltr"] = -1;
        GridViewParent.DataBind();
    }
    protected void DropDownListUserWorksFiltr_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["UserWorksFiltr"] = DropDownListUserWorksFiltr.SelectedValue.ToString();
        
        
    }
    protected void GridViewParent_RowEditing(object sender, GridViewEditEventArgs e)
    {
        if (CheckBoxHistory.Checked == true)
        {

            int parent_index = e.NewEditIndex;
            Session["GridViewParentIndex"] = parent_index;
            //to set the edit index of the Parent grid with that of the current row
            GridViewParent.EditIndex = parent_index;
            GridViewParent.DataBind();
            //find the pubid_lbl containing pub_id in that particular row by using findcontrol method
            GridViewRow row = GridViewParent.Rows[parent_index];

            Label items = (Label)row.FindControl("LabelEditItems");
            //Label id_currentSession = (Label)row.FindControl("LabelItemId_currentSession");

            //save pub_id and edit_index in session for childgridview's use
            Session["items"] = items.Text;
            //Session["id_currentSession"] = id_currentSession.Text;
        }
        else
        {
            Session["items"] = null;
        }



    }
}

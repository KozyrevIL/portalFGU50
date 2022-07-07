using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Drawing;
using System.Text;

public partial class Admin_admin_sotrudnik : System.Web.UI.Page
{
    public string pathCatalog = "./../Upload/Doc/2013";
	protected void Page_Load( object sender, EventArgs e )
	{
        if (!IsPostBack)
        {
            

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
                
                //Роль
                String name_roles = readerUsers["name_roles"].ToString();
               
                //Отдел
                String name_otdel = readerUsers["name_otdel"].ToString();
               
                String id_otdel = readerUsers["id_otdel"].ToString();

                String id_sotrudnik = readerUsers["id_sotrudnik"].ToString();
                ViewState["id_sotrudnik"] = id_sotrudnik;

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
                LabelUserAdd_doc.Text = last_name;
                ViewState["full_name"] = last_name + " " + first_name + " " + middle_name;

                Session["id_otdel"] = id_otdel;
                Session["id_otdel2"] = id_otdel;

                //Выставляем Отдел Исполнителя по индексу

                DropDownList ddOtdel;
                ddOtdel = DropDownListOtdel1;
                int index = 0;
                foreach (object objOtdel in ddOtdel.Items)
                {
                    if (objOtdel.ToString() == name_otdel)
                        ddOtdel.SelectedIndex = index;
                    index = index + 1;

                }
                //Выставляем Отдел Контроля по индексу

                DropDownList ddOtdel2;
                ddOtdel2 = DropDownListOtdel2;
                index = 0;
                foreach (object objOtdel2 in ddOtdel2.Items)
                {
                    if (objOtdel2.ToString() == name_otdel)
                        ddOtdel2.SelectedIndex = index;
                    index = index + 1;
                }

                //Выставляем фильтр

                DropDownListExecutive.SelectedValue = id_sotrudnik;

                

                //DropDownListUser_control.SelectedValue = id_sotrudnik;

                DropDownListGroupQuery.DataSource = this.SqlDataSourceSotrudnikGroup;
                DropDownListGroupQuery.DataTextField = "nameGroupQuery";
                DropDownListGroupQuery.DataValueField = "id_groupQuery";
                DropDownListGroupQuery.DataBind();

                ListItem objItem = new ListItem("выбор", "-1");
                DropDownListGroupQuery.Items.Insert(0, objItem);

                if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_GUEST))
                {

                    
                    DropDownListOtdel2.Enabled = true;
                    DropDownListUser_control.Enabled = true;
                    DropDownListGroupQuery.Enabled = false;
                    TextBoxNumber_in_doc.Enabled = false;
                    TextBoxDateReg.Enabled = false;

                    TextBoxDate_control.Enabled = true;
                    DropDownListHours.Enabled = true;
                    DropDownListMinutes.Enabled = true;

                }
                if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_ADMIN))
                {
                    
                    ButtonGroup.Enabled = true;
                }
                
                ButtonGroup.Enabled = true;

                //Инициализация дипазона выборки

                string begin_date = DateTime.Now.AddDays(-7).ToShortDateString();
                string end_date = DateTime.Now.ToShortDateString();

                this.TextBoxBeginDate.Text = begin_date;
                this.TextBoxEndDate.Text = end_date;

                TextBoxDateReg.Text = end_date;

                //ViewState["begin_date"] = begin_date;
                //ViewState["end_date"] = end_date;
            }
            catch
            {
                LabelError.Visible = true;
                LabelError.Text = "Ошибка загрузки данных. База данных недоступна";
            }
            finally
            {
                readerUsers.Close();
            }
            


            Admin_banner1.user_logon = user_logon;

            //Первоначальная настройка страницы

            
            int minutesCurrent = DateTime.Now.Minute;
            int intMinutes = 0;

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

            this.DropDownListHours.SelectedValue = (DateTime.Now.Hour).ToString();
            this.DropDownListMinutes.SelectedValue = intMinutes.ToString();

            TextBoxDate_control.Text = DateTime.Now.AddDays(1).ToShortDateString();

            DropDownListOtdel1.DataSource = SqlDataSourceOtdelDD;
            DropDownListOtdel1.DataTextField = "name_otdel_abr";
            DropDownListOtdel1.DataValueField = "id_otdel";
            DropDownListOtdel1.DataBind();

            DropDownListOtdel2.DataSource = SqlDataSourceOtdelDD;
            DropDownListOtdel2.DataTextField = "name_otdel_abr";
            DropDownListOtdel2.DataValueField = "id_otdel";
            DropDownListOtdel2.DataBind();

            
            DropDownListExecutive.DataSource = this.SqlDataSourceSotrudnik;
            DropDownListExecutive.DataTextField = "full_name";
            DropDownListExecutive.DataValueField = "id_sotrudnik";
            DropDownListExecutive.DataBind();


            ListItem objSotrudnik = new ListItem("Выбор", "-1");
            ListItem objSotrudnik1 = new ListItem("Показать всех", "-1");

            DropDownListOtdel1.Items.Insert(0, objSotrudnik);
            DropDownListOtdel2.Items.Insert(0, objSotrudnik);


            BindGrid();
          
        }


	}
    public void BindGrid()
    {
        object data = null;
        String begin_date = TextBoxBeginDate.Text;
        String end_date = TextBoxEndDate.Text;
        String top = "100";
        String id_sotrudnik = ViewState["id_sotrudnik"].ToString();
        String id_sotrudnik_control = DropDownListUser_control.SelectedValue.ToString();

        String filtr = FiltrDD.SelectedValue.ToString();

        //switch (data)
        // case 
        if (filtr == "Неисполненные")
        {
           
            this.ObjectDataSourceDocFiltr.SelectParameters["id_sotrudnik"].DefaultValue = id_sotrudnik;
            


            try
            {
                data = ObjectDataSourceDocFiltr.Select();
            }
            catch (Exception ex)
            {
                LabelError.Visible = true;
                LabelError.Text = ex.Message;
                return;
            }
        }else
        {
            this.ObjectDataSourceDoc.SelectParameters["begin_date"].DefaultValue = begin_date;
            this.ObjectDataSourceDoc.SelectParameters["end_date"].DefaultValue = end_date;
            this.ObjectDataSourceDoc.SelectParameters["top"].DefaultValue = top;
            this.ObjectDataSourceDoc.SelectParameters["id_sotrudnik"].DefaultValue = id_sotrudnik;
            this.ObjectDataSourceDoc.SelectParameters["id_sotrudnik_control"].DefaultValue = id_sotrudnik_control;


            try
            {
                data = ObjectDataSourceDoc.Select();
            }
            catch (Exception ex)
            {
                LabelError.Visible = true;
                LabelError.Text = ex.Message;
                return;
            }
        }

        GridView1.DataSource = data;
        GridView1.DataBind();

    }




    protected void ButtonFind_Click(object sender, EventArgs e)
    {
       
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string type_users = "";

        if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_ADMIN)) type_users = "admin";
        if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_GUEST)) type_users = "guest";
        if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_USER)) type_users = "user";

        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            
           
        }
        if ((e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate)) || (e.Row.RowState == DataControlRowState.Edit))
        {
        }
    }


    protected void DropDownListUser_work_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownListGroupQuery_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["id_otdel2"] = DropDownListOtdel2.SelectedValue.ToString();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["id_otdel"] = DropDownListOtdel1.SelectedValue.ToString();
    }
    protected void ButtonInsertDoc_Click(object sender, EventArgs e)
    {
        //Подготовка уникального номера
        //String items_str = System.Guid.NewGuid().ToString();
        //Session["items"] = items_str;
        //
        String number_in_doc=this.TextBoxNumber_in_doc.Text;
	    String number_out_doc="";
	    String avtor_send_doc=LabelUserAdd_doc.Text;
        String tema=TextBoxTema.Text;
	    String delo="";
	    String vid_doc="";
	    String date_reg= TextBoxDateReg.Text;
	    String time_reg= DateTime.Now.ToShortTimeString();
	    String date_control=TextBoxDate_control.Text;
	    String time_control=DropDownListHours.SelectedValue.ToString() + ":" + DropDownListMinutes.SelectedValue.ToString();
	    String date_ready="";
	    String time_ready="";
        String date_in="";
        String date_out="";
	    String user_add_doc=ViewState["full_name"].ToString();
	    String user_work=DropDownListUser_work.SelectedItem.Text;
        int id_sotrudnik_work = Convert.ToInt32(DropDownListUser_work.SelectedValue.ToString());
	    String user_control=DropDownListUser_control.SelectedItem.Text;
	    String status_doc= "В работу";
	    String comments="";
        String items = System.Guid.NewGuid().ToString();
        int number_poruchenie = -1;
	    int prioritet=1;
        String prioritet_str="низкая";
        int id_sotrudnik_control = Convert.ToInt32(DropDownListUser_control.SelectedValue.ToString());
        int id_groupQuery = Convert.ToInt16(DropDownListGroupQuery.SelectedValue.ToString());
        int id_sotrudnik_executive = Convert.ToInt32(DropDownListExecutive.SelectedValue.ToString()); 
        string docs_links="";

        Doc objDoc = new Doc();
        try
        {
            objDoc.InsertDoc
            (
                number_in_doc,
                 number_out_doc,
                 avtor_send_doc,
                 tema,
                 delo,
                 vid_doc,
                 date_reg,
                 time_reg,
                 date_control,
                 time_control,
                 date_ready,
                 time_ready,
                 date_in,
                 date_out,
                 user_add_doc,
                 user_work,
                 user_control,
                 status_doc,
                 comments,
                 items,
                 prioritet,
                 prioritet_str,
                 id_sotrudnik_work,
                 id_sotrudnik_control,
                 id_groupQuery,
                 id_sotrudnik_executive,
                 docs_links


            );
        }
        catch
        {
            LabelError.Visible = true;
            LabelError.Text = "Ошибка добавления документа";
            return;
        }

        //Загрузка файла на сервер

        int fileLength = this.FileUpload2.PostedFile.ContentLength;
        string fileName = "";

        if (fileLength != 0)
        {

            fileName = Path.GetFileName(FileUpload2.PostedFile.FileName);

            string destDir = Server.MapPath(pathCatalog);

            int countLength = fileName.Length;
            int indexPoint = fileName.LastIndexOf(".");
            string fileNameRashirenie = fileName.Substring(indexPoint + 1);

                //Получение уникального имени файла

                string fileGUIDNames = items + "." + fileNameRashirenie;
                string filePath = Path.Combine(destDir, fileGUIDNames);

                string fileType = FileUpload2.PostedFile.ContentType;
                string fileDate = DateTime.Now.ToShortDateString();
                string fileComments = "";

                //Сохраняем данные в БД

                try
                {
                    Files objFiles = new Files();
                    objFiles.FilesInsert
                        (
                               fileName,
                               fileGUIDNames,
                               fileLength,
                               filePath,
                               fileType,
                               fileDate,
                               fileComments,
                               items

                        );

                    
                    //Загружаем файл на сервер
                    FileUpload2.PostedFile.SaveAs(filePath);
                }
                catch
                {
                    LabelError.Visible = true;
                    LabelError.Text = "Ошибка добавления файла! Внимание файл не добавлен!";
                    return;
                }
 
        }


        BindGrid();
        
    }
    protected void ButtonGroup_Click(object sender, EventArgs e)
    {

    }
    protected void ObjectDataSourceDoc_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        
    }
    protected void ObjectDataSourceDoc_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
    protected void CheckBoxStatus_doc_CheckedChanged(object sender, EventArgs e)
    {


    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        String type_users = "";

        int intStatus_under_type = 0;


        if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_ADMIN)) type_users = "admin";
        if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_GUEST)) type_users = "guest";
        if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_USER)) type_users = "user";


        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            try
            {

                intStatus_under_type = Convert.ToInt16(((Label)e.Row.FindControl("LabelItemStatus_under_type")).Text);
            }
            catch
            {

            }


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
                LabelError.Visible = true;
                LabelError.Text = "НЕ КОРРЕКТНОЕ ВРЕМЯ КОНТРОЛЯ (ПОЛЕ: СРОК ИСПОЛ.)!!! Необходимо внести правильное значение!";

            }

           
            DateTime currentDate = DateTime.Now;

            string strFileGUIDNames = ((Label)e.Row.FindControl("LabelItemFileGUIDNames")).Text;
            string strFilePath = ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl;

            ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl = Path.Combine("./../Upload/Doc/2013", strFileGUIDNames);


            string strFileGUIDNames2 = ((Label)e.Row.FindControl("LabelItemFileGUIDNames2")).Text;
            string strFilePath2 = ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath2")).NavigateUrl;

            ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath2")).NavigateUrl = Path.Combine("./../Upload/Doc/2013", strFileGUIDNames2);


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


            //Выделение текущей задачи или задачи по запросу с email
            /*if (ViewState["items_select"].ToString() != "")
            {
                if (((Label)e.Row.FindControl("LabelItemItems")).Text == ViewState["items_select"].ToString())
                {
                    e.Row.Focus();
                    e.Row.BackColor = System.Drawing.Color.Yellow;

                }

            }*/


        }
        if ((e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate)) || (e.Row.RowState == DataControlRowState.Edit))
        {



            String status = ((Label)e.Row.FindControl("LabelEditStatus_doc")).Text;

           

            string fileNames = ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFilesEdit")).AlternateText;
            string fileNames2 = ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFilesEdit2")).AlternateText;
           

            if (fileNames == "")
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFilesEdit")).Visible = false;
                
            }
            if (fileNames2 == "")
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFilesEdit2")).Visible = false;
                
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
    protected void ObjectDataSourceDoc_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        // The GridView passes the ID of the employee
        // to be deleted. However, the buisiness object, EmployeeLogic,
        // requires a NorthwindEmployee parameter, named "ne". Create
        // it now and add it to the parameters collection.
        IDictionary paramsFromPage = e.InputParameters;
        int id_doc = Convert.ToInt16(paramsFromPage["id_doc"].ToString());
        int id_doc_sotrudnik = Convert.ToInt16(paramsFromPage["id_doc_sotrudnik"].ToString());

        if (paramsFromPage["id_doc"] != null)
        {
            //Doc ne
              //= new Doc(Int32.Parse(paramsFromPage["id_doc"].ToString()));
            // Remove the old EmpID parameter.
            Doc objDoc = new Doc();
            objDoc.DocDelete(id_doc, id_doc_sotrudnik);
            paramsFromPage.Clear();
            //paramsFromPage.Add("ne", ne);
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
                    return;
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

                        //Удаление файла из базы

                        objFiles.FilesItemsDelete(items);
                    }
                    catch
                    {

                    }
                }
            }
        }
        catch (Exception ex)
        {
            LabelError.Text = ex.Message;
            LabelError.Visible = true;

        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id_doc = (int)e.Keys[0];
        int id_docs_sotrudnik = (int)e.Keys[1];

        Doc objDoc = new Doc();
        objDoc.DocDelete(id_doc, id_docs_sotrudnik);

        BindGrid();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        
        BindGrid();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        int id_doc = Int32.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());



        //int id_doc= Convert.ToInt16(((TextBox)row.FindControl("TextBoxEditNumber_in_doc")).Text);
        String number_in_doc = ((TextBox)row.FindControl("TextBoxEditNumber_in_doc")).Text; ;
	    String tema= ((TextBox)row.FindControl("TextBoxEditTema")).Text;
	    String date_reg= ((TextBox)row.FindControl("TextBoxEditDate_reg")).Text;
	    String date_control= ((TextBox)row.FindControl("TextBoxEditDate_control")).Text;
	    String date_ready="";
	    String time_ready="";
	    String user_add_doc="";
	    String status_doc="";
	    String comments ="";
	    int id_sotrudnik_control = Convert.ToInt16(((DropDownList)row.FindControl("DropDownListFull_name_control")).SelectedValue);
	    int id_docs_sotrudnik= Convert.ToInt16(((Label)row.FindControl("LabelItemId_docs_sotrudnik")).Text);
	    int status_under_type= Convert.ToInt16(((DropDownList)row.FindControl("DropDownListEditStatus_under_type")).SelectedValue);
        String items_under_type = ((Label)row.FindControl("LabelItemEdit_under_type")).Text;
	    int id_sotrudnik = Convert.ToInt16(((DropDownList)row.FindControl("DropDownListEditFull_name")).SelectedValue);
	    String comments_under_type= ((TextBox)row.FindControl("TextBoxEditComments_under_type")).Text;
	    int id_sotrudnik_executive = Convert.ToInt16(((DropDownList)row.FindControl("DropDownListFull_name_executive")).SelectedValue);
	    String docs_links="";
           
        Doc objDoc = new Doc();
        objDoc.UpdateDoc
        (
              id_doc,
	         number_in_doc,
	         tema,
	         date_reg,
	         date_control,
	         date_ready,
	         time_ready,
	         user_add_doc,
	         status_doc,
	         comments,
	         id_sotrudnik_control,
	         id_docs_sotrudnik,
	         status_under_type,
	         items_under_type,
	         id_sotrudnik,
	         comments_under_type,
	         id_sotrudnik_executive,
	         docs_links
        );

        GridView1.EditIndex = -1;
        BindGrid();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        GridView1.EditIndex = -1;

        BindGrid();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
    
    protected void FiltrDD_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

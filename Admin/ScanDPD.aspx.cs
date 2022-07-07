using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ScanDPD : System.Web.UI.Page
{
    protected string name_page = "Сканирование ДПД";
    string pathFile = "./../Upload/ScanDPD";
    protected int  row_total = 0;
    public static SqlConnection con;
    private float sum_total = 0;



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String login = Request.Cookies["loginFGU59"].Value;
            int id_users = Convert.ToInt32(Request.Cookies["id_userFGU59"].Value);
            ViewState["id_users"] = id_users;

            Users objUsers = new Users();
            SqlDataReader readerUsers = objUsers.SelectLogonRoles(id_users);
            String user_logon = "", name_roles = "", name_otdel = "", id_sotrudnik = "", id_otdel = "";
            try
            {
                readerUsers.Read();
                //Полное имя пользователя
                user_logon = readerUsers["full_name"].ToString();
                ViewState["user_logon"] = user_logon;
                //Роль
                name_roles = readerUsers["name_roles"].ToString();
                ViewState["name_roles"] = name_roles;
                //Отдел
                name_otdel = readerUsers["name_otdel"].ToString();
                ViewState["name_otdel"] = name_otdel;
                id_otdel = readerUsers["id_otdel"].ToString();

                ViewState["id_otdel"] = id_otdel;
                ViewState["id_otdel2"] = id_otdel;

                //Электронный адрес пользователя
                String email = "";//readerUsers["email"].ToString();
                ViewState["email"] = email;
                //Электронный адрес пользователя
                id_sotrudnik = readerUsers["id_sotrudnik"].ToString();
                ViewState["id_sotrudnik"] = id_sotrudnik;

                //TextBoxDate_add.Enabled = true;
                //TextBoxDate_add.Text = DateTime.Now.ToString(); 

                ViewState["ConnectionString"] = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"].ConnectionString;

            }
            catch
            {
                return;
            }
            finally
            {
                readerUsers.Close();
            }
            Master.header = name_page;

            TextBoxDate1_Filtr.Text = TextBoxDate1_Filtr.Text = DateTime.Now.AddMonths(-1).ToString();
            TextBoxDate2_Filtr.Text = DateTime.Now.ToString();

        }

        GridView1.AllowPaging = true;

        StatusAlert.Visible = false;
        LabelStatus.Visible = false;
    }

    protected void StatusMessage(string type_message, string text_info, Exception ex)
    {

        switch (type_message)
        {
            case "info":
                StatusAlert.Attributes.Add("class", "alert alert-success alert-dismissible");
                StatusAlert.Visible = true;

                LabelStatus.CssClass = "alert alert-success";
                LabelStatus.Visible = true;
                LabelStatus.Text = text_info;
                break;
            case "error":
                StatusAlert.Attributes.Add("class", "alert alert-danger alert-dismissible");
                StatusAlert.Visible = true;

                LabelStatus.CssClass = "alert alert-danger";
                LabelStatus.Visible = true;
                LabelStatus.Text = "ОШИБКА! Обратитесь к разработчику. Зеленин.А.П. IP 2205. Запись не добавлена или добавлена некорректно. " + ex.Message.ToString();
                break;
            case "error_custom":
                StatusAlert.Attributes.Add("class", "alert alert-danger alert-dismissible");
                StatusAlert.Visible = true;

                LabelStatus.CssClass = "alert alert-danger";
                LabelStatus.Visible = true;
                LabelStatus.Text = text_info;
                break;
        }


    }

    protected void LinkButtonInsert_Click(object sender, EventArgs e)
    {
        string kn = TextBoxKad_number.Text;
        if (FindKNinDB(kn))
        {
            StatusMessage("error_custom", "Такой номер уже есть в базе. Запись не добавлена!", null);
            return;
        }


        SqlDataSourceScanDPD.Insert();
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        //
        if (row != null)
        {

           

        }
    }

    protected void LinkButtonReset_Click(object sender, EventArgs e)
    {
        TextBoxSearch.Text = string.Empty;
        TextBoxDate1_Filtr.Text= string.Empty;
        TextBoxDate2_Filtr.Text = string.Empty;
    }

    protected void LinkButtonSearch_Click(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
    }
    /// <summary>
    /// 
    /// </summary>
    /// 
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void ImageButtonExcel_Click1(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;

        Response.AddHeader("content-disposition",
         "attachment;filename=GridViewExport.xls");
        Response.Charset = "utf-16";
        Response.ContentType = "application /vnd.ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);

        GridView1.AllowPaging = false;
        //BindGrid();
        GridView1.DataBind();

        //Change the Header Row back to white color
        GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");
        GridView1.HeaderRow.Visible = false;
        DataControlFieldCollection objCol = GridView1.Columns;

        GridViewRowCollection row = GridView1.Rows;

        GridView1.RenderControl(hw);

        //style to format numbers to string
        string style = @"<style> .textmode { mso-number-format:\@; } </style>";
        Response.Write(style);
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
    }

    protected void ImageButtonWord_Click1(object sender, EventArgs e)
    {
        //int id = Convert.ToInt16(((Label)GridView1.SelectedRow.FindControl("LabelItemId_otuti_journal")).Text);
        //items = ((Label)GridView1.SelectedRow.FindControl("LabelItemItems")).Text;

        //GetDoc();

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.doc");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-word ";
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);

        //BindGrid();
        GridView1.AllowPaging = false;
        GridView1.DataBind();

        GridView1.RenderControl(hw);
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
    }

    /// <summary>
    /// Первоначальная загрузка файла
    /// </summary>
    /// <param name="FileUpload"></param>
    /// <param name="items"></param>
    private void FileLoad(FileUpload FileUpload, String items)
    {
        int fileLength = 0;
        try
        {
            fileLength = FileUpload.PostedFile.ContentLength;
        }
        catch
        {
        }

        Files objFiles = new Files();

        if (fileLength != 0)
        {


            string fileName = Path.GetFileName(FileUpload.PostedFile.FileName);
            string destDir = Server.MapPath(pathFile);
            int countLength = Path.GetFileName(FileUpload.PostedFile.FileName).Length;
            int indexPoint = fileName.LastIndexOf(".");

            string fileNameRashirenie = Path.GetFileName(fileName.Substring(indexPoint + 1));
            string fileNames = fileName;// +"." + fileNameRashirenie;

            //Получение уникального имени файла

            string fileGUIDNames = items + "." + fileNameRashirenie;
            string filePath = Path.Combine(destDir, fileGUIDNames);

            string fileType = FileUpload.PostedFile.ContentType;
            string fileDate = DateTime.Now.ToShortDateString();
            string fileComments = "";

            //Сохраняем данные в БД



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

            //Загружаем файл на сервер
            FileUpload.PostedFile.SaveAs(filePath);
        }
    }
    /// <summary>
    /// Загрузка файла из события GridViewUpdating
    /// </summary>
    /// <param name="e"></param>
    /// <param name="checkBoxFileDelete"></param>
    /// <param name="FileUpload"></param>
    /// <param name="items"></param>
    /// <param name="fileNamesLoad"></param>
    /// <param name="name_items"></param>
    private void FileLoad(Files objFiles, GridViewUpdateEventArgs e, CheckBox checkBoxFileDelete, FileUpload FileUpload, String items, String fileNamesLoad, String name_items)
    {
        int fileLength = 0;
        try
        {
            fileLength = FileUpload.PostedFile.ContentLength;
        }
        catch
        {
            return;
        }

        if (fileLength != 0)
        {
            if (items == "" || items==null)
            {
                items = System.Guid.NewGuid().ToString();
                e.NewValues.Remove(name_items); e.OldValues.Remove(name_items);
                e.NewValues.Add(name_items, items);
            }

            string fileName = Path.GetFileName(FileUpload.PostedFile.FileName);
            string destDir = Server.MapPath(pathFile);
            int countLength = Path.GetFileName(FileUpload.PostedFile.FileName).Length;
            int indexPoint = fileName.LastIndexOf(".");

            string fileNameRashirenie = Path.GetFileName(fileName.Substring(indexPoint + 1));
            string fileNames = fileName;// +"." + fileNameRashirenie;

            //Получение уникального имени файла

            string fileGUIDNames = items + "." + fileNameRashirenie;
            string filePath = Path.Combine(destDir, fileGUIDNames);

            string fileType = FileUpload.PostedFile.ContentType;
            string fileDate = DateTime.Now.ToShortDateString();
            string fileComments = "";

            //Сохраняем данные в БД
            
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
           
            //Загружаем файл на сервер
            FileUpload.PostedFile.SaveAs(filePath);
        }
    }

    private void FileDelete(Files objFiles, String items, GridViewUpdateEventArgs e)
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
                // LabelError.Text = ex.Message;
                // LabelError.Visible = true;
                e.Cancel = true;
            }
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            float currentSum = 0f;
            if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_ADMIN))
            {
                ((LinkButton)e.Row.FindControl("LinkButtonDelete")).Visible = true;
               // ((LinkButton)e.Row.FindControl("LinkButtonEdit")).Visible = true;
            }
            else
            {
                ((LinkButton)e.Row.FindControl("LinkButtonDelete")).Visible = false;
               // ((LinkButton)e.Row.FindControl("LinkButtonEdit")).Visible = false;
            }

            //Кол-во строк
            row_total++;

            ((Label)e.Row.FindControl("LabelItemRow")).Text = row_total.ToString();

            //Сумма
            //Label LabelEditCounterReadingAll = (Label)e.Row.FindControl("LabelEditCounterReadingAll");
            //ИТОГО
            //Label LabelItemTotal_sum = (Label)e.Row.FindControl("LabelItemTotal_sum");
            //if (LabelEditCounterReadingAll.Text != "" && LabelEditCounterReadingAll.Text != "0")
            //{
            //    if (float.TryParse(LabelEditCounterReadingAll.Text, out currentSum))
            //    { sum_total +=  (currentSum);} 
            //    else if (float.TryParse(LabelEditCounterReadingAll.Text.Replace(",","."), out currentSum))
            //    { sum_total += (currentSum); }
            //}
            //else
            //{
            //    if (LabelItemSum_pay.Text != "" && LabelItemSum_pay.Text != "0")
            //        sum_total = sum_total + Convert.ToInt32(LabelItemSum_pay.Text);
            //}
        }
        //if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Edit) || (e.Row.RowState == DataControlRowState.Alternate))
        //{
           // DropDownList DropDownListEditStatus_install = (DropDownList)e.Row.FindControl("DropDownListEditStatus_install");
            //CheckBoxItemAgreed_install
            //DropDownListEditStatus_install.Enabled = CheckBoxItemAgreed_install.Checked ? true : false;
        //}
        if (e.Row.RowType == DataControlRowType.Footer && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            //Кол-во строк
            //Label LabelCountRow = ((Label)e.Row.FindControl("LabelCountRow"));
            //LabelCountRow.Text = row_total.ToString();

            ////Сумма
            //Label LabelTotalSum = ((Label)e.Row.FindControl("LabelTotalSum"));
            //LabelTotalSum.Text = sum_total.ToString();

        }
    }

    protected void LinkButtonReport_Click(object sender, EventArgs e)
    {
        string selected_num = DropDownListReport.SelectedValue;
        switch (selected_num)
        {
            case "1":
                Response.Redirect("http://10.59.143.15/portalfgu59/Admin/Paper_report.aspx?id=84");
                break;
            case "2":
                Response.Redirect("http://10.59.143.15/portalfgu59/Admin/Paper_report.aspx?id=92");
                break;
            case "3":
                Response.Redirect("http://10.59.143.15/portalfgu59/Admin/Paper_report.aspx?id=102");
                break;
            case "4":
                Response.Redirect("http://10.59.143.15/portalfgu59/Admin/Paper_report2.aspx?id=98");
                break;
            case "5":
                Response.Redirect("http://10.59.143.15/portalfgu59/Admin/Paper_report.aspx?id=99");
                break;
            case "6":
                Response.Redirect("http://10.59.143.15/portalfgu59/Admin/Paper_report.aspx?id=103");
                break;
            case "7":
                Response.Redirect("http://10.59.143.15/portalfgu59/Admin/Paper_report2.aspx?id=105");
                break;
            case "8":
                Response.Redirect("http://10.59.143.15/portalfgu59/Admin/Paper_report.aspx?id=104");
                break;
        }
    }


    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      
    }
  

    protected void GridViewDop_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {

            if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_ADMIN))
            {
                ((LinkButton)e.Row.FindControl("LinkButtonDelete")).Visible = true;
            }
            else
            {
                ((LinkButton)e.Row.FindControl("LinkButtonDelete")).Visible = false;
            }

            //Отображение 1 файла

            string fileNames = ((Label)e.Row.FindControl("LabelItemFileGUIDNames")).Text;
            string items = ((Label)e.Row.FindControl("LabelItemItems")).Text;
            if (fileNames == "")
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFilesItem")).Visible = false;
                ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).Visible = false;
            }
            string strFileGUIDNames = ((Label)e.Row.FindControl("LabelItemFileGUIDNames")).Text;
            string strFilePath = ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl;
            ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl = Path.Combine(pathFile, strFileGUIDNames);



            //Отображение 2 файла

            string fileNames2 = ((Label)e.Row.FindControl("LabelItemFileGUIDNames2")).Text;
            string itemsError = ((Label)e.Row.FindControl("LabelItemitemsError")).Text;
            if (fileNames2 == "")
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFilesItem2")).Visible = false;
                ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath2")).Visible = false;
            }
            string strFileGUIDNames2 = ((Label)e.Row.FindControl("LabelItemFileGUIDNames2")).Text;
            string strFilePath2 = ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath2")).NavigateUrl;
            ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath2")).NavigateUrl = Path.Combine(pathFile, strFileGUIDNames2);

            //Кол-во строк
            //row_total++;

            //Сумма
            //Label LabelItemSum_pay = (Label)e.Row.FindControl("LabelItemSum_pay");
            //ИТОГО
            //Label LabelItemTotal_sum = (Label)e.Row.FindControl("LabelItemTotal_sum");
            //if (LabelItemTotal_sum.Text != "" && LabelItemTotal_sum.Text != "0")
            //{
            //    sum_total = sum_total + Convert.ToInt32(LabelItemTotal_sum.Text);
            //}
            //else
            //{
            //    if (LabelItemSum_pay.Text != "" && LabelItemSum_pay.Text != "0")
            //        sum_total = sum_total + Convert.ToInt32(LabelItemSum_pay.Text);
            //}
        }
        
        if (e.Row.RowType == DataControlRowType.Footer && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            //Кол-во строк
            //Label LabelCountRow = ((Label)e.Row.FindControl("LabelCountRow"));
            //LabelCountRow.Text = row_total.ToString();

            ////Сумма
            //Label LabelTotalSum = ((Label)e.Row.FindControl("LabelTotalSum"));
            //LabelTotalSum.Text = sum_total.ToString();

        }
    }




    protected void SqlDataSourceEnergoControl_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Cancel = false;
        try
        {
           

            e.Command.Parameters["@Kad_number"].Value = TextBoxKad_number.Text;

            e.Command.Parameters["@V_sheets"].Value = TextBoxV_sheets.Text;
            e.Command.Parameters["@v_volume"].Value = TextBoxV_volume.Text;
            e.Command.Parameters["@v_pages"].Value = TextBoxV_pages.Text;
            e.Command.Parameters["@Comments"].Value = TextBoxComments.Text!=String.Empty? TextBoxComments.Text : " ";
            e.Command.Parameters["@status_load_archive"].Value = "не загружено";
            e.Command.Parameters["@date_insert"].Value = Utilites.ConvertDate(DateTime.Now.ToString());
            e.Command.Parameters["@id_sotrudnik"].Value = ViewState["id_sotrudnik"].ToString();
            e.Command.Parameters["@id_otdel"].Value = ViewState["id_otdel"].ToString();
            e.Command.Parameters["@operator"].Value = ViewState["user_logon"].ToString();

            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            StatusMessage("error","",ex);
        }
    }

    protected bool FindKNinDB(string kad_number)
    {
        int count_kn = 0, kn = 0;
        string str_request = @"SELECT count(*) 'count_kn' FROM portalFGU59.dbo.ScanDPD  where kad_number=@kad_number";

        using (var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"].ConnectionString))
        {
            var sqlCmd = new SqlCommand(str_request, sqlConn);
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.Parameters.AddWithValue("@kad_number", kad_number);
            try
            {
                sqlConn.Open();
                SqlDataReader readerData = sqlCmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (readerData.HasRows)
                {
                    readerData.Read();
                    count_kn = Convert.ToInt16(readerData["count_kn"].ToString());
                }
                readerData.Close();
                sqlConn.Close();
            }
            catch (Exception ex)
            {
                StatusMessage("error", "", ex);
            }
        }

        return count_kn > 0 ? true : false;
    }



    
}


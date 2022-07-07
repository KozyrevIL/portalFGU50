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
using Obout.Ajax.UI;

public partial class Admin_smi : System.Web.UI.Page
{
    public bool have_file, have_images;
    public string id_item;
    public byte[] images;
    public String name_images;
    public String type_images;
    public int size_images;

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
            //Электронный адрес пользователя
            String email = "";//readerUsers["email"].ToString();
            ViewState["email"] = email;
            //Электронный адрес пользователя
            String id_sotrudnik = readerUsers["id_sotrudnik"].ToString();
            ViewState["id_sotrudnik"] = id_sotrudnik;

            readerUsers.Close();


           //Admin_banner1.user_logon = user_logon;

            String[] names = user_logon.Split();
            String last_name = names[0];
            ViewState["last_name"] = last_name;
            //LabelUserAdd_doc.Text = last_name;


        }
    }
    
   
    
   
    protected void ButtonInsertNews_Click(object sender, EventArgs e)
    {
        

        //Загрузка файла на сервер

        

        String items = Guid.NewGuid().ToString();
        ViewState["items"] = items;

        // Подгрузка файла на сервер

        int fileLength = FileUploadFile.PostedFile.ContentLength;

        if (fileLength != 0)
        {
            have_file = true;

            string fileName = Path.GetFileName(FileUploadFile.PostedFile.FileName);
            string destDir = Server.MapPath("./../Upload/News");

            int countLength = fileName.Length;
            int indexPoint = fileName.LastIndexOf(".");
            string fileNameRashirenie = fileName.Substring(indexPoint + 1);

            /*if (fileNameRashirenie == "docx" || fileNameRashirenie == "doc" || fileNameRashirenie == "xls"
                || fileNameRashirenie == "xlsx" || fileNameRashirenie == "pdf" || fileNameRashirenie == "rar"
                || fileNameRashirenie == "zip" || fileNameRashirenie == "txt" || fileNameRashirenie == "jpg" 
                || fileNameRashirenie == "gif" || fileNameRashirenie == "rtf")
            {*/

                //Получение уникального имени файла

                string fileGUIDNames = items + "." + fileNameRashirenie;
                string filePath = Path.Combine(destDir, fileGUIDNames);

                string fileType = FileUploadFile.PostedFile.ContentType;
                string fileDate = DateTime.Now.ToShortDateString();
                string fileComments = "";

                //Сохраняем данные в БД

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

                Session["have_file"] = true;

                //Загружаем файл на сервер
                FileUploadFile.PostedFile.SaveAs(filePath);
           // }
           // else
           // {
               // LabelError.Visible = true;
               // LabelError.Text = "Не корректное расширение файла";
           // }
        }
        // конец блока подгрузки файла
        // Подгрузка изображения на сервер
        int fileLengthImg = FileUploadImage.PostedFile.ContentLength;
        if (fileLengthImg>0)
        try
        {
            //ID фото----------------------
            String id_item = items;
            String item = "doska";
            //-----------------------------
            byte[] images;
            String name_images;
            String type_images;
            int size_images;
            String alt_images = "";

            type_images = this.FileUploadImage.PostedFile.ContentType;
            size_images = FileUploadImage.PostedFile.ContentLength;
            images = new byte[size_images];

            FileUploadImage.PostedFile.InputStream.Read(images, 0, size_images);
            int indexOfSlash = FileUploadImage.PostedFile.FileName.LastIndexOf("\\") + 1;

            name_images = FileUploadImage.PostedFile.FileName.Substring(indexOfSlash);


            Images objImages = new Images();
            objImages.ImagesInsert
            (
                id_item,
                item,
                images,
                name_images,
                type_images,
                size_images,
                alt_images
            );

            have_images = true;
        }
        catch (Exception ex)
        {
            LabelError.Text = ex.Message;
            LabelError.Visible = true;
            
        }
        // конец блока подгрузки изображения
        try
        {
            SqlDataSourceNews.Insert();
             GridView1.DataBind();
        }
        catch (Exception ex)
        {
            LabelError.Text = ex.Message;
            LabelError.Visible = true;
            
        }
       
        
    }
    protected void SqlDataSourceSmi_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Cancel = false;
        try
        {
            String items = ViewState["items"].ToString();

            e.Command.Parameters["@id_sotrudnik"].Value = Convert.ToInt16(ViewState["id_sotrudnik"].ToString());
            e.Command.Parameters["@prioritet_news"].Value = 1;
            e.Command.Parameters["@header_news"].Value = TextBoxHeader_news.Text;
            e.Command.Parameters["@text_news"].Value = TextBoxEditor.Text;// Editor5.Content;
            e.Command.Parameters["@date_news"].Value = DateTime.Now.ToShortDateString();
            e.Command.Parameters["@time_news"].Value = DateTime.Now.ToShortTimeString();
            e.Command.Parameters["@have_file"].Value = have_file;
            e.Command.Parameters["@path_file"].Value = "";

            e.Command.Parameters["@have_images"].Value = have_images;

            e.Command.Parameters["@type_news"].Value = 6; //поздравления
            e.Command.Parameters["@items"].Value = items;

            e.Command.Parameters["@text_news_short"].Value = TextBoxText_news_short.Text;


        }
        catch (Exception ex)
        {
            LabelError.Text = ex.Message;
            LabelError.Visible = true;
            e.Cancel = true;
        }

    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
           (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            String id_item = ((Label)e.Row.FindControl("LabelItemItems")).Text;
            String item = "image_low";
            int w = 70;
            int h = 70;
            
            if (((CheckBox)e.Row.FindControl("CheckBoxItemhave_images")).Checked == true)
            {
                ((Image)e.Row.FindControl("ImageCatalog")).ImageUrl = "./../photoDB.ashx?item=" + item + "&id_item=" + id_item + "&w=" + w + "&h=" + h;
            }
            else
            {
                ((Image)e.Row.FindControl("ImageCatalog")).Visible = false;
            }

            //показ файла

            string fileNames = ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFiles")).AlternateText;
            if (fileNames == "") { ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFiles")).Visible = false; }

            string strFileGUIDNames = ((Label)e.Row.FindControl("LabelItemFileGUIDNames")).Text;
            string strFilePath = ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl;

            ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl = Path.Combine("./../Upload/News", strFileGUIDNames);
            

            //string strStatus_doc = ((Label)e.Row.FindControl("LabelItemStatus_doc")).Text;

        }
        if ((e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
        {

            string text = ((TextBox)e.Row.FindControl("TextBoxEditorGrid")).Text;
            


            //string strEditor=((Label)e.Row.FindControl("LabelEditText_news")).Text;

            //((Obout.Ajax.UI.HTMLEditor.Editor)e.Row.FindControl("EditorGrid")).Content = strEditor;

            //e.Row.Cells[2].ColumnSpan = 3;

           
            //e.Row.Cells.RemoveAt(3);
            //e.Row.Cells.RemoveAt(3);
            //e.Row.Cells.RemoveAt(3);
           


        }

       
        
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String items = (e.CommandArgument.ToString());

        if (e.CommandName == "Delete")
        {

            String filePath = "";
            String fileNames = "";
            int fileLength=0;
            // String items = ViewState["items"].ToString();

            Files objFiles = new Files();
            SqlDataReader readerFiles = objFiles.FilesSelect(items);

           
            try
            { 
                readerFiles.Read();
            fileLength = Convert.ToInt32(readerFiles["fileLength"].ToString());

                if (fileLength != 0)
                {
                    filePath = readerFiles["filePath"].ToString();
                    fileNames = readerFiles["fileNames"].ToString();
                    //fileType = readerFiles["fileType"].ToString();
                    //fileLength = Convert.ToInt32(readerFiles["fileLength"].ToString());
                }
            }
            catch (Exception ex)
            {
                LabelError.Text = ex.Message;
                LabelError.Visible = true;
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
                catch (Exception ex)
                {
                    LabelError.Text = ex.Message;
                    LabelError.Visible = true;
                }
            }
        }
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        String filePath = "";
        String fileNames = "";
        String fileType = "";
        int fileLength = 0;

        String items = ((ImageButton)GridView1.SelectedRow.FindControl("ImageButtonFiles")).CommandArgument;

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
                LabelError.Text = ex.Message;
                LabelError.Visible = true;
                //e.Cancel = true;
            }
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        //Подгрузка текста

        // string text_news = ((Obout.Ajax.UI.HTMLEditor.Editor)(GridView1.Rows[e.RowIndex].FindControl("EditorGrid"))).Content;TextBoxEditorGrid //LabelEditPrioritet_news

        int prioritet_news=Convert.ToInt16(((Label)(GridView1.Rows[e.RowIndex].FindControl("LabelEditPrioritet_news"))).Text);

        e.OldValues.Remove("prioritet_news");
        e.NewValues.Remove("prioritet_news");
        e.NewValues.Add("prioritet_news", prioritet_news);

        string text_news = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBoxEditorGrid"))).Text;

        e.OldValues.Remove("text_news");
        e.NewValues.Remove("text_news");
        e.NewValues.Add("text_news", text_news);

        //Подгрузка изображения

        FileUpload FileUploadImg = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUploadImageDG");
        size_images = FileUploadImg.PostedFile.ContentLength;

        String id_item = ((Label)(GridView1.Rows[e.RowIndex].FindControl("LabelEditItemsFile"))).Text;
        String alt_images = "";

        String item = "doska";
        
        if (size_images!= 0)
        {

            type_images = FileUploadImg.PostedFile.ContentType;
            images = new byte[size_images];
            FileUploadImg.PostedFile.InputStream.Read(images, 0, size_images);
            int indexOfSlash = FileUploadImg.PostedFile.FileName.LastIndexOf("\\") + 1;
            name_images = FileUploadImg.PostedFile.FileName.Substring(indexOfSlash);
            Images objImg = new Images();

            objImg.ImagesUpdate
                (
                    id_item,
                    item,
                    images,
                    name_images,
                    type_images,
                    size_images,
                    alt_images
                );
        }
       

        //Конец блока редактирования изображения

        //Признак удаления файла

        CheckBox checkBoxFileDelete;
        checkBoxFileDelete = (CheckBox)(GridView1.Rows[e.RowIndex].FindControl("CheckBoxFileDelete"));

        e.OldValues.Remove("items");
        e.NewValues.Remove("items");
        
        e.OldValues.Remove("fileNames");
        e.NewValues.Remove("fileNames");
       

        //Загрузка файла на сервер

        FileUpload FileUpload = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUploadEdit");
        String items = ((Label)(GridView1.Rows[e.RowIndex].FindControl("LabelEditItemsFile"))).Text;
        String fileNamesLoad = ((Label)(GridView1.Rows[e.RowIndex].FindControl("LabelFileNames"))).Text;
        int fileLength = FileUpload.PostedFile.ContentLength;

        Files objFiles = new Files();

        if (checkBoxFileDelete.Checked == true || fileLength != 0)
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
                    LabelError.Text = ex.Message;
                    LabelError.Visible = true;
                    e.Cancel = true;
                }
            }
        }




        if (fileLength != 0)
        {

            string fileName = Path.GetFileName(FileUpload.PostedFile.FileName);
            string destDir = Server.MapPath("./../Upload/News");
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

            /*if (fileNamesLoad != "")
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
            {*/
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

            //}

            //Загружаем файл на сервер
            FileUpload.PostedFile.SaveAs(filePath);

        }

    }
    protected void SqlDataSourceNews_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            this.LabelError.Visible = true;
            this.LabelError.Text = "Ошибка при добавлении документа! Текст ошибки: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else
        {
            LabelError.ForeColor = System.Drawing.Color.DarkGreen;
            this.LabelError.Visible = true;
            this.LabelError.Text = "Документ успешно добавлен!";
        }
    }
    protected void SqlDataSourceNews_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            this.LabelError.Visible = true;
            this.LabelError.Text = "Ошибка при добавлении документа! Текст ошибки: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else
        {
            LabelError.ForeColor = System.Drawing.Color.DarkGreen;
            this.LabelError.Visible = true;
            this.LabelError.Text = "Документ успешно удален!";
        }
    }
}

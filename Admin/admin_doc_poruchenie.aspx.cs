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
            //DropDownListUser_add_doc.DataSource = SqlDataSourceSotrudnik;
            //DropDownListUser_add_doc.DataTextField = "last_name";
            //DropDownListUser_add_doc.DataValueField = "id_sotrudnik";
            //DropDownListUser_add_doc.DataBind();

            DropDownListUser_work.DataSource = SqlDataSourceForOtdel;
            DropDownListUser_work.DataTextField = "last_name";
            DropDownListUser_work.DataValueField = "id_sotrudnik";
            DropDownListUser_work.DataBind();

            // DropDownListUser_control.DataSource = SqlDataSourceForOtdel;
           // DropDownListUser_control.DataTextField = "last_name";
           // DropDownListUser_control.DataValueField = "id_sotrudnik";
           // DropDownListUser_control.DataBind();

            //ListItem objSotrudnik = new ListItem("Выбор", "-1");

            //DropDownListUser_add_doc.Items.Insert(0, objSotrudnik);
            //DropDownListUser_work.Items.Insert(0, objSotrudnik);
            //DropDownListUser_control.Items.Insert(0, objSotrudnik);


           // TextBoxDate_reg.Text = DateTime.Now.ToShortDateString();
           // TextBoxTime_reg.Text = DateTime.Now.ToShortTimeString();
           // TextBoxDate_control.Text = DateTime.Now.ToShortDateString();
           // TextBoxTime_control.Text = DateTime.Now.ToShortTimeString();

            //TextBoxDateIn.Text = DateTime.Now.ToShortDateString();
            //TextBoxDateOut.Text = DateTime.Now.ToShortDateString();

            TextBoxDate_ready.Text = "";
            TextBoxTime_ready.Text = "";
            ButtonInsertDoc.Text = "Добавить";

            //ClearFoms();

            ViewState["FindDoc"] = "0";
            ViewState["id_object_str"] = "-1";

            //PanelDataTimeReg.Visible = false;

            //Настройка фильтра вывода данных по дате

            String currentDate = DateTime.Now.ToShortDateString();

            //BindGrid(currentDate, currentDate);
              
           // GridView1.DataSource = dv;//ObjectDataSourceDocForDate;//SqlDataSourceDoc;
            //GridView1.DataKeyNames = "id_doc";
           // GridView1.DataBind();

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

            LabelUser_add.Text = last_name;
            //Выставляем ДД по индексу

            //DropDownList ddUser_add_doc;
            //ddUser_add_doc = DropDownListUser_add_doc;
            //int index = 0;
            //foreach (object objLast_name in ddUser_add_doc.Items)
            //{
                //if (objLast_name.ToString() == last_name) ddUser_add_doc.SelectedIndex = index;
                //index = index + 1;
            //}
            //-------------------------------------------------------
            //--Конец настройки текущего пользователя
            //-------------------------------------------------------
        }
        LabelError.Visible = false;


        
    }

    public void Send_email(String body_subject, String body, String to_email)
    {
       
        System.Web.Mail.MailMessage m = new System.Web.Mail.MailMessage();
        m.From = "portal@zkp.perm.ru";
        m.To = to_email;
        m.BodyFormat = System.Web.Mail.MailFormat.Html;
        m.BodyEncoding = System.Text.Encoding.GetEncoding("windows-1251");
        m.Subject = body_subject;
        m.Body = body;
        System.Web.Mail.SmtpMail.SmtpServer = "10.59.143.20";
        try
        {
            System.Web.Mail.SmtpMail.Send(m);
        }
        catch
        {
        }

    }
    /*public void BindGrid(String date_begin, String date_end)
    {
        DataSet ds = new DataSet();
        Doc objDoc = new Doc();
        DataView dv = objDoc.DocSelectForDate(date_begin, date_end);

        GridView1.DataSource = dv;

        GridView1.DataBind();
    }*/
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DateTime date_reg = Convert.ToDateTime(((Label)e.Row.FindControl("LabelItemDate_reg")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
            DateTime time_reg = Convert.ToDateTime(((Label)e.Row.FindControl("LabelItemTime_reg")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
            DateTime full_date_reg = Convert.ToDateTime((((Label)e.Row.FindControl("LabelItemDate_reg")).Text) + " " + (((Label)e.Row.FindControl("LabelItemTime_reg")).Text), System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);

            DateTime date_control = Convert.ToDateTime(((Label)e.Row.FindControl("LabelItemDate_control")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
            DateTime time_control = Convert.ToDateTime(((Label)e.Row.FindControl("LabelItemTime_control")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
            DateTime full_date_control = Convert.ToDateTime((((Label)e.Row.FindControl("LabelItemDate_control")).Text) + " " + (((Label)e.Row.FindControl("LabelItemTime_control")).Text), System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);

            DateTime currentDate = DateTime.Now;


            String strStatus_doc = ((Label)e.Row.FindControl("LabelItemStatus_doc")).Text;

            String dateOverTime = "";

            //Поиск документа по номеру
            if (ViewState["FindDoc"].ToString() == "1")
            {
                String findParament = DropDownListFindParametr.SelectedItem.Text;
                String findStr = "";

                switch (findParament)
                {
                    case "№ вх. док":
                        {
                            findStr = ((Label)e.Row.FindControl("LabelItemNumber_in_doc")).Text;
                            //countQuery = countQuery + 1;
                            break;
                        }
                    case "Исполнитель":
                        {
                            findStr = ((Label)e.Row.FindControl("LabelItemUser_work")).Text;
                            //countQuery = countQuery + 1;
                            break;
                        }
                    case "Контроль":
                        {
                            findStr = ((Label)e.Row.FindControl("LabelItemUser_control")).Text;
                            //
                            break;
                        }
                }
                if (findStr == TextBoxFindDoc.Text)
                {
                    e.Row.Visible = true;
                    countQuery = countQuery + 1;
                }
                else
                {
                    if (TextBoxFindDoc.Text != "") e.Row.Visible = false;
                }
                LabelCountQuery.Text = countQuery.ToString();
            }

            if (currentDate > full_date_control && strStatus_doc != "Исполнено")
            {

                e.Row.BackColor = Color.Tomato;
                e.Row.ForeColor = Color.White;

                dateOverTime = (currentDate.Subtract(full_date_control)).ToString().Substring(0, 8);

            }
            else
            {
                if (CheckBoxNoReadyDoc.Checked == true)
                {
                    e.Row.Visible = false;

                }

            }




            switch (strStatus_doc)
            {
                case "Исполнено":
                    {
                        e.Row.BackColor = Color.YellowGreen;
                        e.Row.ForeColor = Color.Black;
                        break;
                    }
                case "Для ознакомления":
                    {
                        e.Row.BackColor = Color.YellowGreen;
                        e.Row.ForeColor = Color.Black;
                        break;
                    }
            }


        }
    }
    protected void ClearFoms()
    {
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        String id_doc = ((Label)GridView1.SelectedRow.FindControl("LabelItemId_doc")).Text;
       
    }


    protected void ButtonInsertDoc_Click(object sender, EventArgs e)
    {
        int id_doc = 0;
        String number_in_doc = "";
        String number_out_doc = "";
        String avtor_send_doc = "";
        String tema = "";
        String delo = "";
        String vid_doc = "";
        String date_reg = "";
        String time_reg = "";
        String date_control = "";
        String time_control = "";
        String date_ready = "";
        String time_ready = "";
        String date_in = "";
        String date_out = "";
        String user_add_doc = "";
        String user_work = "";
        String user_control = "";
        String status_doc = "";
        String comments = "";
        int number_poruchenie = 0;
        int prioritet = 0;
        String prioritet_str = "";


        //Запрос номера поручения из таблицы Counts
        Counts objCounts = new Counts();
        String numerator = "";
        //String id_object_str = "";
        bool insertCounts = false;

        int counts = 0; //Текущий счетчик
        int countsInBD = 0; //Счетчик в базе

        try
        {
            counts = Convert.ToInt32(TextBoxNumber_in_doc.Text);
        }
        catch
        {
            counts = 1;
        }
        //numerator = DropDownListVid_doc.SelectedItem.ToString();
        //id_object_str = ViewState["id_object_str"].ToString();

        SqlDataReader objCountsReader = objCounts.SelectCounts(numerator, id_object_str);
        objCountsReader.Read();
        try
        {
            countsInBD = Convert.ToInt32(objCountsReader["counts"].ToString());
        }
        catch
        {
            insertCounts = true;
        }

        objCountsReader.Close();
        /*if (insertCounts)
        {
            objCounts.InsertCounts(counts, numerator, id_object_str);
        }
        else
        {
            objCounts.UpdateCounts(counts, numerator, id_object_str);
        }*/




        /*number_in_doc = TextBoxNumber_in_doc.Text;
        //number_out_doc = TextBoxNumber_out_doc.Text;
        avtor_send_doc = DropDownListAvtor_send_doc.SelectedItem.ToString();


        //delo = DropDownListDelo.SelectedValue.ToString();
        //vid_doc = DropDownListVid_doc.SelectedValue.ToString();
        date_reg = TextBoxDate_reg.Text;
        time_reg = TextBoxTime_reg.Text;
        date_control = TextBoxDate_control.Text;
        time_control = TextBoxTime_control.Text;
        date_ready = TextBoxDate_ready.Text;
        time_ready = TextBoxTime_ready.Text;
        //date_in = TextBoxDateIn.Text;
        //date_out = TextBoxDateOut.Text;

        //user_add_doc = DropDownListUser_add_doc.SelectedItem.ToString();
        //Разбиваем fullname
        user_work = DropDownListUser_work.SelectedItem.ToString();
        //user_control = DropDownListUser_control.SelectedItem.ToString();
        status_doc = DropDownListStatus.SelectedItem.ToString();
        comments = TextBoxComments.Text;
        prioritet = Convert.ToInt16(DropDownListPrioritet.SelectedValue.ToString());
        prioritet_str = DropDownListPrioritet.SelectedItem.ToString();
        //tema = DropDownListTema.SelectedItem.ToString();

        if (avtor_send_doc != "Выбор" && vid_doc != "Выбор" && status_doc != "Выбор" && tema!= "Выбор" &&
            user_add_doc != "Выбор" && user_work != "Выбор" && user_control != "Выбор" && prioritet != -1)
        {

            //Загрузка файла на сервер

            if (CheckBoxHave_file.Checked)
            {
                //Файл не пустой
                if (FileUpload2.PostedFile.ContentLength != 0)
                {
                    try
                    {
                        //Файл не более
                        // if (FileUpload2.PostedFile.ContentLength > 4000)
                        //{

                        // }
                        // else
                        // {
                        string destDir = Server.MapPath("./../Upload");
                        string fileNames = Path.GetFileName(FileUpload2.PostedFile.FileName);
                        //Получение уникального имени файла
                        string fileGUIDNames = GetGUID(fileNames);
                        string filePath = Path.Combine(destDir, fileGUIDNames);

                        //Сохраняем данные в БД
                        /*Files objFiles = new Files();
                        objFiles.FilesInsert
                            (
                                    
                            );*/

                        //Загружаем файл на сервер
                 /*       FileUpload2.PostedFile.SaveAs(filePath);
                        // }
                    }
                    catch
                    {
                    }
                }
                if (FileUpload1.PostedFile.ContentLength != 0)
                {
                    try
                    {
                        //Файл не более
                        // if (FileUpload2.PostedFile.ContentLength > 4000)
                        //{

                        // }
                        // else
                        // {
                        string destDir = Server.MapPath("./../Upload");
                        string fileNames = Path.GetFileName(FileUpload1.PostedFile.FileName);
                        string filePath = Path.Combine(destDir, fileNames);

                        //Сохраняем данные в БД
                        /*Files objFiles = new Files();
                        objFiles.FilesInsert
                            (
                                    
                            );

                        //Загружаем файл на сервер
                        FileUpload1.PostedFile.SaveAs(filePath);
                        // }
                    }
                    catch
                    {
                    }
                }
            }

            if (DropDownListTema.Text == "Другое")
            {
                FreeTextBoxTema.Visible = true;
                tema = FreeTextBoxTema.Text;
            }

            if (DropDownListTema.SelectedValue.ToString() == "Другое")
            {
                tema = FreeTextBoxTema.Text;
                FreeTextBoxTema.Visible = true;
            }
            else
            {
                tema = DropDownListTema.SelectedValue.ToString();
            }

            if (ButtonInsertDoc.Text != "Редактировать")
            {


                //Вставить счетчик
                //Работаем с таблицей счетчиков только в режиме вставки

                if (insertCounts)
                {
                    objCounts.InsertCounts(counts, numerator, id_object_str);
                }
                else
                {
                    objCounts.UpdateCounts(counts, numerator, id_object_str);
                }

                Doc objDoc = new Doc();

                //Подгружаем картинку
                //Маленькое фото
                if (CheckBoxHave_images.Checked == true)
                {
                    int id_item;
                    String item;
                    byte[] images;
                    String name_images;
                    String type_images;
                    int size_images;
                    String alt_images;

                    type_images = this.FileUploadImage.PostedFile.ContentType;
                    size_images = FileUploadImage.PostedFile.ContentLength;
                    images = new byte[size_images];

                    FileUploadImage.PostedFile.InputStream.Read(images, 0, size_images);
                    int indexOfSlash = FileUploadImage.PostedFile.FileName.LastIndexOf("\\") + 1;

                    name_images = FileUploadImage.PostedFile.FileName.Substring(indexOfSlash);

                    /*Images objImages = new Images();
                    objImages.ImagesInsert
                    (
                        id_item,
                        item,
                        images,
                        name_images,
                        type_images,
                        size_images,
                        alt_images
                    );*/
                /*    item = "Doc";
                    alt_images = name_images;

                    objDoc.InsertDocPlusImg
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
                        number_poruchenie,
                        prioritet,
                        prioritet_str,
                        item,
                        images,
                        name_images,
                        type_images,
                        size_images,
                        alt_images
                    );

                    //Формируем блок отправки данных на почтовые ящик
                    String body_post =

                       "<span style='font-family:Verdana; font-size: 14px; color:Gray'><b>Добавлена новая задача: </b>" + vid_doc + " N " + number_in_doc + "<br/><br/>  " +
                        " <b>автор:</b> " + avtor_send_doc + "<br/>" +
                        " <b>тема:</b> " + tema + "<br/>" +
                        " <b>документ добавил:</b> " + user_add_doc + "<br/>" +
                        " <b>исполнитель:</b> " + user_work + "<br/>" +
                        " <b>контроль:</b> " + user_control + "<br/>" +
                        " <b>приоритет:</b> " + prioritet_str + "<br/>" +
                        " <b>дата регистрации:</b> " + date_reg + "<b> время:</b> " + time_reg + "<br/>" +
                        " <b>дата контроля:</b> " + date_control + "<b> время:</b> " + time_control + "<br/></span>";
                }
                else
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
                        number_poruchenie,
                        prioritet,
                        prioritet_str
                    );

                    //Формируем блок отправки данных на почтовые ящик
                    String body_post =

                        "<span style='font-family:Verdana; font-size: 14px; color:Gray'><b>Добавлена новая задача: </b>" + vid_doc + " N " + number_in_doc + "<br/><br/>  " +
                        " <b>автор:</b> " + avtor_send_doc + "<br/>" +
                        " <b>тема:</b> " + tema + "<br/>" +
                        " <b>документ добавил:</b> " + user_add_doc + "<br/>" +
                        " <b>исполнитель:</b> " + user_work + "<br/>" +
                        " <b>контроль:</b> " + user_control + "<br/>" +
                        " <b>приоритет:</b> " + prioritet_str + "<br/>" +
                        " <b>дата регистрации:</b> " + date_reg + "<b> время:</b> " + time_reg + "<br/>" +
                        " <b>дата контроля:</b> " + date_control + "<b> время:</b> " + time_control + "<br/></span>";


                    Send_email("Портал ФГУ 59", body_post, "zelenin@zkp.perm.ru");
                    Send_email("Портал ФГУ 59", body_post, "osipov@zkp.perm.ru");
                }
            }
            else
            {
                //Обновить счетчик
                //objCounts.UpdateCounts(counts, numerator, id_object_str);

                id_doc = Convert.ToInt32(ViewState["id_doc"].ToString());
                Doc objDoc = new Doc();
                objDoc.UpdateDoc
                (
                    id_doc,
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
                    number_poruchenie,
                    prioritet,
                    prioritet_str
                );

                //Формируем блок отправки данных на почтовые ящик
                String body_post;

                if (status_doc == "Исполнено")
                {
                    body_post = "<span style='font-family:Verdana; font-size: 14px; color:Green'><b>Задача выполнена: </b>" + vid_doc + " N " + number_in_doc + "<br/><br/>  " +
                    " <b>автор:</b> " + avtor_send_doc + "<br/>" +
                    " <b>тема:</b> " + tema + "<br/>" +
                    " <b>документ добавил:</b> " + user_add_doc + "<br/>" +
                    " <b>исполнитель:</b> " + user_work + "<br/>" +
                    " <b>контроль:</b> " + user_control + "<br/>" +
                    " <b>приоритет:</b> " + prioritet_str + "<br/>" +
                    " <b>дата регистрации:</b> " + date_reg + "<b> время:</b> " + time_reg + "<br/>" +
                    " <b>дата контроля:</b> " + date_control + "<b> время:</b> " + time_control + "<br/>" +
                    " <b>дата исполнения:</b> " + date_ready + "<b> время:</b> " + time_ready + "<br/></span>"
                    ;
                }
                else
                {
                    body_post = "<span style='font-family:Verdana; font-size: 14px; color:Gray'><b>Изменение в задаче:</b> " + vid_doc + " N " + number_in_doc + "<br/><br/>  " +
                   " <b>автор:</b> " + avtor_send_doc + "<br/>" +
                   " <b>тема:</b> " + tema + "<br/>" +
                   " <b>документ добавил:</b> " + user_add_doc + "<br/>" +
                   " <b>исполнитель:</b> " + user_work + "<br/>" +
                   " <b>контроль:</b> " + user_control + "<br/>" +
                   " <b>приоритет:</b> " + prioritet_str + "<br/>" +
                   " <b>дата регистрации:</b> " + date_reg + "<b> время:</b> " + time_reg + "<br/>" +
                   " <b>дата контроля:</b> " + date_control + "<b> время:</b> " + time_control + "<br/></span>";
                }

                

                    


                Send_email("Портал ФГУ 59", body_post, "zelenin@zkp.perm.ru");
                Send_email("Портал ФГУ 59", body_post, "osipov@zkp.perm.ru");

            }
        }
        else
        {
            LabelError.Visible = true;
            LabelError.Text = "Ошибка заполнения формы!";
        }
        //Обновляем значение счетчика



        countsInBD = QueryCountsInBD(numerator, id_object_str);

        TextBoxNumber_in_doc.Text = (countsInBD + 1).ToString();
        GridView1.DataBind();

        ClearFoms();

        SelectDate("неделя");*/
       
    }
    /// <summary>
    /// Создание уникального имени файла
    /// </summary>
    /// <param name="currentFileName"></param>
    /// <returns></returns>
    private string GetGUID(string currentFileName)
    {
        string guidFileName = currentFileName + Guid.NewGuid().ToString();
        return guidFileName;
    }
    public int QueryCountsInBD(String numerator, String id)
    {
        //--------------------------------------------------
        //Запрос номера поручения из таблицы Counts
        Counts objCounts = new Counts();
        //String numerator = "";
        //String id_object_str = "";
        int counts = 0;
        //numerator = DropDownListVid_doc.SelectedItem.ToString();
        //id_object_str = DropDownListDelo.SelectedItem.ToString();

        SqlDataReader objCountsReader = objCounts.SelectCounts(numerator, id);
        objCountsReader.Read();
        try
        {
            counts = Convert.ToInt32(objCountsReader["counts"].ToString());

        }
        catch
        {
            counts = 0;
        }
        objCountsReader.Close();
        return counts;
    }
    
    public void selectElement(object obj)
    {

    }
    
    protected void HideForPoruchenie()
    {
        
        TextBoxTime_control.BackColor = Color.Yellow;
        //TextBoxNumber_out_doc.Enabled = false;
        //TextBoxNumber_out_doc.Text = "";
        //TextBoxNumber_in_doc.Text = DropDownListDelo.Text;
        TextBoxNumber_in_doc.BackColor = Color.Yellow;
        //LabelDateIn.Visible = false;
       // TextBoxDateIn.Visible = false;
        //LabelDateOut.Visible = false;
        //TextBoxDateOut.Visible = false;
        //LabelNumber_out_doc.Visible = false;
        //TextBoxNumber_out_doc.Visible = false;

        FreeTextBoxTema.Visible = true;
       // DropDownListTema.SelectedIndex = 6;

       // PanelDelo.Visible = false;
    }
    
    
    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        ClearFoms();
    }
    protected void CheckBoxNoReadyDoc_CheckedChanged(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
        GridView1.DataBind();
    }
    protected void ButtonFindDoc_Click(object sender, EventArgs e)
    {
        ViewState["FindDoc"] = "1";
        GridView1.AllowPaging = false;
        GridView1.DataBind();
    }
    public void SelectDate(String selectDate)
    {
        int currentDayName = Convert.ToInt16(DateTime.Now.DayOfWeek);
        String strCurrentDate = DateTime.Now.ToShortDateString();

        DateTime currentDate = DateTime.Now.Date;
        String date_begin = "";
        String date_end = "";

        if (selectDate!="выбор")
        {
            switch (selectDate)
            {
                case "день":
                    {

                        date_begin = currentDate.ToShortDateString();
                        
                        //BindGrid(date_begin, date_begin);
                        break;
                    }
                case "неделя":
                    {
                        date_begin = Convert.ToString(currentDate.AddDays(1 - currentDayName).ToShortDateString());
                        date_end = Convert.ToString(currentDate.AddDays(7 - currentDayName).ToShortDateString());
                        //BindGrid(strCurrentDate, strCurrentDate);
                        break;
                    }
                case "месяц":
                    {
                        date_begin = Convert.ToString(currentDate.AddDays(1 - currentDayName).ToShortDateString());
                        date_end = Convert.ToString(currentDate.AddDays(30 - currentDayName).ToShortDateString());
                        //BindGrid(strCurrentDate, strCurrentDate);
                        break;
                    }
            }
        }
    }
    protected void DropDownListDate_SelectedIndexChanged(object sender, EventArgs e)
    {
        

        String selectDate=DropDownListDate.SelectedValue.ToString();

        SelectDate(selectDate);
    }
    protected void CheckBoxStatus_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBoxStatus.Checked == true)
        {
            TextBoxDate_ready.Enabled = true;
            TextBoxTime_ready.Enabled = true;
            TextBoxDate_ready.BackColor = System.Drawing.Color.Yellow;
            TextBoxTime_ready.BackColor = System.Drawing.Color.Yellow;
            TextBoxDate_ready.Text = DateTime.Now.ToShortDateString();
            TextBoxTime_ready.Text = DateTime.Now.ToShortTimeString();

            PanelDateTime_ready.Visible = true;
        }
        else
        {
            TextBoxDate_ready.Enabled = false;
            TextBoxTime_ready.Enabled = false;
        }
    }
    protected void CheckBoxHave_file_CheckedChanged(object sender, EventArgs e)
    {

    }
}

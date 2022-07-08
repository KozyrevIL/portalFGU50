using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Serialization;

// Примечание. Для запуска созданного кода может потребоваться NET Framework версии 4.5 или более поздней версии и .NET Core или Standard версии 2.0 или более поздней.
/// <remarks/>
[System.SerializableAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
[System.Xml.Serialization.XmlRootAttribute(Namespace = "", IsNullable = false)]
public partial class Дело
{

    private ДелоТом[] томField;

    private string номерДелаField;

    private string датаДелаField;

    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute("Том")]
    public ДелоТом[] Том
    {
        get
        {
            return this.томField;
        }
        set
        {
            this.томField = value;
        }
    }

    /// <remarks/>
    [System.Xml.Serialization.XmlAttributeAttribute()]
    public string НомерДела
    {
        get
        {
            return this.номерДелаField;
        }
        set
        {
            this.номерДелаField = value;
        }
    }

    /// <remarks/>
    [System.Xml.Serialization.XmlAttributeAttribute()]
    public string ДатаДела
    {
        get
        {
            return this.датаДелаField;
        }
        set
        {
            this.датаДелаField = value;
        }
    }
}

/// <remarks/>
[System.SerializableAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
public partial class ДелоТом
{

    private string номерТомаField;

    private string датаТомаField;

    private string ППФField;

    /// <remarks/>
    [System.Xml.Serialization.XmlAttributeAttribute()]
    public string НомерТома
    {
        get
        {
            return this.номерТомаField;
        }
        set
        {
            this.номерТомаField = value;
        }
    }

    /// <remarks/>
    [System.Xml.Serialization.XmlAttributeAttribute()]
    public string ДатаТома
    {
        get
        {
            return this.датаТомаField;
        }
        set
        {
            this.датаТомаField = value;
        }
    }
    [System.Xml.Serialization.XmlAttributeAttribute()]
    public string ППФ
    {
        get
        {
            return this.ППФField;
        }
        set
        {
            this.ППФField = value;
        }
    }
}


public partial class Admin_ArchiveGenFileDownload : System.Web.UI.Page
{
    protected string name_page = "Формирование файлов для загрузки в ИС Архив";
    string pathFile = "./../Upload/ArchiveGenFileDownload";
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
            TextBoxCountRow.Text = "0";
            LinkButtonGenFile.Enabled = false;
            ViewState["ID"] = string.Empty;

            try
            {
                string rd = Request.Params.Get("rd");
                string qty = Request.Params.Get("toms");
                string id = Request.Params.Get("id");
                ViewState["ID"] = id;
                TextBoxKad_number.Text = rd;
                TextBoxCountRow.Text = qty;
                LinkButtonGenFile.Enabled = true;
                GridView1.DataSource = LoadXmlFile(Convert.ToInt32(qty));
                GridView1.DataBind();
            }
            catch { }

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
            StatusAlert.Visible = false;
        }

    }

    protected void StatusMessage (string type_message, string text_info, Exception ex)
    {

        switch (type_message)
        {
            case "info":
                StatusAlert.Attributes.Add("class", "alert alert-success alert-dismissible");
                StatusAlert.Visible = true;

                LabelStatus.CssClass = "alert alert-success h4";
                LabelStatus.Visible = true;
                LabelStatus.Text = text_info; 
                break;
            case "error":
                StatusAlert.Attributes.Add("class", "alert alert-danger alert-dismissible");
                StatusAlert.Visible = true;

                LabelStatus.CssClass = "alert alert-danger h4";
                LabelStatus.Visible = true;
                LabelStatus.Text = "ОШИБКА! Обратитесь к разработчику. Зеленин.А.П. IP 2205. Запись не добавлена или добавлена некорректно. " + ex.Message.ToString();
                break;
        }

        
    }


    protected void LinkButtonGen_Click(object sender, EventArgs e)
    {
        int countRow = 0;
        if (int.TryParse(TextBoxCountRow.Text, out countRow))
        {
            GridView1.DataSource = GenFile(countRow);
            GridView1.DataBind();

            LinkButtonGenFile.Enabled = true;
        }
        
    }

    private DataTable GenFile(int countRow)
    {
        DataTable dt = new DataTable();
        DataColumn numberVolume = new DataColumn("numberVolume");
        numberVolume.Caption = "Номер тома";
        DataColumn volumeDate = new DataColumn("volumeDate");
        volumeDate.Caption = "Дата тома";
        DataColumn ppf = new DataColumn("ppf");

        dt.Columns.Add(numberVolume);
        dt.Columns.Add(volumeDate);
        dt.Columns.Add(ppf);

        for (int i = 1; i < countRow+1; i++)
        {
            DataRow row = dt.NewRow();
            row["numberVolume"] = i;
            row["volumeDate"] = "";
            dt.Rows.Add(row);
        }
     //   ViewState["dt"] = dt;

        return dt;
    }

    private DataTable LoadXmlFile(int countRow)
    {
        DataTable dt = new DataTable();
        DataColumn numberVolume = new DataColumn("numberVolume");
        numberVolume.Caption = "Номер тома";
        DataColumn volumeDate = new DataColumn("volumeDate");
        DataColumn ppf = new DataColumn("ppf");
        volumeDate.Caption = "Дата тома";
        dt.Columns.Add(numberVolume);
        dt.Columns.Add(volumeDate);
        dt.Columns.Add(ppf);

        try
        {
            string id = ViewState["ID"].ToString();
            string sxml = string.Empty;

            using (SqlConnection sqc = new SqlConnection(ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"].ToString()))
            {
                sqc.Open();
                SqlCommand com = new SqlCommand("select info_txt from archive_scan where id=@id", sqc);
                com.Parameters.AddWithValue("id", id);
                sxml = com.ExecuteScalar().ToString();
                sqc.Close();
            }

            XmlDocument xInfo = new XmlDocument();
            xInfo.LoadXml(sxml);
            TextBoxKad_number.Text = xInfo.DocumentElement.GetAttribute("НомерДела").ToString();
            TextBoxDelo_date.Text = xInfo.DocumentElement.GetAttribute("ДатаДела").ToString();

            var xRoot = xInfo.DocumentElement;
            XmlNodeList xToms = xRoot.SelectNodes("Том");
            foreach (XmlNode xTom in xToms)
            {
                DataRow row = dt.NewRow();
                row["numberVolume"] = xTom.Attributes["НомерТома"].Value;
                row["volumeDate"] = xTom.Attributes["ДатаТома"].Value;
                row["ppf"] = xTom.Attributes["ППФ"].Value;
                dt.Rows.Add(row);
            }
        }
        catch
        {
            dt = GenFile(countRow);
        }
        return dt;
    }


    protected void LinkButtonGenFile_Click(object sender, EventArgs e)
    {
        try
        {
            string id = ViewState["ID"].ToString();

            Дело delo = new Дело();
            delo.ДатаДела = string.Empty;
            delo.НомерДела = TextBoxKad_number.Text;
//            DataTable dd = ViewState["dt"] as DataTable;
            delo.Том = new ДелоТом[GridView1.Rows.Count];
            for (int i = 0; i < delo.Том.Length; i++)
            {
                delo.Том[i] = new ДелоТом();
                delo.Том[i].НомерТома = ((TextBox)(GridView1.Rows[i].FindControl("TextBoxNumberVolume"))).Text;
                delo.Том[i].ДатаТома = ((TextBox)(GridView1.Rows[i].FindControl("TextBoxVolumeDate"))).Text;
                delo.Том[i].ППФ = ((CheckBox)(GridView1.Rows[i].FindControl("CheckPPF"))).Checked?"1":"0";
                if (delo.ДатаДела == string.Empty)
                    if (delo.Том[i].НомерТома == "1") delo.ДатаДела = delo.Том[i].ДатаТома;

            }


            XmlWriterSettings settings = new XmlWriterSettings();
            settings.ConformanceLevel = ConformanceLevel.Document;
            settings.OmitXmlDeclaration = false; // не подавлять xml заголовок
            settings.Encoding = Encoding.UTF8; // кодировка
            settings.Indent = true; // добавлять отступы
            settings.IndentChars = "    "; // сиволы отступа

            XmlSerializer serializer = new XmlSerializer(typeof(Дело));


            XmlSerializerNamespaces dummyNSs = new XmlSerializerNamespaces();
            dummyNSs.Add(string.Empty, string.Empty);

            if (id == string.Empty)
            {

                Response.Clear();

                Response.ContentType = "text/xml";
                Response.AddHeader("content-disposition", "attachment;filename=" + delo.НомерДела.Replace(":", " ") + ".xml");

                using (XmlWriter xw = XmlWriter.Create(Response.OutputStream, settings))
                {
                    serializer.Serialize(xw, delo, dummyNSs);
                }
                //        Response.BinaryWrite(File.ReadAllBytes(FileTempDir));
                Response.Flush();
                Response.End();
            }
            else
            {
                StringBuilder sb = new StringBuilder();
                using (XmlWriter xw = XmlWriter.Create(sb, settings))
                {
                    serializer.Serialize(xw, delo, dummyNSs);
                }
                using (SqlConnection sqc = new SqlConnection(ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"].ToString()))
                {
                    sqc.Open();
                    SqlCommand com = new SqlCommand("update archive_scan set info_txt = @xml where id=@id", sqc);
                    com.Parameters.AddWithValue("xml", sb.ToString());
                    com.Parameters.AddWithValue("id", id);
                    com.ExecuteNonQuery();
                    sqc.Close();
                    //LabelStatus.Text = "Сведения добавлены!";
                    //LabelStatus.CssClass = "alert alert-success";

                    StatusMessage("info","Сведения добавлены!", null);
                }
            }
        }
        catch (Exception ex)
        {
            StatusMessage("error", "",ex);
        }
    }
}


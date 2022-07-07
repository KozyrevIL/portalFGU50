using System;
using System.IO;
using System.Security.Principal;
using System.Drawing;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Data.SqlClient;

using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    //Время - Начало
        //private DateTime finishTime
        //{
        //    get
        //    {
        //        if (ViewState["finishTime"] == null) ViewState["finishTime"] = DateTime.Now.AddMinutes(5);// DateTime.Now.Add(new TimeSpan(Days,Hours,Minutes,Seconds))
        //        return (DateTime)ViewState["finishTime"];
        //    }
        //}
        //protected void Timer_Tick(object sender, EventArgs e)
        //{
        //    cntTimeRemain.Text = (finishTime - DateTime.Now).ToString(@"hh\:mm\:ss");
        //}
    //Время - Конец

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // String Name = User.Identity.Name;

            
            
            try
            {
               // WindowsIdentity identity = (WindowsIdentity)User.Identity;
               // String Token = identity.Token.ToString();
               // String guest = identity.IsGuest.ToString();
                //String system = identity.IsSystem.ToString();

            }
            catch
            {
            }

            //Инициализация вывода документов по диапазону
            //в источнике данных настроен дефолт "01.01.1901"
            //для минимизации данных делаем вывод в 7 дней
            //--------------------------------------------------------------
            //String strEnd_date = DateTime.Now.ToShortDateString();
            //String strBegin_date = DateTime.Now.ToShortDateString();//DateTime.Now.AddDays(-3).ToShortDateString();

            //Session["begin_date"] = strBegin_date;//"01.01.1901";
            //Session["end_date"] = strEnd_date;// "01.01.1901";

            String strEnd_dateNews = DateTime.Now.ToShortDateString();
            String strBegin_dateNews = DateTime.Now.AddDays(-7).ToShortDateString();

            Session["begin_dateNews"] = strBegin_dateNews;//"01.01.1901";
            Session["end_dateNews"] = strEnd_dateNews;// "01.01.1901";
            
            //-----------------------------------------------------------------
            
        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DateTime date_reg = DateTime.Parse(((Label)e.Row.FindControl("LabelItemDate_reg")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
            DateTime time_reg = DateTime.Parse(((Label)e.Row.FindControl("LabelItemTime_reg")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
            DateTime full_date_reg = DateTime.Parse((((Label)e.Row.FindControl("LabelItemDate_reg")).Text) + " " + (((Label)e.Row.FindControl("LabelItemTime_reg")).Text), System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
            DateTime date_control = Convert.ToDateTime("01.01.1000");
            try
            {
                date_control = DateTime.Parse(((Label)e.Row.FindControl("LabelItemDate_control")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
            }
            catch
            {
                
            }
            DateTime time_control = DateTime.Parse(((Label)e.Row.FindControl("LabelItemTime_control")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);

            DateTime full_date_control = Convert.ToDateTime("01.01.1000");
            try
            {
                full_date_control = DateTime.Parse((((Label)e.Row.FindControl("LabelItemDate_control")).Text) + " " + (((Label)e.Row.FindControl("LabelItemTime_control")).Text), System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
            }
            catch
            {
            }

            DateTime currentDate = DateTime.Now;



            bool alertDate = false;
            String strStatus_doc = ((Label)e.Row.FindControl("LabelStatus_doc")).Text;
            String dateOverTime = "";


            if (currentDate > full_date_control && strStatus_doc != "Исполнено")
            {
                alertDate = true;
                //e.Row.BackColor = Color.Tomato;
                //e.Row.ForeColor = Color.White;
                ((Label)e.Row.FindControl("LabelStatus_doc")).ForeColor = Color.Red;
                ((Label)e.Row.FindControl("LabelNumber_in_doc")).ForeColor = Color.Red;
                ((Label)e.Row.FindControl("LabelVid_doc")).ForeColor = Color.Red;
                ((Label)e.Row.FindControl("LabelItemTema")).ForeColor = Color.Red;

                dateOverTime = (currentDate.Subtract(full_date_control)).ToString().Substring(0, 8);

                //((Label)e.Row.FindControl("LabelItemDateOverTimeText")).Visible = true;
                //((Label)e.Row.FindControl("LabelItemDateOverTime")).Text = dateOverTime;

            }
            else
            {
                //((Label)e.Row.FindControl("LabelItemDateOverTimeText")).Visible = false;
            }
            /*DateTime date_reg = Convert.ToDateTime(((Label)e.Row.FindControl("LabelItemDate_reg")).Text);
            DateTime time_reg = Convert.ToDateTime(((Label)e.Row.FindControl("LabelItemTime_reg")).Text);
            DateTime date_control = Convert.ToDateTime(((Label)e.Row.FindControl("LabelItemDate_control")).Text);
            DateTime time_control = Convert.ToDateTime(((Label)e.Row.FindControl("LabelItemTime_control")).Text);
            DateTime currentDate = DateTime.Now;


            int dayRun = date_control.Day - currentDate.Day;
            int hourRun = time_control.Hour - currentDate.Hour;
            int minuteRun = time_control.Minute - currentDate.Minute;

            String timeRun = dayRun.ToString() +"."+ hourRun.ToString()+"." + minuteRun.ToString();

            bool alertDate=false;
            String strStatus_doc = ((Label)e.Row.FindControl("LabelStatus_doc")).Text;

            if (((dayRun <= 0 && hourRun <= 0 && minuteRun<= 0) ||
                (dayRun <= 0 && hourRun <= 0) ||
                dayRun<0) && strStatus_doc != "Исполнено")
            {
                 alertDate = true;
                ((Label)e.Row.FindControl("LabelStatus_doc")).ForeColor = Color.Red;
                ((Label)e.Row.FindControl("LabelNumber_in_doc")).ForeColor = Color.Red;
                ((Label)e.Row.FindControl("LabelVid_doc")).ForeColor = Color.Red;
                ((Label)e.Row.FindControl("LabelItemTema")).ForeColor = Color.Red;
            }*/

            //if ((DateTime.Compare(date_reg, date_control) <= 0) && (DateTime.Compare(time_reg, time_control) <= 0)) alertDate = true;

            
            switch (strStatus_doc)
            {
                case "Исполнено":
                    {
                        ((Label)e.Row.FindControl("LabelStatus_doc")).ForeColor = Color.DarkGreen;
                        ((Label)e.Row.FindControl("LabelNumber_in_doc")).ForeColor = Color.DarkGreen;
                        ((Label)e.Row.FindControl("LabelVid_doc")).ForeColor = Color.DarkGreen;
                        ((Label)e.Row.FindControl("LabelItemTema")).ForeColor = Color.DarkGreen;
                        //((Panel)e.Row.FindControl("PanelGridView2")).BackColor = Color.LightGreen;
                        break;
                    }
                case "Для ознакомления":
                    {
                        ((Label)e.Row.FindControl("LabelStatus_doc")).ForeColor = Color.DarkGreen;
                        ((Label)e.Row.FindControl("LabelNumber_in_doc")).ForeColor = Color.DarkGreen;
                        ((Label)e.Row.FindControl("LabelVid_doc")).ForeColor = Color.DarkGreen;
                        ((Label)e.Row.FindControl("LabelItemTema")).ForeColor = Color.DarkGreen;
                        //((Panel)e.Row.FindControl("PanelGridView2")).BackColor = Color.LightGreen;
                        break;
                    }
            }

            /*((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).DataTextField = "name_otdel";
            ((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).DataValueField = "id_otdel";
            ((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).SelectedValue = DataBinder.Eval(e.Row.DataItem, "id_otdel").ToString();
            ((DropDownList)e.Row.FindControl("DropDownListEditOtdel")).DataBind();
            */

        }
    }
  
    protected void ButtonFiles_Click(object sender, EventArgs e)
    {

       /* Response.ContentType = "application/octet-stream";
        Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
        Response.Cache.SetCacheability(HttpCacheability.Public);
        Response.BufferOutput = true;
        Response.OutputStream.Write(postedFile, 0, postedFile.Length);
        Response.Flush(); */

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
           (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
                String item = "news";
                String id_item = ((Label)e.Row.FindControl("LabelItemItems")).Text;
                String id_news = ((Label)e.Row.FindControl("LabelItemId_news")).Text;

                String text_news = ((Label)e.Row.FindControl("LabelItemText_news")).Text;

                string strFileGUIDNames = ((Label)e.Row.FindControl("LabelItemFileGUIDNames")).Text;
                string strFilePath = ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl;

                ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl = Path.Combine("Upload/NewsOks", strFileGUIDNames);


                int lengthText = text_news.Length;

            /*
            if (lengthText > 500)
             * 
            {
                ((Label)e.Row.FindControl("LabelItemText_news")).Text = text_news.Substring(0, 500) + " ... <font color='blue'>[читать далее]</font>";
                ((HyperLink)e.Row.FindControl("HyperLinkItemText_news")).NavigateUrl = "~/page2.aspx?id_news=" + id_news;
                ((HyperLink)e.Row.FindControl("HyperLinkItemText_news_img")).NavigateUrl = "~/page2.aspx?id_news=" + id_news;
            }*/



            if (((CheckBox)e.Row.FindControl("CheckBoxItemHave_images")).Checked == true)
            {
                //((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemNews")).Visible = true;
                //((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemNews")).ImageUrl = "photoDB.ashx?id_item=" + id_item + "&item=image_big";
                //((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemNews")).ImageUrl = "photoDB.ashx?id_item=" + id_item + "&item=image_big";
                ((Encosia.HighslideImage)e.Row.FindControl("ImageItemNews")).Visible = true;
                ((Encosia.HighslideImage)e.Row.FindControl("ImageItemNews")).ImageUrl = "photoDB.ashx?id_item=" + id_item + "&item=image_big";
                ((Encosia.HighslideImage)e.Row.FindControl("ImageItemNews")).FullImageURL = "photoDB.ashx?id_item=" + id_item + "&item=image_big";
            }
            else
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemNews")).Visible = false;
            }

            //показ файла

            string fileNames = ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFiles")).AlternateText;
            if (fileNames == "")
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFiles")).Visible = false;
                ((Label)e.Row.FindControl("LabelItemFiles")).Visible = false;
                
            }
            else
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFiles")).Visible = true;
                ((Label)e.Row.FindControl("LabelItemFiles")).Visible = true;
            }



        }
            //Инициализация вывода документов по диапазону
            //в источнике данных настроен дефолт "01.01.1901"
            //для минимизации данных делаем вывод в 7 дней
            //--------------------------------------------------------------
            /*String strEnd_date = DateTime.Now.ToShortDateString();
            String strBegin_date = DateTime.Now.AddDays(-3).ToShortDateString();

            Session["begin_dateNews"] = strBegin_date;//"01.01.1901";
            Session["end_dateNews"] = strEnd_date;// "01.01.1901";*/

          
            //-----------------------------------------------------------------
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        String filePath = ((Label)GridView1.SelectedRow.FindControl("LabelItemFilePath")).Text;
        String fileNames = ((ImageButton)GridView1.SelectedRow.FindControl("ImageButtonFiles")).CommandArgument;
        String fileType = ((Label)GridView1.SelectedRow.FindControl("LabelItemFileType")).Text;
        int fileLength = Convert.ToInt32(((Label)GridView1.SelectedRow.FindControl("LabelItemFileLength")).Text);

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
        catch
        {
        }
        /*String filePath = "";
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
                //LabelError.Text = ex.Message;
                //LabelError.Visible = true;
                //e.Cancel = true;
            }
        }*/



    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        //System.Threading.Thread.Sleep(TimeSpan.FromSeconds(10));

        DateTime selectDate = Calendar1.SelectedDate;

        Session["begin_dateNews"] = selectDate;
        Session["end_dateNews"] = selectDate;

        this.GridView1.DataBind();

    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {

    }
}

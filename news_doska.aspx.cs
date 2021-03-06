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

using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String Name = User.Identity.Name;
            
            
            try
            {
                WindowsIdentity identity = (WindowsIdentity)User.Identity;
                String Token = identity.Token.ToString();
                String guest = identity.IsGuest.ToString();
                String system = identity.IsSystem.ToString();

            }
            catch
            {
            }

            //????????????? ?????? ?????????? ?? ?????????
            //? ????????? ?????? ???????? ?????? "01.01.1901"
            //??? ??????????? ?????? ?????? ????? ? 7 ????
            //--------------------------------------------------------------
            String strEnd_date = DateTime.Now.ToShortDateString();
            String strBegin_date = DateTime.Now.AddDays(-7).ToShortDateString();

            Session["begin_date"] = strBegin_date;//"01.01.1901";
            Session["end_date"] = strEnd_date;// "01.01.1901";

            String strEnd_dateNews = DateTime.Now.ToShortDateString();
            String strBegin_dateNews = DateTime.Now.AddDays(-7).ToShortDateString();

            Session["begin_dateNews"] = strBegin_dateNews;//"01.01.1901";
            Session["end_dateNews"] = strEnd_dateNews;// "01.01.1901";
            
            //-----------------------------------------------------------------

            //menu_web1.menu_activ = headerRazdel.Text;
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


            if (currentDate > full_date_control && strStatus_doc != "?????????")
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
                dayRun<0) && strStatus_doc != "?????????")
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
                case "?????????":
                    {
                        ((Label)e.Row.FindControl("LabelStatus_doc")).ForeColor = Color.DarkGreen;
                        ((Label)e.Row.FindControl("LabelNumber_in_doc")).ForeColor = Color.DarkGreen;
                        ((Label)e.Row.FindControl("LabelVid_doc")).ForeColor = Color.DarkGreen;
                        ((Label)e.Row.FindControl("LabelItemTema")).ForeColor = Color.DarkGreen;
                        //((Panel)e.Row.FindControl("PanelGridView2")).BackColor = Color.LightGreen;
                        break;
                    }
                case "??? ????????????":
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
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
       // DateTime selectDate = Calendar1.SelectedDate;
        
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {

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
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            String item = "doska";
            String id_item = ((Label)e.Row.FindControl("LabelItemItems")).Text;
            String id_news = ((Label)e.Row.FindControl("LabelItemId_news")).Text;

            String text_news = ((Label)e.Row.FindControl("LabelItemText_news")).Text;

            int lengthText = text_news.Length;

            if (lengthText > 500)
            {
                ((Label)e.Row.FindControl("LabelItemText_news")).Text = text_news.Substring(0, 500) + " ... <font color='blue'>[?????? ?????]</font>";
                ((HyperLink)e.Row.FindControl("HyperLinkItemText_news")).NavigateUrl = "~/page2.aspx?id_news=" + id_news;
                ((HyperLink)e.Row.FindControl("HyperLinkItemText_news_img")).NavigateUrl = "~/page2.aspx?id_news=" + id_news;
            }



            if (((CheckBox)e.Row.FindControl("CheckBoxItemHave_images")).Checked == true)
            {
                ((Encosia.HighslideImage)e.Row.FindControl("ImageItemNews")).Visible = true;
                ((Encosia.HighslideImage)e.Row.FindControl("ImageItemNews")).ImageUrl = "photoDB.ashx?item=" + "image_big" + "&id_item=" + id_item;// +"&w=" + w + "&h=" + h;
                ((Encosia.HighslideImage)e.Row.FindControl("ImageItemNews")).FullImageURL = "photoDB.ashx?item=" + "image_big" + "&id_item=" + id_item;// +"&w=" + w + "&h=" + h;
            }
            else
            {
                ((Encosia.HighslideImage)e.Row.FindControl("ImageItemNews")).Visible = false;
            }





        }
        //????????????? ?????? ?????????? ?? ?????????
        //? ????????? ?????? ???????? ?????? "01.01.1901"
        //??? ??????????? ?????? ?????? ????? ? 7 ????
        //--------------------------------------------------------------
        String strEnd_date = DateTime.Now.ToShortDateString();
        String strBegin_date = DateTime.Now.AddDays(-3).ToShortDateString();

        Session["begin_dateNews"] = strBegin_date;//"01.01.1901";
        Session["end_dateNews"] = strEnd_date;// "01.01.1901";


        //-----------------------------------------------------------------
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        /*String filePath = ((Label)GridView1.SelectedRow.FindControl("LabelItemFilePath")).Text;
        String fileNames = ((ImageButton)GridView1.SelectedRow.FindControl("ImageButtonFiles")).CommandArgument;
        String fileType = ((Label)GridView1.SelectedRow.FindControl("LabelItemFileType")).Text;
        int fileLength = Convert.ToInt32(((Label)GridView1.SelectedRow.FindControl("LabelItemFileLength")).Text);

        FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
        byte[] MyData = new byte[fs.Length];
        fs.Read(MyData, 0, System.Convert.ToInt32(fs.Length));
        fs.Close();

        Response.ContentType = fileType;
        Response.AddHeader("Content-Disposition", "attachment; filename=" + fileNames);
        Response.Cache.SetCacheability(HttpCacheability.Public);
        Response.BufferOutput = true;
        Response.OutputStream.Write(MyData, 0, fileLength);
        Response.Flush(); */
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        String id_item = ((Label)e.Item.FindControl("id_itemLabel")).Text;
        String id_catalog = ((Label)e.Item.FindControl("id_catalogLabel")).Text;

        String item_small = "image_high";
        int w = 95;
        int h = 126;
        String item_big = "image_big";



        ((HyperLink)e.Item.FindControl("HyperLinkCatalog")).NavigateUrl = "";

        ((Encosia.HighslideImage)e.Item.FindControl("ImageItem")).Visible = true;
        ((Encosia.HighslideImage)e.Item.FindControl("ImageItem")).ImageUrl = "photoDB.ashx?item=" + item_small + "&id_item=" + id_item + "&w=" + w + "&h=" + h;
        ((Encosia.HighslideImage)e.Item.FindControl("ImageItem")).FullImageURL = "photoDB.ashx?item=" + item_big + "&id_item=" + id_item + "&w=" + w + "&h=" + h;

        //((HyperLink)e.Item.FindControl("HyperLinkDescription")).NavigateUrl = "description.aspx?id_catalog=" + id_catalog;

        
    }

    protected void DataListData_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            String item = "doska";
            String id_item = ((Label)e.Item.FindControl("LabelItemItems")).Text;
            String id_news = ((Label)e.Item.FindControl("LabelItemId_news")).Text;

            String text_news = ((Label)e.Item.FindControl("LabelItemText_news")).Text;

            int lengthText = text_news.Length;

            if (lengthText > 500)
            {
                ((Label)e.Item.FindControl("LabelItemText_news")).Text = text_news.Substring(0, 500) + " ... <font color='blue'>[?????? ?????]</font>";
                ((HyperLink)e.Item.FindControl("HyperLinkItemText_news")).NavigateUrl = "~/page2.aspx?id_news=" + id_news;
                ((HyperLink)e.Item.FindControl("HyperLinkItemText_news_img")).NavigateUrl = "~/page2.aspx?id_news=" + id_news;
            }



            if (((CheckBox)e.Item.FindControl("CheckBoxItemHave_images")).Checked == true)
            {
                ((Encosia.HighslideImage)e.Item.FindControl("ImageItemNews")).Visible = true;
                ((Encosia.HighslideImage)e.Item.FindControl("ImageItemNews")).ImageUrl = "photoDB.ashx?item=" + "image_big" + "&id_item=" + id_item;// +"&w=" + w + "&h=" + h;
                ((Encosia.HighslideImage)e.Item.FindControl("ImageItemNews")).FullImageURL = "photoDB.ashx?item=" + "image_big" + "&id_item=" + id_item;// +"&w=" + w + "&h=" + h;
            }
            else
            {
                ((Encosia.HighslideImage)e.Item.FindControl("ImageItemNews")).Visible = false;
            }
        }
    }
}

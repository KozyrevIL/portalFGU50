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
           

           
            
        }
    }
    
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DateTime selectDate = Calendar1.SelectedDate;
        
    }
   
    
    
    protected void ButtonFindDoc_Click(object sender, EventArgs e)
    {
        if (TextBoxFind.Text=="") TextBoxFind.Text=" ";
        GridView1.DataBind();
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

            ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl = Path.Combine("Upload/News", strFileGUIDNames);


            int lengthText = text_news.Length;

            /*
            if (lengthText > 500)
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
        String strEnd_date = DateTime.Now.ToShortDateString();
        String strBegin_date = DateTime.Now.AddDays(-3).ToShortDateString();

        Session["begin_dateNews"] = strBegin_date;//"01.01.1901";
        Session["end_dateNews"] = strEnd_date;// "01.01.1901";


        //-----------------------------------------------------------------
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

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

            String id_news = Request.QueryString["id_news"].ToString();

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

            //Инициализация вывода документов по диапазону
            //в источнике данных настроен дефолт "01.01.1901"
            //для минимизации данных делаем вывод в 7 дней
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


            if (currentDate > full_date_control && strStatus_doc != "Исполнено")
            {
                alertDate = true;
               
                ((Label)e.Row.FindControl("LabelStatus_doc")).ForeColor = Color.Red;
                ((Label)e.Row.FindControl("LabelNumber_in_doc")).ForeColor = Color.Red;
                ((Label)e.Row.FindControl("LabelVid_doc")).ForeColor = Color.Red;
                ((Label)e.Row.FindControl("LabelItemTema")).ForeColor = Color.Red;

                dateOverTime = (currentDate.Subtract(full_date_control)).ToString().Substring(0, 8);

               

            }
            else
            {
                
            }
          

           

            
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

          

        }
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DateTime selectDate = Calendar1.SelectedDate;
        
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {

    }
    
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            String item="news";
            String id_item = ((Label)e.Row.FindControl("LabelItemItems")).Text;

           
            if (((CheckBox)e.Row.FindControl("CheckBoxItemHave_images")).Checked == true)
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemNews")).Visible = true;
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemNews")).ImageUrl = "photoDB.ashx?id_item=" + id_item + "&item=news";
            }
            else
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemNews")).Visible = false;
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

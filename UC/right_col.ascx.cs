using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class UC_right_col : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                DateTime date_reg = DateTime.Parse(((Label)e.Row.FindControl("LabelItemDate_reg")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
                DateTime time_reg = DateTime.Parse(((Label)e.Row.FindControl("LabelItemTime_reg")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
                DateTime full_date_reg = DateTime.Parse((((Label)e.Row.FindControl("LabelItemDate_reg")).Text) + " " + (((Label)e.Row.FindControl("LabelItemTime_reg")).Text), System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
            }
            catch
            {

            }
            DateTime date_control = Convert.ToDateTime("01.01.1000");
            try
            {
                date_control = DateTime.Parse(((Label)e.Row.FindControl("LabelItemDate_control")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);
            }
            catch
            {

            }
            //DateTime time_control = DateTime.Parse(((Label)e.Row.FindControl("LabelItemTime_control")).Text, System.Globalization.CultureInfo.CreateSpecificCulture("ru-RU").DateTimeFormat);

            DateTime full_date_control = Convert.ToDateTime("01.01.1901");
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
    
}

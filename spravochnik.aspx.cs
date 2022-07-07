using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class spravochnik : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonFindDoc_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            //((Image)e.Row.FindControl("ImageMob")).Visible = ((Label)e.Row.FindControl("LabelItemNumber_mob")).Text != "" ? true : false;


            Label lbNumber_ip_phone = (Label)e.Row.FindControl("LabelItemNumber_ip_phone");
            String prefix = "";

            HyperLink hypNumber_ip_phone = (HyperLink)e.Row.FindControl("HyperLinkItemNumber_ip_phone");
            String strNumber = lbNumber_ip_phone.Text;

            if (strNumber != "" && strNumber != "0" && strNumber.Length >= 4 && strNumber.IndexOf(",", 0) == -1)
            {
                lbNumber_ip_phone.Visible = false;
                hypNumber_ip_phone.Visible = true;
                hypNumber_ip_phone.Text = strNumber;
                hypNumber_ip_phone.NavigateUrl = "https://10.59.131.201/webdialer/Webdialer?destination=" + strNumber + "&red=null";
            }
            else
            {
                lbNumber_ip_phone.Visible = true;
                hypNumber_ip_phone.Visible = false;
            }

            // Поле - городские телефоны
            Label LabelItemNumber_phone = (Label)e.Row.FindControl("LabelItemNumber_phone");

            HyperLink HyperLinkItemNumber_phone = (HyperLink)e.Row.FindControl("HyperLinkItemNumber_phone");
            String strNumber_phone = LabelItemNumber_phone.Text.Replace(")", "").Replace("(", "").Replace("-", "").Trim();

            if (strNumber_phone != "" && strNumber_phone != "0")
            {
                LabelItemNumber_phone.Visible = false;
                HyperLinkItemNumber_phone.Visible = true;
                HyperLinkItemNumber_phone.Text = LabelItemNumber_phone.Text;

                if (LabelItemNumber_phone.Text.IndexOf("(", 0) != -1)
                {
                    prefix = "98";
                }
                else
                {
                    prefix = "9";
                }
                HyperLinkItemNumber_phone.ToolTip = prefix + strNumber_phone;
                HyperLinkItemNumber_phone.NavigateUrl = "https://10.59.131.201/webdialer/Webdialer?destination=" + prefix + strNumber_phone + "&red=null";

            }
            else
            {
                LabelItemNumber_phone.Visible = true;
                HyperLinkItemNumber_phone.Visible = false;
            }

        }
    }
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
        Response.ContentType = "application /vnd.ms-excel";//"application/vnd.oasis.opendocument.text";
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

    protected void LinkButtonSearch_Click(object sender, EventArgs e)
    {

    }
}
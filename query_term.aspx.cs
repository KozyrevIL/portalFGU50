using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class query_term : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ///запрос подробных данных
        string var = DropDownList1.SelectedValue;
        GridView1.DataSourceID = "SqlDataSource3";
        GridView1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ///выгрузка в xls
        Response.Clear();
        Response.Buffer = true;
        string attachment = "attachment; filename=" + DateTime.Now.ToString("yyyyMMddHHmm") + ".xls";
        Response.AddHeader("content-disposition", attachment);
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";

        System.IO.StringWriter sw = new System.IO.StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        System.Web.UI.HtmlControls.HtmlForm frm = new System.Web.UI.HtmlControls.HtmlForm();
        GridView1.Parent.Controls.Add(frm);
        frm.Attributes["runat"] = "server";
        frm.Controls.Add(GridView1);
        frm.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        ///запрос обобщенной информации
        GridView1.DataSourceID = "SqlDataSource2";
        SqlDataSource2.DataBind();
    }
}
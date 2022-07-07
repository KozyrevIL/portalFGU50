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
using System.IO;

public partial class UC_news_civil : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
           (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            //String item = "news";
            //String id_item = ((Label)e.Row.FindControl("LabelItemItems")).Text;
            //String id_news = ((Label)e.Row.FindControl("LabelItemId_news")).Text;

            //String text_news = ((Label)e.Row.FindControl("LabelItemText_news")).Text;

            string strFileGUIDNames = ((Label)e.Row.FindControl("LabelItemFileGUIDNames")).Text;
            string strFilePath = ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl;

            ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl = Path.Combine(".././Upload/News", strFileGUIDNames);



            //показ файла

            //string fileNames = ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFiles")).AlternateText;
            //if (fileNames == "")
            //{
            //    ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFiles")).Visible = false;
            //    ((Label)e.Row.FindControl("LabelItemFiles")).Visible = false;

            //}
            //else
            //{
            //    ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageButtonFiles")).Visible = true;
            //    ((Label)e.Row.FindControl("LabelItemFiles")).Visible = true;
            //}



        }



        //-----------------------------------------------------------------
    }

}

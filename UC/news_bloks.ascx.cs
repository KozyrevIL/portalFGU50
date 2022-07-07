using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_news_bloks : System.Web.UI.UserControl
{
    protected int _items;
    /// <summary>
    /// Тип новости, 1-новости главной страницы, 2-кадастровые и т.д.
    /// </summary>
    public int TypeNews
    {
        get { return _items; }
        set { _items = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid(TypeNews);

            //LabelHeader.Text = HeaderNews;

            //gridviewCountRow = GridView1.Rows.Count;
        }
        //GridView1.Width = WidthNews;
    }

    protected void BindGrid(int type_news)
    {
        object data = null;
        int current_year = DateTime.Now.Year;
        int begin_year = current_year - 2;
        int end_year = current_year + 1;

        this.SqlDataSourceNewsProduction.SelectParameters[0].DefaultValue = "01.01." + begin_year;
        this.SqlDataSourceNewsProduction.SelectParameters[1].DefaultValue = "01.01." + end_year;
        this.SqlDataSourceNewsProduction.SelectParameters[2].DefaultValue = type_news.ToString();
        data = SqlDataSourceNewsProduction.Select(DataSourceSelectArguments.Empty);

        GridView2.DataSource = data;
        GridView2.DataBind();
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
       


        //-----------------------------------------------------------------
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {


    }
}
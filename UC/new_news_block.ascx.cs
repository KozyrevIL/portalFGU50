using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class UC_new_news_block : System.Web.UI.UserControl
{
    protected int _items, _count_rom, _width_block, rowsCount=0, gridviewCountRow;
    protected string _header_block;
    public string overlay = "", modal_form="", modal_close="", go="";
    private HtmlAnchor linkGo;
    private bool _showDate=true ,_showHeader=true;

    /// <summary>
    /// Тип новости, 1-новости главной страницы, 2-кадастровые и т.д.
    /// </summary>
    public int TypeNews
    {
        get { return _items; }
        set { _items = value; }
    }
    /// <summary>
    /// Кол-во новостей на странице
    /// </summary>
    public int PagingNews
    {
        get { return _count_rom; }
        set { _count_rom = value; }
    }

    /// <summary>
    /// Ширина блока в px
    /// </summary>
    public int WidthNews
    {
        get { return _width_block; }
        set { _width_block = value; }
    }
    /// <summary>
    /// Заголовок новостного блока
    /// </summary>
    public string HeaderNews
    {
        get { return _header_block; }
        set { _header_block = value; }
    }
    /// <summary>
    /// Показ даты
    /// </summary>
    public bool ShowDate
    {
        get { return _showDate; }
        set { _showDate = value; }
    }
    /// <summary>
    /// Показ даты
    /// </summary>
    public bool ShowHeader
    {
        get { return _showHeader; }
        set { _showHeader = value; }
    }

    protected void BindGrid(int type_news)
    {
        object data = null;
        int current_year = DateTime.Now.Year;
        int begin_year = current_year-2;
        int end_year = current_year+1;

        this.SqlDataSourceNews.SelectParameters[0].DefaultValue = "01.01."+ begin_year;
        this.SqlDataSourceNews.SelectParameters[1].DefaultValue = "01.01." + end_year;
        this.SqlDataSourceNews.SelectParameters[2].DefaultValue = type_news.ToString();
        data = SqlDataSourceNews.Select(DataSourceSelectArguments.Empty);

        GridView1.DataSource = data;
        GridView1.DataBind();
    }
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid(TypeNews);
            
            LabelHeader.Text = HeaderNews;

            //gridviewCountRow = GridView1.Rows.Count;
        }
        GridView1.Width = WidthNews;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGrid(TypeNews);
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        gridviewCountRow = GridView1.Rows.Count;

        if (e.Row.RowType == DataControlRowType.DataRow &&
          (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            //Показ даты
            ((Label)e.Row.FindControl("LabelItemDate_news")).Visible= ShowDate;
            //Показ заголовка
            ((Label)e.Row.FindControl("LabelItemHeader_news")).Visible = ShowHeader;

            

            //String item = "lectures";
            String id_item = ((Label)e.Row.FindControl("LabelItemItems")).Text;
            String id_news = ((Label)e.Row.FindControl("LabelItemId_news")).Text;

            String text_news = ((Label)e.Row.FindControl("LabelItemText_news_short")).Text;

            string cleanText = Regex.Replace(text_news, @"<(.|\n)*?>", string.Empty);

            int lengthText = cleanText.Length;

            if (((CheckBox)e.Row.FindControl("CheckBoxItemHave_images")).Checked == true)
            {
                ((System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ImageItemNews")).Visible = true;
            }
            else
            {
                ((System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ImageItemNews")).Visible = false;
            }

            
            //Загрузка данных в модальный gridview

            GridView gw = (GridView)e.Row.FindControl("GridView2");
            this.SqlDataSourceId_news.SelectParameters[0].DefaultValue = id_news;
            object data = SqlDataSourceId_news.Select(DataSourceSelectArguments.Empty);

            gw.DataSource = data;
            gw.DataBind();



            //Подготовка данных для модального скрипта
            rowsCount = rowsCount+1;
            //формирования списка id контейнеров
            //linkGo = ((System.Web.UI.HtmlControls.HtmlAnchor)e.Row.FindControl("go"));

            //go = go + "#" + linkGo.ClientID + ", ";
            //overlay = overlay + "#" + ((System.Web.UI.HtmlControls.HtmlContainerControl)e.Row.FindControl("overlay")).ClientID + ", ";
            //modal_form = modal_form + "#" + ((System.Web.UI.HtmlControls.HtmlContainerControl)e.Row.FindControl("modal_form")).ClientID + ", ";
            //modal_close = modal_close + "#" + ((System.Web.UI.HtmlControls.HtmlContainerControl)e.Row.FindControl("modal_close")).ClientID + ", ";

            //go = linkGo.ClientID;
            string go = ((HyperLink)e.Row.FindControl("Go")).ClientID;
            overlay = ((System.Web.UI.HtmlControls.HtmlContainerControl)e.Row.FindControl("overlay")).ClientID;
            modal_form =  ((System.Web.UI.HtmlControls.HtmlContainerControl)e.Row.FindControl("modal_form")).ClientID;
            modal_close =  ((System.Web.UI.HtmlControls.HtmlContainerControl)e.Row.FindControl("modal_close")).ClientID;

            //if (rowsCount == 3)
            // {
            //----------- Вставка динамического кода  -----------

            //string overlay = "overlay";
            // ((System.Web.UI.HtmlControls.HtmlContainerControl)e.Row.FindControl("overlay")).ClientID;
            //overlay = overlay+"#"+((Panel)e.Row.FindControl("overlay")).ClientID+",";
            //go = go.Remove(go.LastIndexOf(","));
            //overlay = overlay.Remove(overlay.LastIndexOf(","));
            //modal_form = modal_form.Remove(modal_form.LastIndexOf(","));//((System.Web.UI.HtmlControls.HtmlContainerControl)e.Row.FindControl("modal_form")).ClientID;
            //modal_close = modal_close.Remove(modal_close.LastIndexOf(","));//((System.Web.UI.HtmlControls.HtmlContainerControl)e.Row.FindControl("modal_close")).ClientID;

            // Define the name and type of the client script on the page.
            String csName = "ModalView"+ rowsCount;
                Type csType = this.GetType();

                // Get a ClientScriptManager reference from the Page class.
                ClientScriptManager cs = Page.ClientScript;
                if (!cs.IsClientScriptBlockRegistered(csType, csName))
                {
                    StringBuilder csText = new StringBuilder();
                    csText.Append("<script>");
                    string script = @"$(document).ready(function() { 
                    $('#"+go+@"').click(function(event) { 
                         event.preventDefault();" + 
                          "$('#"+overlay+@"').fadeIn(400, 
                        function () { 
                        $('#"+modal_form+@"')
                         .css('display', 'block') 
                       .animate({ opacity: 1, top: '50%' }, 200); 
                     });
                    });
                
                     $('#"+modal_close+", #"+overlay+@"').click(function ()
                     { 
                         $('#"+modal_form+@"')
                      .animate({ opacity: 0, top: '45%' }, 200,  
                    function() { 
                     $(this).css('display', 'none'); 
                     $('#"+overlay+@"').fadeOut(400); 
                      }
                      );
                        });
                         });";
                    csText.Append(script);
                    csText.Append("</script>");
                    cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
                }
           // }
            // Check to see if the client script is already registered.
            //if (!cs.IsClientScriptBlockRegistered(csType, csName))
            //{

            //    StringBuilder csText = new StringBuilder();
            //    csText.Append("<script>");
            //    csText.Append("$(document).ready(function() {");
            //    csText.Append("$(this).click(function(event) {");
            //    csText.Append("event.preventDefault();");

            //    //string strOverlay = "$('#" + overlay + "').fadeIn(400,";
            //    //csText.Append(strOverlay);
            //    csText.Append("$('#overlay').fadeIn(400,");

            //    csText.Append("function () {");

            //    //string strModal_form = "$('#" + modal_form + "')";
            //    //csText.Append(strModal_form);
            //    csText.Append("$('#modal_form')");

            //    csText.Append(".css('display', 'block')");
            //    csText.Append(".animate({ opacity: 1, top: '50%' }, 200);");
            //    csText.Append("});");
            //    csText.Append("});");

            //    //string strOverlay2 = "$('#modal_close, #" + overlay + "').click(function ()";
            //    //csText.Append(strOverlay2);
            //    csText.Append("$('#modal_close, #overlay').click(function ()");

            //    csText.Append("{");
            //    csText.Append("$('#modal_form')");
            //    csText.Append(".animate({ opacity: 0, top: '45%' }, 200,");
            //    csText.Append("function() {");
            //    csText.Append("$(this).css('display', 'none');");
            //    csText.Append(" $('#overlay').fadeOut(400);");
            //    csText.Append(" $('#overlay').fadeOut(400);");

            //    // string strid = "$('#" + clientid + "').datepicker();";
            //    //csText.Append(strid);
            //     csText.Append("});});});");
            //    csText.Append("</script>");
            //    cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
            //}


            //< script type = "text/javascript" >
            //$(document).ready(function() { // вся магия после загрузки страницы
            // $(this).click(function(event) { // ловим клик по ссылки с id="go"
            //     event.preventDefault(); // выключаем стандартную роль элемента
            //      $('#overlay').fadeIn(400, //$('#overlay').fadeIn(400, // сначала плавно показываем темную подложку
            //    function () { // после выполнения предъидущей анимации
            //    $('#modal_form')
            //     .css('display', 'block') // убираем у модального окна display: none;
            //   .animate({ opacity: 1, top: '50%' }, 200); // плавно прибавляем прозрачность одновременно со съезжанием вниз
            // });
            //});
            /* Закрытие модального окна, тут делаем то же самое но в обратном порядке */
            // $('#modal_close, #overlay').click(function ()
            // { // ловим клик по крестику или подложке
            //  $('#modal_form')
            //  .animate({ opacity: 0, top: '45%' }, 200,  // плавно меняем прозрачность на 0 и одновременно двигаем окно вверх
            //function() { // после анимации
            // $(this).css('display', 'none'); // делаем ему display: none;
            // $('#overlay').fadeOut(400); // скрываем подложку
            //  }
            //              );
            //});
            // });
            // </script>
            //---------------- Конец  -------------------------


        }
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    String item = "news";
        //    String id_item = ((Label)e.Row.FindControl("LabelItemItems")).Text;

        if (e.Row.RowType == DataControlRowType.DataRow &&
          (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            String item = "news";
            String id_item = ((Label)e.Row.FindControl("LabelItemItems")).Text;
            String id_news = ((Label)e.Row.FindControl("LabelItemId_news")).Text;

            //String text_news = ((Label)e.Row.FindControl("LabelItemText_news")).Text;

            //string strFileGUIDNames = ((Label)e.Row.FindControl("LabelItemFileGUIDNames")).Text;
            //string strFilePath = ((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl;

            //((HyperLink)e.Row.FindControl("HyperLinkItemFilePath")).NavigateUrl = Path.Combine("Upload/forDetails", strFileGUIDNames);

            //int lengthText = text_news.Length;

            if (((CheckBox)e.Row.FindControl("CheckBoxItemHave_images")).Checked == true)
            {
                //((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemNews")).Visible = true;
                //((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItemNews")).ImageUrl = "photoDB.ashx?id_item=" + id_item + "&item=news";

                ((System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ImageItemNewsChild")).Visible = true;
                //((Encosia.HighslideImage)e.Row.FindControl("ImageItemNews")).Visible = true;
                //((Encosia.HighslideImage)e.Row.FindControl("ImageItemNews")).ImageUrl = "photoDB.ashx?id_item=" + id_item + "&item=news";
                //((Encosia.HighslideImage)e.Row.FindControl("ImageItemNews")).FullImageURL = "photoDB.ashx?id_item=" + id_item + "&item=news";
            }
            else
            {
                ((System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ImageItemNewsChild")).Visible = false;
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

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
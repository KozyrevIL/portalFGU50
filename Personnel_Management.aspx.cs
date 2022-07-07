using System;
using System.IO;
using System.Data;
using System.Drawing;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class journal_backup: System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String fisikalPath = Server.MapPath("~/Personnel_Management");
            ShowDirectoryContents(fisikalPath);
        }
    }
   

    private void ShowDirectoryContents(string path)
    {
        //Определяем текущий каталог
        DirectoryInfo dir = new DirectoryInfo(path);
        //Получаем объекты DirectoryInfo и FileInfo
        FileInfo[] files = dir.GetFiles();
        DirectoryInfo[] dirs = dir.GetDirectories();
        //Показать листинг каталога
        GridViewFileList.DataSource = files;
        GridViewFileList.DataBind();
        GridViewDirList.DataSource = dirs;
        GridViewDirList.DataBind();

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        String filePath = ((Label)GridViewFileList.SelectedRow.FindControl("LabelItemFilePath")).Text;
        String fileNames = ((Label)GridViewFileList.SelectedRow.FindControl("LabelItemName")).Text;//((ImageButton)GridView1.SelectedRow.FindControl("ImageButtonFiles")).CommandArgument;
        String fileType = ((Label)GridViewFileList.SelectedRow.FindControl("LabelItemFileType")).Text;
        int fileLength = Convert.ToInt32(((Label)GridViewFileList.SelectedRow.FindControl("LabelItemFileLength")).Text);

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

    protected void GridViewDirList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string dir = (string)GridViewDirList.DataKeys[GridViewDirList.SelectedIndex].Value;
        ShowDirectoryContents(dir);
    }

    protected void GridViewFileList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            String item = ((Label)e.Row.FindControl("LabelItemExtension")).Text ;
            switch (item)
            {
                case ".txt":
                {
                    ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgTypeFile")).ImageUrl = "~/images/icon_files/txt.png";
                    break;
                }
                case ".doc":
                {
                    ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgTypeFile")).ImageUrl = "~/images/icon_files/page_word.png";
                    break;
                }
                case ".docx":
                {
                    ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgTypeFile")).ImageUrl = "~/images/icon_files/page_word.png";
                    break;
                }
                case ".xls":
                {
                    ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgTypeFile")).ImageUrl = "~/images/icon_files/page_excel.png";
                    break;
                }
                case ".xlsx":
                {
                    ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgTypeFile")).ImageUrl = "~/images/icon_files/page_excel.png";
                    break;
                }
                case ".rar":
                {
                    ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgTypeFile")).ImageUrl = "~/images/icon_files/bookcase.png";
                    break;
                }
                case ".zip":
                {
                    ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgTypeFile")).ImageUrl = "~/images/icon_files/bookcase.png";
                    break;
                }
            }
        }
    }
}

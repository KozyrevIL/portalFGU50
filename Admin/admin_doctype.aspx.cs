using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_admin_doctype : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        this.SqlDataSourceDocType.Insert();
        this.GridView1.DataBind();
    }
    protected void SqlDataSourceDocType_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Cancel = false;

        try
        {
            e.Command.Parameters["@doctype_name"].Value = TextBox2.Text;
            e.Command.Parameters["@type_info"].Value = 1;
        }
        catch
        {

        }
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];

        if (row != null)
        {
            e.NewValues.Remove("type_info"); e.OldValues.Remove("type_info");
            e.NewValues.Add("type_info", 1);
        }
    }
}
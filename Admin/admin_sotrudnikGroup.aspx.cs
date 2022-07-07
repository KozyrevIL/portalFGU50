using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_admin_sotrudnikGroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SqlDataSourceSotrudnikGroup_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Cancel = false;
        try
        {


            e.Command.Parameters["@nameGroupQuery"].Value = TextBoxNameGroupQuery.Text;

            e.Command.Parameters["@comments"].Value = TextBoxComments.Text;

            


        }
        catch (Exception ex)
        {
            LabelError.Text = ex.Message;
            LabelError.Visible = true;
            e.Cancel = true;
        }
    }
    protected void ButtonGroup_Click(object sender, EventArgs e)
    {
        
        try
        {
           
                this.SqlDataSourceSotrudnikGroup.Insert();
                GridView1.DataBind();

           

        }
        catch (Exception ex)
        {
            LabelError.Text = ex.Message;
            LabelError.Visible = true;
            
        }
    }
}
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Admin_admin_users: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
       {
           bool role1 = User.IsInRole("Администратор");
           
           /*if ())
           {

           }
           else
           {
               Response.Redirect("admin.aspx");
           }*/

       }
        LabelError.Visible = false;
        
    }
   
    

    
    protected void ButtonInsertFilial_Click1(object sender, EventArgs e)
    {

        
        String name_roles = "";


        name_roles = TextBoxName_roles.Text;
                Users objUsers = new Users();



                objUsers.InsertRoles
                    (
                       name_roles
                    ); 
                 
                   
                

                GridView1.DataBind();
            
            
       
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState == DataControlRowState.Edit)
        {
           


        }
    }
    protected void ClearFoms()
    {
      
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
                
        ClearFoms();  
       
      
       
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        
    }
}

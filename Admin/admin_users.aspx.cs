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
using System.Collections.Generic;

public partial class Admin_admin_users: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
       {
            Admin_banner1.user_logon = PortalPrincipal.Current.UserFullName;

            if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_ADMIN) == false &&
                 PortalPrincipal.Current.IsInRole(Utilites.ROLE_TEST_ANALIZ) == false)
                Server.Transfer("admin.aspx");
        }
        LabelError.Visible = false;
        
    }
   
    

    
    protected void ButtonInsertFilial_Click1(object sender, EventArgs e)
    {
       
           int id_sotrudnik=-1;
	       String logon="";
           String pass = "";
           String pass2 = "";
           int id_roles = -1;
           bool blok_account = false;


           logon = TextBoxLogin.Text;
           pass = TextBoxPass.Text;
           pass2 = TextBoxPass2.Text;
           id_roles = Convert.ToInt32(DropDownListRoles.SelectedValue.ToString());
           id_sotrudnik = Convert.ToInt32(DropDownListSotrudnik.SelectedValue.ToString());

           if (pass == pass2)
           {
               Users objUsers = new Users();

               objUsers.InsertUsers
                   (
                       id_sotrudnik,
                       logon,
                       pass,
                       id_roles,
                       blok_account
                   );


           }

                GridView1.DataBind();
            
            
       
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      
        if ((e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate)) || (e.Row.RowState == DataControlRowState.Edit))
        {

            /* Edit Mode Code Here (DataControlRowState.Edit) */
            String name_roles = ((Label)e.Row.FindControl("LabelEditName_roles")).Text;

            ((DropDownList)e.Row.FindControl("DropDownListEditRoles")).DataSource = SqlDataSourceRoles;
            ((DropDownList)e.Row.FindControl("DropDownListEditRoles")).DataTextField = "name_roles";
            ((DropDownList)e.Row.FindControl("DropDownListEditRoles")).DataValueField = "id_roles";
            
            ((DropDownList)e.Row.FindControl("DropDownListEditRoles")).DataBind();

            DropDownList ddName_roles;
            ddName_roles = ((DropDownList)e.Row.FindControl("DropDownListEditRoles"));
            int index = 0;
            foreach (object obj in ddName_roles.Items)
            {
                if (obj.ToString() == name_roles) ddName_roles.SelectedIndex = index;
                index = index + 1;
            }



        }
        else if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            /* DataRow Mode Code Here (DataControlRowState.Normal) */

           

            
            
           
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_users_roles.aspx");
        //Button1.PostBackUrl = "admin_users_roles.aspx";
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id_roles_new = Convert.ToInt16(((DropDownList)(GridView1.Rows[e.RowIndex].FindControl("DropDownListEditRoles"))).SelectedValue);



        e.OldValues.Remove("name_roles");
        e.NewValues.Remove("name_roles");

        e.NewValues.Add("id_roles_new", id_roles_new);

        //int id_passuser = Convert.ToInt32(((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBoxEditPass"))));

    }
    protected void ButtonFind_Click(object sender, EventArgs e)
    {
        this.GridView1.DataBind();
    }

    private static List<int> Numbers = new List<int>()
    {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 0
    };

    private static List<char> UpperCaseLetters = new List<char>()
    {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',  'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    };

    private static List<char> LowercaseLetters = new List<char>()
    {
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    };

    protected void Button2_Click(object sender, EventArgs e)
    {
        string URL = "";
        Random R = new Random();
        for (int i = 0; i < 5; i++)
        {
            int r = R.Next(0, 3);
            if (r == 0)
            {
                r = R.Next(0, Numbers.Count);
                URL += Numbers[r].ToString();
            }
            else if (r == 1)
            {
                r = R.Next(0, UpperCaseLetters.Count);
                URL += UpperCaseLetters[r].ToString();
            }
            else
            {
                r = R.Next(0, LowercaseLetters.Count);
                URL += LowercaseLetters[r].ToString();
            }
        }
        TextBoxPass.Text = URL.ToString();
        TextBoxPass2.Text = URL.ToString();
    }

    //protected void PasswordUsers(object sender, EventArgs e)
    //{
    //    string URL = "";
    //    Random R = new Random();
    //    for (int i = 0; i < 5; i++)
    //    {
    //        int r = R.Next(0, 3);
    //        if (r == 0)
    //        {
    //            r = R.Next(0, Numbers.Count);
    //            URL += Numbers[r].ToString();
    //        }
    //        else if (r == 1)
    //        {
    //            r = R.Next(0, UpperCaseLetters.Count);
    //            URL += UpperCaseLetters[r].ToString();
    //        }
    //        else
    //        {
    //            r = R.Next(0, LowercaseLetters.Count);
    //            URL += LowercaseLetters[r].ToString();
    //        }
    //    }
    //    TextBoxEditPass.Text = URL.ToString();
    //}
}

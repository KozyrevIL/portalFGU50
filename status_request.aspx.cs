using System;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class doc : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //��������� ����� �����---------------------------------------------------

          
          
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String request = TextBoxRequestText.Text;

        Status_request objStatus_request = new Status_request();

        bool? readStatus_request = objStatus_request.SelectStatus_request(request);
        if (readStatus_request.HasValue == false)
            LabelStatus.Text = "��������� � ����� ������� �� �������";
        else if (readStatus_request.Value)
            LabelStatus.Text = "������ ���������" ;
        else
            LabelStatus.Text = "������ � ������";

    }
}

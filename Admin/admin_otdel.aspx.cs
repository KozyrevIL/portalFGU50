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

public partial class Admin_admin_otdel : System.Web.UI.Page
{
    protected const string name_page = "Справочник отделов";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.MaintainScrollPositionOnPostBack = true;
            Master.header = name_page;
        }
    }
    protected void ButtonInsertOtdel_Click(object sender, EventArgs e)
    {
		SqlDataSourceOtdel.Insert();
		GridView1.DataBind();
    }
	protected void SqlDataSourceOtdel_Inserting( object sender, SqlDataSourceCommandEventArgs e )
	{
		e.Command.Parameters[ "@id_filial" ].Value = ddlFilial.SelectedValue.ToInteger() ?? null;
		e.Command.Parameters[ "@name_otdel" ].Value = tbOtdel.Text;
		e.Command.Parameters[ "@name_otdel_abr" ].Value = tbOtdelAbr.Text;
		e.Command.Parameters[ "@count_otdel_fakt" ].Value = tbOtdelFakt.Text.ToInteger() ?? null;
		e.Command.Parameters[ "@count_otdel_real" ].Value = tbOtdelReal.Text.ToInteger() ?? null;
		e.Command.Parameters[ "@active" ].Value = cbActive.Checked;
		e.Command.Parameters[ "@shift_count_report" ].Value = cbShiftCountReport.Checked;
        e.Command.Parameters["@type_otdel"].Value = DropDownListType_otdel.SelectedValue.ToString();
        e.Command.Parameters["@id_boss"].Value = DropDownListBoss.SelectedValue.ToString();
        e.Command.Parameters["@id_curator"].Value = DropDownListСurator.SelectedValue.ToString();
        e.Command.Parameters["@type_finance"].Value = DropDownListType_finance.SelectedValue.ToString();
    }

    protected void LinkButtonInsert_Click(object sender, EventArgs e)
    {
        SqlDataSourceOtdel.Insert();
        GridView1.DataBind();
    }

    protected void ImageButtonExcel_Click(object sender, EventArgs e)
    {

    }

    protected void ImageButtonWord_Click(object sender, EventArgs e)
    {

    }

    protected void LinkButtonReset_Click(object sender, EventArgs e)
    {

    }
}

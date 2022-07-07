using System;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class filial : System.Web.UI.Page 
{
    public int countVPN=0;
    public int countFTP = 0;
    public int countTURBO = 0;
    public int countUSY= 0;
    public int countNoKanal = 0;
    public int countHave_ip_phone = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //int countVPN = 0;
        //int countTurbo = 0;

        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {

            //--
            if (((CheckBox)e.Row.FindControl("CheckBoxItemVPN")).Checked == false)
            {
                //e.Row.BackColor = Color.FromArgb(255, 188, 188);
                //e.Row.ForeColor = Color.White;
            }
            else
            {
                //System.Drawing.Color dd=#DEFCA1;
                //e.Row.BackColor = Color.FromArgb(196, 224, 167);
                //e.Row.ForeColor = Color.Black;
                
                countVPN = countVPN + 1;
            }
            //---
            if (((CheckBox)e.Row.FindControl("CheckBoxItemFTP")).Checked == true)
            {
                //e.Row.BackColor = Color.Tomato;
                //e.Row.ForeColor = Color.White;
                countFTP = countFTP + 1;
            }
            //---
           // if (((CheckBox)e.Row.FindControl("CheckBoxItemHave_ip_phone")).Checked == true)
            //{
                //e.Row.BackColor = Color.Tomato;
                //e.Row.ForeColor = Color.White;
            countHave_ip_phone = 0;// countHave_ip_phone + 1;
            //}
            //--
            /*if (((Label)e.Row.FindControl("LabelItemTarif_kanal")).Text == "турбо")
            {
                e.Row.BackColor = Color.Orange;
                e.Row.ForeColor = Color.White;

                countTURBO = countTURBO + 1;
            }*/
            //--
             if (((Label)e.Row.FindControl("LabelItemfor_report")).Text.ToUpper() == "FALSE")
            {
                e.Row.Visible = false;
            }
            if (((Label)e.Row.FindControl("LabelItemTarif_kanal")).Text == "нет")
            {
                //e.Row.BackColor = Color.Orange;
                //e.Row.ForeColor = Color.White;

                countNoKanal = countNoKanal + 1;
            }
            
          
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            ((Label)e.Row.FindControl("LabelFooterVPN")).Text = countVPN.ToString();
            ((Label)e.Row.FindControl("LabelFooterFTP")).Text = countFTP.ToString();
           // ((Label)e.Row.FindControl("LabelFooterHave_ip_phone")).Text = countHave_ip_phone.ToString();
            ((Label)e.Row.FindControl("LabelFooterTarif_kanal")).Text = countTURBO.ToString();
            ((Label)e.Row.FindControl("LabelFooterNoKanal")).Text = countNoKanal.ToString();

           
        } 
       
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {

       /* GridViewRow footer = GridView1.FooterRow;
        footer.Cells[0].ColumnSpan = 12;
        //footer.Cells.RemoveAt(16);
        //footer.Cells.RemoveAt(15);
        footer.Cells.RemoveAt(14);
        footer.Cells.RemoveAt(13);
        footer.Cells.RemoveAt(12);
        footer.Cells.RemoveAt(11);
        footer.Cells.RemoveAt(10);
        footer.Cells.RemoveAt(9);
        footer.Cells.RemoveAt(8);
        footer.Cells.RemoveAt(7);
        footer.Cells.RemoveAt(6);
        footer.Cells.RemoveAt(5);
        footer.Cells.RemoveAt(4);
        footer.Cells.RemoveAt(3);
        footer.Cells.RemoveAt(2);
        footer.Cells.RemoveAt(1);*/
    }
}

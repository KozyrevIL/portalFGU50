using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Images
/// </summary>
public class Provodka
{
    public Provodka()
	{
		//
		// TODO: Add constructor logic here
		//
	}
  
    public void ProvodkaInsert
        (
            int id_filial,
	        int id_materials,
	        int id_firma,
	        int count_all,
	        String date_enter,
	        int count_output,
	        String date_output,
	        int rashod_1_ZK,
	        int ostatok,
	        int prognoz_day

        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("ProvodkaInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_filial = new SqlParameter("@id_filial", SqlDbType.Int);
        parameterid_filial.Value = id_filial;
        myCommand.Parameters.Add(parameterid_filial); 
        
        SqlParameter parameterid_materials = new SqlParameter("@id_materials", SqlDbType.Int);
        parameterid_materials.Value = id_materials;
        myCommand.Parameters.Add(parameterid_materials);

        SqlParameter parameterid_firma = new SqlParameter("@id_firma", SqlDbType.Int);
        parameterid_firma.Value = id_firma;
        myCommand.Parameters.Add(parameterid_firma);
       
        SqlParameter parameterdate_enter = new SqlParameter("@date_enter", SqlDbType.NVarChar,20);
        parameterdate_enter.Value = date_enter;
        myCommand.Parameters.Add(parameterdate_enter);

        SqlParameter parametercount_all = new SqlParameter("@count_all", SqlDbType.Int);
        parametercount_all.Value = count_all;
        myCommand.Parameters.Add(parametercount_all);

        SqlParameter parametercount_output = new SqlParameter("@count_output", SqlDbType.Int);
        parametercount_output.Value = count_output;
        myCommand.Parameters.Add(parametercount_output);

        SqlParameter parameterdate_output = new SqlParameter("@date_output", SqlDbType.NVarChar,20);
        parameterdate_output.Value = date_output;
        myCommand.Parameters.Add(parameterdate_output);

        SqlParameter parameterrashod_1_ZK = new SqlParameter("@rashod_1_ZK", SqlDbType.Int);
        parameterrashod_1_ZK.Value = rashod_1_ZK;
        myCommand.Parameters.Add(parameterrashod_1_ZK);

        SqlParameter parameterostatok = new SqlParameter("@ostatok", SqlDbType.Int);
        parameterostatok.Value = ostatok;
        myCommand.Parameters.Add(parameterostatok);

        SqlParameter parameterprognoz_day = new SqlParameter("@prognoz_day", SqlDbType.Int);
        parameterprognoz_day.Value = prognoz_day;
        myCommand.Parameters.Add(parameterprognoz_day);
       

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
}

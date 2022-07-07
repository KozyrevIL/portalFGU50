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
public class Tovar
{
    public Tovar()
	{
		//
		// TODO: Add constructor logic here
		//
	}
  
    public void TovarInsert
        (

       
            int id_materials,
            int id_firma_postav,
            int id_firma_proizv,
            String artikul,
            String location,
	        int count_tovar,
	        decimal prices,
	        String status,
	        String comments,
            String data_postupl,
	        String data_vydachi
           

        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("TovarInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_materials = new SqlParameter("@id_materials", SqlDbType.Int);
        parameterid_materials.Value = id_materials;
        myCommand.Parameters.Add(parameterid_materials);

        SqlParameter parameterid_firma_postav = new SqlParameter("@id_firma_postav", SqlDbType.Int);
        parameterid_firma_postav.Value = id_firma_postav;
        myCommand.Parameters.Add(parameterid_firma_postav);

        SqlParameter parameterid_firma_proizv = new SqlParameter("@id_firma_proizv", SqlDbType.Int);
        parameterid_firma_proizv.Value = id_firma_proizv;
        myCommand.Parameters.Add(parameterid_firma_proizv);

        SqlParameter parameterartikul = new SqlParameter("@artikul", SqlDbType.NVarChar, 50);
        parameterartikul.Value = artikul;
        myCommand.Parameters.Add(parameterartikul);

        SqlParameter parameterlocation = new SqlParameter("@location", SqlDbType.NVarChar, 255);
        parameterlocation.Value = location;
        myCommand.Parameters.Add(parameterlocation);

        SqlParameter parametercount_tovar = new SqlParameter("@count_tovar", SqlDbType.Int);
        parametercount_tovar.Value = count_tovar;
        myCommand.Parameters.Add(parametercount_tovar);

        SqlParameter parameterprices = new SqlParameter("@prices", SqlDbType.Float);
        parameterprices.Value = prices;
        myCommand.Parameters.Add(parameterprices);

        SqlParameter parameterstatus = new SqlParameter("@status", SqlDbType.NVarChar, 255);
        parameterstatus.Value = status;
        myCommand.Parameters.Add(parameterstatus);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar, 1000);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameterdata_postupl = new SqlParameter("@data_postupl", SqlDbType.NVarChar, 1000);
        parameterdata_postupl.Value = data_postupl;
        myCommand.Parameters.Add(parameterdata_postupl);

        SqlParameter parameterdata_vydachi = new SqlParameter("@data_vydachi", SqlDbType.NVarChar, 1000);
        parameterdata_vydachi.Value = data_vydachi;
        myCommand.Parameters.Add(parameterdata_vydachi);

      

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }

    public void TovarUpdate
       (

           int id_tovar,
           int id_materials,
           int id_firma_postav,
           int id_firma_proizv,
           String artikul,
           String location,
           int count_tovar,
           decimal prices,
           String status,
           String comments,
           String data_postupl,
           String data_vydachi


       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("TovarUpdate", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_tovar = new SqlParameter("@id_tovar", SqlDbType.Int);
        parameterid_tovar.Value = id_tovar;
        myCommand.Parameters.Add(parameterid_tovar);

        SqlParameter parameterid_materials = new SqlParameter("@id_materials", SqlDbType.Int);
        parameterid_materials.Value = id_materials;
        myCommand.Parameters.Add(parameterid_materials);

        SqlParameter parameterid_firma_postav = new SqlParameter("@id_firma_postav", SqlDbType.Int);
        parameterid_firma_postav.Value = id_firma_postav;
        myCommand.Parameters.Add(parameterid_firma_postav);

        SqlParameter parameterid_firma_proizv = new SqlParameter("@id_firma_proizv", SqlDbType.Int);
        parameterid_firma_proizv.Value = id_firma_proizv;
        myCommand.Parameters.Add(parameterid_firma_proizv);

        SqlParameter parameterartikul = new SqlParameter("@artikul", SqlDbType.NVarChar, 50);
        parameterartikul.Value = artikul;
        myCommand.Parameters.Add(parameterartikul);

        SqlParameter parameterlocation = new SqlParameter("@location", SqlDbType.NVarChar, 255);
        parameterlocation.Value = location;
        myCommand.Parameters.Add(parameterlocation);

        SqlParameter parametercount_tovar = new SqlParameter("@count_tovar", SqlDbType.Int);
        parametercount_tovar.Value = count_tovar;
        myCommand.Parameters.Add(parametercount_tovar);

        SqlParameter parameterprices = new SqlParameter("@prices", SqlDbType.Float);
        parameterprices.Value = prices;
        myCommand.Parameters.Add(parameterprices);

        SqlParameter parameterstatus = new SqlParameter("@status", SqlDbType.NVarChar, 255);
        parameterstatus.Value = status;
        myCommand.Parameters.Add(parameterstatus);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar, 1000);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameterdata_postupl = new SqlParameter("@data_postupl", SqlDbType.NVarChar, 1000);
        parameterdata_postupl.Value = data_postupl;
        myCommand.Parameters.Add(parameterdata_postupl);

        SqlParameter parameterdata_vydachi = new SqlParameter("@data_vydachi", SqlDbType.NVarChar, 1000);
        parameterdata_vydachi.Value = data_vydachi;
        myCommand.Parameters.Add(parameterdata_vydachi);



        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
}

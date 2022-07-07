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
public class Materials
{
    public Materials()
	{
		//
		// TODO: Add constructor logic here
		//
	}
  
    public void FirmaInsert
        (

            /*@name_materials nvarchar (255),
	        @ed_izm nvarchar (50),
	        @comments nvarchar (1000)*/

            String name_materials,
            String ed_izm,
            String comments
           

        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("MaterialsInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametername_materials = new SqlParameter("@name_materials", SqlDbType.NVarChar, 255);
        parametername_materials.Value = name_materials;
        myCommand.Parameters.Add(parametername_materials);

        SqlParameter parametered_izm = new SqlParameter("@ed_izm", SqlDbType.NVarChar, 50);
        parametered_izm.Value = ed_izm;
        myCommand.Parameters.Add(parametered_izm);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar, 1000);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

      

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
}

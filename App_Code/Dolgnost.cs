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
/// Summary description for Dolgnost
/// </summary>
public class Dolgnost
{
	public Dolgnost()
	{
		//
		// TODO: Add constructor logic here
		//

    }
    public void InsertDolgnost
    (
        string name_Dolgnost, string name_Dolgnost_for_doc
        )
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("DolgnostInsert", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parametername_Dolgnost = new SqlParameter("@name_dolgnost", SqlDbType.NVarChar,255);
            parametername_Dolgnost.Value = name_Dolgnost;
            myCommand.Parameters.Add(parametername_Dolgnost);

            SqlParameter parametername_Dolgnost_for_doc = new SqlParameter("@name_dolgnost_for_doc", SqlDbType.NVarChar, 255);
            parametername_Dolgnost_for_doc.Value = name_Dolgnost_for_doc;
            myCommand.Parameters.Add(parametername_Dolgnost_for_doc);

            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        }

        public SqlDataReader DolgnostSelectForSotrudnik
         (
             int id
         )
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("SotrudnikSelectDolgnost", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterid = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
            parameterid.Value = id;
            myCommand.Parameters.Add(parameterid);

            myConnection.Open();

            return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

        }
	
}

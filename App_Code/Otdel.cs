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
/// Summary description for Otdel
/// </summary>
public class Otdel
{
	public Otdel()
	{
		//
		// TODO: Add constructor logic here
		//

    }
        public void InsertOtdel
        (
           
            String name_otdel,
            int count_otdel_fakt,
            int count_otdel_real
          
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("OtdelInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        

        SqlParameter parametername_otdel = new SqlParameter("@name_otdel", SqlDbType.NVarChar,255);
        parametername_otdel.Value = name_otdel;
        myCommand.Parameters.Add(parametername_otdel);

        SqlParameter parametercount_otdel_fakt = new SqlParameter("@count_otdel_fakt", SqlDbType.Int);
        parametercount_otdel_fakt.Value = count_otdel_fakt;
        myCommand.Parameters.Add(parametercount_otdel_fakt);

        SqlParameter parametercount_otdel_real = new SqlParameter("@count_otdel_real", SqlDbType.Int);
        parametercount_otdel_real.Value = count_otdel_real;
        myCommand.Parameters.Add(parametercount_otdel_real);

    

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
	
}

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
/// Summary description for Spravochnik
/// </summary>
public class Spravochnik
{
	public Spravochnik()
	{
		//
		// TODO: Add constructor logic here
		//

    }
        public void InsertSpravochnik
        (
           
            int id_sotrudnik,
            int id_filial,
	        int id_otdel,
	        int id_dolgnost,
	        String number_cab,
	        String number_phone,
	        String number_ip_phone,
	        String email
           
          
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("SpravochnikInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);

        SqlParameter parameterid_filial = new SqlParameter("@id_filial", SqlDbType.Int);
        parameterid_filial.Value = id_filial;
        myCommand.Parameters.Add(parameterid_filial);

        SqlParameter parameterid_otdel = new SqlParameter("@id_otdel", SqlDbType.Int);
        parameterid_otdel.Value = id_otdel;
        myCommand.Parameters.Add(parameterid_otdel);

        SqlParameter parameterid_dolgnost = new SqlParameter("@id_dolgnost", SqlDbType.Int);
        parameterid_dolgnost.Value = id_dolgnost;
        myCommand.Parameters.Add(parameterid_dolgnost);

        SqlParameter parameternumber_cab = new SqlParameter("@number_cab", SqlDbType.NVarChar, 50);
        parameternumber_cab.Value = number_cab;
        myCommand.Parameters.Add(parameternumber_cab);

        SqlParameter parameternumber_phone = new SqlParameter("@number_phone", SqlDbType.NVarChar, 50);
        parameternumber_phone.Value = number_phone;
        myCommand.Parameters.Add(parameternumber_phone);

        SqlParameter parameternumber_ip_phone = new SqlParameter("@number_ip_phone", SqlDbType.NVarChar, 50);
        parameternumber_ip_phone.Value = number_ip_phone;
        myCommand.Parameters.Add(parameternumber_ip_phone);

      
        SqlParameter parameteremail = new SqlParameter("@email", SqlDbType.NVarChar, 255);
        parameteremail.Value = email;
        myCommand.Parameters.Add(parameteremail);
     
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void UpdateSpravochnik
        (

            int id_spravochnik,
            int id_sotrudnik,
            int id_filial,
            int id_otdel,
            int id_dolgnost,
            String number_cab,
            String number_phone,
            String number_ip_phone,
            String email


        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("SpravochnikUpdate", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_spravochnik = new SqlParameter("@id_spravochnik", SqlDbType.Int);
        parameterid_spravochnik.Value = id_spravochnik;
        myCommand.Parameters.Add(parameterid_spravochnik);

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);

        SqlParameter parameterid_filial = new SqlParameter("@id_filial", SqlDbType.Int);
        parameterid_filial.Value = id_filial;
        myCommand.Parameters.Add(parameterid_filial);

        SqlParameter parameterid_otdel = new SqlParameter("@id_otdel", SqlDbType.Int);
        parameterid_otdel.Value = id_otdel;
        myCommand.Parameters.Add(parameterid_otdel);

        SqlParameter parameterid_dolgnost = new SqlParameter("@id_dolgnost", SqlDbType.Int);
        parameterid_dolgnost.Value = id_dolgnost;
        myCommand.Parameters.Add(parameterid_dolgnost);

        SqlParameter parameternumber_cab = new SqlParameter("@number_cab", SqlDbType.NVarChar, 50);
        parameternumber_cab.Value = number_cab;
        myCommand.Parameters.Add(parameternumber_cab);

        SqlParameter parameternumber_phone = new SqlParameter("@number_phone", SqlDbType.NVarChar, 50);
        parameternumber_phone.Value = number_phone;
        myCommand.Parameters.Add(parameternumber_phone);

        SqlParameter parameternumber_ip_phone = new SqlParameter("@number_ip_phone", SqlDbType.NVarChar, 50);
        parameternumber_ip_phone.Value = number_ip_phone;
        myCommand.Parameters.Add(parameternumber_ip_phone);


        SqlParameter parameteremail = new SqlParameter("@email", SqlDbType.NVarChar, 255);
        parameteremail.Value = email;
        myCommand.Parameters.Add(parameteremail);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }

    public SqlDataReader SelectParametersUsers
      (
          int id_sotrudnik
      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("SpravochnikSelectForParameters", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);

        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

    }
}

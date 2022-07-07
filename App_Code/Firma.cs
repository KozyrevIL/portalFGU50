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
public class Firma
{
    public Firma()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void Firma_proizvInsert
        (
            String name_firma,
            String KPP_firma,
            String INN_firma,
            String raschet_schet_firma,
            String phone_firma,
            String address_firma

        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Firma_proizvInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametername_firma = new SqlParameter("@name_firma", SqlDbType.NVarChar, 255);
        parametername_firma.Value = name_firma;
        myCommand.Parameters.Add(parametername_firma);

        SqlParameter parameterKPP_firma = new SqlParameter("@KPP_firma", SqlDbType.NVarChar, 50);
        parameterKPP_firma.Value = KPP_firma;
        myCommand.Parameters.Add(parameterKPP_firma);

        SqlParameter parameterINN_firma = new SqlParameter("@INN_firma", SqlDbType.NVarChar, 50);
        parameterINN_firma.Value = INN_firma;
        myCommand.Parameters.Add(parameterINN_firma);

        SqlParameter parameterraschet_schet_firma = new SqlParameter("@raschet_schet_firma", SqlDbType.NVarChar, 255);
        parameterraschet_schet_firma.Value = raschet_schet_firma;
        myCommand.Parameters.Add(parameterraschet_schet_firma);

        SqlParameter parameterphone_firma = new SqlParameter("@phone_firma", SqlDbType.NVarChar, 20);
        parameterphone_firma.Value = phone_firma;
        myCommand.Parameters.Add(parameterphone_firma);

        SqlParameter parameteraddress_firma = new SqlParameter("@address_firma", SqlDbType.NVarChar, 255);
        parameteraddress_firma.Value = address_firma;
        myCommand.Parameters.Add(parameteraddress_firma);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void Firma_postavInsert
       (
           String name_firma,
           String KPP_firma,
           String INN_firma,
           String raschet_schet_firma,
           String phone_firma,
           String address_firma

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Firma_postavInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametername_firma = new SqlParameter("@name_firma", SqlDbType.NVarChar, 255);
        parametername_firma.Value = name_firma;
        myCommand.Parameters.Add(parametername_firma);

        SqlParameter parameterKPP_firma = new SqlParameter("@KPP_firma", SqlDbType.NVarChar, 50);
        parameterKPP_firma.Value = KPP_firma;
        myCommand.Parameters.Add(parameterKPP_firma);

        SqlParameter parameterINN_firma = new SqlParameter("@INN_firma", SqlDbType.NVarChar, 50);
        parameterINN_firma.Value = INN_firma;
        myCommand.Parameters.Add(parameterINN_firma);

        SqlParameter parameterraschet_schet_firma = new SqlParameter("@raschet_schet_firma", SqlDbType.NVarChar, 255);
        parameterraschet_schet_firma.Value = raschet_schet_firma;
        myCommand.Parameters.Add(parameterraschet_schet_firma);

        SqlParameter parameterphone_firma = new SqlParameter("@phone_firma", SqlDbType.NVarChar, 20);
        parameterphone_firma.Value = phone_firma;
        myCommand.Parameters.Add(parameterphone_firma);

        SqlParameter parameteraddress_firma = new SqlParameter("@address_firma", SqlDbType.NVarChar, 255);
        parameteraddress_firma.Value = address_firma;
        myCommand.Parameters.Add(parameteraddress_firma);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
}

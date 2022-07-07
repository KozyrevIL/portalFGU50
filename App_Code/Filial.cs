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
/// Summary description for Filial
/// </summary>
public class Filial
{
	public Filial()
	{
		//
		// TODO: Add constructor logic here
		//

    }
        public void InsertFilial
        (
            int kad_number,
            String name_filial,
	        String city_filial,
	        String street_filial,
	        String home_filial,
            int index_filial,
            int id_type_kanal,
	        String tarif_kanal,
	        int v_kanal,
            String ip_address_vpn,
	        String provayder_kanal,
            bool have_vpn,
	        bool have_ip_phone,
	        bool have_ftp,
	        bool have_rnd,
	        String number_phone,
            String number_ip_phone,
	        String name_email,
            String type_router,
            String ip_lan,
	        String ip_lan_mask,
	        String ip_lan_router,
	        String ip_address_vpn_mask,
            String type_phone,
            bool placeRnd,
            string ip_address_server

        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("FilialInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterkad_number = new SqlParameter("@kad_number", SqlDbType.Int);
        parameterkad_number.Value = kad_number;
        myCommand.Parameters.Add(parameterkad_number);

        SqlParameter parametername_filial = new SqlParameter("@name_filial", SqlDbType.NVarChar,255);
        parametername_filial.Value = name_filial;
        myCommand.Parameters.Add(parametername_filial);

        SqlParameter parametercity_filial = new SqlParameter("@city_filial", SqlDbType.NVarChar,200);
        parametercity_filial.Value = city_filial;
        myCommand.Parameters.Add(parametercity_filial);

        SqlParameter parameterstreet_filial = new SqlParameter("@street_filial", SqlDbType.NVarChar,255);
        parameterstreet_filial.Value = street_filial;
        myCommand.Parameters.Add(parameterstreet_filial);

        SqlParameter parameterhome_filial = new SqlParameter("@home_filial", SqlDbType.NVarChar,5);
        parameterhome_filial.Value = home_filial;
        myCommand.Parameters.Add(parameterhome_filial);

        SqlParameter parameterindex_filial = new SqlParameter("@index_filial", SqlDbType.Int);
        parameterindex_filial.Value = index_filial;
        myCommand.Parameters.Add(parameterindex_filial);

        SqlParameter parameterid_type_kanal = new SqlParameter("@id_type_kanal", SqlDbType.Int);
        parameterid_type_kanal.Value = id_type_kanal;
        myCommand.Parameters.Add(parameterid_type_kanal);

        SqlParameter parametertarif_kanal = new SqlParameter("@tarif_kanal", SqlDbType.NVarChar,50);
        parametertarif_kanal.Value = tarif_kanal;
        myCommand.Parameters.Add(parametertarif_kanal);

        SqlParameter parameterv_kanal = new SqlParameter("@v_kanal", SqlDbType.Int);
        parameterv_kanal.Value = v_kanal;
        myCommand.Parameters.Add(parameterv_kanal);

        SqlParameter parameterip_address_vpn = new SqlParameter("@ip_address_vpn", SqlDbType.NVarChar, 50);
        parameterip_address_vpn.Value = ip_address_vpn;
        myCommand.Parameters.Add(parameterip_address_vpn);

        SqlParameter parameterprovayder_kanal = new SqlParameter("@provayder_kanal", SqlDbType.NVarChar,20);
        parameterprovayder_kanal.Value = provayder_kanal;
        myCommand.Parameters.Add(parameterprovayder_kanal);

        SqlParameter parameterhave_vpn = new SqlParameter("@have_vpn", SqlDbType.Bit);
        parameterhave_vpn.Value = have_vpn;
        myCommand.Parameters.Add(parameterhave_vpn);

        SqlParameter parameterhave_ip_phone = new SqlParameter("@have_ip_phone", SqlDbType.Bit);
        parameterhave_ip_phone.Value = have_ip_phone;
        myCommand.Parameters.Add(parameterhave_ip_phone);

        SqlParameter parameterhave_ftp = new SqlParameter("@have_ftp", SqlDbType.Bit);
        parameterhave_ftp.Value = have_ftp;
        myCommand.Parameters.Add(parameterhave_ftp);

        SqlParameter parameterhave_rnd = new SqlParameter("@have_rnd", SqlDbType.Bit);
        parameterhave_rnd.Value = have_rnd;
        myCommand.Parameters.Add(parameterhave_rnd);

        SqlParameter parameternumber_phone = new SqlParameter("@number_phone", SqlDbType.NVarChar,50);
        parameternumber_phone.Value = number_phone;
        myCommand.Parameters.Add(parameternumber_phone);

        SqlParameter parameternumber_ip_phone = new SqlParameter("@number_ip_phone", SqlDbType.NVarChar, 50);
        parameternumber_ip_phone.Value = number_ip_phone;
        myCommand.Parameters.Add(parameternumber_ip_phone);

        SqlParameter parametername_email = new SqlParameter("@name_email", SqlDbType.NVarChar,255);
        parametername_email.Value = name_email;
        myCommand.Parameters.Add(parametername_email);

        SqlParameter parametertype_router = new SqlParameter("@type_router", SqlDbType.NVarChar, 50);
        parametertype_router.Value = type_router;
        myCommand.Parameters.Add(parametertype_router);

        SqlParameter parameterip_lan = new SqlParameter("@ip_lan", SqlDbType.NVarChar, 50);
        parameterip_lan.Value = ip_lan;
        myCommand.Parameters.Add(parameterip_lan);

        SqlParameter parameterip_lan_mask = new SqlParameter("@ip_lan_mask", SqlDbType.NVarChar, 50);
        parameterip_lan_mask.Value = ip_lan_mask;
        myCommand.Parameters.Add(parameterip_lan_mask);

        SqlParameter parameterip_lan_router = new SqlParameter("@ip_lan_router", SqlDbType.NVarChar, 50);
        parameterip_lan_router.Value = ip_lan_router;
        myCommand.Parameters.Add(parameterip_lan_router);

        SqlParameter parameterip_address_vpn_mask = new SqlParameter("@ip_address_vpn_mask", SqlDbType.NVarChar, 50);
        parameterip_address_vpn_mask.Value = ip_address_vpn_mask;
        myCommand.Parameters.Add(parameterip_address_vpn_mask);

        SqlParameter parametertype_phone = new SqlParameter("@type_phone", SqlDbType.NVarChar, 10);
        parametertype_phone.Value = type_phone;
        myCommand.Parameters.Add(parametertype_phone);

        SqlParameter parameterplaceRnd = new SqlParameter("@placeRnd", SqlDbType.Bit);
        parameterplaceRnd.Value = placeRnd;
        myCommand.Parameters.Add(parameterplaceRnd);

        SqlParameter parameterip_address_server = new SqlParameter("@ip_address_server", SqlDbType.NVarChar, 50);
        parameterip_address_server.Value = ip_address_server;
        myCommand.Parameters.Add(parameterip_address_server);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
	
}

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
/// Summary description for Sotrudnik
/// </summary>
public class Sotrudnik
{
	public Sotrudnik()
	{
		//
		// TODO: Add constructor logic here
		//

	}
	public SqlDataReader SotrudnikSelectDolgnost( int id_sotrudnik )
	{
		ConnectionStringSettings settings;
		settings = ConfigurationManager.ConnectionStrings[ "portalFGU59ConnectionString" ];

		SqlConnection myConnection = new SqlConnection( settings.ToString() );
		SqlCommand myCommand = new SqlCommand( "SotrudnikSelectDolgnost", myConnection );

		SqlParameter parameterid_sotrudnik = new SqlParameter( "@id_sotrudnik", SqlDbType.Int );
		parameterid_sotrudnik.Value = id_sotrudnik;
		myCommand.Parameters.Add( parameterid_sotrudnik );

		myCommand.CommandType = CommandType.StoredProcedure;

		myConnection.Open();

		return myCommand.ExecuteReader( CommandBehavior.CloseConnection );
	}
	public void InsertSotrudnik(

		int id_otdel,
		int id_otdel_fact,
		int id_dolgnost,
		int id_filial,
		String first_name,
		String last_name,
		String middle_name,
		String number_cab,
		String number_phone,
        String number_ip_phone,
		String email,
		String email2,
		bool active,
        bool initSed,
        int id_groupQuery,
         int id_sotrudnik_ref,
	     String items,
	     String comments,
        String number_mob,
        String type_tabel,
        bool show_phone,
        int  count_hours_in_week,
        string tabel_number,
        string FIO_for_doc,
        string power_attorney_doc


    //@number_cab nvarchar (50),
    //@number_phone nvarchar (50),
    //@number_ip_phone int,
    //@email nvarchar (255),
    //@email2 nvarchar (255),
    //@active bit

    )
	{
		ConnectionStringSettings settings;
		settings = ConfigurationManager.ConnectionStrings[ "portalFGU59ConnectionString" ];

		SqlConnection myConnection = new SqlConnection( settings.ToString() );
		SqlCommand myCommand = new SqlCommand( "SotrudnikInsert", myConnection );

		myCommand.CommandType = CommandType.StoredProcedure;

		SqlParameter parameterid_otdel = new SqlParameter( "@id_otdel", SqlDbType.Int );
		parameterid_otdel.Value = id_otdel;
		myCommand.Parameters.Add( parameterid_otdel );

		myCommand.Parameters.AddWithValue( "@id_otdel_fact", id_otdel_fact );

		SqlParameter parameterid_dolgnost = new SqlParameter( "@id_dolgnost", SqlDbType.Int );
		parameterid_dolgnost.Value = id_dolgnost;
		myCommand.Parameters.Add( parameterid_dolgnost );

		SqlParameter parameterid_filial = new SqlParameter( "@id_filial", SqlDbType.Int );
		parameterid_filial.Value = id_filial;
		myCommand.Parameters.Add( parameterid_filial );

		SqlParameter parameterfirst_name = new SqlParameter( "@first_name", SqlDbType.NVarChar, 50 );
		parameterfirst_name.Value = first_name;
		myCommand.Parameters.Add( parameterfirst_name );

		SqlParameter parameterlast_name = new SqlParameter( "@last_name", SqlDbType.NVarChar, 200 );
		parameterlast_name.Value = last_name;
		myCommand.Parameters.Add( parameterlast_name );

		SqlParameter parametermiddle_name = new SqlParameter( "@middle_name", SqlDbType.NVarChar, 200 );
		parametermiddle_name.Value = middle_name;
		myCommand.Parameters.Add( parametermiddle_name );

		SqlParameter parameternumber_cab = new SqlParameter( "@number_cab", SqlDbType.NVarChar, 50 );
		parameternumber_cab.Value = number_cab;
		myCommand.Parameters.Add( parameternumber_cab );

		SqlParameter parameternumber_phone = new SqlParameter( "@number_phone", SqlDbType.NVarChar, 50 );
		parameternumber_phone.Value = number_phone;
		myCommand.Parameters.Add( parameternumber_phone );

        SqlParameter parameternumber_ip_phone = new SqlParameter("@number_ip_phone", SqlDbType.NVarChar, 50);
		parameternumber_ip_phone.Value = number_ip_phone;
		myCommand.Parameters.Add( parameternumber_ip_phone );

		SqlParameter parameteremail = new SqlParameter( "@email", SqlDbType.NVarChar, 255 );
		parameteremail.Value = email;
		myCommand.Parameters.Add( parameteremail );

		SqlParameter parameteremail2 = new SqlParameter( "@email2", SqlDbType.NVarChar, 255 );
		parameteremail2.Value = email2;
		myCommand.Parameters.Add( parameteremail2 );

		SqlParameter parameteractive = new SqlParameter( "@active", SqlDbType.Bit );
		parameteractive.Value = active;
		myCommand.Parameters.Add( parameteractive );

        SqlParameter parameterinitSed = new SqlParameter("@initSed", SqlDbType.Bit);
        parameterinitSed.Value = initSed;
        myCommand.Parameters.Add(parameterinitSed);

        SqlParameter parameterid_groupQuery = new SqlParameter("@id_groupQuery", SqlDbType.Int);
        parameterid_groupQuery.Value = id_groupQuery;
        myCommand.Parameters.Add(parameterid_groupQuery);

        SqlParameter parameterid_sotrudnik_ref = new SqlParameter("@id_sotrudnik_ref", SqlDbType.Int);
        parameterid_sotrudnik_ref.Value = id_sotrudnik_ref;
        myCommand.Parameters.Add(parameterid_sotrudnik_ref);

        SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 255);
        parameteritems.Value = items;
        myCommand.Parameters.Add(parameteritems);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar, 255);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameternumber_mob = new SqlParameter("@number_mob", SqlDbType.NVarChar, 50);
        parameternumber_mob.Value = number_mob;
        myCommand.Parameters.Add(parameternumber_mob);

        SqlParameter parametertype_tabel = new SqlParameter("@type_tabel", SqlDbType.NChar, 2);
        parametertype_tabel.Value = type_tabel;
        myCommand.Parameters.Add(parametertype_tabel);

        SqlParameter parametershow_phone = new SqlParameter("@show_phone", SqlDbType.Bit);
        parametershow_phone.Value = show_phone;
        myCommand.Parameters.Add(parametershow_phone);

        SqlParameter parametercount_hours_in_week = new SqlParameter("@count_hours_in_week", SqlDbType.Int);
        parametercount_hours_in_week.Value = count_hours_in_week;
        myCommand.Parameters.Add(parametercount_hours_in_week);

        SqlParameter parametertabel_number = new SqlParameter("@tabel_number", SqlDbType.NVarChar, 10);
        parametertabel_number.Value = tabel_number;
        myCommand.Parameters.Add(parametertabel_number);

        SqlParameter parameterFIO_for_doc = new SqlParameter("@FIO_for_doc", SqlDbType.NVarChar, 255);
        parameterFIO_for_doc.Value = FIO_for_doc;
        myCommand.Parameters.Add(parameterFIO_for_doc); 

        SqlParameter parameterPower_attorney_doc = new SqlParameter("@power_attorney_doc", SqlDbType.NVarChar, 50);
        parameterPower_attorney_doc.Value = power_attorney_doc;
        myCommand.Parameters.Add(parameterPower_attorney_doc);

        myConnection.Open();
		myCommand.ExecuteNonQuery();
		myConnection.Close();

	}

	public void UpdateSotrudnik(
		int id_sotrudnik,
		int id_otdel,
		int id_otdel_fact,
		int id_dolgnost,
		int id_filial,
		String first_name,
		String last_name,
		String middle_name,
		 String number_cab,
		String number_phone,
        String number_ip_phone,
		String email,
		String email2,
		bool active, 
        bool initSed,
        int id_groupQuery,
         int id_sotrudnik_ref,
         String items,
         String comments,
        String number_mob,
         String type_tabel,
        bool show_phone,
        int count_hours_in_week,
        string tabel_number,
        string FIO_for_doc,
        string power_attorney_doc
       )
	{
		ConnectionStringSettings settings;
		settings = ConfigurationManager.ConnectionStrings[ "portalFGU59ConnectionString" ];

		SqlConnection myConnection = new SqlConnection( settings.ToString() );
		SqlCommand myCommand = new SqlCommand( "SotrudnikUpdate", myConnection );

		myCommand.CommandType = CommandType.StoredProcedure;

		SqlParameter parameterid_sotrudnik = new SqlParameter( "@id_sotrudnik", SqlDbType.Int );
		parameterid_sotrudnik.Value = id_sotrudnik;
		myCommand.Parameters.Add( parameterid_sotrudnik );

		SqlParameter parameterid_otdel = new SqlParameter( "@id_otdel", SqlDbType.Int );
		parameterid_otdel.Value = id_otdel;
		myCommand.Parameters.Add( parameterid_otdel );

		myCommand.Parameters.AddWithValue( "@id_otdel_fact", id_otdel_fact );

		SqlParameter parameterid_dolgnost = new SqlParameter( "@id_dolgnost", SqlDbType.Int );
		parameterid_dolgnost.Value = id_dolgnost;
		myCommand.Parameters.Add( parameterid_dolgnost );

		SqlParameter parameterid_filial = new SqlParameter( "@id_filial", SqlDbType.Int );
		parameterid_filial.Value = id_filial;
		myCommand.Parameters.Add( parameterid_filial );

		SqlParameter parameterfirst_name = new SqlParameter( "@first_name", SqlDbType.NVarChar, 50 );
		parameterfirst_name.Value = first_name;
		myCommand.Parameters.Add( parameterfirst_name );

		SqlParameter parameterlast_name = new SqlParameter( "@last_name", SqlDbType.NVarChar, 200 );
		parameterlast_name.Value = last_name;
		myCommand.Parameters.Add( parameterlast_name );

		SqlParameter parametermiddle_name = new SqlParameter( "@middle_name", SqlDbType.NVarChar, 200 );
		parametermiddle_name.Value = middle_name;
		myCommand.Parameters.Add( parametermiddle_name );

		SqlParameter parameternumber_cab = new SqlParameter( "@number_cab", SqlDbType.NVarChar, 50 );
		parameternumber_cab.Value = number_cab;
		myCommand.Parameters.Add( parameternumber_cab );

		SqlParameter parameternumber_phone = new SqlParameter( "@number_phone", SqlDbType.NVarChar, 50 );
		parameternumber_phone.Value = number_phone;
		myCommand.Parameters.Add( parameternumber_phone );

        SqlParameter parameternumber_ip_phone = new SqlParameter("@number_ip_phone", SqlDbType.NVarChar, 50);
		parameternumber_ip_phone.Value = number_ip_phone;
		myCommand.Parameters.Add( parameternumber_ip_phone );

		SqlParameter parameteremail = new SqlParameter( "@email", SqlDbType.NVarChar, 255 );
		parameteremail.Value = email;
		myCommand.Parameters.Add( parameteremail );

		SqlParameter parameteremail2 = new SqlParameter( "@email2", SqlDbType.NVarChar, 255 );
		parameteremail2.Value = email2;
		myCommand.Parameters.Add( parameteremail2 );

		SqlParameter parameteractive = new SqlParameter( "@active", SqlDbType.Bit );
		parameteractive.Value = active;
		myCommand.Parameters.Add( parameteractive );

        SqlParameter parameterinitSed = new SqlParameter("@initSed", SqlDbType.Bit);
        parameterinitSed.Value = initSed;
        myCommand.Parameters.Add(parameterinitSed);

        SqlParameter parameterid_groupQuery = new SqlParameter("@id_groupQuery", SqlDbType.Int);
        parameterid_groupQuery.Value = id_groupQuery;
        myCommand.Parameters.Add(parameterid_groupQuery);

        SqlParameter parameterid_sotrudnik_ref = new SqlParameter("@id_sotrudnik_ref", SqlDbType.Int);
        parameterid_sotrudnik_ref.Value = id_sotrudnik_ref;
        myCommand.Parameters.Add(parameterid_sotrudnik_ref);

        SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 255);
        parameteritems.Value = items;
        myCommand.Parameters.Add(parameteritems);

        SqlParameter parametercomments = new SqlParameter("@comments", SqlDbType.NVarChar, 255);
        parametercomments.Value = comments;
        myCommand.Parameters.Add(parametercomments);

        SqlParameter parameternumber_mob = new SqlParameter("@number_mob", SqlDbType.NVarChar, 50);
        parameternumber_mob.Value = number_mob;
        myCommand.Parameters.Add(parameternumber_mob);

        SqlParameter parametertype_tabel = new SqlParameter("@type_tabel", SqlDbType.NChar, 2);
        parametertype_tabel.Value = type_tabel;
        myCommand.Parameters.Add(parametertype_tabel);

        SqlParameter parametershow_phone = new SqlParameter("@show_phone", SqlDbType.Bit);
        parametershow_phone.Value = show_phone;
        myCommand.Parameters.Add(parametershow_phone);

        SqlParameter parametercount_hours_in_week = new SqlParameter("@count_hours_in_week", SqlDbType.Int);
        parametercount_hours_in_week.Value = count_hours_in_week;
        myCommand.Parameters.Add(parametercount_hours_in_week);

        SqlParameter parametertabel_number = new SqlParameter("@tabel_number", SqlDbType.NVarChar, 10);
        parametertabel_number.Value = tabel_number;
        myCommand.Parameters.Add(parametertabel_number);

        SqlParameter parametertFIO_for_doc = new SqlParameter("@FIO_for_doc", SqlDbType.NVarChar, 255);
        parametertFIO_for_doc.Value = FIO_for_doc;
        myCommand.Parameters.Add(parametertFIO_for_doc);

        SqlParameter parametertPower_attorney_doc = new SqlParameter("@power_attorney_doc", SqlDbType.NVarChar, 50);
        parametertPower_attorney_doc.Value = power_attorney_doc;
        myCommand.Parameters.Add(parametertPower_attorney_doc);

        myConnection.Open();
		myCommand.ExecuteNonQuery();
		myConnection.Close();

	}
    public void DeleteSotrudnik
      (
           int id
      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        string deltext = @"DELETE FROM Sotrudnik_promotion WHERE (id ="+ id.ToString()+")";

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand(deltext, myConnection);

        myCommand.CommandType = CommandType.Text;

        SqlParameter parameterid = new SqlParameter("@id", SqlDbType.Int);
        parameterid.Value = id;
        myCommand.Parameters.Add(parameterid);



        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void UpdateSotrudnik_promotion
      (
           int id,
           DateTime date_promotion,
           string type_promotion,
           string text_promotion
      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

              SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Sotrudnik_promotionUpdate", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid = new SqlParameter("@id", SqlDbType.Int);
        parameterid.Value = id;
        myCommand.Parameters.Add(parameterid);

        SqlParameter parameterdate_promotion = new SqlParameter("@date_promotion", SqlDbType.Date);
        parameterdate_promotion.Value = date_promotion;
        myCommand.Parameters.Add(parameterdate_promotion);

        SqlParameter parametertype_promotion = new SqlParameter("@type_promotion", SqlDbType.NVarChar, 50);
        parametertype_promotion.Value = type_promotion;
        myCommand.Parameters.Add(parametertype_promotion);

        SqlParameter parametertext_promotion = new SqlParameter("@text_promotion", SqlDbType.NVarChar,500);
        parametertext_promotion.Value = text_promotion;
        myCommand.Parameters.Add(parametertext_promotion);



        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }

}

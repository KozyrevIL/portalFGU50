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
/// Summary description for Counts
/// </summary>
public class Registr
{
	public Registr()
	{
		//
		// TODO: Add constructor logic here
		//

	}
	public void InsertRegistr
	(
        String connectionString,
		String num_office,
		string filial_number,
		DateTime reg_date,
		String in_doc,
		DateTime work_date,
		String result_work,
		DateTime exec_date,
		DateTime electron_date,
		DateTime manual_date,
		String operator_name,
		String comments,
        DateTime control_date,
		String number_notice,
		bool status_notice,
		DateTime send_notice_date,
		String reg_num_out_post,
        DateTime date_return_doc,
        String items

    


	)
	{
		ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings[connectionString];

		SqlConnection myConnection = new SqlConnection( settings.ToString() );
        SqlCommand myCommand = new SqlCommand("InformobmenInsert", myConnection);

		myCommand.CommandType = CommandType.StoredProcedure;

		SqlParameter parameternum_office = new SqlParameter( "@num_office", SqlDbType.NVarChar, 30 );
		parameternum_office.Value = num_office;
		myCommand.Parameters.Add( parameternum_office );

		myCommand.Parameters.AddWithValue( "filial_number", filial_number );

		SqlParameter parameterreg_date = new SqlParameter( "@reg_date", SqlDbType.DateTime );
		parameterreg_date.Value = reg_date;
		myCommand.Parameters.Add( parameterreg_date );

		SqlParameter parameterin_doc = new SqlParameter( "@in_doc", SqlDbType.NVarChar, 500 );
		parameterin_doc.Value = in_doc;
		myCommand.Parameters.Add( parameterin_doc );

		SqlParameter parameterwork_date = new SqlParameter( "@work_date", SqlDbType.DateTime );
		parameterwork_date.Value = work_date;
		myCommand.Parameters.Add( parameterwork_date );

		SqlParameter parameterresult_work = new SqlParameter( "@result_work", SqlDbType.NVarChar, 50 );
		parameterresult_work.Value = result_work;
		myCommand.Parameters.Add( parameterresult_work );

		SqlParameter parameterexec_date = new SqlParameter( "@exec_date", SqlDbType.DateTime );
		parameterexec_date.Value = exec_date;
		myCommand.Parameters.Add( parameterexec_date );

		SqlParameter parameterelectron_date = new SqlParameter( "@electron_date", SqlDbType.DateTime );
		parameterelectron_date.Value = electron_date;
		myCommand.Parameters.Add( parameterelectron_date );

		SqlParameter parametermanual_date = new SqlParameter( "@manual_date", SqlDbType.DateTime );
		parametermanual_date.Value = manual_date;
		myCommand.Parameters.Add( parametermanual_date );


		SqlParameter parameteroperator_name = new SqlParameter( "@operator", SqlDbType.NVarChar, 30 );
		parameteroperator_name.Value = operator_name;
		myCommand.Parameters.Add( parameteroperator_name );

		SqlParameter parametercomments = new SqlParameter( "@comments", SqlDbType.NVarChar, 255 );
		parametercomments.Value = comments;
		myCommand.Parameters.Add( parametercomments );




        SqlParameter parametercontrol_date = new SqlParameter("@control_date", SqlDbType.DateTime);
        parametercontrol_date.Value = control_date;
        myCommand.Parameters.Add(parametercontrol_date);

        SqlParameter parameternumber_notice = new SqlParameter("@number_notice", SqlDbType.NVarChar, 30);
        parameternumber_notice.Value = number_notice;
        myCommand.Parameters.Add(parameternumber_notice);

        SqlParameter parameterstatus_notice = new SqlParameter("@status_notice", SqlDbType.Bit);
        parameterstatus_notice.Value = status_notice;
        myCommand.Parameters.Add(parameterstatus_notice);

        SqlParameter parametersend_notice_date = new SqlParameter("@send_notice_date", SqlDbType.DateTime);
        parametersend_notice_date.Value = send_notice_date;
        myCommand.Parameters.Add(parametersend_notice_date);

        SqlParameter parameterreg_num_out_post = new SqlParameter("@reg_num_out_post", SqlDbType.NVarChar, 100);
        parameterreg_num_out_post.Value = reg_num_out_post;
        myCommand.Parameters.Add(parameterreg_num_out_post);

        SqlParameter parameterdate_return_doc = new SqlParameter("@date_return_doc", SqlDbType.DateTime);
        parameterdate_return_doc.Value = date_return_doc;
        myCommand.Parameters.Add(parameterdate_return_doc);

        SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 50);
        parameteritems.Value = items;
        myCommand.Parameters.Add(parameteritems);

		myConnection.Open();
		myCommand.ExecuteNonQuery();
		myConnection.Close();

	}
	public void UpdateRegistr
	   (
        String connectionString,
	   int id,
	   String num_office,
		String filial_number,
	   DateTime reg_date,
	   String in_doc,
	   DateTime work_date,
	   String result_work,
	   DateTime exec_date,
	   DateTime electron_date,
	   DateTime manual_date,
	   String operator_name,
		String comments,
         DateTime control_date,
        String number_notice,
        bool status_notice,
        DateTime send_notice_date,
        String reg_num_out_post,
        DateTime date_return_doc

	   )
	{
		ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings[connectionString];

		SqlConnection myConnection = new SqlConnection( settings.ToString() );
        SqlCommand myCommand = new SqlCommand("InformobmenUpdate", myConnection);

		myCommand.CommandType = CommandType.StoredProcedure;


		SqlParameter parameterid = new SqlParameter( "@id", SqlDbType.Int );
		parameterid.Value = id;
		myCommand.Parameters.Add( parameterid );



		SqlParameter parameternum_office = new SqlParameter( "@num_office", SqlDbType.NVarChar, 30 );
		parameternum_office.Value = num_office;
		myCommand.Parameters.Add( parameternum_office );

		myCommand.Parameters.AddWithValue( "filial_number", filial_number );

		SqlParameter parameterreg_date = new SqlParameter( "@reg_date", SqlDbType.DateTime );
		parameterreg_date.Value = reg_date;
		myCommand.Parameters.Add( parameterreg_date );

		SqlParameter parameterin_doc = new SqlParameter( "@in_doc", SqlDbType.NVarChar, 500 );
		parameterin_doc.Value = in_doc;
		myCommand.Parameters.Add( parameterin_doc );

		SqlParameter parameterwork_date = new SqlParameter( "@work_date", SqlDbType.DateTime );
		parameterwork_date.Value = work_date;
		myCommand.Parameters.Add( parameterwork_date );

		SqlParameter parameterresult_work = new SqlParameter( "@result_work", SqlDbType.NVarChar, 50 );
		parameterresult_work.Value = result_work;
		myCommand.Parameters.Add( parameterresult_work );

		SqlParameter parameterexec_date = new SqlParameter( "@exec_date", SqlDbType.DateTime );
		parameterexec_date.Value = exec_date;
		myCommand.Parameters.Add( parameterexec_date );

		SqlParameter parameterelectron_date = new SqlParameter( "@electron_date", SqlDbType.DateTime );
		parameterelectron_date.Value = electron_date;
		myCommand.Parameters.Add( parameterelectron_date );

		SqlParameter parametermanual_date = new SqlParameter( "@manual_date", SqlDbType.DateTime );
		parametermanual_date.Value = manual_date;
		myCommand.Parameters.Add( parametermanual_date );


		SqlParameter parameteroperator_name = new SqlParameter( "@operator", SqlDbType.NVarChar, 30 );
		parameteroperator_name.Value = operator_name;
		myCommand.Parameters.Add( parameteroperator_name );

		SqlParameter parametercomments = new SqlParameter( "@comments", SqlDbType.NVarChar, 255 );
		parametercomments.Value = comments;
		myCommand.Parameters.Add( parametercomments );


        SqlParameter parametercontrol_date = new SqlParameter("@control_date", SqlDbType.DateTime);
        parametercontrol_date.Value = control_date;
        myCommand.Parameters.Add(parametercontrol_date);

        SqlParameter parameternumber_notice = new SqlParameter("@number_notice", SqlDbType.NVarChar, 30);
        parameternumber_notice.Value = number_notice;
        myCommand.Parameters.Add(parameternumber_notice);

        SqlParameter parameterstatus_notice = new SqlParameter("@status_notice", SqlDbType.Bit);
        parameterstatus_notice.Value = status_notice;
        myCommand.Parameters.Add(parameterstatus_notice);

        SqlParameter parametersend_notice_date = new SqlParameter("@send_notice_date", SqlDbType.DateTime);
        parametersend_notice_date.Value = send_notice_date;
        myCommand.Parameters.Add(parametersend_notice_date);

        SqlParameter parameterreg_num_out_post = new SqlParameter("@reg_num_out_post", SqlDbType.NVarChar, 100);
        parameterreg_num_out_post.Value = reg_num_out_post;
        myCommand.Parameters.Add(parameterreg_num_out_post);

        SqlParameter parameterdate_return_doc = new SqlParameter("@date_return_doc", SqlDbType.DateTime);
        parameterdate_return_doc.Value = date_return_doc;
        myCommand.Parameters.Add(parameterdate_return_doc);

		myConnection.Open();
		myCommand.ExecuteNonQuery();
		myConnection.Close();

	}

	public void InsertInform_num_officeInsert
	   (
           
		   String name_num_office,
		   String name_filial,
            String connectionString
	   )
	{
		ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings[connectionString];

		SqlConnection myConnection = new SqlConnection( settings.ToString() );
		SqlCommand myCommand = new SqlCommand( "Inform_num_officeInsert", myConnection );

		myCommand.CommandType = CommandType.StoredProcedure;

		SqlParameter parametername_num_office = new SqlParameter( "@name_num_office", SqlDbType.NVarChar, 30 );
		parametername_num_office.Value = name_num_office;
		myCommand.Parameters.Add( parametername_num_office );

		SqlParameter parametername_filial = new SqlParameter( "@name_filial", SqlDbType.NVarChar, 255 );
		parametername_filial.Value = name_filial;
		myCommand.Parameters.Add( parametername_filial );



		myConnection.Open();
		myCommand.ExecuteNonQuery();
		myConnection.Close();

	}


}

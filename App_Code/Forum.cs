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
/// Summary description for Forum
/// </summary>
public class Forum
{
	public Forum()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void ForumInsert
       (

            int id_sotrudnik,
		    DateTime date_post,
		    DateTime time_post,
		    int id_otdel,
		    String header_post,
		    String text_post,
		    String status


       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Forum_PostInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;



        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);

        SqlParameter parameterdate_post = new SqlParameter("@date_post", SqlDbType.SmallDateTime);
        parameterdate_post.Value = date_post;
        myCommand.Parameters.Add(parameterdate_post);

        SqlParameter parametertime_post = new SqlParameter("@time_post", SqlDbType.SmallDateTime);
        parametertime_post.Value = time_post;
        myCommand.Parameters.Add(parametertime_post);

        SqlParameter parameterid_otdel = new SqlParameter("@id_otdel", SqlDbType.Int);
        parameterid_otdel.Value = id_otdel;
        myCommand.Parameters.Add(parameterid_otdel);

        SqlParameter parameterheader_post = new SqlParameter("@header_post", SqlDbType.NVarChar,1000);
        parameterheader_post.Value = header_post;
        myCommand.Parameters.Add(parameterheader_post);

        SqlParameter parametertext_post = new SqlParameter("@text_post", SqlDbType.Text);
        parametertext_post.Value = text_post;
        myCommand.Parameters.Add(parametertext_post);

        SqlParameter parameterstatus = new SqlParameter("@status", SqlDbType.NVarChar, 50);
        parameterstatus.Value = status;
        myCommand.Parameters.Add(parameterstatus);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void ForumAnswerInsert
       (

           int id_post,
	        int id_sotrudnik,
	        DateTime date_answer,
	        DateTime time_answer,
	        String text_answer


       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Forum_answerInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_post = new SqlParameter("@id_post", SqlDbType.Int);
        parameterid_post.Value = id_post;
        myCommand.Parameters.Add(parameterid_post);

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);

        SqlParameter parameterdate_answer = new SqlParameter("@date_answer", SqlDbType.SmallDateTime);
        parameterdate_answer.Value = date_answer;
        myCommand.Parameters.Add(parameterdate_answer);

        SqlParameter parametertime_answer = new SqlParameter("@time_answer", SqlDbType.SmallDateTime);
        parametertime_answer.Value = time_answer;
        myCommand.Parameters.Add(parametertime_answer);

       
        SqlParameter parametertext_answer = new SqlParameter("@text_answer", SqlDbType.Text);
        parametertext_answer.Value = text_answer;
        myCommand.Parameters.Add(parametertext_answer);

       


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
}

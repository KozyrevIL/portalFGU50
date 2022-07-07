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
/// Summary description for Computer
/// </summary>
public class Tests
{
	public Tests()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void InsertTests
       (
            String name_tests,
		    String author_tests,
		    String data_tests,
		    String time_tests,
            bool tests_visible
       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("TestsInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametername_tests = new SqlParameter("@name_tests", SqlDbType.NVarChar, 1000);
        parametername_tests.Value = name_tests;
        myCommand.Parameters.Add(parametername_tests);

        SqlParameter parameterauthor_tests = new SqlParameter("@author_tests", SqlDbType.NVarChar, 255);
        parameterauthor_tests.Value = author_tests;
        myCommand.Parameters.Add(parameterauthor_tests);

        SqlParameter parameterdata_tests = new SqlParameter("@data_tests", SqlDbType.NVarChar, 20);
        parameterdata_tests.Value = data_tests;
        myCommand.Parameters.Add(parameterdata_tests);

        SqlParameter parametertime_tests = new SqlParameter("@time_tests", SqlDbType.NVarChar, 20);
        parametertime_tests.Value = time_tests;
        myCommand.Parameters.Add(parametertime_tests);

        SqlParameter parametertests_visible = new SqlParameter("@tests_visible", SqlDbType.Bit);
        parametertests_visible.Value = tests_visible;
        myCommand.Parameters.Add(parametertests_visible);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }

    public void InsertTests_question
       (
            int id_tests,
            int number_question,
            String name_question
          
       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Tests_questionInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_tests = new SqlParameter("@id_tests", SqlDbType.Int);
        parameterid_tests.Value = id_tests;
        myCommand.Parameters.Add(parameterid_tests);

        SqlParameter parameternumber_question = new SqlParameter("@number_question", SqlDbType.Int);
        parameternumber_question.Value = number_question;
        myCommand.Parameters.Add(parameternumber_question);

        SqlParameter parametername_question = new SqlParameter("@name_question", SqlDbType.Text);
        parametername_question.Value = name_question;
        myCommand.Parameters.Add(parametername_question);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertTests_answer
      (
            
		    int id_question,
            int number_answer,
		    String text_answer,
		    bool author_answer,
		    String date_answer,
		    String time_answer

      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Tests_answerInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

       

        SqlParameter parameterid_question = new SqlParameter("@id_question", SqlDbType.Int);
        parameterid_question.Value = id_question;
        myCommand.Parameters.Add(parameterid_question);

        SqlParameter parameternumber_answer = new SqlParameter("@number_answer", SqlDbType.Int);
        parameternumber_answer.Value = number_answer;
        myCommand.Parameters.Add(parameternumber_answer);

        SqlParameter parametertext_answer = new SqlParameter("@text_answer", SqlDbType.Text);
        parametertext_answer.Value = text_answer;
        myCommand.Parameters.Add(parametertext_answer);

        SqlParameter parameterauthor_answer = new SqlParameter("@author_answer", SqlDbType.Bit);
        parameterauthor_answer.Value = author_answer;
        myCommand.Parameters.Add(parameterauthor_answer);

        SqlParameter parameterdate_answer = new SqlParameter("@date_answer", SqlDbType.NVarChar, 20);
        parameterdate_answer.Value = date_answer;
        myCommand.Parameters.Add(parameterdate_answer);

        SqlParameter parametertime_answer = new SqlParameter("@time_answer", SqlDbType.NVarChar, 20);
        parametertime_answer.Value = time_answer;
        myCommand.Parameters.Add(parametertime_answer);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }

    public void UpdateTests_answer
      (
            int id_answer,
            int id_question,
            int number_answer,
            String text_answer,
            bool author_answer,
            String date_answer,
            String time_answer

      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Tests_answerUpdate", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_answer = new SqlParameter("@id_answer", SqlDbType.Int);
        parameterid_answer.Value = id_answer;
        myCommand.Parameters.Add(parameterid_answer);

        SqlParameter parameterid_question = new SqlParameter("@id_question", SqlDbType.Int);
        parameterid_question.Value = id_question;
        myCommand.Parameters.Add(parameterid_question);

        SqlParameter parameternumber_answer = new SqlParameter("@number_answer", SqlDbType.Int);
        parameternumber_answer.Value = number_answer;
        myCommand.Parameters.Add(parameternumber_answer);

        SqlParameter parametertext_answer = new SqlParameter("@text_answer", SqlDbType.Text);
        parametertext_answer.Value = text_answer;
        myCommand.Parameters.Add(parametertext_answer);

        SqlParameter parameterauthor_answer = new SqlParameter("@author_answer", SqlDbType.Bit);
        parameterauthor_answer.Value = author_answer;
        myCommand.Parameters.Add(parameterauthor_answer);

        SqlParameter parameterdate_answer = new SqlParameter("@date_answer", SqlDbType.NVarChar, 20);
        parameterdate_answer.Value = date_answer;
        myCommand.Parameters.Add(parameterdate_answer);

        SqlParameter parametertime_answer = new SqlParameter("@time_answer", SqlDbType.NVarChar, 20);
        parametertime_answer.Value = time_answer;
        myCommand.Parameters.Add(parametertime_answer);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void InsertTestsSotrudnik
       (
            int id_question,
            String id_currentSession,
            int id_sotrudnik,
            String id_answer,
            String number_answer_user,
            String number_answer_author,
            bool result_answer,
            String date_answer,
            DateTime time_answer,
            int countQuestion,
            int countCorrectAnswer
            

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("TestsSotrudnikInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_question = new SqlParameter("@id_question", SqlDbType.Int);
        parameterid_question.Value = id_question;
        myCommand.Parameters.Add(parameterid_question);

        SqlParameter parameterid_currentSession = new SqlParameter("@id_currentSession", SqlDbType.NVarChar,255);
        parameterid_currentSession.Value = id_currentSession;
        myCommand.Parameters.Add(parameterid_currentSession);

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);

        SqlParameter parameterid_answer = new SqlParameter("@id_answer", SqlDbType.NVarChar, 50);
        parameterid_answer.Value = id_answer;
        myCommand.Parameters.Add(parameterid_answer);

        SqlParameter parameternumber_answer_user = new SqlParameter("@number_answer_user", SqlDbType.NVarChar, 255);
        parameternumber_answer_user.Value = number_answer_user;
        myCommand.Parameters.Add(parameternumber_answer_user);

        SqlParameter parameternumber_answer_author = new SqlParameter("@number_answer_author", SqlDbType.NVarChar, 255);
        parameternumber_answer_author.Value = number_answer_author;
        myCommand.Parameters.Add(parameternumber_answer_author);

        SqlParameter parameterresult_answer = new SqlParameter("@result_answer", SqlDbType.Bit);
        parameterresult_answer.Value = result_answer;
        myCommand.Parameters.Add(parameterresult_answer);


        SqlParameter parameterdate_answer = new SqlParameter("@date_answer", SqlDbType.NVarChar, 10);
        parameterdate_answer.Value = date_answer;
        myCommand.Parameters.Add(parameterdate_answer);

        SqlParameter parametertime_answer = new SqlParameter("@time_answer", SqlDbType.DateTime);
        parametertime_answer.Value = time_answer;
        myCommand.Parameters.Add(parametertime_answer);

        SqlParameter parametercountQuestion = new SqlParameter("@countQuestion", SqlDbType.Int);
        parametercountQuestion.Value = countQuestion;
        myCommand.Parameters.Add(parametercountQuestion);

        SqlParameter parametercountCorrectAnswer = new SqlParameter("@countCorrectAnswer", SqlDbType.Int);
        parametercountCorrectAnswer.Value = countCorrectAnswer;
        myCommand.Parameters.Add(parametercountCorrectAnswer);
      

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void UpdateTestsSotrudnik
      (
           int id_question,
           String id_currentSession,
           int id_sotrudnik,
           String id_answer,
           String str_answer,
           String date_answer,
           String time_answer,
            bool result_answer

      )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("TestsSotrudnikUpdate", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_question = new SqlParameter("@id_question", SqlDbType.Int);
        parameterid_question.Value = id_question;
        myCommand.Parameters.Add(parameterid_question);

        SqlParameter parameterid_currentSession = new SqlParameter("@id_currentSession", SqlDbType.NVarChar, 255);
        parameterid_currentSession.Value = id_currentSession;
        myCommand.Parameters.Add(parameterid_currentSession);

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);

        SqlParameter parameterid_answer = new SqlParameter("@id_answer", SqlDbType.NVarChar, 255);
        parameterid_answer.Value = id_answer;
        myCommand.Parameters.Add(parameterid_answer);

        SqlParameter parameterstr_answer = new SqlParameter("@str_answer", SqlDbType.NVarChar, 255);
        parameterstr_answer.Value = str_answer;
        myCommand.Parameters.Add(parameterstr_answer);

        SqlParameter parameterdate_answer = new SqlParameter("@date_answer", SqlDbType.NVarChar, 10);
        parameterdate_answer.Value = date_answer;
        myCommand.Parameters.Add(parameterdate_answer);

        SqlParameter parametertime_answer = new SqlParameter("@time_answer", SqlDbType.NVarChar, 10);
        parametertime_answer.Value = time_answer;
        myCommand.Parameters.Add(parametertime_answer);

        SqlParameter parameterresult_answer = new SqlParameter("@result_answer", SqlDbType.Bit);
        parameterresult_answer.Value = result_answer;
        myCommand.Parameters.Add(parameterresult_answer);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }

    public DataView SelectTestsSotrudnikDV(String id_currentSession, int id_question)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());

        SqlDataAdapter myCommand = new SqlDataAdapter("TestsSotrudnikSelect", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_currentSession = new SqlParameter("@id_currentSession", SqlDbType.NVarChar, 255);
        parameterid_currentSession.Value = id_currentSession;
        myCommand.SelectCommand.Parameters.Add(parameterid_currentSession);

        SqlParameter parameterid_question = new SqlParameter("@id_question", SqlDbType.Int);
        parameterid_question.Value = id_question;
        myCommand.SelectCommand.Parameters.Add(parameterid_question);

         DataSet ds = new DataSet();
        //Заливка данных в DataSet
        myCommand.Fill(ds);
        myConnection.Close();
        DataView dv = new DataView(ds.Tables[0]);
        //dv.Sort = sortfield;
        return dv;

    }

    public SqlDataReader SelectTestsSotrudnik(String id_currentSession, int id_question)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("TestsSotrudnikSelect", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_currentSession = new SqlParameter("@id_currentSession", SqlDbType.NVarChar, 255);
        parameterid_currentSession.Value = id_currentSession;
        myCommand.Parameters.Add(parameterid_currentSession);

        SqlParameter parameterid_question = new SqlParameter("@id_question", SqlDbType.Int);
        parameterid_question.Value = id_question;
        myCommand.Parameters.Add(parameterid_question);

        myConnection.Open();
        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);
    }
    public int TestSotrudnikResult(String id_currentSession)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("TestSotrunikResult", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        /*SqlParameter parameterid_test = new SqlParameter("@id_test", SqlDbType.Int);
        parameterid_test.Value = id_test;
        myCommand.Parameters.Add(parameterid_test);

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);*/

        SqlParameter parameterid_currentSession = new SqlParameter("@id_currentSession", SqlDbType.NVarChar,255);
        parameterid_currentSession.Value = id_currentSession;
        myCommand.Parameters.Add(parameterid_currentSession);

        myConnection.Open();
        try
        {
            int count = (int)myCommand.ExecuteScalar();
            if (count > 0)
            {
                myConnection.Close();
                return count;
            }
            else
            {
                myConnection.Close();
                return -1;
            }
        }
        catch
        {
            myConnection.Close();
            return -1;
        }
        finally
        {
            myConnection.Close();
        }
    }

    public DataSet SelectTests_answerDV(int id_question)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());

        SqlDataAdapter myCommand = new SqlDataAdapter("Tests_answerSelect", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_question = new SqlParameter("@id_question", SqlDbType.Int);
        parameterid_question.Value = id_question;
        myCommand.SelectCommand.Parameters.Add(parameterid_question);

        DataSet ds = new DataSet();
        //Заливка данных в DataSet
        myCommand.Fill(ds);
        myConnection.Close();
        //DataView dv = new DataView(ds.Tables[0]);
        //dv.Sort = sortfield;
        return ds;

    }
    public int TestsCount()
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("TestsCount", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        myConnection.Open();
        try
        {
            int count = (int)myCommand.ExecuteScalar();
            if (count > 0)
            {
                myConnection.Close();
                return count;
            }
            else
            {
                myConnection.Close();
                return -1;
            }
        }
        catch
        {
            myConnection.Close();
            return -1;
        }
        finally
        {
            myConnection.Close();
        }

        

    }
    public int SelectTest(string name)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("TestsSelectId", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameter_name = new SqlParameter("@name", SqlDbType.NVarChar, 1000);
        parameter_name.Value = name;
        myCommand.Parameters.Add(parameter_name);

        myConnection.Open();
        try
        {
            int id = (int)myCommand.ExecuteScalar();            
            myConnection.Close();
            return id;
           
        }
        catch
        {
            myConnection.Close();
            return -1;
        }
        finally
        {
            myConnection.Close();
        }

    }
    public int SelectQuestion(int id_test, int num_ques)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("Tests_questionSelectId", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter id_tests = new SqlParameter("@id_tests", SqlDbType.Int);
        id_tests.Value = id_test;
        myCommand.Parameters.Add(id_tests);

        SqlParameter numq = new SqlParameter("@number_question", SqlDbType.Int);
        numq.Value = num_ques;
        myCommand.Parameters.Add(numq);

        myConnection.Open();
        try
        {
            int id = (int)myCommand.ExecuteScalar();
            myConnection.Close();
            return id;

        }
        catch
        {
            myConnection.Close();
            return -1;
        }
        finally
        {
            myConnection.Close();
        }
    }
}

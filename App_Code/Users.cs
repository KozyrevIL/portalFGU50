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
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Summary description for Counts
/// </summary>
public class Users
{
	public Users()
	{
		//
		// TODO: Add constructor logic here
		//

    }
        public void InsertUsers
        (
        
	        int id_sotrudnik,
            String logon,
            String hash,
            String salt,
            int id_roles,
            bool blok_account,
			int admin_id
          
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("UsersInsertHash", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_sotrudnik = new SqlParameter("@id_sotrudnik", SqlDbType.Int);
        parameterid_sotrudnik.Value = id_sotrudnik;
        myCommand.Parameters.Add(parameterid_sotrudnik);

        SqlParameter parameterhash = new SqlParameter("@hash", SqlDbType.NVarChar, -1);
        parameterhash.Value = hash;
        myCommand.Parameters.Add(parameterhash);

        SqlParameter parametersalt= new SqlParameter("@salt", SqlDbType.NVarChar, -1);
        parametersalt.Value = salt;
        myCommand.Parameters.Add(parametersalt);


        SqlParameter parameterlogon = new SqlParameter("@logon", SqlDbType.NVarChar, 50);
        parameterlogon.Value = logon;
        myCommand.Parameters.Add(parameterlogon);

        SqlParameter parameterid_roles = new SqlParameter("@id_roles", SqlDbType.Int);
        parameterid_roles.Value = id_roles;
        myCommand.Parameters.Add(parameterid_roles);

        SqlParameter parameterblok_account = new SqlParameter("@blok_account", SqlDbType.Bit);
        parameterblok_account.Value = blok_account;
        myCommand.Parameters.Add(parameterblok_account);

        //SqlParameter parameteradmin_id = new SqlParameter("@admin_id", SqlDbType.Bit);
        //parameteradmin_id.Value = admin_id ;
        //myCommand.Parameters.Add(parameteradmin_id);
		
		SqlParameter parameteradmin = new SqlParameter("@admin_id", SqlDbType.Int);
        parameteradmin.Value = admin_id;
        myCommand.Parameters.Add(parameteradmin);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }

    public int SelectLogonUsers
       (
           String logon,
           String pass
       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("SelectUsersSalt", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterlogon = new SqlParameter("@logon", SqlDbType.NVarChar, 50);
        parameterlogon.Value = logon;
        myCommand.Parameters.Add(parameterlogon);

        myConnection.Open();
        try
        {
            string salt = (string) myCommand.ExecuteScalar();
            SHA256 mySHA256 = SHA256.Create();

            byte[] hash = Encoding.Default.GetBytes(pass + salt);

            byte[] result = mySHA256.ComputeHash(hash);

            myCommand = new SqlCommand("UsersSelectHash", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;

            parameterlogon = new SqlParameter("@logon", SqlDbType.NVarChar, 50);
            parameterlogon.Value = logon;
            myCommand.Parameters.Add(parameterlogon);

            SqlParameter parameterhash = new SqlParameter("@hash", SqlDbType.NVarChar, -1);
            parameterhash.Value = BitConverter.ToString(result).Replace("-", "").ToLower();
            myCommand.Parameters.Add(parameterhash);

            int id = (int) myCommand.ExecuteScalar();

            if (id > 0)
            {
                myConnection.Close();
                return id;
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

        //return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

    }
    public SqlDataReader SelectLogonRoles
       (
           int id_users
       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("UsersSelectRoles", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_users = new SqlParameter("@id_users", SqlDbType.Int);
        parameterid_users.Value = id_users;
        myCommand.Parameters.Add(parameterid_users);

        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

    }

   

    public void InsertRoles
        (

           String name_roles 
            
        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("RolesInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parametername_roles = new SqlParameter("@name_roles", SqlDbType.NVarChar, 50);
        parametername_roles.Value = name_roles;
        myCommand.Parameters.Add(parametername_roles);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }

    public string SelectEmail(string id)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];
        SqlConnection myConnection = new SqlConnection(settings.ToString());
        string Query = @"select email from Sotrudnik where id_sotrudnik ='" + id + "'";
        SqlCommand myCommand = new SqlCommand(Query, myConnection);
        myConnection.Open();
        string email = "";
        if (myCommand.ExecuteScalar()!=null)
        {
            email = (string)myCommand.ExecuteScalar();

        }
        myConnection.Close();
        return email;

    }
  
}

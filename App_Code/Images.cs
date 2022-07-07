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
public class Images
{
	public Images()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void ImagesInsert
        (
          

            String id_item,
            String item,
            byte[] images,
            String name_images,
            String type_images,
            int size_images,
            String alt_images

        )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("ImagesInsert", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;


        SqlParameter parameterid_item = new SqlParameter("@id_item", SqlDbType.NVarChar, 100);
        parameterid_item.Value = id_item;
        myCommand.Parameters.Add(parameterid_item);

        SqlParameter parameteritem = new SqlParameter("@item", SqlDbType.NVarChar, 50);
        parameteritem.Value = item;
        myCommand.Parameters.Add(parameteritem);

        SqlParameter parameterimages = new SqlParameter("@images", SqlDbType.Image);
        parameterimages.Value = images;
        myCommand.Parameters.Add(parameterimages);

        SqlParameter parametername_images = new SqlParameter("@name_images", SqlDbType.NVarChar, 50);
        parametername_images.Value = name_images;
        myCommand.Parameters.Add(parametername_images);

        SqlParameter parametertype_images = new SqlParameter("@type_images", SqlDbType.NVarChar, 30);
        parametertype_images.Value = type_images;
        myCommand.Parameters.Add(parametertype_images);

        SqlParameter parametersize_images = new SqlParameter("@size_images", SqlDbType.Int);
        parametersize_images.Value = size_images;
        myCommand.Parameters.Add(parametersize_images);

        SqlParameter parameteralt_images = new SqlParameter("@alt_images", SqlDbType.NVarChar, 50);
        parameteralt_images.Value = alt_images;
        myCommand.Parameters.Add(parameteralt_images);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public SqlDataReader ImagesSelect(String id_item, String item)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("ImagesSelect", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_item = new SqlParameter("@id_item", SqlDbType.NVarChar, 100);
        parameterid_item.Value = id_item;
        myCommand.Parameters.Add(parameterid_item);

        SqlParameter parameteritem = new SqlParameter("@item", SqlDbType.NVarChar,50);
        parameteritem.Value = item;
        myCommand.Parameters.Add(parameteritem);

        

        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);
    }
    public SqlDataReader ImagesSelectItems(String id_item)
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("ImagesSelectItems", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterid_item = new SqlParameter("@id_item", SqlDbType.NVarChar, 100);
        parameterid_item.Value = id_item;
        myCommand.Parameters.Add(parameterid_item);


        myConnection.Open();

        return myCommand.ExecuteReader(CommandBehavior.CloseConnection);
    }
    public void ImagesUpdate
    (


        String id_item,
        String item,
        byte[] images,
        String name_images,
        String type_images,
        int size_images,
        String alt_images

    )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("ImagesUpdate", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;


        SqlParameter parameterid_item = new SqlParameter("@id_item", SqlDbType.NVarChar, 100);
        parameterid_item.Value = id_item;
        myCommand.Parameters.Add(parameterid_item);

        SqlParameter parameteritem = new SqlParameter("@item", SqlDbType.NVarChar, 50);
        parameteritem.Value = item;
        myCommand.Parameters.Add(parameteritem);

        SqlParameter parameterimages = new SqlParameter("@images", SqlDbType.Image);
        parameterimages.Value = images;
        myCommand.Parameters.Add(parameterimages);

        SqlParameter parametername_images = new SqlParameter("@name_images", SqlDbType.NVarChar, 50);
        parametername_images.Value = name_images;
        myCommand.Parameters.Add(parametername_images);

        SqlParameter parametertype_images = new SqlParameter("@type_images", SqlDbType.NVarChar, 30);
        parametertype_images.Value = type_images;
        myCommand.Parameters.Add(parametertype_images);

        SqlParameter parametersize_images = new SqlParameter("@size_images", SqlDbType.Int);
        parametersize_images.Value = size_images;
        myCommand.Parameters.Add(parametersize_images);

        SqlParameter parameteralt_images = new SqlParameter("@alt_images", SqlDbType.NVarChar, 50);
        parameteralt_images.Value = alt_images;
        myCommand.Parameters.Add(parameteralt_images);


        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
    public void ImagesDelete
       (


           String id_item,
            String item
          

       )
    {
        ConnectionStringSettings settings;
        settings = ConfigurationManager.ConnectionStrings["portalFGU59ConnectionString"];

        SqlConnection myConnection = new SqlConnection(settings.ToString());
        SqlCommand myCommand = new SqlCommand("ImagesDelete", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;


        SqlParameter parameterid_item = new SqlParameter("@id_item", SqlDbType.NVarChar, 100);
        parameterid_item.Value = id_item;
        myCommand.Parameters.Add(parameterid_item);

        SqlParameter parameteritem = new SqlParameter("@item", SqlDbType.NVarChar, 100);
        parameteritem.Value = item;
        myCommand.Parameters.Add(parameteritem);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

    }
}

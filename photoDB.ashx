<%@ WebHandler Language="C#" Class="photoDB" %>

using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing.Imaging;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

public class photoDB : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {


        String id = context.Request.Params["id"];

        String item = context.Request.Params["item"];
        String id_item = context.Request.Params["id_item"];

        int w = Convert.ToInt16(context.Request.Params["w"]);
        int h = Convert.ToInt16(context.Request.Params["h"]);

        Images objImages = new Images();

        if (id_item != "")
        {

            switch (item)
            {

                case "image_low":
                    {
                        SqlDataReader sqlImages = objImages.ImagesSelectItems(id_item);
                        sqlImages.Read();

                        int objectImg_size = 0;
                        try
                        {
                            objectImg_size = Convert.ToInt32(sqlImages["size_images"]);
                        }
                        catch
                        {

                        }
                        if (objectImg_size != 0)
                        {


                            //¬€¬Œƒ Ã¿À≈Õ‹ Œ√Œ »«Œ¡–¿∆≈Õ»ﬂ
                            byte[] imageData = (byte[])sqlImages["images"];

                            Bitmap imgOutput = new Bitmap(w, h);
                            Graphics newGraphics = Graphics.FromImage(imgOutput);
                            newGraphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighSpeed;
                            newGraphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.Low;


                            System.IO.MemoryStream MS = new System.IO.MemoryStream(imageData);

                            System.Drawing.Image oImage = System.Drawing.Image.FromStream(MS);
                            newGraphics.DrawImage(oImage, 0, 0, w, h);
                            imgOutput.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);


                            imgOutput.Dispose();
                            newGraphics.Dispose();


                        }
                        else
                        {
                            context.Response.Redirect("images/no_photo.gif");
                        }

                        sqlImages.Close();



                        break;
                    }
                case "image_big":
                    {


                        SqlDataReader sqlImages = objImages.ImagesSelectItems(id_item);
                        sqlImages.Read();

                        int objectImg_size = 0;
                        try
                        {
                            objectImg_size = Convert.ToInt32(sqlImages["size_images"]);
                        }
                        catch
                        {

                        }
                        if (objectImg_size != 0)
                        {
                            String name = sqlImages["name_images"].ToString();
                            int img_size = Convert.ToInt32(sqlImages["size_images"].ToString());
                            String rnd = name;
                            context.Response.AddHeader("Content-Disposition", "attachment;filename=" + rnd);
                            context.Response.ContentType = "image/jpeg";
                            context.Response.OutputStream.Write((byte[])sqlImages["images"], 0, img_size);
                            context.Response.End();




                        }
                        else
                        {
                            //context.Response.Redirect("images/no_prikols.gif");
                        }

                        sqlImages.Close();



                        break;

                    }
                case "image_high":
                    {


                        SqlDataReader sqlImages = objImages.ImagesSelectItems(id_item);
                        sqlImages.Read();

                        int objectImg_size = 0;
                        try
                        {
                            objectImg_size = Convert.ToInt32(sqlImages["size_images"]);
                        }
                        catch
                        {

                        }
                        if (objectImg_size != 0)
                        {


                            //¬€¬Œƒ Ã¿À≈Õ‹ Œ√Œ »«Œ¡–¿∆≈Õ»ﬂ
                            byte[] imageData = (byte[])sqlImages["images"];

                            Bitmap imgOutput = new Bitmap(w, h);
                            Graphics newGraphics = Graphics.FromImage(imgOutput);
                            newGraphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                            newGraphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;

                            System.IO.MemoryStream MS = new System.IO.MemoryStream(imageData);

                            System.Drawing.Image oImage = System.Drawing.Image.FromStream(MS);
                            newGraphics.DrawImage(oImage, 0, 0, w, h);
                            imgOutput.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);


                            imgOutput.Dispose();
                            newGraphics.Dispose();


                        }
                        else
                        {
                            //context.Response.Redirect("images/no_prikols.gif");
                        }

                        sqlImages.Close();



                        break;

                    }
                case "news":
                    {

                        try
                        {
                            SqlDataReader sqlNews = objImages.ImagesSelect(id_item, item);
                            sqlNews.Read();

                            int objectImg_size = 0;
                            try
                            {
                                objectImg_size = Convert.ToInt32(sqlNews["size_images"]);
                            }
                            catch
                            {

                            }
                            if (objectImg_size != 0)
                            {
                                String name = sqlNews["name_images"].ToString();
                                int img_size = Convert.ToInt32(sqlNews["size_images"].ToString());
                                String rnd = name;
                                context.Response.AddHeader("Content-Disposition", "attachment;filename=" + rnd);
                                context.Response.ContentType = "image/jpeg";
                                context.Response.OutputStream.Write((byte[])sqlNews["images"], 0, img_size);
                                context.Response.End();


                            }
                            else
                            {
                                //context.Response.Redirect("images/no_photo_big.gif");
                            }

                            sqlNews.Close();
                        }
                        catch
                        {
                        }

                        break;
                    }
                case "sotrudnik":
                    {
                        SqlDataReader sqlImages = objImages.ImagesSelectItems(id_item);
                        sqlImages.Read();

                        int objectImg_size = 0;
                        try
                        {
                            objectImg_size = Convert.ToInt32(sqlImages["size_images"]);
                        }
                        catch
                        {

                        }
                        if (objectImg_size != 0)
                        {


                            //¬€¬Œƒ Ã¿À≈Õ‹ Œ√Œ »«Œ¡–¿∆≈Õ»ﬂ
                            byte[] imageData = (byte[])sqlImages["images"];

                            Bitmap imgOutput = new Bitmap(w, h);
                            Graphics newGraphics = Graphics.FromImage(imgOutput);
                            newGraphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighSpeed;
                            newGraphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.Low;


                            System.IO.MemoryStream MS = new System.IO.MemoryStream(imageData);

                            System.Drawing.Image oImage = System.Drawing.Image.FromStream(MS);
                            newGraphics.DrawImage(oImage, 0, 0, w, h);
                            imgOutput.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);


                            imgOutput.Dispose();
                            newGraphics.Dispose();


                        }
                        else
                        {
                            context.Response.Redirect("images/no_photo.gif");
                        }

                        sqlImages.Close();



                        break;
                    }



            }



        }
        else
        {
            context.Response.Redirect("images/no_photo.gif");
        }
    }
    
    public bool IsReusable {
        get {
            return true;
        }
    }
    public System.Drawing.Image ResizeImage(int width, int height, System.Drawing.Image image)        
    {            
        float k = 0f;            
        float kWidth = 0f;            
        float kHeight = 0f;            
        kWidth = width / Convert.ToSingle(image.Width);            
        kHeight = height / Convert.ToSingle(image.Height);            
        if (kWidth < kHeight)            
        {                
            k = kWidth;                
            height = Convert.ToInt32(image.Height * k);            
        }
        else
        {
            k = kHeight;
            width = Convert.ToInt32(image.Width * k);
        }
        Bitmap thump = new Bitmap(width, height);
        Graphics grfx = Graphics.FromImage(thump);
        Matrix transform = new Matrix();
        transform.Scale(k, k, MatrixOrder.Append);
        grfx.Transform = transform;
        grfx.DrawImage(image, 0, 0, width, height);
        return thump;
    }

}
using System;
using System.Collections.Generic;
using System.Web;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web.Security;
using System.Drawing;
using System.Collections;
using System.Net.Mail;
using System.Net;

/// <summary>
/// Summary description for Utilites
/// </summary>
public static class Utilites
{
    

	public static int? ToInteger( this string str )
	{
		try
		{
			return Int32.Parse( str );
		}
		catch { }
		return null;
	}

	public static DateTime RoundToMonthStart( this DateTime value )
	{
		return new DateTime( value.Year, value.Month, 1, 0, 0, 0 );
	}

	public static DateTime RoundToMonthEnd( this DateTime value )
	{
		value = value.AddMonths( 1 );
		return new DateTime( value.Year, value.Month, 1, 0, 0, 0 ).AddMilliseconds( -1 );
	}


	public static void CreateConfirmBox( Button btn, string strMessage )
	{
		btn.Attributes.Add( "onclick", string.Format( "return confirm('{0}');" ) );
	}

	/*
	public static int GetCurrentUserlId()
	{
		//String login = Request.Cookies["loginFGU59"].Value;
		try
		{
			return Convert.ToInt32( HttpContext.Current.Request.Cookies[ "id_userFGU59" ].Value );
		}
		catch { }
		return 0;
	}
	*/

	public static int GetCurrentUserlIdFromName(string loginame)
	{
		using (SqlConnection conn = new SqlConnection( ConfigurationManager.ConnectionStrings[ "portalFGU59ConnectionString" ].ConnectionString ))
		{
			conn.Open();
			try
			{
				using (SqlCommand cmd = conn.CreateCommand())
				{
					cmd.CommandText = "SELECT ID_USERS FROM USERS WHERE UPPER(LOGON)=UPPER(@LOGIN)";
					cmd.CommandType = CommandType.Text;
					cmd.Parameters.AddWithValue( "LOGIN", loginame );
					return (int) cmd.ExecuteScalar();
				}
			}
			finally
			{
				conn.Close();
			}
		}
	}

	public static int GetUserFilialId( int id_user )
	{
		using (SqlConnection conn = new SqlConnection( ConfigurationManager.ConnectionStrings[ "portalFGU59ConnectionString" ].ConnectionString ))
		{
			conn.Open();
			try
			{
				using (SqlCommand cmd = conn.CreateCommand())
				{
					cmd.CommandText = "SELECT dbo.FilialForUser(@id_user)";
					cmd.CommandType = CommandType.Text;
					cmd.Parameters.AddWithValue( "id_user", id_user );
					return (int) cmd.ExecuteScalar();
				}
			}
			finally
			{
				conn.Close();
			}
		}
	}

	public static int CurrentUserOtdelId( int id_user )
	{
		using (SqlConnection conn = new SqlConnection( ConfigurationManager.ConnectionStrings[ "portalFGU59ConnectionString" ].ConnectionString ))
		{
			conn.Open();
			try
			{
				using (SqlCommand cmd = conn.CreateCommand())
				{
					cmd.CommandText = "SELECT dbo.OtdelForUser(@id_user)";
					cmd.CommandType = CommandType.Text;
					cmd.Parameters.AddWithValue( "id_user", id_user );
					return (int) cmd.ExecuteScalar();
				}
			}
			finally
			{
				conn.Close();
			}
		}
	}

	public const string ROLE_ADMIN = "АДМИНИСТРАТОР";
	public const string ROLE_GUEST = "ГОСТЬ";
	public const string ROLE_INFOBM = "ИНФОРМОБМЕН";
	public const string ROLE_TEST_ANALIZ = "АНАЛИЗ ТЕСТОВ";
	public const string ROLE_USER = "ПОЛЬЗОВАТЕЛЬ";
	public const string ROLE_SCR_ADMIN = "АДМИНИСТРАТОР ОТЧЁТА О РАБОТЕ ОТДЕЛА";
	public const string ROLE_SCR_EDIT = "РЕДАКТОР ОТЧЁТА О РАБОТЕ ОТДЕЛА";
	public const string ROLE_REQ_ADMIN = "АДМИНИСТРАТОР ЗАЯВОК";
	public const string ROLE_REQ_CONTROL = "КОНТРОЛЁР ЗАЯВОК";
	public const string ROLE_DOCIN = "ПРИЕМ ДОКУМЕНТОВ";
	public const string ROLE_DOCOUT = "ПЕРЕДАЧА ДОКУМЕНТОВ";
    public const string ROLE_RND = "Управление Росреестра";
    public const string ROLE_CREATE_SOTRUDNIK = "Добавление сотрудников";
    public const string ROLE_EDIT_SOTRUDNIK = "Редактирование сотрудников";
    public const string ROLE_Activities_add = "Мероприятия добавление";
    public const string ROLE_Del_Temp_Stop = "Удаление Приостановок";
    public const string ROLE_Del_MV = "Удаление записей межведа";
    public const string ROLE_Add_KN_incorrect_mapped_ON= "Добавление КН нев. сопост. ОН"; //Журнал внесения РУ
    public const string ROLE_EDIT_QUERY_EGRN = "Редактирование запросы в ЕГРН"; //journal_query_egrn
    public const string ROLE_DOC_PDD_VIEW = "ДОГОВОРА ПО ПДД - ПРОСМОТР"; //journal_doc_pdd.aspx
    public const string ROLE_DOC_PDD_EDIT = "ДОГОВОРА ПО ПДД - РЕДАКТИРОВАНИЕ"; //journal_doc_pdd.aspx
    public const string RECEPTION_APPLICATIONS_EDIT = "Прием по заявлениям - редактирование"; //reception_applications.aspx. Прием по заявлениям - редактирование

    

    private static bool Contains(string[] array, string content)
    {
        foreach (string item in array)
        {
            if (item.Trim().ToLower()==content.Trim().ToLower())
            {
                return true;
            }
        }
        return false;
    }

    public static bool IsAdministratorRole( Page page )
	{
		return Contains(GetCurrentUserRoles( page ),ROLE_ADMIN.ToUpper() );
	}
	public static bool IsGuestRole( Page page )
	{
		return Contains(GetCurrentUserRoles( page ), ROLE_GUEST.ToUpper() );
	}
	public static bool IsInformobmenRole( Page page )
	{
		return Contains(GetCurrentUserRoles( page ), ROLE_INFOBM.ToUpper() );
	}
	public static bool IsAnalizTestovRole( Page page )
	{
		return Contains(GetCurrentUserRoles( page ), ROLE_TEST_ANALIZ.ToUpper() );
	}
	public static bool IsUsersRole( Page page )
	{
		return Contains( GetCurrentUserRoles( page ), ROLE_USER.ToUpper() );
	}
	public static bool IsShiftCountAdministratorRole( Page page )
	{
		return Contains(GetCurrentUserRoles( page ), ROLE_SCR_ADMIN.ToUpper() );
	}
	public static bool IsShiftCountEditorRole( Page page )
	{
		return Contains(GetCurrentUserRoles( page ), ROLE_SCR_EDIT.ToUpper() );
	}
	public static bool IsReqAdminRole( Page page )
	{
		return Contains(GetCurrentUserRoles( page ), ROLE_REQ_ADMIN.ToUpper() );
	}
	public static bool IsReqControlRole( Page page )
	{
		return Contains(GetCurrentUserRoles( page ), ROLE_REQ_CONTROL.ToUpper() );
	}
    public static bool IsEDIT_QUERY_EGRN(Page page)
    {
        return Contains(GetCurrentUserRoles(page), ROLE_EDIT_QUERY_EGRN.ToUpper());
    }
    public static bool IsROLE_DOC_PDD_VIEW(Page page)
    {
        return Contains(GetCurrentUserRoles(page),ROLE_DOC_PDD_VIEW.ToUpper());
    }
    public static bool IsROLE_DOC_PDD_EDIT(Page page)
    {
        return Contains(GetCurrentUserRoles(page),ROLE_DOC_PDD_EDIT.ToUpper());
    }
    public static bool IsRECEPTION_APPLICATIONS_EDIT(Page page)
    {
        return Contains(GetCurrentUserRoles(page),RECEPTION_APPLICATIONS_EDIT.ToUpper());
    }

    public static string[] GetCurrentUserRoles( Page page )
	{
		return PortalPrincipal.Current.Roles;
	}

	public static void RedirectToAccessDenied( Page page )
	{
		page.Response.Redirect( "~/SC/Error403.aspx", true );
	}

	public static string[] GetUserRoles( int id_user )
	{
		var roles = new List<string>();

		using (SqlConnection conn = new SqlConnection( ConfigurationManager.ConnectionStrings[ "portalFGU59ConnectionString" ].ConnectionString ))
		{
			conn.Open();
			try
			{
				using (SqlCommand cmd = conn.CreateCommand())
				{
					cmd.CommandText = "RolesForUser";
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.Parameters.AddWithValue( "id_user", id_user );
					using (SqlDataAdapter da = new SqlDataAdapter( cmd ))
					{
						using (DataTable dt = new DataTable())
						{
							da.Fill( dt );
							foreach (DataRow row in dt.Rows)
							{
								roles.Add( row[ "NAME" ].ToString() );
							}
						}
					}
				}
			}
			finally
			{
				conn.Close();
			}
			return roles.ToArray();
		}
	}

	public static string CurrentUserFillname( int id_user )
	{
		using (SqlConnection conn = new SqlConnection( ConfigurationManager.ConnectionStrings[ "portalFGU59ConnectionString" ].ConnectionString ))
		{
			conn.Open();
			try
			{
				using (SqlCommand cmd = conn.CreateCommand())
				{
					cmd.CommandText = "SELECT dbo.UsersFullname(@id_user)";
					cmd.CommandType = CommandType.Text;
					cmd.Parameters.AddWithValue( "id_user", id_user );
					return cmd.ExecuteScalar().ToString();
				}
			}
			finally
			{
				conn.Close();
			}
		}
	}

	public static string CurrentUserOtdelname( int id_user )
	{
		using (SqlConnection conn = new SqlConnection( ConfigurationManager.ConnectionStrings[ "portalFGU59ConnectionString" ].ConnectionString ))
		{
			conn.Open();
			try
			{
				using (SqlCommand cmd = conn.CreateCommand())
				{
					cmd.CommandText = "SELECT dbo.UsersOtdelname(@id_user)";
					cmd.CommandType = CommandType.Text;
					cmd.Parameters.AddWithValue( "id_user", id_user );
					return (string) cmd.ExecuteScalar();
				}
			}
			finally
			{
				conn.Close();
			}
		}
	}

	public static void GridView_RowDataBound(GridViewRow Row, params string[] columns)
	{
		bool red = false;
		bool yellow = false;
		object value;

		if (Row.TableSection != TableRowSection.TableBody)
			return;

		var row = Row.DataItem as DataRowView;
		if (row == null)
			return;

		foreach (string colName in columns)
		{
			try
			{
				value = row[ colName ];
				if (value is int)
				{
					if ((int) value <= 0)
						red = true;
					if ((int) value <= 3)
						yellow = true;
				}
			}
			catch
			{
			}
		}
		if (red)
		{
			if (Row.RowState == DataControlRowState.Alternate)
				Row.BackColor = Color.FromArgb( 255, 255, 64, 64 );
			else
				Row.BackColor = Color.FromArgb( 255, 255, 96, 96 );
		}
		else if (yellow)
		{
			if (Row.RowState == DataControlRowState.Alternate)
				Row.BackColor = Color.FromArgb( 255, 240, 240, 64 );
			else
				Row.BackColor = Color.FromArgb( 255, 255, 255, 64 );
		}
	}
    public static string Send_email(String body_subject, String body, String to_email, String links)
    {
        /*SmtpClient smtp = new SmtpClient(ConfigurationManager.AppSettings["MailServer"]);
        smtp.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["MailUserName"], ConfigurationManager.AppSettings["MailPassword"]);
        MailMessage Message=new MailMessage();
        Message.From = new MailAddress("portal@zkp.perm.ru");
        Message.To.Add(new MailAddress("zelenin@zkp.perm.ru"));
        Message.SubjectEncoding=Encoding.ASCII;
        Message.Subject = body_subject;
        Message.BodyEncoding=Encoding.ASCII;
        Message.Body=body;*/

        System.Web.Mail.MailMessage m = new System.Web.Mail.MailMessage();
        m.From = "portal@u59.rosreestr.ru";
        m.To = to_email;
        m.BodyFormat = System.Web.Mail.MailFormat.Html;
        m.BodyEncoding = System.Text.Encoding.GetEncoding("windows-1251");
        m.Subject = body_subject;
        m.Body = body;
        m.UrlContentBase = links;

        System.Web.Mail.SmtpMail.SmtpServer = "10.59.143.70";
        try
        {
            System.Web.Mail.SmtpMail.Send(m);
            return "Сообщение отправлено";
        }
        catch (Exception ex)
        {
            return "Сообщение не отправлено!-"+ex.Message.ToString();
        }

        /*MailMessage Message = new MailMessage(ConfigurationManager.AppSettings["MailFrom"], "zelenin@zkp.perm.ru", body_subject, body);
        try
        {
            smtp.Send(Message);
        }
        catch{
        }*/
    }

    /// <summary>
    /// Отправка письма на почтовый ящик C# mail send
    /// </summary>
    /// <param name="smtpServer">Имя SMTP-сервера</param>
    /// <param name="from">Адрес отправителя</param>
    /// <param name="password">пароль к почтовому ящику отправителя</param>
    /// <param name="mailto">Адрес получателя</param>
    /// <param name="caption">Тема письма</param>
    /// <param name="message">Сообщение</param>
    /// <param name="attachFile">Присоединенный файл</param>
    public static string SendMail(string smtpServer, string from, string password,
    string mailto, string caption, string message, string attachFile)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(from);
            mail.To.Add(new MailAddress(mailto));
            mail.Subject = caption;
            mail.Body = message;
            if (!string.IsNullOrEmpty(attachFile))
                mail.Attachments.Add(new Attachment(attachFile));
            SmtpClient client = new SmtpClient();
            client.Host = smtpServer;
            client.Port = 587;
            //client.Port = 25;
            client.EnableSsl = false;
            client.Credentials = new NetworkCredential(from.Split('@')[0], password);
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(mail);
            mail.Dispose();
            return "Сообщение отправлено";
        }
        catch (Exception e)
        {
            //throw new Exception("Mail.Send: " + e.Message);
            return "Сообщение не отправлено!-" + e.Message.ToString();
        }
    }

    /// <summary>
    /// Отправка письма на почтовый ящик C# mail send
    /// </summary>
    /// <param name="smtpServer">Имя SMTP-сервера</param>
    /// <param name="from">Адрес отправителя</param>
    /// <param name="password">пароль к почтовому ящику отправителя</param>
    /// <param name="mailto">Адрес получателя</param>
    /// <param name="caption">Тема письма</param>
    /// <param name="message">Сообщение</param>
    /// <param name="attachFile">Присоединенный файл</param>
    public static string SendMail(string smtpServer, string from, string password,
    string mailto, string caption, string message, string login, string attachFile, string attachFileSig)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(from);
            mail.To.Add(new MailAddress(mailto));
            mail.Subject = caption;
            mail.Body = message;
            if (!string.IsNullOrEmpty(attachFile))
                mail.Attachments.Add(new Attachment(attachFile));
            if (!string.IsNullOrEmpty(attachFileSig))
                mail.Attachments.Add(new Attachment(attachFileSig));
            SmtpClient client = new SmtpClient();
            client.Host = smtpServer;
            client.Port = 587;
            //client.Port = 25;
            client.EnableSsl = false;
            client.Credentials = new NetworkCredential(login, password);
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(mail);
            mail.Dispose();
            return "Сообщение отправлено";
        }
        catch (Exception e)
        {
            //throw new Exception("Mail.Send: " + e.Message);
            return "Сообщение не отправлено!-" + e.Message.ToString();
        }
    }

    public static string Send_emailForInnerServer(String body_subject, String body, String to_email)
    {

        System.Web.Mail.MailMessage m = new System.Web.Mail.MailMessage();
        m.From = "portal@zkp.perm.ru";
        m.To = to_email;
        m.BodyFormat = System.Web.Mail.MailFormat.Html;
        m.BodyEncoding = System.Text.Encoding.GetEncoding("windows-1251");
        m.Subject = body_subject;
        m.Body = body;
        System.Web.Mail.SmtpMail.SmtpServer = "robots.1gb.ru";

        try
        {
            System.Web.Mail.SmtpMail.Send(m);
            return "Сообщение отправлено";
        }
        catch (Exception ex)
        {
            return ex.Message.ToString();
        }
    }
    public static bool Send_SMS(String body_subject, String body, String phone, String links)
    {
       
        //For test +79679031723
        using (MailMessage mm = new MailMessage("FKP@sms.beeline.amega-inform.ru", phone+"@sms.beeline.amega-inform.ru"))
        {
            mm.Subject = body_subject;
            mm.Body = body;
           // if (fuAttachment.HasFile)
          //  {
              //  string FileName = Path.GetFileName(fuAttachment.PostedFile.FileName);
              //  mm.Attachments.Add(new Attachment(fuAttachment.PostedFile.InputStream, FileName));
           // }
            mm.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "beeline.amega-inform.ru";
            smtp.EnableSsl = false;
            NetworkCredential NetworkCred = new NetworkCredential("558800", "12345");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 256;
            try
            {
                smtp.Send(mm);
            }
            catch (Exception ex)
            {
                return false;
            }
           // ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
        }
        return true;
    }

    public static string Send_SMS_HTTP(String text, String phone)
    {
        string responseString = "";

        //https://www.smsdirect.ru/submit_message?login=kp_perm&pass=7nrs4iqpc&from=ZKP_59&to=79120000000&text=HELLO
        //For test +79679031723
        //text = "test portalFGU59";
        //phone = "79679031723";

        
        
        
        string ozSURL = "https://www.smsdirect.ru/submit_message?login="; //where Ozeki NG SMS Gateway is running
            //string ozSPort = "9501"; //port number where Ozeki NG SMS Gateway is listening
            string ozUser = HttpUtility.UrlEncode("kp_perm"); //username for successful login
            string ozPassw = HttpUtility.UrlEncode("7nrs4iqpc"); //user's password
            //string ozMessageType = "SMS:TEXT"; //type of message
            //string ozRecipients = HttpUtility.UrlEncode(textboxRecipient.Text); //who
            //will get the message
            //string ozMessageData = HttpUtility.UrlEncode(textboxMessage.Text); //body
            //of message
 
           


            String createdURL = ozSURL + ozUser + "&pass=" + ozPassw + "&from=ZKP_59&to=" + phone + "&text=" + text;
        
       try
        {
            //Create the request and send data to Ozeki NG SMS Gateway Server by HTTP connection
            HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(createdURL);
 
            //Get response from Ozeki NG SMS Gateway Server and read the answer
            HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
            System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
            responseString = respStreamReader.ReadToEnd();
            respStreamReader.Close();
            myResp.Close();
 
            //inform the user
            //textboxError.Text = responseString;
            //textboxError.Visible = true;
        }
        catch (Exception ex)
        {
            //if sending request or getting response is not successful, Ozeki NG - SMS Gateway Server may not be running
            //textboxError.Text = "Ozeki NG SMS Gateway Server is not running!";
            //textboxError.Visible = true;
            responseString = "Сообщение не отправлено, ошибка: "+ex.Message.ToString();
        }




       return responseString;
    }
    public static void CreateTestMessage1(String body_subject, String phone, String to_email)
    {
        string to = (phone + "@SMS.beeline.amega-inform.ru"); ;
        string from = "portal@zkp.perm.ru";
        string subject = "Проверка СМС";
        string body = @"Проверка СМС.";
        MailMessage message = new MailMessage(from, to, subject, body);
        SmtpClient client = new SmtpClient("beeline.amega-inform.ru", 256);
        // Credentials are necessary if the server requires the client 
        // to authenticate before it will send e-mail on the client's behalf.
        client.Host = "portal@zkp.perm.ru";
        client.Credentials = new System.Net.NetworkCredential("558800", "12345");
        //client.Credentials = CredentialCache.DefaultNetworkCredentials;

//        client.Credentials = new NetworkCredential("outmail-username", "outmail-password"); 
//client.Port = 25; //client.Send(Mail); 

       // try
       // {
            client.Send(message);
        //}
        //catch (Exception ex)
        //{
           // Console.WriteLine("Exception caught in CreateTestMessage1(): {0}",
               //   ex.ToString());
        //}
    }


   // public int _otStat { get; set; } 
    
    /// <summary>
    /// Статусы запросов для журнала ОТУТИ:
    /// 0. новый
    /// 1. в работе
    /// 2. закрыто
    /// 3. закрыто с просроком
    /// </summary>
    /// <returns></returns>
    public static string  OTUTY_status(int index)
    {
        ArrayList otStat = new ArrayList();
        otStat.Add("новый");
        otStat.Add("в работе");
        otStat.Add("закрыт");
        otStat.Add("закрыт с просроком");

        return otStat[index].ToString();
        
    }
    
    public static DateTime WorkDateGet (string currentDate)
    {
        WorkDays objWork = new WorkDays();
        DateTime control_date = DateTime.MinValue;
        SqlDataReader objSql=objWork.WorkDaysSelectControlDay(Convert.ToDateTime(currentDate), 5);
        try
        {
            objSql.Read();
            control_date = Convert.ToDateTime(objSql["DATE"].ToString());                   
        }
        catch
        {
            return control_date;
        }
        finally
        {
            objSql.Close();
        }

        return control_date;
    }
    public static DateTime WorkDateGet(string currentDate, int countDay)
    {
        WorkDays objWork = new WorkDays();
        DateTime control_date = DateTime.MinValue;
        SqlDataReader objSql = objWork.WorkDaysSelectControlDay(Convert.ToDateTime(currentDate), countDay);
        try
        {
            objSql.Read();
            control_date = Convert.ToDateTime(objSql["DATE"].ToString());
        }
        catch
        {
            return control_date;
        }
        finally
        {
            objSql.Close();
        }

        return control_date;
    }
    public static DataTable FillCalendarChoices()
    {
        DateTime thisdate = new DateTime(DateTime.Today.Year, 1, 1);


        DataTable dtMonth = new DataTable();
        dtMonth.Columns.AddRange(new DataColumn[2] { new DataColumn("id_month", typeof(string)),
                            new DataColumn("month_view", typeof(string))
                             });

        // Fills in month values
        for (int x = 0; x < 12; x++)
        {
            // Loops through 12 months of the year and fills in each month value
            //ListItem li = new ListItem(thisdate.ToString("MMMM"), thisdate.Month.ToString());
            //DropDownListMonthSelect.Items.Add(li);
            dtMonth.Rows.Add(thisdate.Month.ToString(), thisdate.ToString("MMMM"));

            thisdate = thisdate.AddMonths(1);
        }
        return dtMonth;
    }
    /// <summary>
    /// Обработка поля даты с учетом возможных нулевых значений
    /// </summary>
    /// <param name="str_date_last"></param>
    /// <returns></returns>
    public static object ConvertDate(string str_date)
    {
        object obj_date;

        if (null != str_date) { str_date = str_date.Trim(); }

        if (string.IsNullOrEmpty(str_date))
        {
            obj_date = DBNull.Value;
        }
        else
        {
            obj_date = DateTime.Parse(str_date);
        }
        return obj_date;
    }
    /// <summary>
    /// Проверка на наличие соответствующей роли
    /// </summary>
    /// <param name="id_users"></param>
    /// <param name="role"></param>
    /// <returns></returns>
    public static bool IsRolesActive(int id_users, string role)
    {
        String[] roles = Utilites.GetUserRoles(id_users);
        bool est = false;
        for (int i = 0; i < roles.GetLength(0); i++)
        {
            if (roles[i].ToUpper().Trim() == role.ToUpper().Trim())
            {
                est = true;
                break;
            }
        }
        return est;
    }


}
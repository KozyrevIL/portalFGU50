<%@ Application Language="C#" %>

<script RunAt="server">

    void Application_Start( object sender, EventArgs e )
    {
        // Код, выполняемый при запуске приложения

    }

    void Application_End( object sender, EventArgs e )
    {
        //  Код, выполняемый при завершении работы приложения

    }
    void Session_Start( object sender, EventArgs e )
    {
        // Код, выполняемый при запуске нового сеанса
    }

    void Session_End( object sender, EventArgs e )
    {
        // Код, выполняемый при запуске приложения. 
        // Примечание. Событие Session_End вызывается только в том случае, если для режима sessionstate
        // задано значение InProc в файле Web.config. Если для режима сеанса задано значение StateServer 
        // или SQLServer, событие не порождается.

    }
    
    protected void Application_AuthenticateRequest( Object sender, EventArgs e )
    {
        // Extract the forms authentication cookie
        string cookieName = FormsAuthentication.FormsCookieName;
        HttpCookie authCookie = Context.Request.Cookies[ cookieName ];
        if (null == authCookie)
        {
            if (Request.Cookies[ "userInfo" ] != null)
            {
                HttpCookie userInfoRemove = new HttpCookie( "userInfo" );
                userInfoRemove.Expires = DateTime.Now.AddDays( -1d );
                Response.Cookies.Add( userInfoRemove );
            }
            return;
        }
        FormsAuthenticationTicket authTicket = null;
        try
        {
            authTicket = FormsAuthentication.Decrypt( authCookie.Value );
        }
        catch 
        {
            // Log exception details (omitted for simplicity)
            return;
        }
        if (null == authTicket)
        {
            // Cookie failed to decrypt.
            return;
        }
        
        // Create an Identity object
        FormsIdentity id = new FormsIdentity( authTicket );
        PortalPrincipal principal;
        string[] roles = null;


		
        // Идентификация пользователя         
        HttpCookie userInfo = Request.Cookies[ "userInfo" ];

		
        if (userInfo == null)
        {
			int userId = Utilites.GetCurrentUserlIdFromName( id.Name );
			
            userInfo = new HttpCookie( "userInfo" );
			userInfo.Expires = authTicket.Expiration;
            
            roles = Utilites.GetUserRoles( userId );
            StringBuilder rolesString = new StringBuilder();
            foreach (var role in roles)
            {
                if (rolesString.Length == 0)
                    rolesString.Append( role );
                else
                    rolesString.AppendFormat( ",{0}", role );
            }

            userInfo[ "user_id" ] = userId.ToString();
            userInfo[ "roles" ] = Server.UrlEncode( rolesString.ToString() );
            userInfo[ "fullname" ] = Server.UrlEncode(Utilites.CurrentUserFillname( userId ));
            userInfo[ "otdelname" ] = Server.UrlEncode(Utilites.CurrentUserOtdelname( userId ));
			userInfo[ "filial_id" ] = Utilites.GetUserFilialId( userId ).ToString();
			userInfo[ "otdel_id" ] = Utilites.CurrentUserOtdelId( userId ).ToString();
            
            Response.Cookies.Add( userInfo );
        }
        else
        {
            roles = Server.UrlDecode( userInfo[ "roles" ] ).Split( ',' );
        }

		// Создаём объект пользователя
		principal = new PortalPrincipal( id, roles );

		// Заполняем объект пользователя данными
        int filial_id = 0, otdel_id = 0;
        int.TryParse( userInfo[ "filial_id" ], out filial_id );
        int.TryParse( userInfo[ "otdel_id" ], out otdel_id );

		principal.UserId = userInfo[ "user_id" ].ToInteger().Value;
        principal.UserFullName = Server.UrlDecode( userInfo[ "fullname" ] );
        principal.UserOtdelName = Server.UrlDecode( userInfo[ "otdelname" ] );
        principal.FilialId = filial_id;
        principal.OtdelId = otdel_id;

        // Attach the new principal object to the current HttpContextobject
        Context.User = principal;

		/*
		 * Для обратной совместимости со старой авторизацией портала
		 */
		if (null == Request.Cookies[ "id_userFGU59" ])
			Response.Cookies.Add( new HttpCookie( "id_userFGU59", principal.UserId.ToString() ) );

		if (null == Request.Cookies[ "loginFGU59" ])
			Response.Cookies.Add( new HttpCookie( "loginFGU59", principal.Identity.Name ) );
    }
    
    protected void Application_AuthorizeRequest( object sender, EventArgs e )
    {

    }

    protected void Application_DefaultAuthentication( object sender, EventArgs e )
    {
    }

    protected void Application_PostAuthenticateRequest( object sender, EventArgs e )
    {

    }

    protected void Application_PostAuthorizeRequest( object sender, EventArgs e )
    {

    }

    

    protected void Application_Error( Object sender, EventArgs e )
    {
        Exception objErr = Server.GetLastError().GetBaseException();
        //Session["Error"] = "Message error:" + objErr.Message.ToString();
    }


</script>


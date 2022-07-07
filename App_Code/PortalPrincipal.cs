using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;
using System.Runtime.InteropServices;
using System.Web.UI;

/// <summary>
/// Сводное описание для PortalPrincipal
/// </summary>
/// [Serializable]
[ComVisible( true )]
public class PortalPrincipal : IPrincipal
{
	public PortalPrincipal( IIdentity identity, string[] roles )
	{
		Identity = identity;
		_Roles = new List<string>( roles.Length );
		_Roles.AddRange( roles.Select( a => a.ToUpper() ).ToArray() );
	}

	private List<string> _Roles;
	public string[] Roles { get { return _Roles.ToArray(); } } 

	public int UserId { get; set; }
	public int FilialId { get; set; }
	public int OtdelId { get; set; }
	public string UserFullName { get; set; }
	public string UserOtdelName { get; set; }

	#region Члены IPrincipal

	public IIdentity Identity { get; set; }

	public bool IsInRole( string role )
	{
		return ( Roles.Contains( role.ToUpper() ) );
	}

	#endregion

	public static PortalPrincipal Current
	{
		get
		{
			PortalPrincipal user = HttpContext.Current.User as PortalPrincipal;
			if (user == null)
				HttpContext.Current.Response.Redirect( "~/logon.aspx" );
			return user;
		}
	}
}

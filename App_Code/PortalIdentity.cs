using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;

/// <summary>
/// Сводное описание для PortalIdentity
/// </summary>
public class PortalIdentity : IIdentity
{
	public PortalIdentity()
	{
		//
		// TODO: добавьте логику конструктора
		//
	}

	#region Члены IIdentity

	public string AuthenticationType
	{
		get { throw new NotImplementedException(); }
	}

	public bool IsAuthenticated
	{
		get { throw new NotImplementedException(); }
	}

	public string Name { get; set; }

	#endregion
}

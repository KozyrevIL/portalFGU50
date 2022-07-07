using System;
using System.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class UC_menu_admin_vert : System.Web.UI.UserControl
{
	protected void Page_Load( object sender, EventArgs e )
	{
		if (!IsPostBack)
		{
			//Администратор
			//bool admin = PortalPrincipal.Current.IsInRole( Utilites.ROLE_ADMIN );
			////Пользователь
			//bool user = PortalPrincipal.Current.IsInRole( Utilites.ROLE_USER );
			////Гость
			//bool guest = PortalPrincipal.Current.IsInRole( Utilites.ROLE_GUEST );
			////Анализ Тестов
			//bool test_analiz = PortalPrincipal.Current.IsInRole( Utilites.ROLE_TEST_ANALIZ );
			////Информобмен
			//bool inform = PortalPrincipal.Current.IsInRole( Utilites.ROLE_INFOBM );
			////Администратор отчёта о работе отдела
			//bool scr_admin = PortalPrincipal.Current.IsInRole( Utilites.ROLE_SCR_ADMIN );
			////Редактор отчёта о работе отдела
			//bool scr_edit = PortalPrincipal.Current.IsInRole( Utilites.ROLE_SCR_EDIT );

			//TreeNode node;

			//String login = Request.Cookies[ "loginFGU59" ].Value;
			//int id_users = Convert.ToInt32( Request.Cookies[ "id_userFGU59" ].Value );

			//Users objUsers = new Users();
			//SqlDataReader readerUsers = objUsers.SelectLogonRoles( id_users );

			//readerUsers.Read();
			//String full_name = readerUsers[ "full_name" ].ToString();
			//String name_roles = readerUsers[ "name_roles" ].ToString();
			//readerUsers.Close();

			//
			//Раграничение доступа по ролям
			//
			//if (admin == false)
			//{
			//	TreeView1.Nodes.Remove(TreeView1.FindNode( "Администрирование" ) );
   //             TreeView1.Nodes.Remove(TreeView1.FindNode("Настройка страниц портала"));
   //             TreeView1.Nodes.Remove(TreeView1.FindNode("Доска почета"));
   //             //TreeView1.Nodes.Remove(TreeView1.FindNode("Объявления"));
   //             //TreeView1.Nodes.Remove(TreeView1.FindNode("Сотрудники"));
			//}

			//if (admin == false &&
			//	test_analiz == false)
			//{
			//	TreeView1.Nodes.Remove( TreeView1.FindNode( "Тесты" ) );
			//}

			//if (admin == false &&
			//	user == false)
			//{
			//	TreeView1.Nodes.Remove( TreeView1.FindNode( "Справочники" ) );
			//	//TreeView1.Nodes.Remove( TreeView1.FindNode( "Документооборот" ) );
			//	TreeView1.Nodes.Remove( TreeView1.FindNode( "Планировщик событий" ) );
			//	//TreeView1.Nodes.Remove(TreeView1.FindNode("Тесты"));
			//	TreeView1.Nodes.Remove( TreeView1.FindNode( "Новости" ) );
			//	//TreeView1.Nodes.Remove(TreeView1.FindNode("Администрирование"));
			//	TreeView1.Nodes.Remove( TreeView1.FindNode( "Склад" ) );

			//	var reports = TreeView1.FindNode( "reports" );
			//	for (int i = 0; i < reports.ChildNodes.Count; )
			//	{
			//		string value = reports.ChildNodes[ i ].Value;
			//		if (value == "antivir_journal" ||
			//			value == "accepted_requests_form")
			//			i++;
			//		else
			//			reports.ChildNodes.RemoveAt( i );
			//	}
			//}

			//if (admin == false && 
			//	scr_edit == false)
			//{
			//	node = TreeView1.FindNode( "SCReport/SCEdit" );
			//	node.Parent.ChildNodes.Remove( node );
			//}

			//if (admin == false && 
			//	scr_admin == false)
			//{
			//	node = TreeView1.FindNode( "SCReport/SCReport" );
			//	node.Parent.ChildNodes.Remove( node );
			//	node = TreeView1.FindNode( "SCReport/SCRoles" );
			//	node.Parent.ChildNodes.Remove( node );
			//}

			//node = TreeView1.FindNode( "SCReport" );
			//if (node.ChildNodes.Count == 0)
			//	if (null != node.Parent)
			//		node.Parent.ChildNodes.Remove( node );
			//	else
			//		TreeView1.Nodes.Remove( node );

			//if (admin == false && 
			//	guest == false )
			//{
			//	/*
			//	var reports = TreeView1.FindNode( "reports" );
			//	for (int i = 0; i < reports.ChildNodes.Count; )
			//	{
			//		string value = reports.ChildNodes[ i ].Value;
			//		if (value != "antivir_journal" ||
			//			value != "accepted_requests_form")
			//			i++;
			//		else
			//			reports.ChildNodes.RemoveAt( i );
			//	}
			//	*/
			//}
			//if (admin == false && 
			//	inform == false)
			//{
			//	var inform_obmen = TreeView1.FindNode( "inform_obmen" );
			//	for (int i = 0; i < inform_obmen.ChildNodes.Count; )
			//	{
			//		if (inform_obmen.ChildNodes[ i ].Value == "journal")
			//			i++;
			//		else
			//			inform_obmen.ChildNodes.RemoveAt( i );
			//	}
			//}
		}
	}
}



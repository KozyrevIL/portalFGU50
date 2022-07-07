using System;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_admin_sotrudnik : System.Web.UI.Page
{
	protected void Page_Load( object sender, EventArgs e )
	{
		if (!IsPostBack)
		{

            //if ((PortalPrincipal.Current.IsInRole(Utilites.ROLE_ADMIN) == false) || (PortalPrincipal.Current.IsInRole(Utilites.ROLE_USER) == false)) Server.Transfer("admin.aspx");

			DropDownListFilial.DataSource = SqlDataSourceFilial;
			DropDownListFilial.DataTextField = "name_filial";
			DropDownListFilial.DataValueField = "id_filial";
			DropDownListFilial.DataBind();

			ListItem objFilial = new ListItem( "выбор", "-1" );

			DropDownListFilial.Items.Insert( 0, objFilial );

			//----------------------------------------------

			DropDownListDolgnost.DataSource = SqlDataSourceDolgnost;
			DropDownListDolgnost.DataTextField = "name_dolgnost";
			DropDownListDolgnost.DataValueField = "id_dolgnost";
			DropDownListDolgnost.DataBind();

			ListItem objDolgnost = new ListItem( "выбор", "-1" );
			DropDownListDolgnost.Items.Insert( 0, objDolgnost );

			//----------------------------------------------

			DropDownListOtdel.DataSource = SqlDataSourceOtdel;
			DropDownListOtdel.DataTextField = "name_otdel";
			DropDownListOtdel.DataValueField = "id_otdel";
			DropDownListOtdel.DataBind();

			DropDownListOtdelFact.DataSource = SqlDataSourceOtdel;
			DropDownListOtdelFact.DataTextField = "name_otdel";
			DropDownListOtdelFact.DataValueField = "id_otdel";
			DropDownListOtdelFact.DataBind();

			DropDownListFiltr.DataSource = SqlDataSourceOtdel;
			DropDownListFiltr.DataTextField = "name_otdel";
			DropDownListFiltr.DataValueField = "id_otdel";
			DropDownListFiltr.DataBind();

            DropDownListGroupQuery.DataSource = this.SqlDataSourceSotrudnikGroup;
            DropDownListGroupQuery.DataTextField = "nameGroupQuery";
            DropDownListGroupQuery.DataValueField = "id_groupQuery";
            DropDownListGroupQuery.DataBind();

            DropDownListSotrudnikRef.DataSource = this.SqlDataSourceSotrudnik;
            DropDownListSotrudnikRef.DataTextField = "full_name";
            DropDownListSotrudnikRef.DataValueField = "id_sotrudnik";
            DropDownListSotrudnikRef.DataBind();

			ListItem objOtdel = new ListItem( "выбор", "-1" );
			DropDownListOtdel.Items.Insert( 0, objOtdel );
			DropDownListOtdelFact.Items.Insert( 0, objOtdel );
			DropDownListFiltr.Items.Insert( 0, objOtdel );
            DropDownListGroupQuery.Items.Insert(0, objOtdel);
            DropDownListSotrudnikRef.Items.Insert(0, objOtdel);


		}

		LabelError.Visible = false;

		ButtonInsertFilial.Visible = true;
		ButtonUpdate.Visible = false;
		ButtonCancel.Visible = false;

        //Настройка страницы под текущего пользователя


        String login = Request.Cookies["loginFGU59"].Value;
        int id_users = Convert.ToInt32(Request.Cookies["id_userFGU59"].Value);
        

        Users objUsers = new Users();
        SqlDataReader readerUsers = objUsers.SelectLogonRoles(id_users);
        String user_logon = "";
       
        try
        {
            readerUsers.Read();

            //Полное имя пользователя
            user_logon = readerUsers["full_name"].ToString();
            //if (readerUsers[5].ToString().Trim() != "Администратор") // только администратор может внести изменения в группу сэд
                //DropDownListGroupQuery.Enabled = false;
            //Response.Write("<script>alert('" + readerUsers[5].ToString() + "')</script>");
            
        }
        catch
        {
        }
        finally
        {
            readerUsers.Close();
        }


        //Admin_banner1.user_logon = user_logon;

      

        //Авторизация - разрешаем добавлять ролям "Добавление сотрудников" и "Администратор"

        bool access = false;

        if (Utilites.IsRolesActive(id_users, Utilites.ROLE_CREATE_SOTRUDNIK)) { access = true; }
        if (Utilites.IsRolesActive(id_users, Utilites.ROLE_ADMIN)) { access = true; }

        ButtonInsertFilial.Enabled = access;

        //Авторизация - разрешаем редактировать ролям "Добавление сотрудников", "Редактирование сотрудников" и "Администратор"

        if (Utilites.IsRolesActive(id_users, Utilites.ROLE_EDIT_SOTRUDNIK))
        { access = true; }

        ButtonUpdate.Enabled = access;
	}

    protected void BindGrid()
    {
        object data = null;
        //string find = "-1";

        //string selector = DropDowlListFiltr.SelectedValue;

       
        //if (TextBoxFind.Text != "") find = TextBoxFind.Text;

        this.SqlDataSourceSotrudnik_promotion.SelectParameters[0].DefaultValue = ViewState["id_sotrudnik"].ToString();
        //this.SqlDataSourceSotrudnik_promotion.SelectParameters[1].DefaultValue = find;

        data = SqlDataSourceSotrudnik_promotion.Select(DataSourceSelectArguments.Empty);

        GridViewSotrudnik_promotion.DataSource = data;
        GridViewSotrudnik_promotion.DataBind();
    }



    protected void ButtonInsertFilial_Click1( object sender, EventArgs e)
	{

		int id_otdel = -1;
		int id_otdel_fact = -1;
		int id_dolgnost = -1;
		int id_filial = -1;
		String first_name = "";
		String last_name = "";
		String middle_name = "";
        bool initSed = false;
        int id_groupQuery = 0;
        int id_sotrudnik_ref=0;
        int count_hours_in_week = 40;
        String comments = this.TextBoxComments.Text;
        String items = Guid.NewGuid().ToString();

        String type_tabel = DropDownListType_tabel.SelectedValue;// TextBoxType_tabel.Text;
        bool show_phone = CheckBoxShow_phone.Checked;
        try { count_hours_in_week = Convert.ToInt16(TextBoxCountHoursInWeek.Text); }//Кол-во часов в неделю } 
        catch { }
        

        id_otdel = Convert.ToInt32( DropDownListOtdel.SelectedValue );
		id_otdel_fact = Convert.ToInt32( DropDownListOtdelFact.SelectedValue );
		id_dolgnost = Convert.ToInt32( DropDownListDolgnost.SelectedValue );
		id_filial = Convert.ToInt32( DropDownListFilial.SelectedValue );
		first_name = TextBoxFirst_name.Text;
		last_name = TextBoxLast_name.Text;
		middle_name = TextBoxMiddle_name.Text;

		String number_cab = TextBoxNumber_cab.Text;
		String number_phone = TextBoxNumber_phone.Text;
        String number_ip_phone = "";
        String number_mob = TextBoxNumber_mob.Text;
		try
		{
			number_ip_phone = TextBoxNumber_ip_phone.Text;
		}
		catch
		{
		}

		String email = TextBoxEmail.Text;
		String email2 = TextBoxEmail2.Text;

		bool active = false;

		if (CheckBoxActive.Checked == true)
			active = true;

        id_groupQuery = Convert.ToInt16(DropDownListGroupQuery.SelectedValue.ToString());
        string table_number = "";
        table_number = TextBoxTabelNumber.Text;
        string FIO_for_doc = TextBoxFIO_for_doc.Text;
        string power_attorney_doc = TextBoxPower_attorney_doc.Text;


        //if (CheckBoxSed.Checked == true)
        //initSed = true;

        if (id_otdel != -1 && id_dolgnost != -1 && id_filial != -1)
		{
            try
            {
                Sotrudnik objSotrudnik = new Sotrudnik();

                objSotrudnik.InsertSotrudnik(

                    id_otdel,
                    id_otdel_fact,
                    id_dolgnost,
                    id_filial,
                    first_name,
                    last_name,
                    middle_name,
                    number_cab,
                    number_phone,
                    number_ip_phone,
                    email,
                    email2,
                    active,
                    initSed,
                    id_groupQuery,
                    id_sotrudnik_ref,
	                items,
	                comments,
                    number_mob,
                    type_tabel,
                    show_phone,
                    count_hours_in_week,
                    table_number,
                    FIO_for_doc,
                    power_attorney_doc

                );
            }
            catch (Exception ex)
            {
                LabelError.Visible = true;
                LabelError.Text = ex.Message;
            }

			GridView1.DataBind();
			ClearFoms();
		}
		else
		{
			LabelError.Visible = true;
			LabelError.Text = "Ошибка заполнения формы!";
		}

        //Выгрузка пользователей - начало

        //try
        //{
        //    StreamWriter SW = File.CreateText(@"c:\inetpub\wwwroot\portalFGU59\XML\active_directory.txt");
        //    SW.WriteLine(id_otdel);
        //    SW.WriteLine(DropDownListOtdelFact.SelectedItem.ToString());
        //    SW.WriteLine(last_name);
        //    SW.WriteLine(first_name);
        //    SW.WriteLine(middle_name);
        //    SW.WriteLine(number_cab);
        //    SW.WriteLine(DropDownListFilial.SelectedItem.ToString());
        //    SW.WriteLine(DropDownListDolgnost.SelectedItem.ToString());
        //    SW.Close();
        //}
        //catch (Exception Ex)
        //{
        //    LabelError.Visible = true;
        //    LabelError.Text = Ex.Message.ToString();
        //}

        //try
        //{
        //    StreamWriter SW = File.CreateText(@"D:\ad.txt");
        //    SW.WriteLine("ad.txt" + TextBoxFirst_name + TextBoxLast_name + TextBoxMiddle_name);
        //    SW.Close();
        //}
        //catch (Exception ex)
        //{
        //    Response.Write("<script type=\"text/javascript\" language=\"javascript\">alert(\'Error User\')</script>" + ex.Message);
        //}
        //FileStream FS = new FileStream(@"D:\ActiveDirectory.txt\", FileMode.OpenOrCreate);
        //StringReader SR = new StringReader("");
        //StreamWriter SW = new StreamWriter(FS);
        //SW.Write(SR.ReadToEnd());
        //SW.Flush();
        //foreach (Control c in this.Controls)
        //    if (c is DropDownList)
        //    {
        //        if (!File.Exists(c.Controls + @"D:\ActiveDirectory.txt"))
        //            File.Create(c.Controls + @"D:\ActiveDirectory.txt").Close();
        //        File.WriteAllText(c.Controls + @"D:\ActiveDirectory.txt", c.Controls.ToString());
        //    }
        //foreach (Control c in this.Controls)
        //    if (c is TextBox)
        //{
        //        if (!File.Exists(c.Controls + @"D:\ActiveDirectory.txt"))
        //            File.Create(c.Controls + @"D:\ActiveDirectory.txt").Close();
        //        File.WriteAllText(c.Controls + @"D:\ActiveDirectory.txt", c.Controls.ToString());
        //}
        //Выгрузка пользователей - конец

        // Подгрузка изображения на сервер

        LoadPhoto(items);
    }

    public void LoadPhoto(String items)
    {
        // Подгрузка изображения на сервер
        int fileLengthImg = FileUploadImage.PostedFile.ContentLength;
        if (fileLengthImg > 0)
            try
            {
                //ID фото----------------------
                String id_item = items;
                String item = "sotrudnik";
                //-----------------------------
                byte[] images;
                String name_images;
                String type_images;
                int size_images;
                String alt_images = "";

                type_images = this.FileUploadImage.PostedFile.ContentType;
                size_images = FileUploadImage.PostedFile.ContentLength;
                images = new byte[size_images];

                FileUploadImage.PostedFile.InputStream.Read(images, 0, size_images);
                int indexOfSlash = FileUploadImage.PostedFile.FileName.LastIndexOf("\\") + 1;

                name_images = FileUploadImage.PostedFile.FileName.Substring(indexOfSlash);


                Images objImages = new Images();
                objImages.ImagesUpdate
                (
                    id_item,
                    item,
                    images,
                    name_images,
                    type_images,
                    size_images,
                    alt_images
                );

               // have_images = true;
            }
            catch (Exception ex)
            {
                LabelError.Text = ex.Message;
                LabelError.Visible = true;

            }
    }

	protected void GridView1_RowDataBound( object sender, GridViewRowEventArgs e )
	{

        if (e.Row.RowType == DataControlRowType.DataRow &&
           (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate || e.Row.RowState == DataControlRowState.Selected || e.Row.RowState == (DataControlRowState.Selected | DataControlRowState.Alternate)))
        {	        
            String id_item = ((Label)e.Row.FindControl("LabelItemItems")).Text;
            String item = "sotrudnik";
            int w = 85;
            int h = 115;

            if (id_item!="")
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageCatalog")).ImageUrl = "./../photoDB.ashx?item=" + item + "&id_item=" + id_item + "&w=" + w + "&h=" + h;
                
            }
            else
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageCatalog")).Visible = false;
            }
        }

		if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState == DataControlRowState.Edit)
		{
			( (DropDownList) e.Row.FindControl( "DropDownListEditOtdel" ) ).DataSource = SqlDataSourceOtdel;
			( (DropDownList) e.Row.FindControl( "DropDownListEditOtdel" ) ).DataTextField = "name_otdel";
			( (DropDownList) e.Row.FindControl( "DropDownListEditOtdel" ) ).DataValueField = "id_otdel";
			( (DropDownList) e.Row.FindControl( "DropDownListEditOtdel" ) ).SelectedValue = DataBinder.Eval( e.Row.DataItem, "id_otdel" ).ToString();
			( (DropDownList) e.Row.FindControl( "DropDownListEditOtdel" ) ).DataBind();

			Color red_color = Color.FromArgb( 255, 170, 170 );
			Color yellow_color = Color.FromArgb( 255, 255, 191 );

			bool active = ( (CheckBox) GridView1.SelectedRow.FindControl( "CheckBocActive" ) ).Checked;
		}
	}
	protected void ClearFoms()
	{
		DropDownListOtdel.SelectedIndex = 0;
		DropDownListOtdelFact.SelectedIndex = 0;
		DropDownListDolgnost.SelectedIndex = 0;
		DropDownListFilial.SelectedIndex = 0;
        DropDownListType_tabel.SelectedIndex = 0;

		TextBoxFirst_name.Text = "";
		TextBoxLast_name.Text = "";
		TextBoxMiddle_name.Text = "";
		ButtonInsertFilial.Text = "Добавить сотрудника";

		TextBoxNumber_cab.Text = "";
		TextBoxNumber_phone.Text = "";

		TextBoxNumber_ip_phone.Text = "";

		TextBoxEmail.Text = "";
		TextBoxEmail2.Text = "";

        TextBoxFIO_for_doc.Text = "";

        CheckBoxActive.Checked = true;
	}
	protected void GridView1_SelectedIndexChanged( object sender, EventArgs e )
	{
        int id_sotrudnik_ref = 0;
		//ClearFoms();  

		TextBoxFirst_name.Text = ( (Label) GridView1.SelectedRow.FindControl( "LabelItemFirst_name" ) ).Text;
		TextBoxLast_name.Text = ( (Label) GridView1.SelectedRow.FindControl( "LabelItemLast_name" ) ).Text;
		TextBoxMiddle_name.Text = ( (Label) GridView1.SelectedRow.FindControl( "LabelItemMiddle_name" ) ).Text;
		String name_otdel = ( (Label) GridView1.SelectedRow.FindControl( "LabelItemOtdel" ) ).Text;
		String name_otdel_fact = ( (Label) GridView1.SelectedRow.FindControl( "LabelItemOtdelFact" ) ).Text;
		String name_dolgnost = ( (Label) GridView1.SelectedRow.FindControl( "LabelItemDolgnost" ) ).Text;
		String name_filial = ( (Label) GridView1.SelectedRow.FindControl( "LabelItemFilial" ) ).Text;

		int id_sotrudnik = Convert.ToInt32( ( (Label) GridView1.SelectedRow.FindControl( "LabelItemId_sotrudnik" ) ).Text );
		int id_otdel = Convert.ToInt32( ( (Label) GridView1.SelectedRow.FindControl( "LabelItemId_otdel" ) ).Text );
		int id_otdel_fact = Convert.ToInt32( ( (Label) GridView1.SelectedRow.FindControl( "LabelItemId_otdel_fact" ) ).Text );
		int id_filial = Convert.ToInt32( ( (Label) GridView1.SelectedRow.FindControl( "LabelItemId_filial" ) ).Text );
		int id_dolgnost = Convert.ToInt32( ( (Label) GridView1.SelectedRow.FindControl( "LabelItemId_dolgnost" ) ).Text );

		String number_cab = ( (Label) GridView1.SelectedRow.FindControl( "LabelItemNumber_cab" ) ).Text;
		String number_phone = ( (Label) GridView1.SelectedRow.FindControl( "LabelItemNumber_phone" ) ).Text;
		String number_ip_phone = ( (Label) GridView1.SelectedRow.FindControl( "LabelItemNumber_ip_phone" ) ).Text;
        String number_mob = ((Label)GridView1.SelectedRow.FindControl("LabelItemNumber_mob")).Text;
		String email = ( (Label) GridView1.SelectedRow.FindControl( "LabelItemEmail" ) ).Text;
		String email2 = ( (Label) GridView1.SelectedRow.FindControl( "LabelItemEmail2" ) ).Text;
        String comments = ((Label)GridView1.SelectedRow.FindControl("LabelItemComments")).Text;

        //String type_tabel = ((Label)GridView1.SelectedRow.FindControl("LabelItemtype_tabel")).Text;
        bool show_phone = ((CheckBox)GridView1.SelectedRow.FindControl("CheckBoxItemShow_phone")).Checked ?  CheckBoxShow_phone.Checked = true : CheckBoxShow_phone.Checked = false;
        String type_tabel=((Label)GridView1.SelectedRow.FindControl("LabelItemtype_tabel")).Text;

        String tabel_number = ((Label)GridView1.SelectedRow.FindControl("LabelItemTabel_number")).Text;

        String FIO_for_doc = ((Label)GridView1.SelectedRow.FindControl("LabelItemFIO_for_doc")).Text;
        TextBoxFIO_for_doc.Text = FIO_for_doc;

        String power_attorney_doc = ((Label)GridView1.SelectedRow.FindControl("LabelItemPower_attorney_doc")).Text;
        TextBoxPower_attorney_doc.Text = power_attorney_doc;

        

        int count_hours_in_week =0;
        try {count_hours_in_week = Convert.ToInt16(((Label)GridView1.SelectedRow.FindControl("LabelItemСount_hours_in_week")).Text); } catch { }
        


        int id_groupQuery = Convert.ToInt16(((Label)GridView1.SelectedRow.FindControl("LabelItemId_groupQuery")).Text);
        try
        {
            id_sotrudnik_ref = Convert.ToInt16(((Label)GridView1.SelectedRow.FindControl("LabelItemId_sotrudnik_ref")).Text);
        }
        catch
        {
            
        }
        String items = ((Label)GridView1.SelectedRow.FindControl("LabelItemItems")).Text;

        ViewState["items"] = items;

		
		CheckBoxActive.Checked = false;
		if (( (CheckBox) GridView1.SelectedRow.FindControl( "CheckBoxItemActive" ) ).Checked == true)
			CheckBoxActive.Checked = true;

    
        

		DropDownListOtdel.SelectedValue = id_otdel.ToString();
		DropDownListOtdelFact.SelectedValue = id_otdel_fact.ToString();
        try
        {
            DropDownListFilial.SelectedValue = id_filial.ToString();
            DropDownListFilial.BackColor = System.Drawing.Color.Empty;
            LabelError.Visible = false;
        }
        catch
        {
            DropDownListFilial.SelectedIndex = 0;
            DropDownListFilial.BackColor = System.Drawing.Color.Red;
            LabelError.Visible = true;
            LabelError.Text = "Некорректный филиал";
        }

		DropDownListDolgnost.SelectedValue = id_dolgnost.ToString();
        DropDownListGroupQuery.SelectedValue = id_groupQuery.ToString();
        DropDownListType_tabel.SelectedIndex = 0;
        DropDownListType_tabel.SelectedValue = type_tabel == "-1" ? " " : type_tabel;

        try
        {
            DropDownListSotrudnikRef.SelectedValue = id_sotrudnik_ref.ToString();
            
        }
        catch
        {
            DropDownListSotrudnikRef.SelectedIndex = 0;
        }
		
		TextBoxNumber_cab.Text = number_cab;
		TextBoxNumber_phone.Text = number_phone;
        TextBoxNumber_mob.Text = number_mob;

		TextBoxNumber_ip_phone.Text = number_ip_phone;

		TextBoxEmail.Text = email;
		TextBoxEmail2.Text = email2;

        TextBoxCountHoursInWeek.Text = count_hours_in_week.ToString();

        TextBoxTabelNumber.Text = tabel_number;
        TextBoxComments.Text= comments;

        ViewState[ "id_sotrudnik" ] = id_sotrudnik;

		ButtonInsertFilial.Visible = false;
		ButtonUpdate.Visible = true;
		ButtonCancel.Visible = true;

        String id_item = items;
        String item = "sotrudnik";
        int w = 85;
        int h = 115;

        ImagePhoto.ImageUrl = "./../photoDB.ashx?item=" + item + "&id_item=" + id_item + "&w=" + w + "&h=" + h;

        BindGrid();

    }
	protected void GridView1_SelectedIndexChanging( object sender, GridViewSelectEventArgs e )
	{
		//int index = Convert.ToInt16( GridView1.SelectedIndex.ToString() );
		//GridViewRow row = GridView1.SelectedRow;
		//ClearFoms();

	}
	protected void TextBoxNumber_ip_phone1_TextChanged( object sender, EventArgs e )
	{

	}
	protected void ButtonUpdate_Click( object sender, EventArgs e )
	{
		int id_otdel = -1;
		int id_otdel_fact = -1;
		int id_dolgnost = -1;
		int id_filial = -1;
		String first_name = "";
		String last_name = "";
		String middle_name = "";
        bool initSed = false;
        int id_groupQuery = 0;
        int id_sotrudnik_ref = 0;
        String items = "";
        String comments = this.TextBoxComments.Text;

        String type_tabel = DropDownListType_tabel.SelectedValue;//TextBoxType_tabel.Text;
        bool show_phone = CheckBoxShow_phone.Checked ? true:false;

        int count_hours_in_week=Convert.ToInt16(TextBoxCountHoursInWeek.Text);


        id_otdel = Convert.ToInt32( DropDownListOtdel.SelectedValue );
		id_otdel_fact = Convert.ToInt32( DropDownListOtdelFact.SelectedValue );
		id_dolgnost = Convert.ToInt32( DropDownListDolgnost.SelectedValue );
		id_filial = Convert.ToInt32( DropDownListFilial.SelectedValue );
		first_name = TextBoxFirst_name.Text;
		last_name = TextBoxLast_name.Text;
		middle_name = TextBoxMiddle_name.Text;

        id_sotrudnik_ref=Convert.ToInt16(this.DropDownListSotrudnikRef.SelectedValue.ToString());

        if (ViewState["items"].ToString() == "")
        {
            items = Guid.NewGuid().ToString();                
        }
        else
        {
            items = ViewState["items"].ToString();
            
        }

        //Загрузка фото
        LoadPhoto(items);

        //comments = "";


		String number_cab = TextBoxNumber_cab.Text;
		String number_phone = TextBoxNumber_phone.Text;
        String number_ip_phone = "";
        String number_mob = TextBoxNumber_mob.Text;
		try
		{
			number_ip_phone = TextBoxNumber_ip_phone.Text ;
		}
		catch
		{
		}

		String email = TextBoxEmail.Text;
		String email2 = TextBoxEmail2.Text;

        string tabel_number;
        tabel_number = TextBoxTabelNumber.Text;

        string FIO_for_doc;
        FIO_for_doc = TextBoxFIO_for_doc.Text;

        string power_attorney_doc;
        power_attorney_doc = TextBoxPower_attorney_doc.Text;

        bool active = false;

		if (CheckBoxActive.Checked == true)
			active = true;

        //if (CheckBoxSed.Checked == true)
            //initSed = true;

        id_groupQuery = Convert.ToInt16(DropDownListGroupQuery.SelectedValue.ToString());

        if (this.CheckBoxDelPhoto.Checked == true)
        {
            Images objImg = new Images();
            objImg.ImagesDelete(items,"sotrudnik");
            items = "";
        }

		if (id_otdel != -1 && id_dolgnost != -1 && id_filial != -1)
		{

			Sotrudnik objSotrudnik = new Sotrudnik();
			objSotrudnik.UpdateSotrudnik(
							Convert.ToInt32( ViewState[ "id_sotrudnik" ].ToString() ),
							id_otdel,
							id_otdel_fact,
							id_dolgnost,
							id_filial,
							first_name,
							last_name,
							middle_name,
							number_cab,
							number_phone,
							number_ip_phone,
							email,
							email2,
							active,
                            initSed,
                            id_groupQuery,
                            id_sotrudnik_ref,
                            items,
                            comments,
                            number_mob,
                            type_tabel,
                            show_phone,
                            count_hours_in_week,
                            tabel_number,
                            FIO_for_doc,
                            power_attorney_doc
                        );
		}

        

		GridView1.DataBind();

		ClearFoms();
	}
	protected void ButtonCancel_Click( object sender, EventArgs e )
	{
		ClearFoms();
	}
    protected void ButtonFind_Click(object sender, EventArgs e)
    {
        ClearFoms();
        this.GridView1.DataBind();
    }
    protected void DropDownListFiltr_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        SqlDataSourceSotrudnik_promotion.Insert();
        BindGrid();
        //GridViewSotrudnik_promotion.DataBind();
    }

    protected void SqlDataSourceSotrudnik_promotion_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["@date_promotion"].Value = Convert.ToDateTime(TextBoxCharacterisrikDate.Text);
        e.Command.Parameters["@id_sotrudnik"].Value = Convert.ToInt16(ViewState["id_sotrudnik"].ToString());
        e.Command.Parameters["@type_promotion"].Value = DropDownListType_promotion.SelectedValue.ToString();
        e.Command.Parameters["@text_promotion"].Value = TextBoxText_promotion.Text;
        e.Command.Parameters["@items"].Value = "";
    }

    protected void GridViewSotrudnik_promotion_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow r = GridViewSotrudnik_promotion.Rows[e.RowIndex];
        int id = Convert.ToInt16(GridViewSotrudnik_promotion.DataKeys[e.RowIndex].Value.ToString());
        Sotrudnik objSot = new Sotrudnik();
        objSot.DeleteSotrudnik(id);
        BindGrid();
    }

   

    protected void GridViewSotrudnik_promotion_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        this.GridViewSotrudnik_promotion.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void GridViewSotrudnik_promotion_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewSotrudnik_promotion.EditIndex = -1;
        BindGrid();
    }

    protected void GridViewSotrudnik_promotion_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridViewSotrudnik_promotion.Rows[e.RowIndex];
        if (row != null)
        {
            int id = Convert.ToInt16(GridViewSotrudnik_promotion.DataKeys[e.RowIndex].Value.ToString());

            DateTime date_promotion = Convert.ToDateTime(((TextBox)GridViewSotrudnik_promotion.Rows[e.RowIndex].FindControl("TextBoxEditDate_promotion")).Text);
            string type_promotion = ((DropDownList)GridViewSotrudnik_promotion.Rows[e.RowIndex].FindControl("DropDownListEditType_promotion")).SelectedValue.ToString();
            string text_promotion = ((TextBox)GridViewSotrudnik_promotion.Rows[e.RowIndex].FindControl("TextBoxEditText_promotion")).Text;
          

            Sotrudnik objSot = new Sotrudnik();
            objSot.UpdateSotrudnik_promotion(id, date_promotion, type_promotion, text_promotion);
        }
        GridViewSotrudnik_promotion.EditIndex = -1;
        BindGrid();
    }

    protected void GridViewSotrudnik_promotion_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate)) || (e.Row.RowState == DataControlRowState.Edit))
        {

            //if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_ADMIN)) ((TextBox)e.Row.FindControl("TextBoxEditDate_filtr")).Enabled = true;

            TextBox date = ((TextBox)e.Row.FindControl("TextBoxEditDate_promotion"));
            //TextBox date1 = ((TextBox)e.Row.FindControl("TextBoxEditDate_filtr"));

            string clientid = date.ClientID;
            //string clientid1 = date1.ClientID;

            // Define the name and type of the client script on the page.
            String csName = "DateInsert";
            Type csType = this.GetType();

            // Get a ClientScriptManager reference from the Page class.
            ClientScriptManager cs = Page.ClientScript;
            // Check to see if the client script is already registered.
            if (!cs.IsClientScriptBlockRegistered(csType, csName))
            {

                StringBuilder csText = new StringBuilder();
                csText.Append("<script>");
                csText.Append("$(function() {");

                string strid = "$('#" + clientid + "').datepicker();";
                //string strid1 = "$('#" + clientid1 + "').datepicker();";

                csText.Append(strid);
                //csText.Append(strid1);

                csText.Append("});");
                csText.Append("</script>");
                cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
            }
            //---------------- Конец блока вставки календаря -------------------------

        }
    }
}

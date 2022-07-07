using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Admin_admin_news: System.Web.UI.Page
{
    public Color colorWorkDay=Color.FromArgb(204,255,204);
    public int newYear = DateTime.Now.Year+1;
    public int currentYear = DateTime.Now.Year;

    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
       {
           if (PortalPrincipal.Current.IsInRole(Utilites.ROLE_ADMIN) == false)
           {
               Server.Transfer("admin.aspx");
           }

           //Текущий год

           Calendar01.VisibleDate = new DateTime(currentYear, 1, 1);
           Calendar02.VisibleDate = new DateTime(currentYear, 2, 1);
           Calendar03.VisibleDate = new DateTime(currentYear, 3, 1);
           Calendar04.VisibleDate = new DateTime(currentYear, 4, 1);
           Calendar05.VisibleDate = new DateTime(currentYear, 5, 1);
           Calendar06.VisibleDate = new DateTime(currentYear, 6, 1);
           Calendar07.VisibleDate = new DateTime(currentYear, 7, 1);
           Calendar08.VisibleDate = new DateTime(currentYear, 8, 1);
           Calendar09.VisibleDate = new DateTime(currentYear, 9, 1);
           Calendar10.VisibleDate = new DateTime(currentYear, 10, 1);
           Calendar11.VisibleDate = new DateTime(currentYear, 11, 1);
           Calendar12.VisibleDate = new DateTime(currentYear, 12, 1);

            //Новый год

            Calendar13.VisibleDate = new DateTime(newYear, 1, 1);
            Calendar14.VisibleDate = new DateTime(newYear, 2, 1);
            Calendar15.VisibleDate = new DateTime(newYear, 3, 1);
            Calendar16.VisibleDate = new DateTime(newYear, 4, 1);
            Calendar17.VisibleDate = new DateTime(newYear, 5, 1);
            Calendar18.VisibleDate = new DateTime(newYear, 6, 1);
            Calendar19.VisibleDate = new DateTime(newYear, 7, 1);
            Calendar20.VisibleDate = new DateTime(newYear, 8, 1);
            Calendar21.VisibleDate = new DateTime(newYear, 9, 1);
            Calendar22.VisibleDate = new DateTime(newYear, 10, 1);
            Calendar23.VisibleDate = new DateTime(newYear, 11, 1);
            Calendar24.VisibleDate = new DateTime(newYear, 12, 1);

            TableItemStyle CalendarToday;
           Color todayColor = Color.FromArgb(255, 204, 102);
           //CalendarToday.BackColor = todayColor;

           int curentMonth=DateTime.Now.Month;

           switch (curentMonth)
           {
               case (1):
                   {
                       Calendar01.SelectedDate=DateTime.Now;
                       break;
                   }
               case (2):
                   {
                       Calendar02.TodaysDate = DateTime.Now;
                       break;
                   }
               case (3):
                   {
                       Calendar03.SelectedDate = DateTime.Now;
                       break;
                   }
               case (4):
                   {
                       Calendar04.SelectedDate = DateTime.Now;
                       break;
                   }
               case (5):
                   {
                       Calendar05.SelectedDate = DateTime.Now;
                       break;
                   }
               case (6):
                   {
                       Calendar06.SelectedDate = DateTime.Now;
                       break;
                   }
               case (7):
                   {
                       Calendar07.SelectedDate = DateTime.Now;
                       break;
                   }
               case (8):
                   {
                       Calendar08.SelectedDate = DateTime.Now;
                       break;
                   }
               case (9):
                   {
                       Calendar09.SelectedDate = DateTime.Now;
                       break;
                   }
               case (10):
                   {
                       Calendar10.SelectedDate = DateTime.Now;
                       break;
                   }
               case (11):
                   {
                       Calendar11.SelectedDate = DateTime.Now;
                       break;
                   }
               case (12):
                   {
                       Calendar12.SelectedDate = DateTime.Now;
                       break;
                   }


           }


           //Настройка страницы под текущего пользователя


           String login = Request.Cookies["loginFGU59"].Value;
           int id_users = Convert.ToInt32(Request.Cookies["id_userFGU59"].Value);

           Users objUsers = new Users();
           SqlDataReader readerUsers = objUsers.SelectLogonRoles(id_users);

           readerUsers.Read();

           String user_logon = readerUsers["full_name"].ToString();
           ViewState["user_logon"] = user_logon;
           String name_roles = readerUsers["name_roles"].ToString();
           ViewState["name_roles"] = name_roles;
            String id_sotrudnik = readerUsers["id_sotrudnik"].ToString();
            ViewState["id_sotrudnik"] = id_sotrudnik;

           readerUsers.Close();
            

           Admin_banner1.user_logon = user_logon;

           String[] names = user_logon.Split();
           String last_name = names[0];
           ViewState["last_name"] = last_name;



          
           
       }
        
        
    }


    protected void Calendar_Select(Calendar ref_calendar)
    {
        WorkDays ojbWork = new WorkDays();
        ojbWork.WorkDaysInsert(ref_calendar.SelectedDate);
    }
    
    
    
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar01);
    }
    protected void Calendar02_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar02);
    }
    protected void Calendar03_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar03);
    }
    protected void Calendar04_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar04);
    }
    protected void Calendar05_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar05);
    }
    protected void Calendar06_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar06);
    }
    protected void Calendar07_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar07);
    }
    protected void Calendar08_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar08);
    }
    protected void Calendar09_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar09);
    }
    protected void Calendar10_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar10);
    }
    protected void Calendar11_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar11);
    }
    protected void Calendar12_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar12);
    }

    protected void CalendarRender(int selected_year, DayRenderEventArgs e, int selected_month)
    {
        //подгрузка текущих выделенных дней
           WorkDays objWork = new WorkDays();
           SqlDataReader sqlWork = objWork.WorkDaysSelect(selected_year, selected_month);
           DateTime dtinbase;
           while (sqlWork.Read())
           {
              dtinbase = Convert.ToDateTime(sqlWork["date"].ToString());
              if (e.Day.Date == dtinbase)
                {
                    e.Cell.BackColor = colorWorkDay;
                }
           }
           sqlWork.Close();
    }

    protected void Calendar01_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(currentYear, e, 1);
    }

    protected void Calendar02_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(currentYear, e, 2);
    }
    protected void Calendar03_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(currentYear, e, 3);
    }
    protected void Calendar04_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(currentYear, e, 4);
    }
    protected void Calendar05_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(currentYear, e, 5);
    }
    protected void Calendar06_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(currentYear, e, 6);
    }
    protected void Calendar07_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(currentYear, e, 7);
    }
    protected void Calendar08_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(currentYear, e, 8);
    }
    protected void Calendar09_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(currentYear, e, 9);
    }
    protected void Calendar10_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(currentYear, e, 10);
    }
    protected void Calendar11_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(currentYear, e, 11);
    }
    protected void Calendar12_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(currentYear, e, 12);
    }

    protected void Calendar13_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(newYear, e, 1);
    }

    protected void Calendar14_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(newYear, e, 2);
    }

    protected void Calendar15_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(newYear, e, 3);
    }

    protected void Calendar16_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(newYear, e, 4);
    }

    protected void Calendar17_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(newYear, e, 5);
    }

    protected void Calendar18_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(newYear, e, 6);
    }

    protected void Calendar19_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(newYear, e, 7);
    }

    protected void Calendar20_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(newYear, e, 8);
    }

    protected void Calendar21_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(newYear, e, 9);
    }

    protected void Calendar22_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(newYear, e, 10);
    }

    protected void Calendar23_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(newYear, e, 11);
    }

    protected void Calendar24_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarRender(newYear, e, 12);
    }

    protected void Calendar13_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar13);
    }

    protected void Calendar14_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar14);
    }

    protected void Calendar15_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar15);
    }

    protected void Calendar16_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar16);
    }

    protected void Calendar17_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar17);
    }

    protected void Calendar18_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar18);
    }

    protected void Calendar19_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar19);
    }

    protected void Calendar20_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar20);
    }

    protected void Calendar21_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar21);
    }

    protected void Calendar22_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar22);
    }

    protected void Calendar23_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar23);
    }

    protected void Calendar24_SelectionChanged(object sender, EventArgs e)
    {
        Calendar_Select(Calendar24);
    }
   
}

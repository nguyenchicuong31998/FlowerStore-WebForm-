using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;

public partial class UC_ucnavbar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Menu();
    }
    protected string Menu()
    {
        string menu = "";
        int ma=0;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * from DanhMucHoa where HIDEN=1";
        DataTable dt = SqlDatabase.GetData(cmd);
        if (dt.Rows.Count > 0)
        {
            menu += "<ul class='nav navbar-nav'>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["MADM"].ToString() != "SP")
                {
                    menu += "<li><a href='" + dt.Rows[i]["HREF"].ToString() + "'>" + dt.Rows[i]["TENDM"].ToString() + "</a></li>";
                }
                else
                {
                    ma = i;     
                }
                SqlCommand cmd_menu = new SqlCommand();
                cmd_menu.CommandText = "SELECT * FROM DANHMUCCON WHERE DANHMUCCON.MADM='" + dt.Rows[i]["MADM"].ToString() + "' AND HIDEN=1";
                DataTable dt_menucon = SqlDatabase.GetData(cmd_menu);
                if (dt_menucon.Rows.Count > 0)
                {
                    menu += "<li class='dropdown'><a class='dropdown-toggle' data-toggle='dropdown' href='javascript: 0'>" + dt.Rows[ma]["TENDM"].ToString() + "<span class='caret'></span></a>"; 
                    menu += "<ul class='dropdown-menu color-submenu'>";
                    string MADMH="";
                    for (int j = 0; j < dt_menucon.Rows.Count; j++)
                    {
                        MADMH = dt_menucon.Rows[j]["MADMH"].ToString();
                        menu += "<li><a href='HoaTheoLoai.aspx?MADMH=" + MADMH + "'>" + dt_menucon.Rows[j]["TENDMCON"].ToString() + "</a></li>";
                    }
                    menu += "</ul>";
                    menu += "</li>";
                }
               // menu += "</li>";
            }
            menu += "</ul>";
        }
        return menu;
    }

    protected void btntimkiem_Click(object sender, EventArgs e)
    {
        Session["TimKiem"] = txttimkiem.Text;
        Response.Redirect("~/TimKiem.aspx");
    }
}
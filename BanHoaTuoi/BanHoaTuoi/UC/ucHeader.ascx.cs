using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;

public partial class UC_ucHeader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if(Session["TenDN"]!=null)
        {
            lblten.Text ="Xin chào: "+ Session["TenDN"].ToString();
            linkdangnhap.Visible = false;
            Linkdangxuat.Visible = true;
            LinkDangKy.Visible = false;
        }
    }

    protected void Linkdangxuat_Click(object sender, EventArgs e)
    {
        Session["TenDN"] = null;
        linkdangnhap.Visible = true;
        Linkdangxuat.Visible = false;
        LinkDangKy.Visible = true;
        lblten.Text = "";
    }
    protected string lay()
    {
        string s = "";
        if(Session["TenDN"] != null)
        {
            s += "<span class='caret' data-toggle='dropdown'></span>";
            s += " <ul class='dropdown-menu thaxuong'>";
            s += "<li><a href='Thongtincanhan.aspx'>Thông tin cá nhân</a></li>";
            s += " </ul>";
        }
        return s;
    }
}
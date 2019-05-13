using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using QLBH;
public partial class Admin_DangNhapAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btndangnhap_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select TENAD,TENDN,MATKHAU from ADMIN where TENDN='" + txtdangnhap.Text + "' and  MATKHAU='" + txtmatkhau.Text + "'";
        DataTable dt = SqlDatabase.GetData(cmd);
        if (dt.Rows.Count > 0)
        {

            Session["TENAD"] = dt.Rows[0]["TENAD"].ToString();
            Session.Timeout=50;
            Response.Redirect("~/Admin/TrangChuAdmin.aspx");

        }
        else
        {
            Response.Write("<script>alert('Đăng nhập thất bại. Vui lòng kiểm tra lại tên tài khoản hoặc mật khẩu!')</script>");
        }
    }
}
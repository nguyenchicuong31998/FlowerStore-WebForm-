using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using QLBH;
public partial class DangNhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btndangnhap_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Select * from KHACHHANG where TENDN='" + txtdangnhap.Text + "' AND MATKHAU='" + txtmatkhau.Text + "'";
            DataTable dt = SqlDatabase.GetData(cmd);
            if (dt.Rows.Count > 0)
            {
                Session["MAKH"] = dt.Rows[0][0].ToString();
                Session["TenDN"] = dt.Rows[0][1].ToString();
                Response.Redirect("~/TrangChu.aspx");
            }
            else
            {
                Response.Write("<script>alert('Bạn sai tên tài khoản hoặc mật khẩu! Xin vui lòng kiểm tra lại')</script>");
            }
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Đăng nhập thất bại')</script>");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class DoiMatKhau : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btndangnhap_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Select TENDN From khachhang where TENDN='" + txttendangnhap.Text + "' and  MATKHAU='" + txtmatkhau.Text + "' ";
            DataTable dt = SqlDatabase.GetData(cmd);
            if (dt.Rows.Count > 0)
            {
                SqlDatabase.ExcuteNonQueryString("UPDATE khachhang Set MATKHAU='" + txtmatkhaumoi.Text + "' Where TENDN='" + txttendangnhap.Text + "' ");
                Response.Write("<script>alert('Đổi mật khẩu thành công')</script>");
                txttendangnhap.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Tên đăng nhập hoặc tài khoản sai')</script>");
                txttendangnhap.Text = "";
            }
        }
        catch(Exception)
        {
            Response.Write("<script>alert('Đổi mật khẩu thất bại')</script>");
        }
    }
}
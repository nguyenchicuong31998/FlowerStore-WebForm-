using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_ThemKhachHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("THEMKHACHHANG", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TENKH", SqlDbType.NVarChar, 50).Value = txttenkh.Text;
            cmd.Parameters.Add("@DIACHI", SqlDbType.NVarChar, 200).Value = txtdiachi.Text;
            cmd.Parameters.Add("@NGAYSINH", SqlDbType.SmallDateTime).Value = DateTime.Parse(txtngaysinh.Text);
            cmd.Parameters.Add("@GIOITINH", SqlDbType.Int).Value = int.Parse(drdanhmuc.SelectedItem.Value);
            cmd.Parameters.Add("@EMAIL", SqlDbType.VarChar, 100).Value = txtemail.Text;
            cmd.Parameters.Add("@TENDN", SqlDbType.VarChar, 25).Value = txttendangnhap.Text;
            cmd.Parameters.Add("@MATKHAU", SqlDbType.VarChar, 25).Value = txtmatkhau.Text;
            cmd.ExecuteNonQuery();
            Response.Write("<script> alert('Bạn thêm thành công')</script>");
            txttenkh.Text = "";
            txtdiachi.Text = "";
            txtemail.Text = "";
            txtngaysinh.Text = "";
            txttendangnhap.Text = "";
            txtmatkhau.Text = "";
            txttenkh.Focus();
            con.Close();
        }
        catch (Exception)
        {
            lblthem.Text = "Thêm thất bại";
        }
    }
}
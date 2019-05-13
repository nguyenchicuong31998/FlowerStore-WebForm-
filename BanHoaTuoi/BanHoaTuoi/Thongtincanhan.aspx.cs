using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Thongtincanhan : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadThongTin();
        }
    }
    protected int MAKH = 0;
    protected void loadThongTin()
    {
        MAKH = int.Parse(Session["MAKH"].ToString());
        if (Session["TENDN"] != null)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Select * from KHACHHANG where MAKH=" + MAKH + "";
            DataTable dt = SqlDatabase.GetData(cmd);
            if (dt.Rows.Count > 0)
            {
                txthotentk.Text = dt.Rows[0]["TENKH"].ToString();
                txtdiachi.Text = dt.Rows[0]["DIACHI"].ToString();
                txtngaysinh.Text = dt.Rows[0]["NGAYSINH"].ToString();
                radgt.Text = dt.Rows[0]["GIOITINH"].ToString();
                txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();
            }
        }
    }
    protected void btndk_Click(object sender, EventArgs e)
    {
        try
        {
            MAKH = int.Parse(Session["MAKH"].ToString());
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("SUATTKHACHHANG", con);
            cmd.CommandType = CommandType.StoredProcedure; 
            cmd.Parameters.Add("@MAKH", SqlDbType.Int).Value = MAKH;
            cmd.Parameters.Add("@TENKH", SqlDbType.NVarChar, 50).Value = txthotentk.Text;
            cmd.Parameters.Add("@DIACHI", SqlDbType.NVarChar, 200).Value =txtdiachi.Text;
            cmd.Parameters.Add("@NGAYSINH", SqlDbType.SmallDateTime).Value = DateTime.Parse(txtngaysinh.Text);
            cmd.Parameters.Add("@GIOITINH", SqlDbType.Int).Value = int.Parse(radgt.SelectedItem.Value);
            cmd.Parameters.Add("@EMAIL", SqlDbType.VarChar, 100).Value = txtEmail.Text;
            cmd.ExecuteNonQuery();
            Response.Write("<script> alert('Bạn cập nhật thông tin cá nhân thành công')</script>");
            con.Close();
        }
        catch (Exception)
        {
            Response.Write("<script> alert('Cập nhật thông tin cá nhân thất bại')</script>");
        }
    }
}
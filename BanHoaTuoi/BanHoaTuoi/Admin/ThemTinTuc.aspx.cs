using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_ThemTinTuc : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("THEMTINTUC", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MAAD", SqlDbType.Int).Value = txtmaad.Text;
            cmd.Parameters.Add("@TIEUDE", SqlDbType.NVarChar, 200).Value = txttieude.Text;
            cmd.Parameters.Add("@NOIDUNG", SqlDbType.NVarChar,2000).Value = txtnoidung.Text;
            cmd.Parameters.Add("@NGAYDANG", SqlDbType.SmallDateTime).Value = DateTime.Today;
            cmd.Parameters.Add("@LUOTXEM", SqlDbType.Int).Value = int.Parse(txtluotxem.Text);
            cmd.ExecuteNonQuery();
            Response.Write("<script> alert('Bạn thêm thành công')</script>");
            txtmaad.Text = "";
            txttieude.Text = "";
            txtnoidung.Text = "";
            txtluotxem.Text = "";
            txtmaad.Focus();
            con.Close();
        }
        catch (Exception)
        {
            lblthem.Text = "Thêm thất bại";
        }
    }
}
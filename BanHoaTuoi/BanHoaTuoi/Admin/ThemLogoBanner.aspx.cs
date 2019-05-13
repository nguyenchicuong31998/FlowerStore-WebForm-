using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_ThemLogoBanner : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("THEMLOGOBANNER", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TENQC", SqlDbType.NVarChar, 250).Value = txttenqc.Text;
            cmd.Parameters.Add("@ANH", SqlDbType.VarChar,200).Value = FileAnh.FileName;
            cmd.Parameters.Add("@HREF", SqlDbType.VarChar, 200).Value = txthref.Text;
            cmd.Parameters.Add("@NGAYBATDAU", SqlDbType.SmallDateTime).Value = DateTime.Today;
            cmd.Parameters.Add("@NGAYKETTHUC", SqlDbType.SmallDateTime).Value =txtngayketthuc.Text;
            cmd.Parameters.Add("@THUTUQC", SqlDbType.Int).Value =int.Parse(txtthutu.Text);
            cmd.Parameters.Add("@TRANGTHAI", SqlDbType.Int).Value = int.Parse(drdanhmuc.SelectedItem.Value);
            cmd.ExecuteNonQuery();
            Response.Write("<script> alert('Bạn thêm thành công')</script>");
            txttenqc.Text = "";
            txthref.Text = "";
            txtngayketthuc.Text = "";
            txtthutu.Text = "";
            txttenqc.Focus();
            con.Close();
        }
        catch (Exception )
        {
            lblthem.Text = "Thêm thất bại";
        }
    }
}
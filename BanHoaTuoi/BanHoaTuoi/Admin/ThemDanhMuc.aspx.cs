using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_ThemDanhMuc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadMenu();
    }
    private void loadMenu()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * from DANHMUCHOA";
        DataTable dt = SqlDatabase.GetData(cmd);
        foreach (DataRow dr in dt.Rows)
        {
            drmenu.Items.Add(dr["MADM"].ToString());
        }
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("THEMDANHMUC", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MADMH", SqlDbType.VarChar, 5).Value = txtmadanhmuc.Text;
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = int.Parse(txtID.Text);
            cmd.Parameters.Add("@TENDMCON", SqlDbType.NVarChar, 50).Value = txttendanhmuc.Text;
            cmd.Parameters.Add("@MADM", SqlDbType.VarChar, 5).Value = drmenu.SelectedItem.Value;
            cmd.Parameters.Add("@HIDEN", SqlDbType.Int).Value = int.Parse(drdanhmuc.SelectedItem.Value);
            cmd.ExecuteNonQuery();
            Response.Write("<script> alert('Bạn thêm thành công')</script>");
            txtmadanhmuc.Text = "";
            txtID.Text = "";
            txttendanhmuc.Text = "";
            txtmadanhmuc.Focus();
            con.Close();
        }
        catch (Exception)
        {
            lblthem.Text = "Thêm thất bại";
        }
    }
}
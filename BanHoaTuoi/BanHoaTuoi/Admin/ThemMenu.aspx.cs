using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_ThemMenu : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("THEMMENU", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MADM", SqlDbType.VarChar, 5).Value = txtmenu.Text;
            cmd.Parameters.Add("@TENDM", SqlDbType.NVarChar, 30).Value = txtten.Text;
            cmd.Parameters.Add("@HREF", SqlDbType.VarChar, 50).Value = txtlink.Text;
            cmd.Parameters.Add("@HIDEN", SqlDbType.Int).Value = int.Parse(drdanhmuc.SelectedItem.Value);
            cmd.ExecuteNonQuery();
            Response.Write("<script> alert('Bạn thêm thành công')</script>");
            txtmenu.Text = "";
            txtten.Text = "";
            txtlink.Text = "";
            txtmenu.Focus();
            con.Close();
        }
        catch (Exception)
        {
            lblthem.Text = "Thêm thất bại";
        }
    }
}
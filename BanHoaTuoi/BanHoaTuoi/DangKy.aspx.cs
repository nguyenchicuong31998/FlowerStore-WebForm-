using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;

public partial class DangKy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        for(int i=1;i<=31;i++)
        {
            drngay.Items.Add(i.ToString());
        }
        for (int j = 1; j <= 12; j++)
        {
            drthang.Items.Add(j.ToString());
        }
        for (int z = 1989; z <= 2020; z++)
        {
            drnam.Items.Add(z.ToString());
        }
       
    }
    protected void btndk_Click(object sender, EventArgs e)
    {
        try { 
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO KHACHHANG(TENKH,NGAYSINH,GIOITINH,TENDN,MATKHAU) VALUES(@TENKH,@NGAYSINH,@GIOITINH,@TENDN,@MATKHAU)";
            cmd.Parameters.Add("@TENKH",SqlDbType.NVarChar,50).Value=txthotentk.Text;
            cmd.Parameters.Add("@NGAYSINH", SqlDbType.SmallDateTime).Value = DateTime.Parse(drnam.Text + "/" + drthang.Text + "/" + drngay.Text);
            cmd.Parameters.Add("@GIOITINH",SqlDbType.Int).Value=Convert.ToInt32(radgt.SelectedItem.Value);
            cmd.Parameters.Add("@TENDN",SqlDbType.VarChar,25).Value=txttendn.Text;
            cmd.Parameters.Add("@MATKHAU",SqlDbType.VarChar,25).Value=txtxacnhanmk.Text;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/TrangChu.aspx");
        }catch(Exception ex)
        {
            Response.Write("<script>alert('Bạn đăng ký thất bại')</script>");
            throw ex;
        }
    }
}
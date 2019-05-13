using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;

public partial class Admin_KhachHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            try
            {
                LoadKhachHang();
            }
            catch (Exception){

            }
        }
    }
    protected void LoadKhachHang()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * From KHACHHANG";
        DataTable dt = SqlDatabase.GetData(cmd);
        GVKhachHang.DataSource = dt;
        GVKhachHang.DataBind();
    }

    protected void GVKhachHang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVKhachHang.PageIndex = e.NewPageIndex;
        LoadKhachHang();
    }

    protected void GVKhachHang_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVKhachHang.EditIndex = -1;
        LoadKhachHang();
    }

    protected void GVKhachHang_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVKhachHang.EditIndex = e.NewEditIndex;
        LoadKhachHang();
    }

    protected void GVKhachHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int MAKH = int.Parse(GVKhachHang.DataKeys[e.RowIndex].Value.ToString());
        string sql = "Delete from KHACHHANG where MAKH=" + MAKH + "";

        if (SqlDatabase.ExcuteNonQueryTraVeGiaTri(sql) > 0)
        {
            LoadKhachHang();
            Response.Write("<script> alert('Bạn đã xóa thành công')</script>");
        }
        else
        {
            Response.Write("<script> alert('Xóa không thành công')</script>");
        }
    }

    protected void GVKhachHang_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int MAKH = int.Parse(GVKhachHang.DataKeys[e.RowIndex].Value.ToString());
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("SUAKHACHHANG", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MAKH", SqlDbType.Int).Value = MAKH;
            cmd.Parameters.Add("@TENKH", SqlDbType.NVarChar, 50).Value = (GVKhachHang.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@DIACHI", SqlDbType.NVarChar, 200).Value = (GVKhachHang.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@NGAYSINH", SqlDbType.SmallDateTime).Value = DateTime.Parse((GVKhachHang.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@GIOITINH", SqlDbType.Int).Value =int.Parse((GVKhachHang.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@EMAIL", SqlDbType.VarChar, 100).Value = (GVKhachHang.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@TENDN", SqlDbType.VarChar, 25).Value = (GVKhachHang.Rows[e.RowIndex].Cells[6].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@MATKHAU", SqlDbType.VarChar, 25).Value = (GVKhachHang.Rows[e.RowIndex].Cells[7].Controls[0] as TextBox).Text;
            cmd.ExecuteNonQuery();
            GVKhachHang.EditIndex = -1;
            LoadKhachHang();
            Response.Write("<script> alert('Bạn cập nhật thành công')</script>");
            con.Close();
        }
        catch (Exception)
        {
            Response.Write("<script> alert('Cập nhật thất bại')</script>");
        }
    }
}
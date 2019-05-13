using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_HoaDon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                LoadHoaDon();
            }
            catch (Exception)
            {

            }
        }
    }
    protected void LoadHoaDon()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * From DONDATHANG ORDER BY NGAYDATHANG DESC";
        DataTable dt = SqlDatabase.GetData(cmd);
        GVHoaDon.DataSource = dt;
        GVHoaDon.DataBind();
    }

    protected void GVHoaDon_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVHoaDon.PageIndex = e.NewPageIndex;
        LoadHoaDon();
    }

    protected void GVHoaDon_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVHoaDon.EditIndex = -1;
        LoadHoaDon();
    }

    protected void GVHoaDon_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVHoaDon.EditIndex = e.NewEditIndex;
        LoadHoaDon();
    }
    protected void GVHoaDon_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int MADH = int.Parse(GVHoaDon.DataKeys[e.RowIndex].Value.ToString());
        string sql = "Delete from DONDATHANG where MADH=" + MADH + " AND NOT EXISTS(SELECT * from CTDATHANG WHERE CTDATHANG.MADH=DONDATHANG.MADH)";
        if (SqlDatabase.ExcuteNonQueryTraVeGiaTri(sql) > 0)
        {
            LoadHoaDon();
            Response.Write("<script> alert('Bạn đã xóa thành công')</script>");
        }
        else
        {
            Response.Write("<script> alert('Xóa không thành công. Chi tiết hóa đơn còn hàng')</script>");
        }
    }
    protected void GVHoaDon_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int MADH = int.Parse(GVHoaDon.DataKeys[e.RowIndex].Value.ToString());
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("SUAHOADON", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MADH", SqlDbType.Int).Value = MADH;
            cmd.Parameters.Add("@MAKH", SqlDbType.Int).Value = int.Parse((GVHoaDon.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@NGAYDATHANG", SqlDbType.SmallDateTime).Value = DateTime.Parse((GVHoaDon.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@TRIGIA", SqlDbType.Decimal,20).Value = Decimal.Parse((GVHoaDon.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@NGAYGIAOHANG", SqlDbType.SmallDateTime).Value = DateTime.Parse((GVHoaDon.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@TENNGUOINHAN", SqlDbType.NVarChar, 50).Value = (GVHoaDon.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@DIENTHOAI", SqlDbType.VarChar, 15).Value = (GVHoaDon.Rows[e.RowIndex].Cells[6].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@DIACHI", SqlDbType.NVarChar, 200).Value = (GVHoaDon.Rows[e.RowIndex].Cells[7].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@HTTHANHTOAN", SqlDbType.NVarChar, 100).Value = (GVHoaDon.Rows[e.RowIndex].Cells[8].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@HTGIAOHANG", SqlDbType.NVarChar, 100).Value = (GVHoaDon.Rows[e.RowIndex].Cells[9].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@TRANGTHAI", SqlDbType.Bit).Value = (GVHoaDon.Rows[e.RowIndex].Cells[10].Controls[0] as TextBox).Text;
            cmd.ExecuteNonQuery();
            GVHoaDon.EditIndex = -1;
            LoadHoaDon();
            Response.Write("<script> alert('Bạn cập nhật thành công')</script>");
            con.Close();
        }
        catch (Exception ex)
        {
            
            Response.Write("<script> alert('Cập nhật thất bại')</script>");
        }
    }


}
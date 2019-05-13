using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_ChiTietHoaDon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                LoadCTHoaDon();
            }
            catch (Exception)
            {

            }
        }
    }
    protected void LoadCTHoaDon()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * From CTDATHANG";
        DataTable dt = SqlDatabase.GetData(cmd);
        GVCTHoaDon.DataSource = dt;
        GVCTHoaDon.DataBind();
    }

    protected void GVCTHoaDon_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVCTHoaDon.PageIndex = e.NewPageIndex;
        LoadCTHoaDon();
    }

    protected void GVCTHoaDon_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVCTHoaDon.EditIndex = -1;
        LoadCTHoaDon();
    }

    protected void GVCTHoaDon_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVCTHoaDon.EditIndex = e.NewEditIndex;
        LoadCTHoaDon();
    }

    protected void GVCTHoaDon_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int MADH = int.Parse(GVCTHoaDon.DataKeys[e.RowIndex].Value.ToString());
        string sql = "Delete from CTDATHANG where CTDATHANG.MADH=" + MADH + "";

        if (SqlDatabase.ExcuteNonQueryTraVeGiaTri(sql) > 0)
        {
            LoadCTHoaDon();
            Response.Write("<script> alert('Bạn đã xóa thành công')</script>");
        }
        else
        {
            Response.Write("<script> alert('Xóa không thành công')</script>");
        }
    }

    protected void GVCTHoaDon_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int MADH = int.Parse(GVCTHoaDon.DataKeys[e.RowIndex].Value.ToString());
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("SUACTHOADON", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MADH", SqlDbType.Int).Value = MADH;
            cmd.Parameters.Add("@MAHOA", SqlDbType.Int).Value = int.Parse((GVCTHoaDon.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@SOLUONG", SqlDbType.Int).Value = int.Parse((GVCTHoaDon.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@DONGIA", SqlDbType.Decimal,20).Value = Decimal.Parse((GVCTHoaDon.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text);
            cmd.ExecuteNonQuery();
            GVCTHoaDon.EditIndex = -1;
            LoadCTHoaDon();
            Response.Write("<script> alert('Bạn cập nhật thành công')</script>");
            con.Close();
        }
        catch (Exception)
        {
            Response.Write("<script> alert('Cập nhật thất bại')</script>");
        }
    }
}
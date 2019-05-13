using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_BinhLuan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                LoadBinhLuan();
            }
            catch (Exception)
            {

            }
        }
    }
    protected void LoadBinhLuan()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * From BINHLUAN";
        DataTable dt = SqlDatabase.GetData(cmd);
        GVBinhLuan.DataSource = dt;
        GVBinhLuan.DataBind();
    }


    protected void GVBinhLuan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVBinhLuan.PageIndex = e.NewPageIndex;
        LoadBinhLuan();
    }

    protected void GVBinhLuan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVBinhLuan.EditIndex = -1;
        LoadBinhLuan();
    }

    protected void GVBinhLuan_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVBinhLuan.EditIndex = e.NewEditIndex;
        LoadBinhLuan();
    }

    protected void GVBinhLuan_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int MABL = int.Parse(GVBinhLuan.DataKeys[e.RowIndex].Value.ToString());
        string sql = "Delete from BINHLUAN where MABL=" + MABL + "";

        if (SqlDatabase.ExcuteNonQueryTraVeGiaTri(sql) > 0)
        {
            LoadBinhLuan();
            Response.Write("<script> alert('Bạn đã xóa thành công')</script>");
        }
        else
        {
            Response.Write("<script> alert('Xóa không thành công')</script>");
        }
    }

    protected void GVBinhLuan_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int MABL = int.Parse(GVBinhLuan.DataKeys[e.RowIndex].Value.ToString());
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("SUABINHLUAN", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MABL", SqlDbType.Int).Value = MABL;
            cmd.Parameters.Add("@MAKH", SqlDbType.Int).Value = int.Parse((GVBinhLuan.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@MAHOA", SqlDbType.Int).Value = int.Parse((GVBinhLuan.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@HOTENKH", SqlDbType.NVarChar,50).Value = (GVBinhLuan.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@NGAYGIO", SqlDbType.SmallDateTime).Value = DateTime.Parse((GVBinhLuan.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@NOIDUNGBL", SqlDbType.NVarChar, 1000).Value = (GVBinhLuan.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;
            cmd.ExecuteNonQuery();
            GVBinhLuan.EditIndex = -1;
            LoadBinhLuan();
            Response.Write("<script> alert('Bạn cập nhật thành công')</script>");
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script> alert('Cập nhật thất bại')</script>");
        }
    }
}
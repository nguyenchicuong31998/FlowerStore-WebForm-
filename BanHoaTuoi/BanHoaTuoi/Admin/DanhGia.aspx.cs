using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_DanhGia : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                loadDanhGia();
                ViewState["SortDirection"] = SortDirection.Ascending;
            }
            catch (Exception)
            {

            }
        }
    }
    protected void loadDanhGia()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * From DANHGIA";
        DataTable dt = SqlDatabase.GetData(cmd);
        GVDanhGia.DataSource = dt;
        GVDanhGia.DataBind();
    }

    protected void GVDanhGia_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVDanhGia.PageIndex = e.NewPageIndex;
        loadDanhGia();
    }

    protected void GVDanhGia_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVDanhGia.EditIndex = -1;
        loadDanhGia();
    }

    protected void GVDanhGia_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVDanhGia.EditIndex = e.NewEditIndex;
        loadDanhGia();
    }

    protected void GVDanhGia_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string ID = GVDanhGia.DataKeys[e.RowIndex].Value.ToString();
        string sql = "Delete from DANHGIA where ID=" + ID + "";

        if (SqlDatabase.ExcuteNonQueryTraVeGiaTri(sql) > 0)
        {
            loadDanhGia();
            Response.Write("<script> alert('Bạn đã xóa thành công')</script>");
        }
        else
        {
            Response.Write("<script> alert('Xóa không thành công')</script>");
        }
    }

    protected void GVDanhGia_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string ID = GVDanhGia.DataKeys[e.RowIndex].Value.ToString();
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("SUADANHGIA", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            cmd.Parameters.Add("@SAO", SqlDbType.SmallInt).Value = int.Parse((GVDanhGia.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@MAHOA", SqlDbType.Int).Value = int.Parse((GVDanhGia.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text);
            cmd.ExecuteNonQuery();
            GVDanhGia.EditIndex = -1;
            loadDanhGia();
            Response.Write("<script> alert('Bạn cập nhật thành công')</script>");
            con.Close();
        }
        catch (Exception)
        {
            Response.Write("<script> alert('Cập nhật không thành công')</script>");
        }
    }
}
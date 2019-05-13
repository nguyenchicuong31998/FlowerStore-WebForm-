using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_TinTuc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                loadTinTuc();
                ViewState["SortDirection"] = SortDirection.Ascending;
            }
            catch (Exception)
            {

            }

        }
    }
    protected void loadTinTuc()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * From TINTUC";
        DataTable dt = SqlDatabase.GetData(cmd);
        GVTinTuc.DataSource = dt;
        GVTinTuc.DataBind();
    }

    protected void GVTinTuc_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVTinTuc.PageIndex = e.NewPageIndex;
        loadTinTuc();
    }

    protected void GVTinTuc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVTinTuc.EditIndex = -1;
        loadTinTuc();
    }

    protected void GVTinTuc_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVTinTuc.EditIndex = e.NewEditIndex;
        loadTinTuc();
    }

    protected void GVTinTuc_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int MATT = int.Parse(GVTinTuc.DataKeys[e.RowIndex].Value.ToString());
        string sql = "Delete from TINTUC where MATT=" + MATT + "";

        if (SqlDatabase.ExcuteNonQueryTraVeGiaTri(sql) > 0)
        {
            loadTinTuc();
            Response.Write("<script> alert('Bạn đã xóa thành công')</script>");
        }
        else
        {
            Response.Write("<script> alert('Xóa không thành công')</script>");
        }
    }

    protected void GVTinTuc_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int MATT = int.Parse(GVTinTuc.DataKeys[e.RowIndex].Value.ToString());
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("SUATINTUC", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MATT", SqlDbType.Int).Value = MATT;
            cmd.Parameters.Add("@MAAD", SqlDbType.Int).Value = int.Parse((GVTinTuc.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@TIEUDE", SqlDbType.NVarChar, 200).Value = (GVTinTuc.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@NOIDUNG", SqlDbType.NVarChar, 2000).Value = (GVTinTuc.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@NGAYDANG", SqlDbType.SmallDateTime).Value = DateTime.Parse((GVTinTuc.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@LUOTXEM", SqlDbType.Int).Value = int.Parse((GVTinTuc.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text);
            cmd.ExecuteNonQuery();
            GVTinTuc.EditIndex = -1;
            loadTinTuc();
            Response.Write("<script> alert('Bạn cập nhật thành công')</script>");
            con.Close();
        }
        catch (Exception)
        {
            Response.Write("<script> alert('Cập nhật không thành công')</script>");
        }
    }
}
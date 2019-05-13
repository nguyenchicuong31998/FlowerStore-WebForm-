using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_Danhmuc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                loadDanhMuc();
                ViewState["SortDirection"] = SortDirection.Ascending;
            }
            catch (Exception)
            {

            }

        }
    }
    protected void loadDanhMuc()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * From DANHMUCCON";
        DataTable dt = SqlDatabase.GetData(cmd);
        GVDanhMuc.DataSource = dt;
        GVDanhMuc.DataBind();
    }

    protected void GVDanhMuc_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVDanhMuc.PageIndex = e.NewPageIndex;
        loadDanhMuc();
    }

    protected void GVDanhMuc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVDanhMuc.EditIndex = -1;
        loadDanhMuc();
    }

    protected void GVDanhMuc_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVDanhMuc.EditIndex = e.NewEditIndex;
        loadDanhMuc();
    }

    protected void GVDanhMuc_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string MADM = GVDanhMuc.DataKeys[e.RowIndex].Value.ToString();
        string sql = "Delete from DANHMUCCON where MADMH=" + MADM + "";

        if (SqlDatabase.ExcuteNonQueryTraVeGiaTri(sql) > 0)
        {
            loadDanhMuc();
            Response.Write("<script> alert('Bạn đã xóa thành công')</script>");
        }
        else
        {
            Response.Write("<script> alert('Xóa không thành công')</script>");
        }
    }

    protected void GVDanhMuc_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string MADM = GVDanhMuc.DataKeys[e.RowIndex].Value.ToString();
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("SUADANHMUC", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MADMH", SqlDbType.VarChar,5).Value = MADM;
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = int.Parse((GVDanhMuc.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@TENDMCON", SqlDbType.NVarChar, 50).Value = (GVDanhMuc.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@MADM", SqlDbType.VarChar, 5).Value = (GVDanhMuc.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@HIDEN", SqlDbType.Bit).Value = (GVDanhMuc.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
            cmd.ExecuteNonQuery();
            GVDanhMuc.EditIndex = -1;
            loadDanhMuc();
            Response.Write("<script> alert('Bạn cập nhật thành công')</script>");
            con.Close();
        }
        catch (Exception)
        {
            Response.Write("<script> alert('Cập nhật không thành công')</script>");
        }
    }
}
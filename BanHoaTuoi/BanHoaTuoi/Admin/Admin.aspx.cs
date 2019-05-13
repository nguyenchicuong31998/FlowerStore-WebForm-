using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                LoadAdmin();
            }
            catch (Exception)
            {

            }
        }
    }
    protected void LoadAdmin()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * From ADMIN";
        DataTable dt = SqlDatabase.GetData(cmd);
        GVADMIN.DataSource = dt;
        GVADMIN.DataBind();
    }

    protected void GVADMIN_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVADMIN.PageIndex = e.NewPageIndex;
        LoadAdmin();
    }

    protected void GVADMIN_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVADMIN.EditIndex = -1;
        LoadAdmin();
    }

    protected void GVADMIN_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVADMIN.EditIndex = e.NewEditIndex;
        LoadAdmin();
    }

    protected void GVADMIN_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string MAAD = GVADMIN.DataKeys[e.RowIndex].Value.ToString();
        string sql = "Delete from ADMIN where MAAD=" + MAAD + "";

        if (SqlDatabase.ExcuteNonQueryTraVeGiaTri(sql) > 0)
        {
            LoadAdmin();
            Response.Write("<script> alert('Bạn đã xóa thành công')</script>");
        }
        else
        {
            Response.Write("<script> alert('Xóa không thành công')</script>");
        }
    }

    protected void GVADMIN_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int MAAD = int.Parse(GVADMIN.DataKeys[e.RowIndex].Value.ToString());
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("SUAADMIN", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MAAD", SqlDbType.Int).Value = MAAD;
            cmd.Parameters.Add("@TENAD", SqlDbType.NVarChar, 50).Value = (GVADMIN.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@NGAYSINH", SqlDbType.SmallDateTime).Value = DateTime.Parse((GVADMIN.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text);        
            cmd.Parameters.Add("@GIOITINH", SqlDbType.Int).Value = int.Parse((GVADMIN.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@DIACHI", SqlDbType.NVarChar, 100).Value = (GVADMIN.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@DIENTHOAI", SqlDbType.VarChar, 15).Value = (GVADMIN.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@EMAIL", SqlDbType.VarChar, 50).Value = (GVADMIN.Rows[e.RowIndex].Cells[6].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@TENDN", SqlDbType.VarChar, 30).Value = (GVADMIN.Rows[e.RowIndex].Cells[7].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@MATKHAU", SqlDbType.VarChar, 30).Value = (GVADMIN.Rows[e.RowIndex].Cells[8].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@QUYENADMIN", SqlDbType.Int).Value = int.Parse((GVADMIN.Rows[e.RowIndex].Cells[9].Controls[0] as TextBox).Text);
            cmd.ExecuteNonQuery();
            GVADMIN.EditIndex = -1;
            LoadAdmin();
            Response.Write("<script> alert('Bạn cập nhật thành công')</script>");
            con.Close();
        }
        catch (Exception)
        {
            Response.Write("<script> alert('Cập nhật thất bại')</script>");
        }
    }
}
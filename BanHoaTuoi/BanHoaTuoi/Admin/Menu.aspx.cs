using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Admin_Menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                
                loadMENU();
                ViewState["SortDirection"] = SortDirection.Ascending;
            }
            catch (Exception)
            {

            }

        }
    }
    protected void loadMENU()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * From DANHMUCHOA";
        DataTable dt = SqlDatabase.GetData(cmd);
        GVMenu.DataSource = dt;
        GVMenu.DataBind();
    }

    protected void GVMenu_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVMenu.PageIndex = e.NewPageIndex;
        loadMENU();
    }

    protected void GVMenu_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVMenu.EditIndex = -1;
        loadMENU();
    }

    protected void GVMenu_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVMenu.EditIndex = e.NewEditIndex;
        loadMENU();
    }

    protected void GVMenu_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int ID = int.Parse(GVMenu.DataKeys[e.RowIndex].Value.ToString());
        string sql = "Delete from DANHMUCHOA where ID=" + ID + "";

        if (SqlDatabase.ExcuteNonQueryTraVeGiaTri(sql) > 0)
        {
            loadMENU();
            Response.Write("<script> alert('Bạn đã xóa thành công')</script>");
        }
        else
        {
            Response.Write("<script> alert('Xóa không thành công')</script>");
        }
    }

    protected void GVMenu_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int ID = int.Parse(GVMenu.DataKeys[e.RowIndex].Value.ToString());
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("SUAMENU", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            cmd.Parameters.Add("@MADM", SqlDbType.VarChar, 5).Value = (GVMenu.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@TENDM", SqlDbType.NVarChar, 30).Value = (GVMenu.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@HREF", SqlDbType.VarChar, 50).Value = (GVMenu.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@HIDEN", SqlDbType.Bit).Value = (GVMenu.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
            cmd.ExecuteNonQuery();
            GVMenu.EditIndex = -1;
            loadMENU();
            Response.Write("<script> alert('Bạn cập nhật thành công')</script>");
            con.Close();
        }
        catch (Exception )
        {
          
            Response.Write("<script> alert('Cập nhật không thành công')</script>");
        }
    }
}
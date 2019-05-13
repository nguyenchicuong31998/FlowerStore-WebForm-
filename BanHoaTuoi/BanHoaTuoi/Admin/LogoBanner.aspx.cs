using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using QLBH;
using System.Web.UI.WebControls;

public partial class Admin_LogoBanner : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                loadQC();
                ViewState["SortDirection"] = SortDirection.Ascending;
            }
            catch(Exception)
            {

            }

        }        
    }
    protected void loadQC()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * From QuangCao";
        DataTable dt = SqlDatabase.GetData(cmd);
        GVLogoBanner.DataSource = dt;
        GVLogoBanner.DataBind();
    }

    protected void GVLogoBanner_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVLogoBanner.PageIndex = e.NewPageIndex;
        loadQC();
    }

    protected void GVLogoBanner_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVLogoBanner.EditIndex = -1;
        loadQC();
    }

    protected void GVLogoBanner_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVLogoBanner.EditIndex = e.NewEditIndex;
        loadQC();
    }

    protected void GVLogoBanner_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int IDQC = int.Parse(GVLogoBanner.DataKeys[e.RowIndex].Value.ToString());
        string sql = "Delete from QUANGCAO where IDQC=" + IDQC + "";

        if (SqlDatabase.ExcuteNonQueryTraVeGiaTri(sql) > 0)
        {
            loadQC();
            Response.Write("<script> alert('Bạn đã xóa thành công')</script>");
        }
        else
        {
            Response.Write("<script> alert('Xóa không thành công')</script>");
        }

    }

    protected void GVLogoBanner_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int IDQC = int.Parse(GVLogoBanner.DataKeys[e.RowIndex].Value.ToString());
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("SUALOGOBANNER", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@IDQC", SqlDbType.Int).Value = IDQC;
            cmd.Parameters.Add("@TENQC", SqlDbType.NVarChar, 250).Value = (GVLogoBanner.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text; 
            cmd.Parameters.Add("@ANH", SqlDbType.VarChar, 200).Value = (GVLogoBanner.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text; 
            cmd.Parameters.Add("@HREF", SqlDbType.VarChar, 200).Value = (GVLogoBanner.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text; 
            cmd.Parameters.Add("@NGAYBATDAU", SqlDbType.SmallDateTime).Value = DateTime.Parse((GVLogoBanner.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@NGAYKETTHUC", SqlDbType.SmallDateTime).Value = DateTime.Parse((GVLogoBanner.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@THUTUQC", SqlDbType.Int).Value = int.Parse((GVLogoBanner.Rows[e.RowIndex].Cells[6].Controls[0] as TextBox).Text); 
            cmd.Parameters.Add("@TRANGTHAI", SqlDbType.Bit).Value = (GVLogoBanner.Rows[e.RowIndex].Cells[7].Controls[0] as TextBox).Text; 
            cmd.ExecuteNonQuery();
            GVLogoBanner.EditIndex = -1;
            loadQC();
            Response.Write("<script> alert('Bạn cập nhật thành công')</script>");
            con.Close();
        }
        catch (Exception)
        {
            Response.Write("<script> alert('Cập nhật không thành công')</script>");
        }
    }
}
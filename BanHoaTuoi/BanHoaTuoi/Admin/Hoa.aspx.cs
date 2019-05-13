using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;

public partial class Admin_Hoa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            try{
                LoadHoa();
            }
            catch (Exception)
            {

            }
        }
    }
    protected void LoadHoa()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * from HOA ORDER BY NGAYCAPNHAT DESC";
        DataTable dt = SqlDatabase.GetData(cmd);
        GVHoa.DataSource = dt;
        GVHoa.DataBind();
    }
    protected void GVHoa_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVHoa.PageIndex = e.NewPageIndex;
        LoadHoa();
    }

    protected void GVHoa_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVHoa.EditIndex = -1;
        LoadHoa();
    }

    protected void GVHoa_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVHoa.EditIndex = e.NewEditIndex;
        LoadHoa();
    }
    protected void GVHoa_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int MAHOA = int.Parse(GVHoa.DataKeys[e.RowIndex].Value.ToString());
        string sql = "Delete from HOA where HOA.MAHOA=" + MAHOA + " AND NOT EXISTS(SELECT * from CTDATHANG where CTDATHANG.MAHOA=HOA.MAHOA)";

        if (SqlDatabase.ExcuteNonQueryTraVeGiaTri(sql) > 0)
        {
            LoadHoa();
            Response.Write("<script> alert('Bạn đã xóa thành công')</script>");
        }
        else
        {
            Response.Write("<script> alert('Xóa thất bại. Vui lòng kiểm tra lại hàng còn trong chi tiết hóa đơn!')</script>");
        }
    }


    protected void GVHoa_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int MAHOA = int.Parse(GVHoa.DataKeys[e.RowIndex].Value.ToString());
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("SUAHOA", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MAHOA", SqlDbType.Int).Value = MAHOA;
            cmd.Parameters.Add("@TENHOA", SqlDbType.NVarChar, 30).Value = (GVHoa.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@XUATSU", SqlDbType.NVarChar, 30).Value = (GVHoa.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@DONGIA", SqlDbType.Decimal,20).Value = Decimal.Parse((GVHoa.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@MOTA", SqlDbType.NVarChar,500).Value = (GVHoa.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@ANHHOA", SqlDbType.VarChar,100).Value =(GVHoa.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@MADMH", SqlDbType.VarChar,5).Value = (GVHoa.Rows[e.RowIndex].Cells[6].Controls[0] as TextBox).Text;
            cmd.Parameters.Add("@NGAYCAPNHAT", SqlDbType.SmallDateTime).Value = DateTime.Parse((GVHoa.Rows[e.RowIndex].Cells[7].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@TONGSOLUONG", SqlDbType.Int).Value =int.Parse((GVHoa.Rows[e.RowIndex].Cells[8].Controls[0] as TextBox).Text);
            cmd.Parameters.Add("@SOLANXEM", SqlDbType.Int).Value = int.Parse((GVHoa.Rows[e.RowIndex].Cells[9].Controls[0] as TextBox).Text);
            cmd.ExecuteNonQuery();
            GVHoa.EditIndex = -1;
            LoadHoa();
            Response.Write("<script> alert('Bạn cập nhật thành công')</script>");
            con.Close();
        }
        catch (Exception)
        {
            Response.Write("<script> alert('Cập nhật thất bại')</script>");
        }
    }
}
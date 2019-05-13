using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using QLBH;

public partial class Admin_ThemHoa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = "CK/ckfinder";
            _FileBrowser.SetupCKEditor(CKEditor);
        }
        loadDanhMuc();
    }
    private void loadDanhMuc()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * from DANHMUCCON";
        DataTable dt = SqlDatabase.GetData(cmd);
        foreach(DataRow dr in dt.Rows)
        {
            drdanhmuc.Items.Add(dr["MADMH"].ToString());
        }
    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("ThemHoa",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TENHOA",SqlDbType.NVarChar,30).Value=txttenhoa.Text;
            cmd.Parameters.Add("@XUATSU",SqlDbType.NVarChar,30).Value=txtxuatsu.Text;
            cmd.Parameters.Add("@DONGIA",SqlDbType.Decimal).Value=Decimal.Parse(txtgia.Text);
            cmd.Parameters.Add("@MOTA",SqlDbType.NVarChar,500).Value=CKEditor.Text;
            cmd.Parameters.Add("@ANHHOA",SqlDbType.VarChar,100).Value=FileAnh.FileName;
            cmd.Parameters.Add("@MADMH",SqlDbType.VarChar,5).Value=drdanhmuc.SelectedItem.Value;
            cmd.Parameters.Add("@NGAYCAPNHAT",SqlDbType.SmallDateTime).Value=DateTime.Today;
            cmd.Parameters.Add("@TONGSOLUONG",SqlDbType.Int).Value=int.Parse(txttsluong.Text);
            cmd.Parameters.Add("@SOLANXEM",SqlDbType.Int).Value=int.Parse(txtsoluotxem.Text);
            cmd.ExecuteNonQuery();
            Response.Write("<script> alert('Bạn thêm thành công')</script>");
            txttenhoa.Text = "";
            txtxuatsu.Text = "";
            txtgia.Text = "";
            txttsluong.Text = "";
            txtsoluotxem.Text = "";
            CKEditor.Text = "";
            txttenhoa.Focus();
            con.Close();
        }
        catch (Exception)
        {
            Response.Write("<script> alert('Bạn thêm thất bại')</script>");
        }
    }
}
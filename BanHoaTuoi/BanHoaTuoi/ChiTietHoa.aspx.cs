using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;

public partial class ChiTietHoa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadbinhluan();
            loaddanhgia();
        }
        loadChitiethoa();
        SqlConnection con = SqlDatabase.OpenConnectionString();
        con.Open();
        SqlCommand cmdd = new SqlCommand();
        cmdd.Connection = con;
        cmdd.CommandText = "UPDATE HOA SET SOLANXEM=SOLANXEM + 1 where HOA.MAHOA='" + MAHOA + "'";
        cmdd.ExecuteNonQuery();
        con.Close();
    }
    private int MAHOA = 0;
    private string Sao = "0";
    protected string FormatNumber(string _strInput)
    {
        string strInput = _strInput;
        int Length = 0;
        if (strInput.IndexOf(',') > 0)
            Length = strInput.Length - (strInput.Length - strInput.IndexOf(','));
        else
            Length = strInput.Length;
        string afterFormat = "";
        if (Length <= 3)
            afterFormat = strInput;
        else if (Length > 3)
        {
            afterFormat = strInput.Insert(Length - 3, ",");
            Length = afterFormat.IndexOf(",");
            while (Length > 3)
            {
                afterFormat = afterFormat.Insert(Length - 3, ",");
                Length = Length - 3;
            }
        }
        return afterFormat;
    }
    protected void loaddanhgia()
    {
        MAHOA = int.Parse(Request.QueryString["MAHOA"].ToString());
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT ISNULL(AVG(SAO), 0) TBSAO,COUNT(SAO) DEMSAO from DANHGIA where DANHGIA.MAHOA=" + MAHOA + "";
        DataTable dt = SqlDatabase.GetData(cmd);
        RatingStar.CurrentRating = Convert.ToInt32(dt.Rows[0]["TBSAO"].ToString());
        lblsao.Text = "( "+dt.Rows[0]["DEMSAO"].ToString() + " )";
    }
    private void loadChitiethoa()
    {
        MAHOA = int.Parse(Request.QueryString["MAHOA"].ToString());
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * From HOA where HOA.MAHOA='" + MAHOA + "'";
        DataTable dt = SqlDatabase.GetData(cmd);
        RepeaterCTH.DataSource = dt;
        RepeaterCTH.DataBind();
        
    }
    protected void btnnhanxet_Click(object sender, EventArgs e)
    {
        
        if (Session["TENDN"]!=null)
        {
            try
            {
                int MAKH = int.Parse(Session["MAKH"].ToString());
                SqlConnection con = SqlDatabase.OpenConnectionString();
                con.Open();
                SqlCommand cmd = new SqlCommand("THEMNHANXET", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MAKH",SqlDbType.Int).Value=MAKH;
                cmd.Parameters.Add("@MAHOA", SqlDbType.Int).Value=MAHOA;
                cmd.Parameters.Add("@HOTENKH",SqlDbType.NVarChar,50).Value=Session["TENDN"].ToString();
                cmd.Parameters.Add("@NGAYGIO",SqlDbType.SmallDateTime).Value=DateTime.Now;
                cmd.Parameters.Add("@NOIDUNGBL",SqlDbType.NVarChar,1000).Value=txtnoidung.Text;
                cmd.ExecuteNonQuery();
                //loadbinhluan();
                txtnoidung.Text = "";
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        else
        {
            Response.Redirect("~/DangNhap.aspx");
        }
    }
    protected string ktconhang(int sl)
    {
        string trangthai = "Còn hàng";
        if (sl<=0)
        {
             trangthai = "Hết hàng";
        }
        return trangthai;
    }
    protected string loadbinhluan()
    {
        MAHOA = int.Parse(Request.QueryString["MAHOA"].ToString());
        string binhluan = "";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * from BINHLUAN where BINHLUAN.MAHOA=" + MAHOA + " ORDER BY NGAYGIO DESC";
        DataTable dt = SqlDatabase.GetData(cmd);
        
        if(dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {                  
                binhluan += "<div class='cot'>";
                binhluan += "<div class='hinh-ten'><img class='hinh' src='Image/boy.png'/></div>";               
                binhluan += "<div class='noidungbl'>";
                binhluan += "<p class='customp ten'>" + dr["HOTENKH"].ToString() + "<span class='ngaygio'>" + dr["NGAYGIO"].ToString() + "</span></p>";
                binhluan += "<p class='customp'>" + dr["NOIDUNGBL"].ToString() + "</p>";
                binhluan += "</div>";
                binhluan += "</div>";   
            }
        }
        return binhluan;
    }

    protected void btnhuy_Click(object sender, EventArgs e)
    {
        txtnoidung.Text = "";
    }


    protected void RatingStar_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        if (Session["TENDN"] != null)
        {
            MAHOA = int.Parse(Request.QueryString["MAHOA"].ToString());
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO DANHGIA(SAO,MAHOA) VALUES(@SAO,@MAHOA)";
            cmd.Parameters.Add("@SAO", SqlDbType.SmallInt).Value = e.Value;
            cmd.Parameters.Add("@MAHOA", SqlDbType.Int).Value = MAHOA;
            cmd.ExecuteNonQuery();
            con.Close();
        }
        else
        {
            Response.Redirect("~/DangNhap.aspx");
        }

    }
    protected void linkGioHang_Click(object sender, EventArgs e)
    {
        MAHOA = int.Parse(Request.QueryString["MAHOA"].ToString());
        Session["SoLuong"] = txtsl.Text;
        Response.Redirect("~/Giohang.aspx?MAHOA=" + MAHOA + "");
    }
}
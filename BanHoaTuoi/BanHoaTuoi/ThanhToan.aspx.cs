using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;

public partial class ThanhToan : System.Web.UI.Page
{
    private int MAKH=0;
    private Decimal TongTien = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["TenDN"] == null)
        {
            Response.Redirect("~/Dangnhap.aspx");
        }
        if (Session["Giohang"] == null)
        {
            Response.Redirect("~/GioHang.aspx");
        }
        if (Session["Giohang"] != null)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Giohang"];
            System.Decimal TongThanhTien = 0;
            foreach (DataRow dr in dt.Rows)
            {
                dr["ThanhTien"] = Convert.ToInt32(dr["Soluong"]) * Convert.ToDecimal(dr["Dongia"]);
                TongThanhTien += Convert.ToDecimal(dr["ThanhTien"]);
                lbltongtien.Text = FormatNumber(TongThanhTien.ToString())+" VNĐ";
                TongTien = Decimal.Parse(TongThanhTien.ToString());
            }
            GVGiohang.DataSource = dt;
            GVGiohang.DataBind();
            loadkhachhang();
        }
    }
    protected string FormatNumber(string _strInput)
    {
        string strInput = _strInput;
        int Length = 0;
        if (strInput.IndexOf('.') > 0)
            Length = strInput.Length - (strInput.Length - strInput.IndexOf('.'));
        else
            Length = strInput.Length;
        string afterFormat = "";
        if (Length <= 3)
            afterFormat = strInput;
        else if (Length > 3)
        {
            afterFormat = strInput.Insert(Length - 3, ".");
            Length = afterFormat.IndexOf(".");
            while (Length > 3)
            {
                afterFormat = afterFormat.Insert(Length - 3, ".");
                Length = Length - 3;
            }
        }
        return afterFormat;
    }
    protected void loadkhachhang()
    {
        int MAKH1 = int.Parse(Session["MAKH"].ToString());
        MAKH = MAKH1;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * from KHACHHANG where MAKH=" + MAKH1 + "";
        DataTable dt = SqlDatabase.GetData(cmd);
        if(dt.Rows.Count>0)
        {
            txtname.Text = dt.Rows[0]["TENKH"].ToString();
            txtemail.Text = dt.Rows[0]["EMAIL"].ToString();
            txtdiachi.Text = dt.Rows[0]["DIACHI"].ToString();
        }

    }
    protected void btnthanhtoan_Click(object sender, EventArgs e)
    {
        int htthanhtoan = int.Parse(drhinhthucthanhtoan.SelectedItem.Value);
        int htgiaohang = int.Parse(drhinhthucgiaohang.SelectedItem.Value);
        string httt, htgh;
        string TenNguoiNhan, DiaChiNhan, DienThoaiNhan;
        TenNguoiNhan = txtname.Text;
        DiaChiNhan = txtdiachi.Text;
        DienThoaiNhan = txtsdt.Text;
        httt = drhinhthucthanhtoan.SelectedItem.Text;
        htgh = drhinhthucgiaohang.SelectedItem.Text;
        try
        {
            SqlConnection con = SqlDatabase.OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand("THANHTOAN", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MAKH", SqlDbType.Int).Value=MAKH;
            cmd.Parameters.Add("@NGAYDATHANG", SqlDbType.SmallDateTime).Value =DateTime.Today;
            cmd.Parameters.Add("@TRIGIA", SqlDbType.Decimal).Value = TongTien;
            cmd.Parameters.Add("@TENNGUOINHAN", SqlDbType.NVarChar,50).Value =txtname.Text;
            cmd.Parameters.Add("@DIENTHOAI", SqlDbType.VarChar,15).Value =txtsdt.Text;
            cmd.Parameters.Add("@DIACHI", SqlDbType.NVarChar, 200).Value = txtdiachi.Text;
            cmd.Parameters.Add("@HTTHANHTOAN", SqlDbType.NVarChar,100).Value =httt;
            cmd.Parameters.Add("@HTGIAOHANG", SqlDbType.NVarChar,100).Value =htgh;
            cmd.Parameters.Add("@TRANGTHAI", SqlDbType.Int).Value = 0;
            cmd.ExecuteNonQuery();
            con.Close();
            // lấy mã đơn hàng vừa lưu vào dataTable chi tiết đơn đặt hàng
            SqlCommand cmdd = new SqlCommand();
            cmdd.CommandText = "Select max(MADH) from DonDatHang where MAKH=" + MAKH + "";
            int SoDonHang = int.Parse(SqlDatabase.GetData(cmdd).Rows[0][0].ToString());
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Giohang"];
            int MAHOA, Soluong;
            Decimal Dongia;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                MAHOA = int.Parse(dt.Rows[i]["MaHoa"].ToString());
                Soluong = int.Parse(dt.Rows[i]["Soluong"].ToString());
                Dongia = Decimal.Parse(dt.Rows[i]["Dongia"].ToString());
                string s = "INSERT INTO CTDATHANG(MADH,MAHOA,SOLUONG,DONGIA) VALUES(" + SoDonHang + "," + MAHOA + "," + Soluong + "," + Dongia + ")";
                string sl = "UPDATE HOA SET TONGSOLUONG=TONGSOLUONG-" + Soluong + " Where HOA.MAHOA=" + MAHOA + "";
                SqlDatabase.ExcuteNonQueryString(s);
                SqlDatabase.ExcuteNonQueryString(sl);
            }
            Session["Giohang"] = null;
            if(htthanhtoan==0)
            {
                Response.Write("<script>alert('Bạn Đã Thanh Toán Thành Công')</script");
                Response.Redirect("~/TrangChu.aspx");
            }
            else if(htthanhtoan==1)
            {
                Response.Redirect("https://www.baokim.vn/thanh-toan/home/paymentMethod?oid=YDSXwCSpuN8%3D&gindex=4");
            }
            else if(htthanhtoan==2)
            {
                Response.Redirect("https://www.baokim.vn/thanh-toan/home/paymentMethod?oid=YDSXwCSpuN8%3D&gindex=4");
            }
            
        }
        catch(Exception)
        {
            Response.Write("<script>alert('Bạn Đã Thanh Toán Thất Bại')</script");
        }
    }
}
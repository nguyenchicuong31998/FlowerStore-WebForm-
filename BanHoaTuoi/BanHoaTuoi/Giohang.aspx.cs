using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;
public partial class Giohang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Request.QueryString["MAHOA"]!= null)
            {
                string MAHOA = Request.QueryString["MAHOA"].ToString();
                int MaHoa = int.Parse(MAHOA);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "Select TENHOA,DONGIA from HOA where HOA.MAHOA=" + MaHoa + "";
                DataTable dt = SqlDatabase.GetData(cmd);             
                string TenHoa = dt.Rows[0][0].ToString();
                Decimal Dongia = Decimal.Parse(FormatNumber(dt.Rows[0][1].ToString()));
                int Soluong = int.Parse(Session["SoLuong"].ToString());
                ThemVaoGioHang(MaHoa,TenHoa, Dongia, Soluong);
            }
            if (Session["Giohang"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["Giohang"];
                Decimal TongThanhTien = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    int soluong= Convert.ToInt32(dr["Soluong"]);
                    Decimal dongia = Convert.ToDecimal(dr["Dongia"]);
                    dr["ThanhTien"] = soluong * dongia;
                    TongThanhTien += Convert.ToDecimal(dr["ThanhTien"]);
                    lbltongtien.Text = FormatNumber(TongThanhTien.ToString())+" VNĐ";
                }
                GVGiohang.DataSource = dt;
                GVGiohang.DataBind();
            }
        }
    }
    public void ThemVaoGioHang(int MaHoa, string TenHoa, Decimal Dongia, int Soluong)
    {
        DataTable dt;
        if (Session["Giohang"] == null)
        {
            dt = new DataTable();
            dt.Columns.Add("MaHoa");
            dt.Columns.Add("TenHoa");
            dt.Columns.Add("Dongia");
            dt.Columns.Add("Soluong");
            dt.Columns.Add("ThanhTien");
        }
        else
        {
            dt = (DataTable)Session["Giohang"];
            int dong = SpDaCoTrongGioHang(MaHoa, dt);
            if (dong != -1)
            {
                dt.Rows[dong]["Soluong"] = Convert.ToInt32(dt.Rows[dong]["Soluong"]) + Soluong;
            }
            else
            {
                DataRow dr = dt.NewRow();
                dr["MaHoa"] = MaHoa;
                dr["TenHoa"] = TenHoa;
                dr["Dongia"] = Dongia;
                dr["Soluong"] = Soluong;
                dr["ThanhTien"] = Dongia * Soluong;
                dt.Rows.Add(dr);
            }
        }
        Session["Giohang"] = dt;
    }
    public static int SpDaCoTrongGioHang(int MaHoa, DataTable dt)
    {
        int dong = -1;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (int.Parse(dt.Rows[i]["MaHoa"].ToString()) == MaHoa)
            {
                dong = i;
                break;
            }
        }
        return dong;
    }
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


    protected void GVGiohang_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Xoa")
        {
            int chiso = int.Parse(e.CommandArgument.ToString());
            try
            {
                DataTable dt = (DataTable)Session["Giohang"];
                dt.Rows.RemoveAt(chiso);
                Session["Giohang"] = dt;
                Response.Redirect("~/Giohang.aspx");
            }
            catch
            {
                Response.Redirect("~/Giohang.aspx");
            }
        }
    }

    protected void btnCapNhat_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)Session["Giohang"];
        foreach (GridViewRow r in GVGiohang.Rows)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (Convert.ToString(GVGiohang.DataKeys[r.DataItemIndex].Value) == dr["MaHoa"].ToString())
                {
                    TextBox t = (TextBox)r.Cells[2].FindControl("txtsoluong");

                    if (Convert.ToInt32(t.Text) <= 0)
                    {
                        dt.Rows.Remove(dr);
                    }
                    else
                    {
                        dr["Soluong"] = t.Text;
                    }
                    break;
                }
            }

        }
        Session["Giohang"] = dt;
        Response.Redirect("~/Giohang.aspx");
    }

    protected void btnThanhToan_Click(object sender, EventArgs e)
    {
        if (Session["TENDN"] != null)
        {
            Response.Redirect("~/ThanhToan.aspx");
        }
        else
        {
            Response.Redirect("~/DangNhap.aspx");
        }
    }
}
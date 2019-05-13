using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;

public partial class HoaTheoLoai : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadHoaTheoLoai();
        TieuDe();
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
    string LuuMa = "";
    private void LoadHoaTheoLoai()
    {
        string MADMH = Request.QueryString["MADMH"].ToString();
        LuuMa = MADMH;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * from Hoa where HOA.MADMH='" + MADMH + "'";
        DataTable dt = SqlDatabase.GetData(cmd);
        RepeaterHTL.DataSource = dt;
        RepeaterHTL.DataBind();
    }
    protected string TieuDe()
    {
        string Title = "";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * from DANHMUCCON where DANHMUCCON.MADMH='" + LuuMa.ToString() + "'";
        DataTable dt = SqlDatabase.GetData(cmd);
        if(dt.Rows.Count>=0)
        {
            Title += dt.Rows[0]["TENDMCON"].ToString();
        }
        return Title;
    }
}
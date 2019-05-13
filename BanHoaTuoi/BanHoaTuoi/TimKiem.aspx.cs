using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using QLBH;
public partial class TimKiem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            loadtimkiem();
        }
        
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
    private void loadtimkiem()
    {
        string timkiem = Session["TimKiem"].ToString();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM HOA WHERE TENHOA=N'" + timkiem + "' OR TENHOA like N'" + timkiem + "%'";
        DataTable dt = SqlDatabase.GetData(cmd);
        if (dt.Rows.Count > 0)
        {
            RepeaterTK.DataSource = dt;
            RepeaterTK.DataBind();
        }
        else
        {
            lblkhongtimthay.Text = "Không có kết quả tìm kiếm";
        }
    }
}
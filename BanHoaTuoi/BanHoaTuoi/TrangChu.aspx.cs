using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using QLBH;

public partial class TrangChu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadtrangchu();
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
    private void loadtrangchu()
    {
        //string HSN = "HSN";
        //SqlCommand cmd = new SqlCommand();
        //cmd.CommandText = "Select TOP 12 * from Hoa where HOA.MADMH='" + HSN + "'";
        //DataTable dt = SqlDatabase.GetData(cmd);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "	SELECT TOP 12 * FROM HOA WHERE DATEDIFF(DAY,NGAYCAPNHAT,GETDATE())<20";
        DataTable dt = SqlDatabase.GetData(cmd);
        if(dt.Rows.Count>0)
        {
           RepeaterTC.DataSource = dt;
           RepeaterTC.DataBind();
        }
    }
}
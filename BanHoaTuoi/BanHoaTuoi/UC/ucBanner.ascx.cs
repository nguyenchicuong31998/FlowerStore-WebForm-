using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class UC_ucBanner : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadBanner();
        LoadLogo();
        if (Session["Giohang"] != null)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Giohang"];
            System.Int32 TongSL = 0;
            foreach (DataRow dr in dt.Rows)
            {
                TongSL += Convert.ToInt32(dr["Soluong"]);
                lblslgiohang.Text = "(" + TongSL.ToString() + ")";
            }
        }
    }

    protected string LoadBanner()
    {
        string anh="";
        DataTable dt = QuangCao.GetPicture(2,1);
        if (dt.Rows.Count >= 0)
        {
            anh = "Image/"+dt.Rows[0][0].ToString();
        }
        return anh;
    }
    protected string LoadLogo()
    {
        string anh = "";
        DataTable dt = QuangCao.GetPicture(1, 1);
        if (dt.Rows.Count >= 0)
        {
            anh = "Image/"+dt.Rows[0][0].ToString();
        }
        return anh;
    }

}
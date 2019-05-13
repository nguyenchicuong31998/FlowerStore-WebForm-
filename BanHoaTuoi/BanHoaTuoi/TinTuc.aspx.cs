using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;

public partial class TinTuc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadTinTuc();
    }
    protected void loadTinTuc()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "	SELECT TOP 6 * FROM TINTUC ORDER BY NGAYDANG DESC";
        DataTable dt = SqlDatabase.GetData(cmd);
        RepeaterTT.DataSource = dt;
        RepeaterTT.DataBind();
    }
}
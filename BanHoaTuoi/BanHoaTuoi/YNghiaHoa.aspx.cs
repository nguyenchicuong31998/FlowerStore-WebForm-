using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QLBH;

public partial class YNghiaHoa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadYNghia();
    }
    protected void LoadYNghia()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * From YNGHIAHOA";
        DataTable dt = SqlDatabase.GetData(cmd);
        RepeaterYN.DataSource = dt;
        RepeaterYN.DataBind();
    }
}
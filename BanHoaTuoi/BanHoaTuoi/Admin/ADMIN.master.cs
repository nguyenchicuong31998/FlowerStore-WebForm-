using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ADMIN : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

         lbltenad.Text = "Xin chào: " + Session["TENAD"].ToString();
       

    }

    protected void Linkdangxuat_Click(object sender, EventArgs e)
    {
        Session["TENAD"] = null;
        Response.Redirect("~/Admin/DangNhapAdmin.aspx");
    }
}

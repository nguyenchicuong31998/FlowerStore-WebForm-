<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucHeader.ascx.cs" Inherits="UC_ucHeader" %>
<style type="text/css">
    *{
        margin:0xp;
        padding:0px;
    }
    .login {
    height: 30px;
    background-color: rgb(255, 128, 151);
}

    .login ul {
        list-style-type: none;
        line-height: 28px;
    }

        .login ul li {
            display: inline-block;
        }

            .login ul li a {
                color: white;
                text-decoration: none;
            }

.vertical-bar {
    color: white;
}
.remove-padding {
    padding-left: 0px !important;
    padding-right: 0px !important;
}

.space {
    padding: 2px;
    color:white;
}

.right {
    float: right;
    margin-right: 15px;
}
ul.thaxuong{
    position: absolute;
    color: white;
    left: 1032px;
    width: 214px !important;
    background: rgb(255, 128, 151) !important;
}
ul.thaxuong li a:hover{
    color:white !important;
}
.caret{
    color:white !important;
}
</style>
<div class="container-fluid remove-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="login">
                <ul>
                    <li style="color: white; margin-left: 40px"><span class="glyphicon glyphicon-earphone">0972612445</span></li>
                    <li class="right"><span class="glyphicon glyphicon-user space"></span>
                        <asp:LinkButton ID="LinkDangKy" runat="server" href="DangKy.aspx">Đăng ký</asp:LinkButton>
                        <asp:LinkButton ID="Linkdangxuat" runat="server" OnClick="Linkdangxuat_Click" Visible="False">Đăng xuất</asp:LinkButton>
                    </li>
                    <span class="vertical-bar right">| </span>
                     
                    <li class="right">
                        <span class="glyphicon glyphicon-log-in space"></span>
                        <%=lay() %>
                        <asp:Label ID="lblten" CssClass="space" runat="server" Text=""></asp:Label>                                              
                        <asp:LinkButton ID="linkdangnhap" runat="server" href="DangNhap.aspx">Đăng nhập</asp:LinkButton>              
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>


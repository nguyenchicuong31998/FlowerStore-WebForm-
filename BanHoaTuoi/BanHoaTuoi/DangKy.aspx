<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DangKy.aspx.cs" Inherits="DangKy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ĐĂNG KÝ</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="Image/logo.png">
    <style type="text/css">
         #popup{
            position: fixed;
            top:0px;
            left:0px;
            width:100%;
            height: 100%;
            z-index: 9999;
            background:url(Image/background1.jpg) no-repeat center;
            background-size:cover;
        }
        #popupcontrol{
            position: fixed;
            width:30%;
            height: auto;
            border: 2px solid black;
            border-radius: 5px;
            background-color: white;
            left:35%;
            top:5%;
        }
        #close-popup{
            position: absolute;
            border: 2px solid red;
            border-radius: 25px;
            width: 25px;
            height: 25px;
            text-align: center;
            right:5px;
            top:5px;
            margin-top:0px;
            color: red;
            font-weight: bold;
            cursor: pointer;
        }
    .gachchan {
        margin: 0;
        padding: 0;
        width: 172px;
        height: 30px;
        border-top:none;
        border-bottom: 5px solid rgb(255, 128, 151);
    }

    .title-dn {
        text-align: center;
        color: black;
        font-weight:bold;
        font-size:20px;
        padding: 10px;
    }
    .layout{
        padding-left: 20px;
        padding-right: 20px;
        margin-bottom: 10px;
    }
        .customdn {
            width: 100%;
            padding: 7px;
        }

        .goitinh {
            display: inline;
        }
        .customgt{
            width:20%;
            height:30px;
            padding:5px;
        }
        @media only screen and (max-width: 688px){
            #popupcontrol {
                width: 80% !important;
                height: auto;
                left:10% !important;
                top:5%;
            }
        }
        @media only screen and (min-width: 688px) and (max-width: 1024px){
            #popupcontrol {
                width: 70%;
                height: auto;
                left: 15% !important;
                top:5%;
            }
        }
        .khac {
        padding-left: 20px;
        padding-right: 20px;
        margin-bottom: 10px;
    }
                .trangchu {
            width: 49%;
            float: right;
            text-align: right;
        }

        .doimatkhau {
            width: 49%;
            display: block;
            float: left;
        }
        .color{
            color:blue;
        }
        .color:hover{
            text-decoration:none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="popup">
            <div id="popupcontrol">
                <hr class="gachchan" />
                <div class="dangnhap">
                    <div class="title-dn">ĐĂNG KÝ</div>
                    <div class="layout">
                        <asp:TextBox ID="txthotentk" CssClass="customdn" Placeholder="Họ tên đầy đủ" runat="server"></asp:TextBox>
                        <div class="eror">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn vui lòng nhập họ tên!" ControlToValidate="txthotentk" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="layout">
                        <asp:TextBox ID="txttendn" CssClass="customdn" Placeholder="Tên đăng nhập" runat="server"></asp:TextBox>
                        <div class="eror">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn vui lòng nhập tên tài khoản!" ControlToValidate="txttendn" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="layout">
                        <asp:TextBox ID="txtmatkhau" CssClass="customdn" Placeholder="Mật khẩu" runat="server" TextMode="Password"></asp:TextBox>
                        <div class="eror">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bạn vui lòng nhập mật khẩu!" ControlToValidate="txtmatkhau" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="layout">
                        <asp:TextBox ID="txtxacnhanmk" CssClass="customdn" Placeholder="Xác nhận mật khẩu" runat="server" TextMode="Password"></asp:TextBox>
                        <div class="eror">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtxacnhanmk" ErrorMessage="Bạn vui lòng nhập lại mật khẩu!" ForeColor="Red"></asp:RequiredFieldValidator>                            
                        </div>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu không trùng nhau!" ControlToCompare="txtmatkhau" ControlToValidate="txtxacnhanmk" ForeColor="Red"></asp:CompareValidator>
                    </div>
                     <div class="layout">
                         <asp:DropDownList ID="drngay" CssClass="customgt" runat="server"></asp:DropDownList>
                         <asp:DropDownList ID="drthang" CssClass="customgt" runat="server"></asp:DropDownList>
                         <asp:DropDownList ID="drnam"  CssClass="customgt" runat="server"></asp:DropDownList>
                    </div>
                     <div class="layout">Giới tính:
                        <asp:RadioButtonList ID="radgt" CssClass="goitinh" runat="server" Height="16px" Width="66px">
                            <asp:ListItem Selected="True" Value="0">Nam</asp:ListItem>
                            <asp:ListItem Value="1">Nữ</asp:ListItem>
                         </asp:RadioButtonList>
                    </div>
                    <div class="layout">
                        <asp:LinkButton ID="btndk" CssClass="btn btn-info btn-block" runat="server" OnClick="btndk_Click">ĐĂNG KÝ</asp:LinkButton>
                    </div>
                    <div class="khac">
                        <div class="doimatkhau">
                            <a class="color" href="DoiMatKhau.aspx">Đổi mật khẩu</a>
                        </div>
                        <span>|</span>
                        <div class="trangchu">
                            <a class="color" href="TrangChu.aspx">Trang chủ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

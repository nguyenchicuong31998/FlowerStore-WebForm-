<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ĐĂNG NHẬP</title>
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
            width:25%;
            height: auto;
            border: 2px solid black;
            border-radius: 5px;
            background-color: white;
            left:38%;
            top:30%;
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
    .tendangnhap,.matkhau,.btndn,.khac {
        padding-left: 20px;
        padding-right: 20px;
        margin-bottom: 10px;
    }
    .customdn {
        width: 100%;
        padding: 7px;
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
        @media only screen and (max-width: 688px){
            #popupcontrol {
                width: 80%;
                height: auto;
                left: 10% !important;
                top: 30%;
            }
        }
        @media only screen and (max-width: 1024px){
            #popupcontrol {
                width: 70%;
                height: auto;
                left: 15% !important;
                top: 30%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="popup">
            <div id="popupcontrol">
                <hr class="gachchan" />
                <div class="dangnhap">
                    <div class="title-dn">ĐĂNG NHẬP</div>
                    <div class="tendangnhap">
                        <asp:TextBox ID="txtdangnhap" CssClass="customdn" Placeholder="Tên đăng nhập" runat="server"></asp:TextBox>
                        <div class="eror">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn vui lòng nhập tên tài khoản!" ControlToValidate="txtdangnhap" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="matkhau">
                        <asp:TextBox ID="txtmatkhau" CssClass="customdn" Placeholder="Mật khẩu" runat="server" TextMode="Password"></asp:TextBox>
                        <div class="eror">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn vui lòng nhập mật khẩu!" ControlToValidate="txtmatkhau" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="btndn">
                        <asp:LinkButton ID="btndangnhap" CssClass="btn btn-info btn-block" runat="server" OnClick="btndangnhap_Click">ĐĂNG NHẬP</asp:LinkButton>
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

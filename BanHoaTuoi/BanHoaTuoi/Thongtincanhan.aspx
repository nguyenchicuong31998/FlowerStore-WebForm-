<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Thongtincanhan.aspx.cs" Inherits="Thongtincanhan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thông tin cá nhân</title>
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
                    <div class="title-dn">THÔNG TIN CÁ NHÂN</div>
                    <div class="layout">
                        <asp:TextBox ID="txthotentk" CssClass="customdn" Placeholder="Họ tên đầy đủ" runat="server"></asp:TextBox>
                        <div class="eror">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn vui lòng nhập họ tên!" ControlToValidate="txthotentk" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="layout">
                        <asp:TextBox ID="txtdiachi" CssClass="customdn" Placeholder="Địa chỉ" runat="server"></asp:TextBox>
                        <div class="eror">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn vui lòng nhập địa chỉ!" ControlToValidate="txtdiachi" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="layout">
                        <asp:TextBox ID="txtngaysinh" CssClass="customdn" Placeholder="Ngày sinh" runat="server"></asp:TextBox>
                        <div class="eror">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bạn vui lòng ngày sinh!" ControlToValidate="txtngaysinh" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>  
                    <div class="layout">
                        <asp:TextBox ID="txtEmail" CssClass="customdn" Placeholder="Email" runat="server"></asp:TextBox>
                    </div>
                     <div class="layout">Giới tính:
                        <asp:RadioButtonList ID="radgt" CssClass="goitinh" runat="server" Height="16px" Width="66px">
                            <asp:ListItem Selected="True" Value="0">Nam</asp:ListItem>
                            <asp:ListItem Value="1">Nữ</asp:ListItem>
                         </asp:RadioButtonList>
                    </div>
                    <div class="layout">
                        <asp:LinkButton ID="btndk" CssClass="btn btn-info btn-block" runat="server" OnClick="btndk_Click">Lưu</asp:LinkButton>
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

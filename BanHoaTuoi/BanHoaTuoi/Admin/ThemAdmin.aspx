<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="ThemAdmin.aspx.cs" Inherits="Admin_ThemAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <style type="text/css">
        .title-chung {
            width: 100%;
            line-height: 10px;
            border-radius: 5px;
            padding: 10px;
            border: 1px solid black;
            background-color: aqua;
            color: black;
            font-weight: bold;
        }

        .dungchung {
            padding: 10px 15px 5px 15px;
            margin-left: 40px;
        }

        .khoangcach {
            width: 170px;
            float: left;
        }
        .danhmuc-padding{
            padding:5px;
        }
            .error {
                margin-left: 163px;
                padding: 5px;
            }
    </style>
    <div class="title-chung">Thêm Admin</div>
    <div class="dungchung">
        <div class="khoangcach">Họ và tên:</div><asp:TextBox ID="txttenad" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn vui lòng nhập họ và tên!" ControlToValidate="txttenad" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
        <div class="dungchung">
       <div class="khoangcach">Ngày sinh:</div><asp:TextBox ID="txtngaysinh" runat="server"></asp:TextBox>
       <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn vui lòng nhập ngày sinh!" ControlToValidate="txtngaysinh" ForeColor="Red"></asp:RequiredFieldValidator>
       </div>
    </div>
    <div class="dungchung">
       <span class="khoangcach">Giới tính:</span><asp:DropDownList ID="drdanhmuc" CssClass="danhmuc-padding" runat="server">
            <asp:ListItem Value="1">Nữ</asp:ListItem>
            <asp:ListItem Value="0" Selected="True">Nam</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="dungchung">
        <div class="khoangcach">Địa chỉ:</div><asp:TextBox ID="txtdiachi" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Bạn vui lòng nhập địa chỉ!" ControlToValidate="txtdiachi" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
        <div class="khoangcach">Điện thoại:</div><asp:TextBox ID="txtdienthoai" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Bạn vui lòng nhập điện thoại!" ControlToValidate="txtdienthoai" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
        <div class="khoangcach">Email:</div>
        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bạn vui lòng nhập email!" ControlToValidate="txtemail" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
        <div class="khoangcach">Tên đăng nhập:</div>
        <asp:TextBox ID="txttendangnhap" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Bạn vui lòng nhập tên đăng nhập!" ControlToValidate="txttendangnhap" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
        <div class="khoangcach">Mật khẩu:</div>
        <asp:TextBox ID="txtmatkhau" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Bạn vui lòng nhập mật khẩu!" ControlToValidate="txtmatkhau" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
        <div class="khoangcach">Quyền Admin:</div>
        <asp:TextBox ID="txtquyen" runat="server"></asp:TextBox>
    </div>
    <div class="dungchung text-center">
        <asp:Button ID="btnThem" CssClass="btn-primary btn" runat="server" Text="Thêm" OnClick="btnThem_Click"  />
    </div>
    <div class="dungchung">
        <asp:Label ID="lblthem" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>


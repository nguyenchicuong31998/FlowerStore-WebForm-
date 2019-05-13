<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="ThemDanhMuc.aspx.cs" Inherits="Admin_ThemDanhMuc" %>

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
    <div class="title-chung">Thêm Menu</div>
    <div class="dungchung">
        <div class="khoangcach">Mã danh mục:</div><asp:TextBox ID="txtmadanhmuc" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn vui lòng nhập mã !" ControlToValidate="txtmadanhmuc" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
        <div class="khoangcach">ID:</div><asp:TextBox ID="txtID" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Bạn vui lòng nhập id !" ControlToValidate="txtID" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
       <div class="khoangcach">Tên danh mục:</div><asp:TextBox ID="txttendanhmuc" runat="server"></asp:TextBox>
       <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn vui lòng nhập tên !" ControlToValidate="txttendanhmuc" ForeColor="Red"></asp:RequiredFieldValidator>
       </div>
    </div>
    <div class="dungchung">
       <div class="khoangcach">Mã menu:</div><asp:DropDownList ID="drmenu" CssClass="danhmuc-padding" runat="server"></asp:DropDownList>
    </div>
    <div class="dungchung">
       <span class="khoangcach">Trạng thái:</span><asp:DropDownList ID="drdanhmuc" CssClass="danhmuc-padding" runat="server">
            <asp:ListItem Value="1">True</asp:ListItem>
            <asp:ListItem Value="0">False</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="dungchung text-center">
        <asp:Button ID="btnThem" CssClass="btn-primary btn" runat="server" Text="Thêm" OnClick="btnThem_Click"  />
    </div>
    <div class="dungchung">
        <asp:Label ID="lblthem" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>


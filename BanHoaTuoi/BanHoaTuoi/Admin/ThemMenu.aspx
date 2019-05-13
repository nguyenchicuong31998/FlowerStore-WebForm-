<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="ThemMenu.aspx.cs" Inherits="Admin_ThemMenu" %>

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
        <div class="khoangcach">Mã menu:</div><asp:TextBox ID="txtmenu" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn vui lòng nhập mã !" ControlToValidate="txtmenu" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
        <div class="khoangcach">Tên menu:</div><asp:TextBox ID="txtten" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Bạn vui lòng nhập tên !" ControlToValidate="txtten" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
       <div class="khoangcach">Link:</div><asp:TextBox ID="txtlink" runat="server"></asp:TextBox>
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


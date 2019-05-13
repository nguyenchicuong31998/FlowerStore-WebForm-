<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="ThemLogoBanner.aspx.cs" Inherits="Admin_ThemLogoBanner" %>

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
    <div class="title-chung">Thêm Logo Banner</div>
    <div class="dungchung">
        <div class="khoangcach">Tên quảng cáo:</div><asp:TextBox ID="txttenqc" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn vui lòng nhập tên !" ControlToValidate="txttenqc" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
     <div class="dungchung">
       <div class="khoangcach">Ảnh:</div><asp:FileUpload ID="FileAnh" runat="server" />
    </div>
    <div class="dungchung">
        <div class="khoangcach">Href:</div><asp:TextBox ID="txthref" runat="server"></asp:TextBox>
    </div>
    <div class="dungchung">
       <div class="khoangcach">Ngày kết thúc:</div><asp:TextBox ID="txtngayketthuc" runat="server"></asp:TextBox>
       <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bạn vui lòng nhập ngày kết thúc !" ControlToValidate="txtngayketthuc" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
       <div class="khoangcach">Thứ tự:</div><asp:TextBox ID="txtthutu" runat="server"></asp:TextBox>
       <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn vui lòng nhập thứ tự !" ControlToValidate="txtthutu" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
       <span class="khoangcach">Trạng thái:</span><asp:DropDownList ID="drdanhmuc" CssClass="danhmuc-padding" runat="server">
            <asp:ListItem Value="1">True</asp:ListItem>
            <asp:ListItem Value="0">False</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="dungchung text-center">
        <asp:Button ID="btnThem" CssClass="btn-primary btn" runat="server" Text="Thêm" OnClick="btnThem_Click"/>
    </div>
    <div class="dungchung">
        <asp:Label ID="lblthem" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>


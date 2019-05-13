<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="ThemTinTuc.aspx.cs" Inherits="Admin_ThemTinTuc" %>

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
    <div class="title-chung">Thêm Tin Tức</div>
    <div class="dungchung">
        <div class="khoangcach">Mã admin:</div><asp:TextBox ID="txtmaad" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn vui lòng nhập mã admin !" ControlToValidate="txtmaad" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
        <div class="khoangcach">Tiêu đề:</div><asp:TextBox ID="txttieude" runat="server"></asp:TextBox>
         <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Bạn vui lòng nhập tiêu đề !" ControlToValidate="txttieude" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
       <div class="khoangcach">Nội dung:</div><asp:TextBox ID="txtnoidung" runat="server"></asp:TextBox>
       <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn vui lòng nhập nội dung !" ControlToValidate="txtnoidung" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
       <div class="khoangcach">Lượt xem:</div><asp:TextBox ID="txtluotxem" runat="server"></asp:TextBox>
       <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bạn vui lòng nhập lượt xem !" ControlToValidate="txtluotxem" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung text-center">
        <asp:Button ID="btnThem" CssClass="btn-primary btn" runat="server" Text="Thêm" OnClick="btnThem_Click"/>
    </div>
    <div class="dungchung">
        <asp:Label ID="lblthem" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>


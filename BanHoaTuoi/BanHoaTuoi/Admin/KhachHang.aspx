<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="KhachHang.aspx.cs" Inherits="Admin_KhachHang" %>

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
        .gvKhachHang {
            margin: 0px;
            font-size:11px!important;
        }

            .gvKhachHang th {
                padding: 5px;
                width: 155px;
                text-align: center;
                background-color: #2bcab2ed;
            }
            .gvKhachHang th:first-child{
                width:20px;
            }
            .gvKhachHang tr {
                padding: 5px;
                width: 150px;
                text-align: center;
            }


    </style>
      <div class="title-chung">Quản lý khách hàng</div>
    <asp:GridView ID="GVKhachHang" CssClass="gvKhachHang" runat="server" AutoGenerateColumns="False" DataKeyNames="MAKH" BorderStyle="Solid" AllowPaging="True" OnPageIndexChanging="GVKhachHang_PageIndexChanging" OnRowCancelingEdit="GVKhachHang_RowCancelingEdit" OnRowDeleting="GVKhachHang_RowDeleting" OnRowEditing="GVKhachHang_RowEditing" OnRowUpdating="GVKhachHang_RowUpdating" PageSize="8">
        <Columns>
            <asp:BoundField DataField="MAKH" HeaderText="ID" />
            <asp:BoundField DataField="TENKH" HeaderText="Tên khách hàng" />
            <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />
            <asp:BoundField DataField="NGAYSINH" HeaderText="Ngày sinh" />
            <asp:BoundField DataField="GIOITINH" HeaderText="Giới tính" />
            <asp:BoundField DataField="EMAIL" HeaderText="Email" />
            <asp:BoundField DataField="TENDN" HeaderText="Tên đăng nhập" />
            <asp:BoundField DataField="MATKHAU" HeaderText="Mật khẩu" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" EditImageUrl="~/Image/edit.png" ShowEditButton="True" UpdateImageUrl="~/Image/update.png" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/delete.png" ShowCancelButton="False" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>


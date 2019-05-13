<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin_Admin" %>

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
        .gvAdmin {
            margin: 0px;
            font-size:11px!important;
        }

            .gvAdmin th {
                padding: 5px;
                width: 155px;
                text-align: center;
                background-color: #2bcab2ed;
            }
            .gvAdmin th:first-child{
                width:20px;
            }
            .gvAdmin tr {
                padding: 5px;
                width: 150px;
                text-align: center;
            }


    </style>
      <div class="title-chung">Quản lý admin</div>
    <asp:GridView ID="GVADMIN" CssClass="gvAdmin" runat="server" AutoGenerateColumns="False" DataKeyNames="MAAD" BorderStyle="Solid" AllowPaging="True"  PageSize="10" OnPageIndexChanging="GVADMIN_PageIndexChanging" OnRowCancelingEdit="GVADMIN_RowCancelingEdit" OnRowDeleting="GVADMIN_RowDeleting" OnRowEditing="GVADMIN_RowEditing" OnRowUpdating="GVADMIN_RowUpdating">
        <Columns>
            <asp:BoundField DataField="MAAD" HeaderText="ID" />
            <asp:BoundField DataField="TENAD" HeaderText="Tên Admin" />
            <asp:BoundField DataField="NGAYSINH" HeaderText="Ngày sinh" />
            <asp:BoundField DataField="GIOITINH" HeaderText="Giới tính" />
            <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />
            <asp:BoundField DataField="DIENTHOAI" HeaderText="Điện thoại" />
            <asp:BoundField DataField="EMAIL" HeaderText="Email" />
            <asp:BoundField DataField="TENDN" HeaderText="Tên đăng nhập" />
            <asp:BoundField DataField="MATKHAU" HeaderText="Mật khẩu" />
            <asp:BoundField DataField="QUYENADMIN" HeaderText="Quyền admin" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" EditImageUrl="~/Image/edit.png" ShowEditButton="True" UpdateImageUrl="~/Image/update.png" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/delete.png" ShowCancelButton="False" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="Danhmuc.aspx.cs" Inherits="Admin_Danhmuc" %>

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
        .gvDanhMuc {
            margin: 0px;
            font-size:12px!important;
        }

            .gvDanhMuc th {
                padding: 5px;
                width: 155px;
                text-align: center;
                background-color: #2bcab2ed;
            }
            .gvDanhMuc th:first-child{
                width:20px;
            }
            .gvDanhMuc tr {
                padding: 5px;
                width: 155px;
                text-align: center;
            }

    </style>
      <div class="title-chung">Quản Lý Danh Mục</div>
    <asp:GridView ID="GVDanhMuc" CssClass="gvDanhMuc" runat="server" AutoGenerateColumns="False" DataKeyNames="MADMH" BorderStyle="Solid" AllowPaging="True" OnPageIndexChanging="GVDanhMuc_PageIndexChanging" OnRowCancelingEdit="GVDanhMuc_RowCancelingEdit" OnRowDeleting="GVDanhMuc_RowDeleting" OnRowEditing="GVDanhMuc_RowEditing" OnRowUpdating="GVDanhMuc_RowUpdating">
        <Columns>
            <asp:BoundField DataField="MADMH" HeaderText="Mã danh mục" />
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="TENDMCON" HeaderText="Tên danh mục" />
            <asp:BoundField DataField="MADM" HeaderText="Mã menu" />
            <asp:BoundField DataField="HIDEN" HeaderText="Trang thái" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" EditImageUrl="~/Image/edit.png" ShowEditButton="True" UpdateImageUrl="~/Image/update.png" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/delete.png" ShowCancelButton="False" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>


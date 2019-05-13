<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="DanhGia.aspx.cs" Inherits="Admin_DanhGia" %>

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
        .gvDanhGia {
            margin: 0px;
            font-size:12px!important;
        }

            .gvDanhGia th {
                padding: 5px;
                width: 155px;
                text-align: center;
                background-color: #2bcab2ed;
            }
            .gvDanhGia th:first-child{
                width:20px;
            }
            .gvDanhGia tr {
                padding: 5px;
                width: 155px;
                text-align: center;
            }

    </style>
      <div class="title-chung">Quản Lý Đánh Giá</div>
    <asp:GridView ID="GVDanhGia" CssClass="gvDanhGia" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" BorderStyle="Solid" AllowPaging="True" OnPageIndexChanging="GVDanhGia_PageIndexChanging" OnRowCancelingEdit="GVDanhGia_RowCancelingEdit" OnRowDeleting="GVDanhGia_RowDeleting" OnRowEditing="GVDanhGia_RowEditing" OnRowUpdating="GVDanhGia_RowUpdating">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="SAO" HeaderText="Số sao" />
            <asp:BoundField DataField="MAHOA" HeaderText="Mã hoa" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" EditImageUrl="~/Image/edit.png" ShowEditButton="True" UpdateImageUrl="~/Image/update.png" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/delete.png" ShowCancelButton="False" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>


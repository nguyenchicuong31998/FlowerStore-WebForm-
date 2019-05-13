<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="BinhLuan.aspx.cs" Inherits="Admin_BinhLuan" %>

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
        .gvBinhLuan {
            margin: 0px;
            font-size:11px!important;
        }

            .gvBinhLuan th {
                padding: 5px;
                width: 155px;
                text-align: center;
                background-color: #2bcab2ed;
            }
            .gvBinhLuan th:first-child{
                width:20px;
            }
            .gvBinhLuan tr {
                padding: 5px;
                width: 150px;
                text-align: center;
            }


    </style>
      <div class="title-chung">Bình Luận</div>
    <asp:GridView ID="GVBinhLuan" CssClass="gvBinhLuan" runat="server" AutoGenerateColumns="False" DataKeyNames="MABL" BorderStyle="Solid" AllowPaging="True" PageSize="8" OnPageIndexChanging="GVBinhLuan_PageIndexChanging" OnRowCancelingEdit="GVBinhLuan_RowCancelingEdit" OnRowDeleting="GVBinhLuan_RowDeleting" OnRowEditing="GVBinhLuan_RowEditing" OnRowUpdating="GVBinhLuan_RowUpdating">
        <Columns>
            <asp:BoundField DataField="MABL" HeaderText="ID" />
            <asp:BoundField DataField="MAKH" HeaderText="Mã khách hàng" />
            <asp:BoundField DataField="MAHOA" HeaderText="Mã hoa" />
            <asp:BoundField DataField="HOTENKH" HeaderText="Họ và tên" />
            <asp:BoundField DataField="NGAYGIO" HeaderText="Ngày bình luận" />
            <asp:BoundField DataField="NOIDUNGBL" HeaderText="Nội dung" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" EditImageUrl="~/Image/edit.png" ShowEditButton="True" UpdateImageUrl="~/Image/update.png" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/delete.png" ShowCancelButton="False" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="TinTuc.aspx.cs" Inherits="Admin_TinTuc" %>

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
        .gvTinTuc {
            margin: 0px;
            font-size:12px!important;
        }

            .gvTinTuc th {
                padding: 5px;
                width: 155px;
                text-align: center;
                background-color: #2bcab2ed;
            }
            .gvTinTuc th:first-child{
                width:20px;
            }
            .gvTinTuc tr {
                padding: 5px;
                width: 155px;
                text-align: center;
            }

    </style>
      <div class="title-chung">Quản lý Tin Tức</div>
    <asp:GridView ID="GVTinTuc" CssClass="gvTinTuc" runat="server" AutoGenerateColumns="False" DataKeyNames="MATT" BorderStyle="Solid" AllowPaging="True" OnPageIndexChanging="GVTinTuc_PageIndexChanging" OnRowCancelingEdit="GVTinTuc_RowCancelingEdit" OnRowDeleting="GVTinTuc_RowDeleting" OnRowEditing="GVTinTuc_RowEditing" OnRowUpdating="GVTinTuc_RowUpdating" >
        <Columns>
            <asp:BoundField DataField="MATT" HeaderText="ID" />
            <asp:BoundField DataField="MAAD" HeaderText="Mã admin" />
            <asp:BoundField DataField="TIEUDE" HeaderText="Tiêu đề" />
            <asp:BoundField DataField="NOIDUNG" HeaderText="Nội dung" />
            <asp:BoundField DataField="NGAYDANG" HeaderText="Ngày đăng" />
            <asp:BoundField DataField="LUOTXEM" HeaderText="Lượt xem" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" EditImageUrl="~/Image/edit.png" ShowEditButton="True" UpdateImageUrl="~/Image/update.png" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/delete.png" ShowCancelButton="False" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>


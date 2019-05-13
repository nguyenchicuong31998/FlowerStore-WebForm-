<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="LogoBanner.aspx.cs" Inherits="Admin_LogoBanner" %>

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
        .gvLogoBanner {
            margin: 0px;
            font-size:12px!important;
        }

            .gvLogoBanner th {
                padding: 5px;
                width: 155px;
                text-align: center;
                background-color: #2bcab2ed;
            }
            .gvLogoBanner th:first-child{
                width:20px;
            }
            .gvLogoBanner tr {
                padding: 5px;
                width: 155px;
                text-align: center;
            }

    </style>
      <div class="title-chung">Quản lý logo, banner</div>
    <asp:GridView ID="GVLogoBanner" CssClass="gvLogoBanner" runat="server" AutoGenerateColumns="False" DataKeyNames="IDQC" BorderStyle="Solid" OnPageIndexChanging="GVLogoBanner_PageIndexChanging" OnRowCancelingEdit="GVLogoBanner_RowCancelingEdit" OnRowDeleting="GVLogoBanner_RowDeleting" OnRowEditing="GVLogoBanner_RowEditing" OnRowUpdating="GVLogoBanner_RowUpdating">
        <Columns>
            <asp:BoundField DataField="IDQC" HeaderText="ID" />
            <asp:BoundField DataField="TENQC" HeaderText="Tên quảng cáo" />
            <asp:BoundField DataField="ANH" HeaderText="Ảnh" />
            <asp:BoundField DataField="HREF" HeaderText="Link" />
            <asp:BoundField DataField="NGAYBATDAU" HeaderText="Ngày bắt đầu" />
            <asp:BoundField DataField="NGAYKETTHUC" HeaderText="Ngày kết thúc" />
            <asp:BoundField DataField="THUTUQC" HeaderText="Thứ tự" />
            <asp:BoundField DataField="TRANGTHAI" HeaderText="Trạng thái" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" EditImageUrl="~/Image/edit.png" ShowEditButton="True" UpdateImageUrl="~/Image/update.png" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/delete.png" ShowCancelButton="False" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>


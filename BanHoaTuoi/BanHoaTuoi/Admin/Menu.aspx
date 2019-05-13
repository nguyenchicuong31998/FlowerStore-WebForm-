<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Admin_Menu" %>

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
        .gvMenu {
            margin: 0px;
            font-size:12px!important;
        }

            .gvMenu th {
                padding: 5px;
                width: 155px;
                text-align: center;
                background-color: #2bcab2ed;
            }
            .gvMenu th:first-child{
                width:20px;
            }
            .gvMenu tr {
                padding: 5px;
                width: 155px;
                text-align: center;
            }

    </style>
      <div class="title-chung">Quản lý Menu</div>
    <asp:GridView ID="GVMenu" CssClass="gvMenu" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" BorderStyle="Solid" AllowPaging="True" OnPageIndexChanging="GVMenu_PageIndexChanging" OnRowCancelingEdit="GVMenu_RowCancelingEdit" OnRowDeleting="GVMenu_RowDeleting" OnRowEditing="GVMenu_RowEditing" OnRowUpdating="GVMenu_RowUpdating">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="MADM" HeaderText="Mã menu" />
            <asp:BoundField DataField="TENDM" HeaderText="Tên menu" />
            <asp:BoundField DataField="HREF" HeaderText="Link" />
            <asp:BoundField DataField="HIDEN" HeaderText="Trang thái" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" EditImageUrl="~/Image/edit.png" ShowEditButton="True" UpdateImageUrl="~/Image/update.png" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/delete.png" ShowCancelButton="False" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>


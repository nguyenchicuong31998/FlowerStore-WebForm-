<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="ChiTietHoaDon.aspx.cs" Inherits="Admin_ChiTietHoaDon" %>

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
        .gvCTHoaDon {
            margin: 0px;
            font-size:11px!important;
        }

            .gvCTHoaDon th {
                padding: 5px;
                width: 155px;
                text-align: center;
                background-color: #2bcab2ed;
            }
            .gvCTHoaDon th:first-child{
                width:20px;
            }
            .gvCTHoaDon tr {
                padding: 5px;
                width: 150px;
                text-align: center;
            }


    </style>
      <div class="title-chung">Chi tiết hóa đơn</div>
    <asp:GridView ID="GVCTHoaDon" CssClass="gvCTHoaDon" runat="server" AutoGenerateColumns="False" DataKeyNames="MADH" BorderStyle="Solid" AllowPaging="True" PageSize="8" OnPageIndexChanging="GVCTHoaDon_PageIndexChanging" OnRowCancelingEdit="GVCTHoaDon_RowCancelingEdit" OnRowDeleting="GVCTHoaDon_RowDeleting" OnRowEditing="GVCTHoaDon_RowEditing" OnRowUpdating="GVCTHoaDon_RowUpdating">
        <Columns>
            <asp:BoundField DataField="MADH" HeaderText="ID" />
            <asp:BoundField DataField="MAHOA" HeaderText="Mã hoa" />
            <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" />
            <asp:BoundField DataField="DONGIA" HeaderText="Đơn giá" />
            <asp:BoundField DataField="THANHTIEN" HeaderText="Thành tiền" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" EditImageUrl="~/Image/edit.png" ShowEditButton="True" UpdateImageUrl="~/Image/update.png" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/delete.png" ShowCancelButton="False" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="HoaDon.aspx.cs" Inherits="Admin_HoaDon" %>

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
        .gvHoaDon {
            margin-left: -10px;
            font-size:9px!important;
        }

            .gvHoaDon th {
                padding: 5px;
                width: 155px;
                text-align: center;
                background-color: #2bcab2ed;
            }
            .gvHoaDon th:first-child{
                width:20px;
            }
            .gvHoaDon tr {
                padding: 5px;
                width: 150px;
                text-align: center;
            }

    </style>
      <div class="title-chung">Đơn hàng</div>
    <asp:GridView ID="GVHoaDon" CssClass="gvHoaDon" runat="server" AutoGenerateColumns="False" DataKeyNames="MADH" BorderStyle="Solid" AllowPaging="True" PageSize="6" OnPageIndexChanging="GVHoaDon_PageIndexChanging" OnRowCancelingEdit="GVHoaDon_RowCancelingEdit" OnRowDeleting="GVHoaDon_RowDeleting" OnRowEditing="GVHoaDon_RowEditing" OnRowUpdating="GVHoaDon_RowUpdating">
        <Columns>
            <asp:BoundField DataField="MADH" HeaderText="ID" />
            <asp:BoundField DataField="MAKH" HeaderText="Mã khách hàng" />
            <asp:BoundField DataField="NGAYDATHANG" HeaderText="Ngày đặt hàng" />
            <asp:BoundField DataField="TRIGIA" HeaderText="Giá tiền" />
            <asp:BoundField DataField="NGAYGIAOHANG" HeaderText="Ngày giao hàng" />
            <asp:BoundField DataField="TENNGUOINHAN" HeaderText="Tên người nhận" />
            <asp:BoundField DataField="DIENTHOAI" HeaderText="Điện thoại" />
            <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />
            <asp:BoundField DataField="HTTHANHTOAN" HeaderText="Hình thức thanh toán" />
            <asp:BoundField DataField="HTGIAOHANG" HeaderText="Hình thức giao hàng" />
            <asp:BoundField DataField="TRANGTHAI" HeaderText="Trạng thái" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" EditImageUrl="~/Image/edit.png" ShowEditButton="True" UpdateImageUrl="~/Image/update.png" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/delete.png" ShowCancelButton="False" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>


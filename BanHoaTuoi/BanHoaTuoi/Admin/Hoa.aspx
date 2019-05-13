<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="Hoa.aspx.cs" Inherits="Admin_Hoa" %>

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
        .gvHoa {
            margin: 0px;
            font-size:8px!important;
            color:black;
            font-weight:bold;
        }

            .gvHoa th {
                padding: 5px;
                width: 155px;
                text-align: center;
                background-color: #2bcab2ed;
            }
            .gvHoa th:first-child{
                width:20px;
            }
            .gvHoa th+th{
                width:40px;
            }
            .gvHoa th+th+th{
                width:20px;
            }
           .gvHoa th+th+th+th+th+th{
                width:20px;
            }
            .gvHoa tr {
                padding: 5px;
                width: 155px;
                text-align: center;
            }
            .gvHoa td {
                padding: 5px;
                font-size:10px;
                text-align: center;
            }

    </style>
      <div class="title-chung">Quản lý Hoa</div>
    <asp:GridView ID="GVHoa" CssClass="gvHoa" runat="server" AutoGenerateColumns="False" DataKeyNames="MAHOA" BorderStyle="Solid" AllowPaging="True" OnPageIndexChanging="GVHoa_PageIndexChanging" OnRowCancelingEdit="GVHoa_RowCancelingEdit" OnRowDeleting="GVHoa_RowDeleting" OnRowEditing="GVHoa_RowEditing" PageSize="6" OnRowUpdating="GVHoa_RowUpdating">
        <Columns>
            <asp:BoundField DataField="MAHOA" HeaderText="ID Hoa" />
            <asp:BoundField DataField="TENHOA" HeaderText="Tên hoa" />
            <asp:BoundField DataField="XUATSU" HeaderText="Xuất sứ" />
            <asp:BoundField DataField="DONGIA" HeaderText="Đơn giá" />
            <asp:BoundField DataField="MOTA" HeaderText="Mô tả" />
            <asp:BoundField DataField="ANHHOA" HeaderText="Ảnh" />
            <asp:BoundField DataField="MADMH" HeaderText="Mã danh mục" />
            <asp:BoundField DataField="NGAYCAPNHAT" HeaderText="Ngày cập nhật" />
            <asp:BoundField DataField="TONGSOLUONG" HeaderText="Tổng số lượng" />
            <asp:BoundField DataField="SOLANXEM" HeaderText="Tổng lượt xem" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" EditImageUrl="~/Image/edit.png" ShowEditButton="True" UpdateImageUrl="~/Image/update.png" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/delete.png" ShowCancelButton="False" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>


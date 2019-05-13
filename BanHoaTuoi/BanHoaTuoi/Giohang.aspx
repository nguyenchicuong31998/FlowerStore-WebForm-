<%@ Page Title="" Language="C#" MasterPageFile="~/HoaTuoi.master" AutoEventWireup="true" CodeFile="Giohang.aspx.cs" Inherits="Giohang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <style type="text/css">
        .column-cart {
            width: 100%;
            height: auto;
        }
        .gvgiohang{
            margin: 20px auto 10px;
        }
        .gvgiohang th{
            padding:5px;
            width:150px;
            text-align:center;
            background-color: #2bcab2ed;
        }
         .gvgiohang tr{
            padding:5px;
            width:150px;
            text-align:center;
        }
         .gh-soluong{
             text-align:center;
         }
        .congcu {
            width: 925px;
            margin: 0 auto;
            margin-bottom:10px;
        }
        .tongtien{
            margin-top:10px;
            margin-bottom:10px;
            font-size:17px;
            font-weight:bold;
        }
    </style>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-md-12 col-sm-12 col-lg-12">
                <div class="column-cart">
                    <asp:GridView ID="GVGiohang" CssClass="gvgiohang" runat="server" AutoGenerateColumns="False" DataKeyNames="MAHOA" BorderStyle="Solid" HorizontalAlign="Center" OnRowCommand="GVGiohang_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="MAHOA" HeaderText="Mã hoa" />
                            <asp:BoundField DataField="TENHOA" HeaderText="Tên hoa" />
                            <asp:BoundField DataField="DONGIA" HeaderText="Đơn giá" />
                            <asp:TemplateField HeaderText="Số lượng">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtsoluong" runat="server" CssClass="gh-soluong" Text='<%# Eval("Soluong") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="THANHTIEN" HeaderText="Thành tiền" />
                            <asp:ButtonField HeaderText="Xóa" ButtonType="Image" CommandName="Xoa" ImageUrl="~/Image/delete.png" />
                        </Columns>
                    </asp:GridView>
                    <div class="congcu">
                            <div class="tongtien">Tổng tiền:
                            <asp:Label ID="lbltongtien" runat="server" Text="0"></asp:Label></div>
                            <asp:Button ID="btnCapNhat" CssClass="btn btn-primary" runat="server" Text="Cập nhật" OnClick="btnCapNhat_Click" />
                            <asp:Button ID="btnThanhToan" CssClass="btn btn-primary" runat="server" Text="Thanh Toán" OnClick="btnThanhToan_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
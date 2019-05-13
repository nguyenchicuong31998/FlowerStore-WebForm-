<%@ Page Title="" Language="C#" MasterPageFile="~/HoaTuoi.master" AutoEventWireup="true" CodeFile="ThanhToan.aspx.cs" Inherits="ThanhToan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <style type="text/css">
        .title-thanhtoan {
            text-align: center;
            font-size: 20px;
            font-family: serif;
            font-weight: bold;
            padding: 10px;
        }

        .title-chung {
            font-size: 16px;
            font-weight: bold;
            padding: 5px;
        }

        .column-cart {
            width: 100%;
            height: auto;
        }

        .gvgiohang {
            margin: 20px auto 10px;
        }

            .gvgiohang th {
                padding: 5px;
                width: 155px;
                text-align: center;
                background-color: #2bcab2ed;
            }

            .gvgiohang tr {
                padding: 5px;
                width: 155px;
                text-align: center;
            }
         .gh-soluong{
             text-align:center;
         }
         .congcu {
            width: 779px;
            margin: 0 auto;
            margin-bottom:10px;
        }
        .tongtien {
            margin-top: 10px;
            margin-bottom: 10px;
            font-size: 17px;
            font-weight: bold;
        }
        .chung-thanhtoan{
            width: 50%;
        }
        .textboxchung {
            width: 100%;
            height: 40px;
            padding: 10px;
            border:1px solid black;
            border-radius: 10px;
            margin:10px 0px;
            font-size:15px;
            color:black;
        }
                .danhmuc-padding{
            padding:5px;
        }
                        .khoangcach {
            width: 170px;
            float: left;
        }
         .height{
             margin-top:10px;
             height:50px;
             margin-bottom:20px;
         }
                             .error {
                padding: 5px;
            }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="title-thanhtoan">THÔNG TIN ĐƠN ĐẶT HÀNG</div>
                <div class="title-chung">Thông tin đơn hàng</div>
                <div class="column-cart">
                    <asp:GridView ID="GVGiohang" CssClass="gvgiohang" runat="server" AutoGenerateColumns="False" DataKeyNames="MAHOA" BorderStyle="Solid" HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField DataField="MAHOA" HeaderText="Mã hoa" />
                            <asp:BoundField DataField="TENHOA" HeaderText="Tên hoa" />
                            <asp:BoundField DataField="DONGIA" HeaderText="Đơn giá" />
                            <asp:BoundField DataField="Soluong" HeaderText="Số lượng" />
                            <asp:BoundField DataField="THANHTIEN" HeaderText="Thành tiền" />
                        </Columns>
                    </asp:GridView>
                    <div class="congcu">
                        <div class="tongtien">
                            Tổng tiền:
                            <asp:Label ID="lbltongtien" runat="server" Text="0"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="title-chung">Thông tin mua hàng</div>
                <div class="congcu">
                    <div class="chung-thanhtoan">
                        <asp:TextBox ID="txtemail" CssClass="textboxchung" PlaceHolder="Email" runat="server"></asp:TextBox>                       
                    </div>
                    <div class="chung-thanhtoan">
                        <asp:TextBox ID="txtname" CssClass="textboxchung" PlaceHolder="Họ và tên" runat="server"></asp:TextBox>
                    </div>
                    <div class="chung-thanhtoan">
                        <asp:TextBox ID="txtsdt" CssClass="textboxchung" PlaceHolder="Số điện thoại" runat="server"></asp:TextBox>
                        <div class="error">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn vui lòng nhập số điện thoại !" ControlToValidate="txtsdt" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="chung-thanhtoan">
                        <asp:TextBox ID="txtdiachi" CssClass="textboxchung" PlaceHolder="Địa chỉ" runat="server"></asp:TextBox>
                        <div class="error">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn vui lòng nhập địa chỉ !" ControlToValidate="txtdiachi" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="chung-thanhtoan height">
                       <span class="khoangcach">Hình thức thanh toán:</span> <asp:DropDownList ID="drhinhthucthanhtoan" CssClass="danhmuc-padding" runat="server">
                            <asp:ListItem Value="0">Thanh toán sau khi giao hàng</asp:ListItem>
                            <asp:ListItem Value="1">Thanh toán bằng Ngân lượng</asp:ListItem>
                            <asp:ListItem Value="2">Thanh toán bằng Bảo kim</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                     <div class="chung-thanhtoan height">
                       <span class="khoangcach">Hình thức giao hàng:</span> <asp:DropDownList ID="drhinhthucgiaohang" CssClass="danhmuc-padding" runat="server">
                            <asp:ListItem Value="0">Giao trực tiếp</asp:ListItem>
                            <asp:ListItem Value="1">Chuyển giao</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="chung-thanhtoan text-center">
                        <asp:Button ID="btnthanhtoan" CssClass="btn btn-primary" runat="server" Text="Thanh toán" OnClick="btnthanhtoan_Click" />    
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


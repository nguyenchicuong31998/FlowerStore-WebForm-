<%@ Page Title="" Language="C#" MasterPageFile="~/HoaTuoi.master" AutoEventWireup="true" CodeFile="TimKiem.aspx.cs" Inherits="TimKiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
        <style type="text/css">
        .customDiv {
            padding: 10px;
            margin: 10px;
            border: 1px solid rgb(255, 128, 151);
            color: black;
            position: relative;
        }

        .name {
            color: black
        }

        .img-responsive {
            width: 100%;
            height: 250px;
            margin-bottom: 10px;
        }

        @media only screen and (max-width: 480px) {
            .img-responsive {
                height: 368px;
            }

            .xem {
                height: 76% !important;
            }
        }

        @media only screen and (max-width: 768px) {
            .img-responsive {
                height: 368px;
            }

            .xem {
                width: 96% !important;
                height: 74% !important;
            }
        }

        .xem {
            width: 94%;
            height: 65%;
            margin-top: 10px;
            position: absolute;
            top: 50%;
            opacity: 0;
            transition: all ease 0.95s;
        }

        .customDiv:hover .xem {
            top: 0px;
            opacity: 1;
        }

        .customDiv:hover img {
            transform: scale(1.1);
            transition: all 1.5s;
            background-color: rgb(255, 128, 151);
        }

        .customDiv:hover {
            border: 1px solid rgb(255, 128, 151);
            box-sizing: content-box !important;
        }

        .tieude {
            position: relative;
            margin-top: 20px;
        }

            .tieude img {
                text-align: center;
                padding: 10px;
                color: rgb(255, 128, 151);
                margin-bottom: 20px;
                height: 80px;
            }

        .name-title {
            position: absolute;
            text-align: center;
            width: 100%;
            top: 0px;
            line-height: 80px;
            height: 80px;
            color: white;
            font-size: 25px;
        }

        .xem .giohang {
            margin-left: 31%;
            color: white;
            text-decoration: none;
            position: absolute;
            top: 43%;
            background-color: #337ab7;
            border: 1px solid #2e6da4;
            padding: 6px 12px;
            border-radius: 30px;
            font-weight: bold;
        }

            .xem .giohang:hover {
                color: #337ab7;
                background-color: white;
                border: 1px solid #337ab7;
                font-weight: bold;
            }

        .clear {
            width: 100% !important;
            height: 10px !important;
        }

        .img-anh {
            width: 60%;
            margin: 0 auto;
            display: block;
        }
        .anhgiohang{
            background:url(Image/cart.png) no-repeat center center;
            background-size:50px 50px;
            width:55px;
            height:55px;
        }    
        span.new {
            position: absolute;
            z-index: 8;
            top: 0px;
            left: 0;
            display: inline-block;
            width: 55px;
            height: 25px;
            line-height: 25px;
            text-align: center;
            border-top-right-radius: 25px;
            border-bottom-right-radius: 25px;
            padding: 0px 0px;
            background: #9bd031;
            color: #fff;
            font-family: 'Gotham', sans-serif;
            font-size: 13px;
        }
        .kotimthay{
            font-size:25px;
            margin-left: 15px;
        }
    </style>
    <div class="tieude">
        <img class="img-anh" src="Image/title1.jpg" alt="Tiêu đề sản phẩm" />
        <div class="name-title">Tìm Kiếm</div>
    </div>
    <asp:Label ID="lblkhongtimthay" CssClass="kotimthay" runat="server" Text=""></asp:Label>
    <div class="container-fluid">   
        <div class="row">
            <asp:Repeater ID="RepeaterTK" runat="server">
                <ItemTemplate>
                    <div class="col-xs-12 col-md-4 col-sm-6 col-lg-3">
                        <div class="customDiv">
                            <span class="new">Mới</span>
                            <img src="<%#"Image/"+Eval("ANHHOA") %>" alt="" class="img-responsive img-thumbnail">
                            <div class="xem"><a class="giohang" href="ChiTietHoa.aspx?MAHOA=<%#Eval("MAHOA")%>">XEM HÀNG</a></div>
                            <div class="content text-center">
                                <h4 class="name"><%#Eval("TENHOA") %></h4>
                                <p class="price"><%#FormatNumber(Eval("DONGIA").ToString())+" VNĐ" %></p>                                     
                            </div>
                        </div>              
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>


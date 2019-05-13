<%@ Page Title="" Language="C#" MasterPageFile="~/HoaTuoi.master" AutoEventWireup="true" CodeFile="ChiTietHoa.aspx.cs" Inherits="ChiTietHoa" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
  <style type="text/css">
              .picture1{
            width: 400px;
            height: 400px;
        }
        .dungchung{
            margin-bottom: 10px;
            font-size: 25px;
        }
        .ten{
            margin-top:40px;
        }
        .chitietsanpham{
            padding-top:40px;
        }
        .trangthai{
            font-size: 20px;
        }
        .conhang{
            margin-left: 10px;
            padding: 8px;  
            background-color: rgb(255, 128, 151);
            color: white;
        }
        .soluong{
            font-size:20px;
        }
        .tien{
            font-size: 25px;
            color: red;
        }
        .ngang{
           border-bottom: 2px solid black;
        }
        .mota{
            height: 230px;
            font-size: 18px;
            font-style: oblique;
            text-align:justify;
        }
        .nhapsoluong{
            padding-left:9px;
            overflow:visible;
            width:70px;
        }
        .themvaogiohang{
            padding: 7px;
            text-decoration: none;
            color: white;
            background: rgb(255, 128, 151);
      }
      .themvaogiohang:hover{
         color: rgb(255, 128, 151);
         background-color: white;
         border:1px solid rgb(255, 128, 151);
         text-decoration: none;
      }
      .cot{
          width:100%;
          margin-top:10px;
          margin-bottom: 20px;
      }
      .hinh-ten {
          width: 60px;
          height: 100px;
          border-radius:17px;
          float: left;
      }
      .hinh{
          width: 60px;
          height: 100px;
      }
      .noidungbl {
          width: 88%;
          height: 100px;
          padding: 5px;
          display: inline-block;
      }
      .nhanxet-huy{
          width:97%;
          text-align:right;
      }
      .nhanxet{
          font-weight:bold; 
          font-size:17px;
          text-align:center;
          margin:20px 0px;
      }
      .customp.ten{
          margin:0px 3px 3px 3px;
          color:#128ee9;
         font-weight:bold;
      }
       .ngaygio{
           color:black;
           margin-left:10px;
       }
      .nhapnd{
         width: 99%;
         height: 71px;
         padding:5px;
      }
      .soluotxem{
          font-size:14px;
      }

        .Sao { 
            background-image: url(Image/trang.png);
            height:24px;
            width:24px;
        }
        .Vang {
            background-image: url(Image/vang.png);
            height:24px;
            width:24px;
        }
        .Trang {
            background-image: url(/Image/trang.png);
            height:24px;
            width:24px;
        }
        .Do {
            background-image: url(Image/do.png);
            height:24px;
            width:24px;
        }
      .tongsl {
          padding: 5px;
          line-height: 28px;
          margin-left: 6px;
          font-size: 15px;
      }
  </style>
    <div class="container">
        <div class="row">
            <asp:Repeater ID="RepeaterCTH" runat="server">
                <ItemTemplate>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="chitietsanpham">
                            <img src="<%#"Image/"+Eval("ANHHOA")%>" alt="Loi" class="img-responsive picture1" alt="Ảnh hoa" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="ten dungchung"><%#Eval("TENHOA")%></div>
                        <div class="soluotxem dungchung">Lượt xem: <%#Eval("SOLANXEM")%></div>
                        <div class="trangthai dungchung">Trạng thái:<span class="conhang"><%# ktconhang(int.Parse(Eval("TONGSOLUONG").ToString())) %></span></div>
                        <div class="tien dungchung"><%#FormatNumber(Eval("DONGIA").ToString())+" VNĐ" %></div>
                        <hr class="ngang dungchung">
                        <div class="mota dungchung">Mô tả: <%#Eval("MOTA")%></div>
                        <hr class="ngang dungchung">
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
                <asp:Rating ID="RatingStar" runat="server" StarCssClass="Sao" FilledStarCssClass="Vang" EmptyStarCssClass="Trang" WaitingStarCssClass="Do" CurrentRating="0" MaxRating="5" AutoPostBack="true" OnChanged="RatingStar_Changed">
                </asp:Rating>
                 <asp:Label ID="lblsao" CssClass="tongsl" runat="server" Text="">(0) </asp:Label>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
            <div class="soluong dungchung">Số lượng:</div>
            <div class="dungchung">
                <asp:TextBox ID="txtsl" class="nhapsoluong" Type="Number" value="1" min="1" max="50" runat="server"></asp:TextBox>
                <%--<a href="Giohang.aspx?MAHOA=<%#Eval("MAHOA") %>" class="themvaogiohang">Thêm vào giỏ hàng</a>--%>
                <asp:LinkButton ID="linkGioHang" class="themvaogiohang" runat="server" OnClick="linkGioHang_Click">Thêm vào giỏ hàng</asp:LinkButton>
            </div>
            </div>
        </div>
    </div>
                    
    <div class="container">
        <div class="row">
            <div class="col-xs-12 co-md-12 col-sm-6 col-lg-6">
                <div class="nhanxet">NHẬN XÉT</div>
                <div class="cot">
                    <div class="hinh-ten">
                        <img class="hinh" src="Image/boy.png" />
                    </div>
                    <div class="noidungbl">
                        <asp:TextBox ID="txtnoidung" PlaceHolder="Thêm nhận xét công khai..." CssClass="nhapnd" runat="server"></asp:TextBox>
                    </div>
                    <div class="nhanxet-huy">
                        <asp:Button ID="btnhuy" CssClass="btn btn-primary" runat="server" Text="Hủy" OnClick="btnhuy_Click" />
                        <asp:Button ID="btnnhanxet" CssClass="btn btn-primary" runat="server" Text="Nhận xét" OnClick="btnnhanxet_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <hr class="ngang">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 co-md-12 col-sm-6 col-lg-6">
                <%=loadbinhluan() %>
            </div>
        </div>
    </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/HoaTuoi.master" AutoEventWireup="true" CodeFile="YNghiaHoa.aspx.cs" Inherits="YNghiaHoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <style type="text/css">
    .customDivTinTuc {
        padding: 0px;
        margin: 50px;
        color: black;
    }

        .customDivTinTuc p a {
            color: black;
        }
    .small-img{ 
        width: 100%;
        height: 200px;
    }
    .content-tintuc{
        padding-left:5px;
        height:100px;
    }
    .ten-tintuc{
        padding:0px; 
        height:43px;
    }
    .ten-tintuc a{
        font-size:15px;
        font-weight:bold;
        text-align:justify;
        color:black;
    }
    .noidung-tintuc{
        padding:10px 0px 0px 0px;
        text-align:justify;
        height:100px;
    }
    .ngay-tintuc{
        margin-top:10px;
        font-size:13px;
    }
    .gachngang{
        border-top:2px solid black;
    }
</style>

    <div class="container-fluid color-hoa">
        <div class="row">
            <asp:Repeater ID="RepeaterYN" runat="server">
                <ItemTemplate>
                    <div class="col-xs-12 col-md-4 col-sm-6 col-lg-4">
                        <div class="customDivTinTuc">
                            <img src="<%#"Image/"+Eval("ANH")%>" class="img-responsive small-img img-thumbnail" alt="ảnh hoa" />
                            <div class="content-tintuc">
                                <div class="ten-tintuc"><a href="CTYNGHIAHOA.aspx?IDYN=<%#Eval("IDYN")%>"><%# Eval("TIEUDE")%></a></div>
                                <div class="ngay-tintuc"><span>Ngày: </span><b><%#Eval("NGAYDANG")%></b></div>
                                <div class="noidung-tintuc"><%#Eval("MOTA")%></div>
                            </div>                          
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>


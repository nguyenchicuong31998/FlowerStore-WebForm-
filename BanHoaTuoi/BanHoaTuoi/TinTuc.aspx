<%@ Page Title="" Language="C#" MasterPageFile="~/HoaTuoi.master" AutoEventWireup="true" CodeFile="TinTuc.aspx.cs" Inherits="TinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
<style type="text/css">
    .customDivTinTuc {
        padding: 0px;
        margin: 15px;
        color: black;
        
    }

        .customDivTinTuc p a {
            color: black;
        }

    .color-hoa {
        /*background: pink;*/
        /*rgb(255, 128, 151)*/
    }
    .content-tintuc{
        width:60%;
        display: inline-block;
        padding-left:5px;
    }
    .title-tintuc {
            padding: 27px;
        color: aqua;
        font-size: 16px;
        margin-left: 6px;
        font-weight: bold;
    }
    .ten-tintuc{
        padding:0px;        
        font-size:15px;
        text-transform:uppercase;
        font-weight:bold;
        color:#29d427;
    }
    .noidung-tintuc{
        text-align:justify;
        padding-bottom:10px;
    }
    .ngay-tintuc{
        font-size:13px;
    }
    .gachngang{
        border-top:2px solid #f98204;
        margin-top:3px;
    }   
</style>

    <div class="container-fluid color-hoa">
        <div class="row">
             <div class="title-tintuc">TIN TỨC</div>
            <asp:Repeater ID="RepeaterTT" runat="server">
                <ItemTemplate>
                    <div class="col-xs-12 col-md-12 col-sm-12 col-lg-8">                     
                        <div class="customDivTinTuc">
                            <div class="content-tintuc">
                                <div class="ten-tintuc"><%# Eval("TIEUDE")%></div>
                                <hr class="gachngang" />
                                <div class="noidung-tintuc"><%# Eval("NOIDUNG") %></div>
                                <div class="ngay-tintuc"><span>Ngày: </span><b><%# Eval("NGAYDANG") %></b></div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>


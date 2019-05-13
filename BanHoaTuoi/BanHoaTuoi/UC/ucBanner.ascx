<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucBanner.ascx.cs" Inherits="UC_ucBanner" %>
<style type>
    .picture{
        height:300px;
        width:100%;
        border:1px solid rgb(255, 128, 151);
    }
    .logo{
        position:absolute;
        top:10px;
        left:30px;
    }
    .kichthuoc{
        width:70px;
        height:70px;
    }
    .logo-giohang {
        position: absolute;
        bottom: 20px;
        right: 70px;
    }

        .logo-giohang a {
            font-weight: bold;
            color: black;
            font-size: 20px;
            font-weight:bold;
            text-decoration: none;
        }

    .img-giohang {
        width: 35px;
        height: 35px;
    }
</style>
<img class="picture thumbnail" src="<%= LoadBanner()%>" alt="Banner bán hoa"/>
<div class="logo">
    <img class="kichthuoc" src="<%= LoadLogo()%>" alt="Logo bán hoa" />
</div>
<div class="logo-giohang">
    <a href="Giohang.aspx">
        <img src="Image/cart.png" data-toggle="tooltip" class="img-giohang" title="Giỏ Hàng" alt="giỏ hàng">
        <asp:Label ID="lblslgiohang" runat="server" Text="(0)"></asp:Label>
    </a>
</div>

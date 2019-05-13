<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucAdminLeft.ascx.cs" Inherits="Admin_ucAdminLeft" %>
<style type="text/css">
    .khung{
        width:100%;
        border:1px solid black;
         border-radius:5px;
    }
    .title{
        line-height:10px;
         border-radius:5px;
         padding:10px;
         border:1px solid black;
         background-color:aqua;
         text-align:center;
         color:black;
         font-weight:bold;
    }
    .cot{
       padding:10px 10px 10px 40px;
    }
    .cot a{
        color:black;
        font-size:18px;
        text-decoration:none;
    }
        .cot a:hover {
            color: red;
            font-size: 18px;
            text-decoration: none;
        }
    .danhmuc{
        height:350px;
    }

</style>
<div class="khung">
    <div class="title">QUẢN LÝ</div>
    <div class="muc">
        <div class="cot">
            <a href="Menu.aspx">Menu</a>
        </div>
        <div class="cot">
            <a href="Danhmuc.aspx">Danh mục sản phẩm</a>
        </div>
        <div class="cot">
            <a href="LogoBanner.aspx">Logo, Banner</a>
        </div>
        <div class="cot">
            <a href="Hoa.aspx">Hoa</a>
        </div>
        <div class="cot">
            <a href="KhachHang.aspx">Khách hàng</a>
        </div>
        <div class="cot">
            <a href="HoaDon.aspx">Đơn hàng</a>
        </div>
        <div class="cot">
            <a href="ChiTietHoaDon.aspx">Chi tiết đơn đặt hàng</a>
        </div>
        <div class="cot">
            <a href="BinhLuan.aspx">Bình luận</a>
        </div>
        <div class="cot">
            <a href="Admin.aspx">Admin</a>
        </div>
        <div class="cot">
            <a href="DanhGia.aspx">Đánh giá</a>
        </div>
        <div class="cot">
            <a href="TinTuc.aspx">Tin tức</a>
        </div>
    </div>
</div>
<div class="khung danhmuc">
    <div class="title">THÊM MỚI</div>
    <div class="muc">
        <div class="cot">
            <a href="ThemMenu.aspx">Menu</a>
        </div>
        <div class="cot">
            <a href="ThemDanhMuc.aspx">Danh mục sản phẩm</a>
        </div>
        <div class="cot">
            <a href="ThemLogoBanner.aspx">Logo Banner</a>
        </div>
        <div class="cot">
            <a href="ThemHoa.aspx">Hoa</a>
        </div>
        <div class="cot">
            <a href="ThemKhachHang.aspx">Khách hàng</a>
        </div>
        <div class="cot">
            <a href="ThemAdmin.aspx">Admin</a>
        </div>
        <div class="cot">
            <a href="ThemTinTuc.aspx">Tin tức</a>
        </div>
    </div>
</div>

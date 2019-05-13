<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucnavbar.ascx.cs" Inherits="UC_ucnavbar" %>
<style type="text/css">
    .color-submenu{
        background-color:rgb(255, 128, 151) !important;
    }
    .color-menu{
	    background-color:  rgb(255, 128, 151);
	    border: none;
    }
    .navbar-default .navbar-nav>li>a{
        color:white!important;
        font-family:'Adobe Ming Std';
    }
     .navbar-default .navbar-nav>li>a:hover{
        color:#8f1196 !important;
    }
    .dropdown-menu>li>a{
         color:white!important;
         font-family:'Adobe Ming Std';
    }
    .dropdown-menu>li>a:hover{
         color:#8f1196 !important;
         background-color:rgb(255, 128, 151);
    }
    .navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:focus, .navbar-default .navbar-nav>.open>a:hover{
        color: #8f1196 !important;
	    background-color: rgb(255, 128, 151) !important;
    }
    .navbar{
        z-index:99;
    }
    .nho {
        display: inline-block;
        width: 80% !important;
        margin-top: 8px;
    }

    .nav {
        margin-right: 0px;
    }
    .btn-image{
         background:url(Image/Search.png) no-repeat center;
        background-color:white;
    }
    .btn-default {
        margin-top: -3px;
        margin-left: -3px;
        border-radius: initial;
        
    }
</style>
<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid color-menu">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
              <%= Menu()%>
            <ul class="nav navbar-right">
                <li> 
                    <asp:TextBox ID="txttimkiem" CssClass="form-control nho" placeholder="Tìm kiếm" runat="server"></asp:TextBox>
                    <asp:Button ID="btntimkiem" CssClass="btn btn-default btn-image" runat="server" Text="" OnClick="btntimkiem_Click" />
                </li>
            </ul>
		</div><!-- /.navbar-collapse -->
	</div>
</nav>

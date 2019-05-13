    <%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ADMIN.master" AutoEventWireup="true" CodeFile="ThemHoa.aspx.cs" Inherits="Admin_ThemHoa" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

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

        .dungchung {
            padding: 10px 15px 5px 15px;
            margin-left: 40px;
        }

        .khoangcach {
            width: 170px;
            float: left;
        }
        .danhmuc-padding{
            padding:5px;
        }
        #cke_ContentPlaceHolder1_CKEditor {
            display: inline-block;
            width: 81%;
        }
                    .error {
                margin-left: 163px;
                padding: 5px;
            }
    </style>
    <div class="title-chung">Thêm Hoa</div>
    <div class="dungchung">
        <div class="khoangcach">Tên hoa:</div><asp:TextBox ID="txttenhoa" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bạn vui lòng nhập tên hoa !" ControlToValidate="txttenhoa" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
        <div class="khoangcach">Xuất sứ:</div><asp:TextBox ID="txtxuatsu" runat="server"></asp:TextBox>
    </div>
    <div class="dungchung">
        <div class="khoangcach">Giá tiền:</div><asp:TextBox ID="txtgia" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn vui lòng nhập giá tiền !" ControlToValidate="txtgia" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
       <div class="khoangcach">Mô tả:</div>
        <CKEditor:CKEditorControl ID="CKEditor" runat="server" BasePath="~/CK/ckeditor"></CKEditor:CKEditorControl>
    </div>
    <div class="dungchung">
       <div class="khoangcach">Ảnh:</div><asp:FileUpload ID="FileAnh" runat="server" />
    </div>
    <div class="dungchung">
       <div class="khoangcach">Mã danh mục hoa:</div><asp:DropDownList ID="drdanhmuc" CssClass="danhmuc-padding" runat="server"></asp:DropDownList>
    </div>
    <div class="dungchung">
       <div class="khoangcach">Tổng số lượng:</div><asp:TextBox ID="txttsluong" runat="server"></asp:TextBox>
       <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn vui lòng nhập tổng số lượng !" ControlToValidate="txttsluong" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung">
       <span class="khoangcach">Tổng số lượt xem:</span><asp:TextBox ID="txtsoluotxem" runat="server"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Bạn vui lòng nhập số lượt xem !" ControlToValidate="txtsoluotxem" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="dungchung text-center">
        <asp:Button ID="btnThem" CssClass="btn-primary btn" runat="server" Text="Thêm" OnClick="btnThem_Click" />
    </div>
    <div class="dungchung">
        <asp:Label ID="lblthem" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>


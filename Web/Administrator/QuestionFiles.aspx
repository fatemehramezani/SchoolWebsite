<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/PanelMasterPage.master" AutoEventWireup="true" CodeFile="QuestionFiles.aspx.cs" Inherits="Administrator_QuestionFiles" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="~/Guest/Question/css/visuallightbox.css" rel="stylesheet" type="text/css" />
    <link href="~/Guest/Question/css/vlightbox6.css" rel="stylesheet" type="text/css" />
    <script src="~/Guest/Question/js/visuallightbox.js" type="text/javascript"></script>
    <script src="~/Guest/Question/js/vlbdata6.js" type="text/javascript"></script>
    <script src="~/Guest/Question/js/jquery.min.js" type="text/javascript"></script>
    <link href="../App_Themes/Default/css/TableStyles.css" rel="stylesheet" type="text/css" />
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="Server">
    فایل سوالات 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="DescriptionContent" runat="Server">
    از طریق این صفحه می توانید تصاویر به نمایش در آمده در فایل سوالات تصاویر را مدیریت نمایید. 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="padding: 20px;"> 
        <h3>ایجاد فایل جدید</h3>
     
         <asp:Label ID="FileLabel" runat="server" Text="فایل:" SkinID="Caption" CssClass="lable"></asp:Label>
                    <%--<asp:FileUpload ID="FileFileUpload" runat="server" />--%>
                    <asp:FileUpload ID="MaxPicFileUpload" runat="server" />
                    <asp:CheckBox ID="FileCheckBox" runat="server" Text="تغییر فایل" />

        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="ایجاد" OnClick="InsertButton_Click" />
        <asp:Button ID="CancelButton" runat="server"  Text="بازگشت" OnClick="CancelButton_Click" />
    </div>
    <div>
        <h3>مدیریت فایل سوالات تصاویر</h3>
        <asp:MultiView ID="ImageMultiView" runat="server">
            <asp:View ID="NoFileView" runat="server">
                <p>
                    تصویری در مسیر فایل های فایل سوالات وجود ندارد
                </p>
            </asp:View>
            <asp:View ID="FileView" runat="server">
                <div style="overflow: auto; width: 400px; border: 1px gray solid; padding: 10px; margin: 0px auto;">
                    
                     <asp:Table ID="ImageTable" runat="server">
                    </asp:Table>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>

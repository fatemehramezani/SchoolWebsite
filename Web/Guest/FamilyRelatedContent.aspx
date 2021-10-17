<%@ Page  Language="C#" MasterPageFile="~/App_MasterPage/RightPageMasterPage.master" AutoEventWireup="true" CodeFile="FamilyRelatedContent.aspx.cs" Inherits="Guest_FamilyRelatedContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LinkContent" runat="Server">
    <a href="RelatedContent.aspx">مطالب مرتبط با اولیا</a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    مطالب مرتبط با اولیا
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div runat="server" id="relatedContentContent">
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <div class="box">
        <div class="box-heading"> مطالب اولیا</div>
        <div class="box-content">
            <ul class="box-category" id="relatedContentContainer" runat="server">
            </ul>
        </div>
    </div>
    <div class="clear"></div>
</asp:Content>


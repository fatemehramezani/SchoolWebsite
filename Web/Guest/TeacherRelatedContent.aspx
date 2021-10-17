<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/RightPageMasterPage.master" AutoEventWireup="true" CodeFile="TeacherRelatedContent.aspx.cs" Inherits="Guest_TeacherRelatedContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LinkContent" runat="Server">
    <a href="RelatedContent.aspx">مطالب مرتبط با مربیان</a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    مطالب مرتبط با مربیان
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div runat="server" id="relatedContentContent">
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <div class="box">
        <div class="box-heading">مطالب مربیان</div>
        <div class="box-content">
            <ul class="box-category" id="relatedContentContainer" runat="server">
            </ul>
        </div>
    </div>
    <div class="clear"></div>
</asp:Content>


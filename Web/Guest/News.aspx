<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/RightPageMasterPage.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="Guest_News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LinkContent" runat="Server">
    <a href="News.aspx">اخبار</a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    اخبار
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div runat="server" id="newsContent">
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <div class="box">
        <div class="box-heading">آخرین اخبار</div>
        <div class="box-content">
            <ul class="box-category" id="newsContainer" runat="server">
                <li></li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
</asp:Content>


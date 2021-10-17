<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/RightPageMasterPage.master" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="Guest_Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <div class="box">
        <div class="box-heading">سوالات امتحانی</div>
        <div class="box-content">
            <ul class="box-category" id="questionContainer" runat="server">
            </ul>
        </div>
    </div>
    <div class="clear"></div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="Server">
    <a href="Question.aspx">سوالات امتحانی</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="Server">
    سوالات امتحانی
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div class="information_content">
        <div runat="server" id="questionContent">            
        </div>
    </div>
</asp:Content>


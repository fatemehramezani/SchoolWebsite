<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/PanelMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Administrator_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" Runat="Server">
    <%= Profile.FullName %>!
             به سامانه مدیریت پرتال مدرسه مهرآیین خوش آمدید
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="DescriptionContent" Runat="Server">      
    این پنل مخصوص مدیران پرتال می باشد که می توانند از طریق آن به مدیریت پرتال بپردازند
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">      
</asp:Content>


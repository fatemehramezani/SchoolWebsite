<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/PanelMasterPage.master" AutoEventWireup="true" CodeFile="LastRequest.aspx.cs" Inherits="Applicant_LastRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DescriptionContent" runat="Server">
    از طریق این صفحه می توانید سفارش های ناتمام قبلی را پرداخت نمایید
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" Runat="Server">
    پرداخت اینترنتی
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="PaymentLabel" runat="server" Text=""></asp:Label>
    <%--<asp:Button ID="UpdateImageButton" runat="server"  Text="خرید بلیت" OnClientClick="if (!confirm('آيا از انتخاب صندلی های خود مطمئن هستيد؟')) return false;" OnClick="UpdateImageButton_Click" />--%>
    <asp:GridView ID="BuyTicketGridView" runat="server" DataSourceID="BuyTicketEntityDataSource" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" HorizontalAlign="Right">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False"></asp:BoundField>
            <asp:BoundField DataField="ConcertTitle" HeaderText="کنسرت" SortExpression="ConcertTitle"></asp:BoundField>
            <asp:BoundField DataField="HallName" HeaderText="سالن" SortExpression="ConcertTitle"></asp:BoundField>
            <asp:BoundField DataField="Row" HeaderText="ردیف صندلی" SortExpression="Row"></asp:BoundField>
            <asp:BoundField DataField="Number" HeaderText="شماره صندلی" SortExpression="Number"></asp:BoundField>
            <asp:BoundField DataField="TrackingCode" HeaderText="بارکد" SortExpression="TrackingCode"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <br/>
    <asp:Button ID="BuyTicketImageButton" runat="server" Text="چاپ بلیط" OnClick="BuyTicketButton_Click"/>
    <asp:EntityDataSource ID="BuyTicketEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities" DefaultContainerName="DatabaseEntities" EnableFlattening="False" EntitySetName="BuyTickets" 
        Where="it.ApplicantId = @ApplicantId and it.TicketStatusId = 2 and TimeShopping <= 10">
        <WhereParameters>
            <asp:ProfileParameter Name="ApplicantId" PropertyName="ApplicantId" DbType="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/PanelMasterPage.master" AutoEventWireup="true" CodeFile="Ticket.aspx.cs" Inherits="Panel_Ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" Runat="Server">
    بلیت خریداری شده
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--<asp:Button ID="UpdateImageButton" runat="server"  Text="خرید بلیت" OnClientClick="if (!confirm('آيا از انتخاب صندلی های خود مطمئن هستيد؟')) return false;" OnClick="UpdateImageButton_Click" />--%>
    <asp:GridView ID="TicketGridView" runat="server" DataSourceID="TicketEntityDataSource" AutoGenerateColumns="False" DataKeyNames="Id,DateShopping,TrackingCode"
        HorizontalAlign="Right">
        <Columns>
            <asp:BoundField DataField="TicketStatusTitle" HeaderText="وضعیت بلیط" SortExpression="TicketStatusTitle"/>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True" Visible="False"/>
            <asp:BoundField DataField="PersianDateShopping" HeaderText="تاریخ خرید" SortExpression="PersianDateShopping" ReadOnly="True" />
            <asp:BoundField DataField="TrackingCode" HeaderText="بارکد" SortExpression="TrackingCode" ReadOnly="True" />
            <asp:BoundField DataField="Subject" HeaderText="عنوان" SortExpression="Subject" />
            <asp:BoundField DataField="ConcertTitle" HeaderText="کنسرت" SortExpression="ConcertTitle" />
            <asp:BoundField DataField="Row" HeaderText="ردیف" SortExpression="Row" />
            <asp:BoundField DataField="Number" HeaderText="شماره صندلی" SortExpression="Number" />
        </Columns>
    </asp:GridView>
    <br/>
        <asp:Button ID="PrintImageButton" runat="server" Text="چاپ بلیط" OnClick="PrintImageButton_Click"/>
    <br/>
    <asp:EntityDataSource ID="TicketEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities" DefaultContainerName="DatabaseEntities"
        EnableFlattening="False" EntitySetName="Tickets"
        Where="it.ApplicantId = @ApplicantId and it.TicketStatusId = 3" EntityTypeFilter="" Select="">
        <WhereParameters>
            <asp:ProfileParameter Name="ApplicantId" PropertyName="ApplicantId" DbType="Int32"/>
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>


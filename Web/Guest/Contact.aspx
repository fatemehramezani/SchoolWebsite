<%@ Page Title="تماس با ما" Language="C#" MasterPageFile="~/App_MasterPage/LeftPageMasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Guest_Contact" %>

<%@ OutputCache Duration="10" VaryByParam="None" %>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    <div class="row">
        <h2 id='target' class="page-heading heading--outcontainer" style="margin-right: 20px;">راه های تماس با ما</h2>
        <div class="row">
            <div class="text-justify text--coloum text-helper">
                <%--<p>
                    <b class="address">آدرس پستی:</b>
                    تهران-میدان ونک-سه راه اول- کوچه سوم
                    -پلاک 999912
                </p>--%>
                <%-- <p><b class="zipcode">کد پستی:</b> 3668899000</p>--%>
                <p><b class="phone">تلفن(خط ویژه): </b>34223040 - 086 </p>
                <p><b class="phone">تلفن و فکس: </b>32211819 - 086 </p>
                <p><b class="phone">سامانه پیامک مدرسه مهرآیین: </b>30006834223040 </p>
                <p><b class="email">آدرس الکترونیکی:</b>info@mehrayin.ir</p>

               <%-- <div style="border-top: 1px dashed #696969; margin-top: 50px; text-align: center">
                    لطفا در صورت بروز مشکل در سایت با  <a href="email:support@concerteater.com">پشتیبانی</a> تماس بگیرید
                </div>
                <br />
                <asp:Label runat="server" ID="FullNameLabel">نام و نام خانوادگی</asp:Label>
                <asp:TextBox runat="server" ID="FullName"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ValidationGroup="Send" ControlToValidate="FullName" ErrorMessage="نام و نام خانوادگی اجباری است" ToolTip="نام و نام خانوادگی اجباری است" Display="Static" ID="FullNameRequired">*</asp:RequiredFieldValidator>
                <br />
                <asp:Label runat="server" ID="SubjectLabel">موضوع</asp:Label>
                <asp:TextBox runat="server" ID="Subject"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ValidationGroup="Send" ControlToValidate="Subject" ErrorMessage="موضوع اجباری است" ToolTip="موضوع اجباری است" Display="Static" ID="SubjectValidator">*</asp:RequiredFieldValidator>
                <br />
                <asp:Label runat="server" ID="EmailLabel">ایمیل</asp:Label>
                <asp:TextBox runat="server" ID="Email"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ErrorMessage="آدرس الکترونیکی اجباری است" ToolTip="آدرس الکترونیکی اجباری است" Display="Static" ID="RequiredFieldValidator1">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display="Static" ValidationGroup="Send" ID="EmailRegularExpressionValidator" runat="server" ErrorMessage="آدرس الکترونیکی معتبر وارد نمایید" ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                <br />
                <asp:Label runat="server" ID="DescriptionLabel">متن</asp:Label>
                <asp:TextBox runat="server" ID="Description" TextMode="MultiLine" Rows="5"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ValidationGroup="Send" ControlToValidate="Description" ErrorMessage="متن اجباری است" ToolTip="متن اجباری است" Display="Static" ID="DescriptionValidator">*</asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="SendButton" runat="server" Text="ارسال پیام" OnClick="SendButton_OnClickImageButton_Click" />
           --%></div>
        </div>

        <%--<div style="float: left">
                <div style="left: 10px; top: 10px; width: 100%; height: 100%;">
                    <iframe width="400px" height="300px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=WA,+United+States&amp;aq=0&amp;oq=WA&amp;sll=47.605288,-122.329296&amp;sspn=0.008999,0.016544&amp;ie=UTF8&amp;hq=&amp;hnear=Washington,+District+of+Columbia&amp;t=m&amp;z=7&amp;iwloc=A&amp;output=embed"></iframe>
                </div>
            </div>--%>
    </div>
   
</asp:Content>


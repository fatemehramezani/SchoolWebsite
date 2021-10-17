<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/RightPageMasterPage.master" AutoEventWireup="true" CodeFile="Photo.aspx.cs" Inherits="Guest_Photo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <link href="../App_Themes/Default/css/Slider/generic.css" rel="stylesheet" />
    <link href="../App_Themes/Default/css/Slider/js-image-slider.css" rel="stylesheet" />
    <script src="../App_Themes/Default/css/Slider/js-image-slider.js"></script>
    <script language="javascript" type="text/javascript">
        function OpenPhoto(id, title) {
            window.location.href = "Photo.aspx?Id=" + id + "&Title=" + title;
        }
    </script>
    <div class="box">
        <div class="box-heading">
            <asp:EntityDataSource ID="PhotoEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities" DefaultContainerName="DatabaseEntities" EnableFlattening="False" EntitySetName="Photos" OrderBy=" it.Id desc">
            </asp:EntityDataSource>
            دسته بندی تصاویر
        </div>
        <div class="box-content">
            <ul>
                <asp:ListView ID="PhotoListView" runat="server" DataSourceID="PhotoEntityDataSource" DataKeyNames="Id">
                    <EmptyDataTemplate>
                        تصاویر وجود ندارد
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink ID="PhotoHyperLink" NavigateUrl=<%# String.Format("javascript:OpenPhoto( '{0}','{1}')", Eval("Id"),Eval("Title")) %> runat="server">
                                   <%# Eval("Title") %>
                            </asp:HyperLink>
                        </li>
                    </ItemTemplate>
                </asp:ListView>
            </ul>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="Server">
    <a href="Photo.aspx">تصاویر</a>
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="Server">
    تصاویر
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div id="imagecontainer" runat="server" >
    </div>
</asp:Content>


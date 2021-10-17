<%@ Page Title="مدیریت اخبار" Language="C#" MasterPageFile="~/App_MasterPage/PanelMasterPage.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="Admin_News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
     اخبار
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="DescriptionContent" runat="Server">
    از طریق این صفحه می توانید اخبار به نمایش در آمده در صفحه اصلی را مدیریت نمایید. 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <telerik:RadScriptManager ID="RadScriptManager2" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
            </asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
            </asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
            </asp:ScriptReference>
        </Scripts>
    </telerik:RadScriptManager>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
</telerik:RadStyleSheetManager>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
</telerik:RadAjaxManager>
  
    <script lang="jv" type="text/javascript">
        function SelectItem(sender, e) {
            e.IsValid = (e.Value != '0'); 7
        }
    </script>
    <asp:MultiView runat="server" ID="NewsMultiView" ActiveViewIndex="0">

        <asp:View runat="server" ID="ShowView">
            <asp:ImageButton ID="NewImageButton" runat="server" OnClick="NewImageButton_Click" SkinID="PanelAddImageButton" />
            <asp:ImageButton ID="SearchImageButton" runat="server" OnClick="SearchImageButton_Click"
                SkinID="PanelSearchImageButton" />
              <asp:ImageButton ID="ClearImageButton" runat="server" OnClick="ClearImageButton_Click" SkinID="PanelClearImageButton" />
            <br />
            <asp:Label ID="NameLabel" runat="server" Text="عنوان خبر:" SkinID="Caption" CssClass="lable"></asp:Label>
            <asp:TextBox ID="TitleTextBox" runat="server" SkinID="TextBox"></asp:TextBox>
             <br />
            <asp:Label ID="SizePageLabel" runat="server" Text="سایز صفحه:" SkinID="Caption" CssClass="lable"></asp:Label>
            <asp:DropDownList ID="PageSizeDropDownList" SkinID="SearchDropDownList" runat="server">
                <asp:ListItem Selected="True" Value="5">[پیش فرض]</asp:ListItem>
                <asp:ListItem Value="5">5 رکورد</asp:ListItem>
                <asp:ListItem Value="10">10 رکورد</asp:ListItem>
                <asp:ListItem Value="15">15 رکورد</asp:ListItem>
                <asp:ListItem Value="20">20 رکورد</asp:ListItem>
                <asp:ListItem Value="25">25 رکورد</asp:ListItem>
                <asp:ListItem Value="1000000">تمام رکورد ها</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:GridView ID="NewsGridView" runat="server" AutoGenerateColumns="False"
                DataKeyNames="ID" DataSourceID="NewsEntityDataSource" HorizontalAlign="Center"
                OnSelectedIndexChanged="NewsGridView_SelectedIndexChanged" PageSize="5" Width="90%" AllowSorting="True" AllowPaging="True">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                                   <asp:ImageButton ID="SelectImageButton" runat="server" CommandName="Select" SkinID="PanelSelectImageButton" />
                        </ItemTemplate>
                        <ItemStyle Width="25px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" Visible="False" SortExpression="ID"/>
                    <asp:BoundField DataField="Title" HeaderText="عنوان خبر" >
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View ID="EditView" runat="server">
            <asp:FormView ID="NewsFormView" runat="server"  Width="90%" DataSourceID="NewsEntityDataSource"
                DataKeyNames="ID" DefaultMode="Insert" OnItemDeleted="NewsFormView_ItemDeleted"
                OnItemCommand="NewsFormView_ItemCommand">
                <EditItemTemplate>
                    <asp:Label ID="TitleLabel" runat="server" Text="عنوان:" SkinID="Caption" CssClass="lable"></asp:Label>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' MaxLength="500" />
                    <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" runat="server" ControlToValidate="TitleTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                    <br></br>
                    <asp:Label ID="PictureLabel" runat="server" Text="تصویر:" SkinID="Caption" CssClass="lable"></asp:Label>
                    <asp:FileUpload ID="PictureFileUpload" runat="server" />
                    <asp:CheckBox ID="PictureCheckBox" runat="server" Text="تغییر تصویر" />
                    <br />

                    <asp:Label ID="FileLabel" runat="server" Text="فایل:" SkinID="Caption" CssClass="lable"></asp:Label>
                    <asp:FileUpload ID="FileFileUpload" runat="server" />
                    <asp:CheckBox ID="FileCheckBox" runat="server" Text="تغییر فایل" />
                    <br />

                    <asp:Label ID="DescriptionLabel" runat="server" Text="متن:" SkinID="Caption" CssClass="lable"></asp:Label>
                   <%-- <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' Width="100%" TextMode="MultiLine" Rows="3" />--%>
                     <telerik:RadEditor ID="DescriptionTextBox" runat="server"  content='<%# Bind("Description") %>' Width="90%" >
                         <ImageManager ViewPaths="../Files/News/Images" UploadPaths="../Files/News/Images" DeletePaths="../Files/News/Images"></ImageManager>
                     </telerik:RadEditor>
                    <asp:RequiredFieldValidator ID="NewsRequiredFieldValidator" runat="server" ControlToValidate="DescriptionTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                    <br />

                    <div style="float: left; padding: 10px;">
                        <asp:Button ID="DeleteImageButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="حذف" OnClientClick="if (!confirm('آيا از حذف مطمئن هستيد؟')) return false;" />
                        <asp:Button ID="UpdateImageButton" runat="server" CommandName="Update" Text="ویرایش"
                            ValidationGroup="Update" OnClientClick="if (!confirm('آيا از اعمال تغییرات مطمئن هستيد؟')) return false;" />
                        <asp:Button ID="CancelImageButton" runat="server" CommandName="Cancel" Text="انصراف" />
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="TitleLabel" runat="server" Text="عنوان:" SkinID="Caption" CssClass="lable"></asp:Label>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' MaxLength="500" />
                    <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" runat="server" ControlToValidate="TitleTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                    <br></br>
                    <br></br>
                    <asp:Label ID="PictureLabel" runat="server" CssClass="lable" SkinID="Caption" Text="تصویر:"></asp:Label>
                    <asp:FileUpload ID="PictureFileUpload" runat="server" />
                    <asp:CheckBox ID="PictureCheckBox" runat="server" Text="تغییر تصویر" />
                    <br />
                    <asp:Label ID="FileLabel" runat="server" CssClass="lable" SkinID="Caption" Text="فایل:"></asp:Label>
                    <asp:FileUpload ID="FileFileUpload" runat="server" />
                    <asp:CheckBox ID="FileCheckBox" runat="server" Text="تغییر فایل" />
                    <br />
                    <asp:Label ID="DescriptionLabel" runat="server" CssClass="lable" SkinID="Caption" Text="متن:"></asp:Label>
                    <%-- <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' Width="100%" TextMode="MultiLine" Rows="3" />--%>
                    <telerik:RadEditor ID="DescriptionTextBox" runat="server" content='<%# Bind("Description") %>' Width="90%">
                        <ImageManager ViewPaths="../Files/News/Images" UploadPaths="../Files/News/Images" DeletePaths="../Files/News/Images"></ImageManager>
                    </telerik:RadEditor>
                    <asp:RequiredFieldValidator ID="NewsRequiredFieldValidator" runat="server" ControlToValidate="DescriptionTextBox" Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                    <br />
                    <div style="float: left; padding: 10px;">
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="ایجاد" ValidationGroup="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="انصراف" />
                    </div>
                    <br>
                    </br>
                </InsertItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:EntityDataSource ID="NewsEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities" EntitySetName="News"
        EnableUpdate="True"
        EnableDelete="True"
        EnableInsert="True"
        OnDeleted="NewsEntityDataSource_Command"
        OnInserted="NewsEntityDataSource_Command"
        OnUpdated="NewsEntityDataSource_Command"
        OnInserting="NewsEntityDataSource_InsertingFiles"
        OnUpdating="NewsEntityDataSource_InsertingFiles"
         OrderBy=" it.[ID] desc"  EnableFlattening="False"   
        Where="(@Title is null || it.Title LIKE '%' + @Title + '%')" >
        <WhereParameters>
            <asp:ControlParameter ControlID="TitleTextBox" Name="Title" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource> 

</asp:Content>



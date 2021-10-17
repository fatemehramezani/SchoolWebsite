<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/PanelMasterPage.master" AutoEventWireup="true" CodeFile="Photo.aspx.cs" Inherits="Admin_Photo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="Server">
    دسته بندی تصاویر
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="DescriptionContent" runat="Server">
    کاربر گرامی، در این قسمت می توانید دسته بندی های مختلف را اضافه یا ویرایش کنید.
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div id="vars_toolbox">
          <asp:ImageButton ID="SearchImageButton" runat="server" OnClick="SearchButton_Click"
                SkinID="PanelSearchImageButton" />
            <asp:ImageButton ID="ClearImageButton" runat="server" OnClick="ClearButton_Click"
                OnClientClick="return false;" SkinID="PanelClearImageButton" />
    </div>

    <div class="vars_fields_section">
        <div class="rows">
            <div class="input_section">
                <label>عنوان گروه</label>
                <asp:TextBox ID="TitleTextBox" runat="server"></asp:TextBox>
            </div>
            <div class="input_section" style="margin-left: 0px;">
                <h5>اندازه صفحه</h5>
                <telerik:RadDropDownList ID="PageSizeDropDownList" runat="server" OnSelectedIndexChanged="PageSizeDropDownList_SelectedIndexChanged">
                    <Items>
                        <telerik:DropDownListItem Selected="true" Value="5" Text="[پیش فرض]" />
                        <telerik:DropDownListItem Value="5" Text="5 رکورد" />
                        <telerik:DropDownListItem Value="10" Text="10 رکورد" />
                        <telerik:DropDownListItem Value="15" Text="15 رکورد" />
                        <telerik:DropDownListItem Value="20" Text="20 رکورد" />
                    </Items>
                </telerik:RadDropDownList>
            </div>
        </div>
    </div>

    <div dir="rtl" class="gvclass jadval_specialty_container">
        <asp:GridView ID="PhotoGridView" runat="server" AllowPaging="True" AllowSorting="True"
            DataKeyNames="Id" DataSourceID="PhotoEntityDataSource"
            Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="PhotoGridView_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="SelectButton" runat="server" CommandName="Select" SkinID="PanelSelectImageButton" />
                    </ItemTemplate>
                    <ItemStyle Width="25px" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink runat="server" ID="FilesLink" SkinID="PanelFilesHyperLink"  NavigateUrl='<%# "PhotoFiles.aspx?Id=" + Eval("Id")  %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="25px" />
                </asp:TemplateField>
                <asp:BoundField DataField="Title" HeaderText="عنوان آلبوم" SortExpression="Title">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>
    <div dir="rtl" style="width: 197px;" class="form_pezeshkan_container">
        <asp:FormView ID="PhotoFormView" runat="server" DataSourceID="PhotoEntityDataSource" DataKeyNames="Id" DefaultMode="Insert" OnItemDeleted="PhotoFormView_ItemDeleted" Width="100%">
            <EditItemTemplate>
                <div class="form_input_section">
                    <label>عنوان آلبوم</label>
                    <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" runat="server" ControlToValidate="TitleTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                </div>
                <div class="form_input_section" style="width: 205px;">
                    <asp:Button ID="DeleteImageButton" runat="server" CausesValidation="False" CommandName="Delete"
                        Text="حذف" OnClientClick="if (!confirm('آيا از حذف مطمئن هستيد؟')) return false;" />
                    <asp:Button ID="UpdateImageButton" runat="server" CommandName="Update" Text="ویرایش"
                        ValidationGroup="Update" OnClientClick="if (!confirm('آيا از اعمال تغییرات مطمئن هستيد؟')) return false;" />
                    <asp:Button ID="CancelImageButton" runat="server" CommandName="Cancel" Text="انصراف" />
                </div>
            </EditItemTemplate>
            <InsertItemTemplate>
                <div class="form_input_section">
                    <label>عنوان آلبوم</label>
                    <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" runat="server" ControlToValidate="TitleTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                </div>
                <div style="float: left;">
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="ایجاد"
                        ValidationGroup="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="انصراف" />
                </div>
                </div>
            </InsertItemTemplate>
        </asp:FormView>
    </div>
    <asp:EntityDataSource ID="PhotoEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities" DefaultContainerName="DatabaseEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Photos"
        OnDeleted="PhotoEntityDataSource_Command"
        OnInserted="PhotoEntityDataSource_Command"
        OnUpdated="PhotoEntityDataSource_Command"
        Where="(@Title is null || it.Title LIKE '%' + @Title + '%')" AutoGenerateOrderByClause="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="TitleTextBox" Name="Name" Type="String" />
        </WhereParameters>
        <OrderByParameters>
            <asp:ControlParameter ControlID="PhotoGridView" Name="OrderBy" PropertyName="SortExpression"
                Type="String" />
        </OrderByParameters>
    </asp:EntityDataSource>
</asp:Content>


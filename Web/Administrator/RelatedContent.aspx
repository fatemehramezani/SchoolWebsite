<%@ Page Title="مدیریت اخبار" Language="C#" MasterPageFile="~/App_MasterPage/PanelMasterPage.master" AutoEventWireup="true" CodeFile="RelatedContent.aspx.cs" Inherits="Admin_RelatedContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
     مطالب مرتبط
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="DescriptionContent" runat="Server">
    از طریق این صفحه می توانید  مطالب مرتبط به نمایش در آمده در صفحه اصلی را مدیریت نمایید. 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script lang="jv" type="text/javascript">
        function SelectItem(sender, e) {
            e.IsValid = (e.Value != '0'); 7
        }
    </script>
    <asp:MultiView runat="server" ID="RelatedContentMultiView" ActiveViewIndex="0">
        <asp:View runat="server" ID="ShowView">
            <asp:ImageButton ID="NewImageButton" runat="server" OnClick="NewImageButton_Click" SkinID="PanelAddImageButton" />
            <asp:ImageButton ID="SearchImageButton" runat="server" OnClick="SearchImageButton_Click"
                SkinID="PanelSearchImageButton" />
              <asp:ImageButton ID="ClearImageButton" runat="server" OnClick="ClearImageButton_Click" SkinID="PanelClearImageButton" />
            <br />
            <asp:Label ID="NameLabel" runat="server" Text="عنوان مطلب:" SkinID="Caption" CssClass="lable"></asp:Label>
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
            <asp:GridView ID="RelatedContentGridView" runat="server" AutoGenerateColumns="False"
                DataKeyNames="Id" DataSourceID="RelatedContentEntityDataSource" HorizontalAlign="Center"
                OnSelectedIndexChanged="RelatedContentGridView_SelectedIndexChanged" PageSize="5" Width="90%" AllowSorting="True" AllowPaging="True">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                                   <asp:ImageButton ID="SelectImageButton" runat="server" CommandName="Select" SkinID="PanelSelectImageButton" />
                        </ItemTemplate>
                        <ItemStyle Width="25px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id" Visible="False" SortExpression="Id"/>
                    <asp:BoundField DataField="Title" HeaderText="عنوان مطلب" >
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View ID="EditView" runat="server">
            <asp:FormView ID="RelatedContentFormView" runat="server"  Width="90%" DataSourceID="RelatedContentEntityDataSource"
                DataKeyNames="Id" DefaultMode="Insert" OnItemDeleted="RelatedContentFormView_ItemDeleted"
                OnItemCommand="RelatedContentFormView_ItemCommand">
                <EditItemTemplate>
                    <asp:Label ID="TitleLabel" runat="server" Text="عنوان:" SkinID="Caption" CssClass="lable"></asp:Label>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' MaxLength="500" />
                    <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" runat="server" ControlToValidate="TitleTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                    <asp:CheckBox ID="CheckBoxIsFamily" Checked='<%# Bind("IsFamily") %>' runat="server" Text="اولیا " />
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
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' Width="100%" TextMode="MultiLine" Rows="3" />
                    <asp:RequiredFieldValidator ID="RelatedContentRequiredFieldValidator" runat="server" ControlToValidate="DescriptionTextBox"
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
                     <asp:CheckBox ID="CheckBoxIsFamily" Checked='<%# Bind("IsFamily") %>' runat="server" Text="اولیا " />
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
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' Width="100%" TextMode="MultiLine" Rows="3" />
                    <asp:RequiredFieldValidator ID="RelatedContentRequiredFieldValidator" runat="server" ControlToValidate="DescriptionTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                    <br />
                   
                    <div style="float: left; padding: 10px;">
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="ایجاد"
                            ValidationGroup="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="انصراف" />
                    </div>
                </InsertItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:EntityDataSource ID="RelatedContentEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities" EntitySetName="RelatedContents"
        EnableUpdate="True"
        EnableDelete="True"
        EnableInsert="True"
        OnDeleted="RelatedContentEntityDataSource_Command"
        OnInserted="RelatedContentEntityDataSource_Command"
        OnUpdated="RelatedContentEntityDataSource_Command"
        OnInserting="RelatedContentEntityDataSource_InsertingFiles"
        OnUpdating="RelatedContentEntityDataSource_InsertingFiles"
         OrderBy=" it.[ID] desc"  EnableFlattening="False"   
        Where="(@Title is null || it.Title LIKE '%' + @Title + '%')" >
        <WhereParameters>
            <asp:ControlParameter ControlID="TitleTextBox" Name="Title" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource> 

</asp:Content>



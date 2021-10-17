using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Photo : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {
        PhotoGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (TitleTextBox.Text != string.Empty)
        {
            PhotoFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearButton_Click(sender, e);
    }
    protected void ClearButton_Click(object sender, EventArgs e)
    {
        TitleTextBox.Text = string.Empty;
        PhotoFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";        
    }
    protected void PhotoGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        PhotoFormView.PageIndex = (PhotoGridView.PageSize * PhotoGridView.PageIndex) + PhotoGridView.SelectedIndex;        
        PhotoFormView.ChangeMode(FormViewMode.Edit);        
        PhotoGridView.SelectedIndex = -1;
    }
    protected void PhotoEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        PhotoGridView.DataBind();
        PhotoFormView.ChangeMode(FormViewMode.Insert);
    }
    protected void PhotoFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        PhotoFormView.DataBind();
        PhotoGridView.DataBind();
    }
    protected void PageSizeDropDownList_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
    {
        PhotoGridView.PageSize = int.Parse(PageSizeDropDownList.SelectedValue);
    }
}
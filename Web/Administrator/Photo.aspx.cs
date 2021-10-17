using DataLayer;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Photo : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {

    }
    protected void PhotoFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        PhotoFormView.DataBind();
    }
    protected void PhotoFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "CANCEL")
            //PhotoFormView.ChangeMode(FormViewMode.Insert);
            PhotoMultiView.SetActiveView(ShowView);
    }
    protected void PhotoGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        PhotoFormView.PageIndex = (PhotoGridView.PageSize * PhotoGridView.PageIndex) + PhotoGridView.SelectedIndex;
        PhotoMultiView.SetActiveView(EditView);
        PhotoFormView.ChangeMode(FormViewMode.Edit);
        PhotoGridView.DataBind();
        PhotoGridView.SelectedIndex = -1;
    }
    protected void ClearImageButton_Click(object sender, EventArgs e)
    {
        TitleTextBox.Text = string.Empty;
        PhotoFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";
    }

    protected void SearchImageButton_Click(object sender, EventArgs e)
    {
        PhotoGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (TitleTextBox.Text != string.Empty)
        {
            PhotoFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void SearchImageButton_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        PhotoMultiView.SetActiveView(EditView);
        PhotoFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton_Click(sender, e);
        PhotoFormView.DataBind();
    }
    protected void PhotoEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        PhotoGridView.DataBind();
        //PhotoFormView.ChangeMode(FormViewMode.Insert);
        PhotoMultiView.SetActiveView(ShowView);
    }
    protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        PhotoGridView.PageSize = int.Parse(PageSizeDropDownList.SelectedValue);
    }

    protected void PhotoFilesImageButton_Click(object sender, ImageClickEventArgs e)
    {
        string photoId = ((System.Web.UI.WebControls.Image)(sender)).AlternateText;
        if (photoId !="")
           Response.Redirect(string.Format("‍PhotoFiles.aspx?Id={0}", photoId));
    }
    
}
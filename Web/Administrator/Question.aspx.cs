using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Question : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {

    }
    protected void QuestionFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        QuestionFormView.DataBind();
    }
    protected void QuestionFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "CANCEL")
            //QuestionFormView.ChangeMode(FormViewMode.Insert);
            QuestionMultiView.SetActiveView(ShowView);
    }
    protected void QuestionGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        QuestionFormView.PageIndex = (QuestionGridView.PageSize * QuestionGridView.PageIndex) + QuestionGridView.SelectedIndex;
        QuestionMultiView.SetActiveView(EditView);
        QuestionFormView.ChangeMode(FormViewMode.Edit);
        QuestionGridView.DataBind();
        QuestionGridView.SelectedIndex = -1;
    }
    protected void ClearImageButton_Click(object sender, EventArgs e)
    {
        TitleTextBox.Text = string.Empty;
        QuestionFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";
    }

    protected void SearchImageButton_Click(object sender, EventArgs e)
    {
        QuestionGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (TitleTextBox.Text != string.Empty)
        {
            QuestionFormView.ChangeMode(FormViewMode.Insert);
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
        QuestionMultiView.SetActiveView(EditView);
        QuestionFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton_Click(sender, e);
        QuestionFormView.DataBind();
    }
    protected void QuestionEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        QuestionGridView.DataBind();
        //QuestionFormView.ChangeMode(FormViewMode.Insert);
        QuestionMultiView.SetActiveView(ShowView);
    }
    protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        QuestionGridView.PageSize = int.Parse(PageSizeDropDownList.SelectedValue);
    }


    protected void QuestionFilesImageButton_Click(object sender, ImageClickEventArgs e)
    {
        string questionId = ((System.Web.UI.WebControls.Image)(sender)).AlternateText;
        if (questionId != "")
            Response.Redirect("QuestionFiles.aspx?Id=" + questionId.Trim());
    }
}
using System.IO;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;

public partial class Admin_RelatedContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {

    }
    protected void RelatedContentFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        RelatedContentFormView.DataBind();
    }
    protected void RelatedContentFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "CANCEL")
            //RelatedContentFormView.ChangeMode(FormViewMode.Insert);
            RelatedContentMultiView.SetActiveView(ShowView);
    }
    protected void RelatedContentGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        RelatedContentFormView.PageIndex = (RelatedContentGridView.PageSize * RelatedContentGridView.PageIndex) + RelatedContentGridView.SelectedIndex;
        RelatedContentMultiView.SetActiveView(EditView);
        RelatedContentFormView.ChangeMode(FormViewMode.Edit);
        RelatedContentGridView.DataBind();
        RelatedContentGridView.SelectedIndex = -1;
    }
    protected void ClearImageButton_Click(object sender, EventArgs e)
    {
        TitleTextBox.Text = string.Empty;
        RelatedContentFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";
    }

    protected void SearchImageButton_Click(object sender, EventArgs e)
    {
        RelatedContentGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (TitleTextBox.Text != string.Empty)
        {
            RelatedContentFormView.ChangeMode(FormViewMode.Insert);
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
        RelatedContentMultiView.SetActiveView(EditView);
        RelatedContentFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton_Click(sender, e);
        RelatedContentFormView.DataBind();
    }
    protected void RelatedContentEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        RelatedContentGridView.DataBind();
        //RelatedContentFormView.ChangeMode(FormViewMode.Insert);
        RelatedContentMultiView.SetActiveView(ShowView);
    }
    protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        RelatedContentGridView.PageSize = int.Parse(PageSizeDropDownList.SelectedValue);
    }
    protected void RelatedContentEntityDataSource_InsertingFiles(object sender, EntityDataSourceChangingEventArgs e)
    {
        string picturePath = "~/Files/RelatedContent/Images";
        string filePath = "~/Files/RelatedContent/Files";

        ((RelatedContent)e.Entity).Date = DateTime.Now;
        bool isChanged = true;
        if ((CheckBox)RelatedContentFormView.FindControl("PictureCheckBox") != null)
            isChanged = ((CheckBox)RelatedContentFormView.FindControl("PictureCheckBox")).Checked;


        if (isChanged)
        {
            FileUpload pictureFileUpload = (FileUpload)RelatedContentFormView.FindControl("PictureFileUpload");
            if (pictureFileUpload.HasFile)
            {
                string imgpath = Server.MapPath(picturePath);
                if (!Directory.Exists(imgpath))
                    Directory.CreateDirectory(imgpath);

                string imgFile = imgpath + "\\" + pictureFileUpload.FileName;
                pictureFileUpload.SaveAs(imgFile);
                ((RelatedContent)e.Entity).ImageUrl = pictureFileUpload.FileName;
            }
        }

        if ((CheckBox)RelatedContentFormView.FindControl("FileCheckBox") != null)
            isChanged = ((CheckBox)RelatedContentFormView.FindControl("FileCheckBox")).Checked;

        if (isChanged)
        {
            FileUpload fileFileUpload = (FileUpload)RelatedContentFormView.FindControl("FileFileUpload");
            if (fileFileUpload.HasFile)
            {
                string imgpath = Server.MapPath(filePath);
                if (!Directory.Exists(imgpath))
                    Directory.CreateDirectory(imgpath);

                string imgFile = imgpath + "\\" + fileFileUpload.FileName;
                fileFileUpload.SaveAs(imgFile);
                ((RelatedContent)e.Entity).FileUrl = fileFileUpload.FileName;
            }
        }
    }



}
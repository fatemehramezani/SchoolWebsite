﻿using System.IO;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;

public partial class Admin_News : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {

    }
    protected void NewsFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        NewsFormView.DataBind();
    }
    protected void NewsFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "CANCEL")
            //NewsFormView.ChangeMode(FormViewMode.Insert);
            NewsMultiView.SetActiveView(ShowView);
    }
    protected void NewsGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        NewsFormView.PageIndex = (NewsGridView.PageSize * NewsGridView.PageIndex) + NewsGridView.SelectedIndex;
        NewsMultiView.SetActiveView(EditView);
        NewsFormView.ChangeMode(FormViewMode.Edit);
        NewsGridView.DataBind();
        NewsGridView.SelectedIndex = -1;
    }
    protected void ClearImageButton_Click(object sender, EventArgs e)
    {
        TitleTextBox.Text = string.Empty;
        NewsFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";
    }

    protected void SearchImageButton_Click(object sender, EventArgs e)
    {
        NewsGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (TitleTextBox.Text != string.Empty)
        {
            NewsFormView.ChangeMode(FormViewMode.Insert);
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
        NewsMultiView.SetActiveView(EditView);
        NewsFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton_Click(sender, e);
        NewsFormView.DataBind();
    }
    protected void NewsEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        NewsGridView.DataBind();
        //NewsFormView.ChangeMode(FormViewMode.Insert);
        NewsMultiView.SetActiveView(ShowView);
    }
    protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        NewsGridView.PageSize = int.Parse(PageSizeDropDownList.SelectedValue);
    }
    protected void NewsEntityDataSource_InsertingFiles(object sender, EntityDataSourceChangingEventArgs e)
    {
        string picturePath = "~/Files/News/Images";
        string filePath = "~/Files/News/Files";

        ((News)e.Entity).Date = DateTime.Now;
        bool isChanged = true;
        if ((CheckBox)NewsFormView.FindControl("PictureCheckBox") != null)
            isChanged = ((CheckBox)NewsFormView.FindControl("PictureCheckBox")).Checked;


        if (isChanged)
        {
            FileUpload pictureFileUpload = (FileUpload)NewsFormView.FindControl("PictureFileUpload");
            if (pictureFileUpload.HasFile)
            {
                string imgpath = Server.MapPath(picturePath);
                if (!Directory.Exists(imgpath))
                    Directory.CreateDirectory(imgpath);

                string imgFile = imgpath + "\\" + pictureFileUpload.FileName;
                pictureFileUpload.SaveAs(imgFile);
                ((News)e.Entity).ImageUrl = pictureFileUpload.FileName;
            }
        }

        if ((CheckBox)NewsFormView.FindControl("FileCheckBox") != null)
            isChanged = ((CheckBox)NewsFormView.FindControl("FileCheckBox")).Checked;

        if (isChanged)
        {
            FileUpload fileFileUpload = (FileUpload)NewsFormView.FindControl("FileFileUpload");
            if (fileFileUpload.HasFile)
            {
                string imgpath = Server.MapPath(filePath);
                if (!Directory.Exists(imgpath))
                    Directory.CreateDirectory(imgpath);

                string imgFile = imgpath + "\\" + fileFileUpload.FileName;
                fileFileUpload.SaveAs(imgFile);
                ((News)e.Entity).FileUrl = fileFileUpload.FileName;
            }
        }
    }



}
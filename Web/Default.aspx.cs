﻿using System.Collections.Specialized;
using System.Configuration;
using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Profile.UserName != null)
            {
                string[] roles = Roles.GetRolesForUser(Profile.UserName);
                if (roles.Contains("Administrator"))
                    Response.Redirect("~/Administrator/Default.aspx");
                else if (roles.Contains("Applicant"))
                    Response.Redirect("~/Applicant/Default.aspx");
                else
                    Response.Redirect("~/UnauthorizedAccess.aspx");
            }
            else
                SetItem();
        }

    }

    private void SetItem()
    {
        #region Slider
//        string imagePath = "Files/Slider";
//        DirectoryInfo directory = new DirectoryInfo(Server.MapPath(imagePath));
//        if (directory.Exists)
//        {
//            FileInfo[] files = directory.GetFiles();
//            if (files.Length > 0)
//                for (int i = 0; i < files.Length; i++)
//                    slider.InnerHtml +=
//                        string.Format(@" <li style=""position: absolute; top: 0px; left: 0px; display: block; z-index: 4; opacity: 1; width: 696px; height: 319px;"">
//                <div class=""border_on_img""></div>
//                <div class=""content_slider"">
//                    <p>توضیحات خود را در این قسمت می توانید بنویسید.</p>
//                </div>
//                <img src=""{0}/{1}"" width=""670px"" height=""320px""  alt=""image{2}"">
//            </li>", imagePath, files[i].Name, i + 1);
//        }

        string imagePath = "Files/Slider";
        DirectoryInfo directory = new DirectoryInfo(Server.MapPath(imagePath));
        if (directory.Exists)
        {
            FileInfo[] files = directory.GetFiles();
            slider.InnerHtml = string.Empty;
            if (files.Length > 0)
                for (int i = 0; i < files.Length; i++)
                {
                    slider.InnerHtml += string.Format(@" <li> <img src=""{0}/{1}"" width=""696px"" height=""319px""  alt=""slide {2}"" />
                    </li>", imagePath, files[i].Name, i + 1);
                }
        }

        #endregion

        #region News
        DatabaseEntities _DatabaseEntities = new DatabaseEntities();

        string content = Enumerable.Aggregate(_DatabaseEntities.News.Take(4).OrderByDescending(item => item.ID), string.Empty, (current, news) => current + string.Format(@"
                <div class=""box-product"">
                    <a class=""image"" href=""Guest/News.aspx?Id={0}"" title=""ادامه"">
                        <img src=""Files/News/Images/{1}"" alt="""" width=""210px"" height=""180px"" />
                        <span class=""new"">خبر</span>
                    </a>
                    <h3 class=""name""><a href=""Guest/News.aspx?Id={0}"" title="""">{2}</a></h3>
                    <p class=""submit"">
                        <a class=""button"" href=""Guest/News.aspx?Id={0}"">ادامه</a>
                    </p>
                </div>",
                       news.ID, news.ImageUrl, news.Title));
        if (!string.IsNullOrEmpty(content))
            newsContainer.InnerHtml = content;
        #endregion

        #region Photo
        int counter = 0;
        foreach (Photo photo in _DatabaseEntities.Photos.Take(9).OrderByDescending(item => item.Id))
        {
           
                DirectoryInfo subdirectory = new DirectoryInfo(Server.MapPath(string.Format("Files/Photo/{0}", photo.Id)));
                if (!subdirectory.Exists)
                    continue;
                FileInfo file = subdirectory.GetFiles().FirstOrDefault();
                if (file.Length > 0)
                {
                    photosContainer.InnerHtml += string.Format(@"
                    <div class=""box-product"">
                        <a class=""image"" href=""Guest/Photo.aspx?Id={0}"" title=""ادامه"">
                            <img src=""Files/Photo/{0}/{1}"" alt=""{2}"" width=""210px"" height=""180px"" />
                            <span class=""new"">تصویر</span>
                        </a>
                        <h3 class=""name""><a href=""Guest/Photo.aspx?Id={0}"" title="""">{2}</a></h3>
                        <p class=""submit"">
                            <a class=""button"" href=""Guest/Photo.aspx?Id={0}"">ادامه</a>
                        </p>
                    </div>", photo.Id, file.Name, photo.Title);
                }
        }
        #endregion
    }
}
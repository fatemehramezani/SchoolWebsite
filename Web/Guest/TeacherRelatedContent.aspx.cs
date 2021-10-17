using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Guest_TeacherRelatedContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            SetRelatedContent();
    }

    private void SetRelatedContent()
    {
        #region RelatedContent
        string relatedContentPath = "../Files/RelatedContent";
        string category = string.Empty;
        DatabaseEntities _DatabaseEntities = new DatabaseEntities();
        foreach (RelatedContent relatedContent in _DatabaseEntities.RelatedContents.Where(item => !item.IsFamily))
        {
            category += string.Format(@"<li><a href=""TeacherRelatedContent.aspx?Id={0}"">{1}</a></li>",
                   relatedContent.Id,
                   relatedContent.Title);
        }
        relatedContentContainer.InnerHtml = category;
        #endregion
        if (Request.QueryString["Id"] != null)
        {
            int relatedContentId = int.Parse(Request.QueryString["Id"]);
            RelatedContent selectedRelatedContent = _DatabaseEntities.RelatedContents.FirstOrDefault(relatedContent => relatedContent.Id == relatedContentId);
            if (selectedRelatedContent != null)
            {
                relatedContentContent.InnerHtml = string.Format(@"
                   <div class=""product-info"">
                        <div class=""left"">
                            <div class=""image"">
                                <div id=""wrap"" style=""top: 0px; z-index: 9; position: relative;"">
                                    <a style=""position: relative; display: block;"" href=""../Files/RelatedContent/Images/{0}"" title=""{1}"" 
                                        class=""cloud-zoom"" id=""zoom1"" rel=""adjustX: 0, adjustY:0"">
                                        <img style=""display: block;"" src=""../Files/RelatedContent/Images/{0}"" title=""{1}"" alt="""" id=""image"">
                                    </a>
                                </div>
                                <div class=""zoom""><a id=""zoomer"" class=""colorbox cboxElement"" href=""../Files/RelatedContent/Images/{0}"">
                                    + بزرگنمایی</a></div>
                            </div>
                        </div>
                        <div class=""right"">
                            <div class=""description"">
                            </div>
                            <div class=""desc2"">
                                <span>عنوان مطلب :</span> <a href=""RelatedContent.aspx?Id={3}"">{1}</a><br>
                                <span>تاریخ مطلب :</span> {6}<br>
                            </div>
                        </div>
                    </div>
                    <div id=""tabs"" class=""htabs"" style=""direction: rtl;"">
                        <a style=""display: inline;"" href=""#tab-description"">توضیحات</a>
                    </div>
                    <div id=""tab-description"" class=""tab-content"">
                        <div class=""cpt_product_description "">
                            <p>{5}</p>
                            <a href=""../Files/RelatedContent/Files/{4}"">دانلود فایل</a>
                        </div>
                    </div>
                    ", selectedRelatedContent.ImageUrl, selectedRelatedContent.Title,
                     selectedRelatedContent.Date.ToShortDateString(), selectedRelatedContent.Id, selectedRelatedContent.FileUrl,
                     selectedRelatedContent.Description, selectedRelatedContent.Date.ToLongDateString());
            }
        }
    }
}
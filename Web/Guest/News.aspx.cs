using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Guest_News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            SetNews();
    }

    private void SetNews()
    {
        #region News
        string newsPath = "../Files/News";
        string category = string.Empty;
        DatabaseEntities _DatabaseEntities = new DatabaseEntities();
        foreach (News news in _DatabaseEntities.News.OrderByDescending(item => item.ID))
        {
            category += string.Format(@"<li><a href=""News.aspx?Id={0}"">{1}</a></li>",
                   news.ID,
                   news.Title);
        }
        newsContainer.InnerHtml = category;
        #endregion
        if (Request.QueryString["Id"] != null)
        {
            int newsId = int.Parse(Request.QueryString["Id"]);
            News selectedNews = _DatabaseEntities.News.FirstOrDefault(news => news.ID == newsId);
            if (selectedNews != null)
            {
                newsContent.InnerHtml = string.Format(@"
                   <div class=""product-info"">
                        <div class=""left"">
                            <div class=""image"">
                                <div id=""wrap"" style=""top: 0px; z-index: 9; position: relative;"">
                                    <a style=""position: relative; display: block;"" href=""../Files/News/Images/{0}"" title=""{1}"" 
                                        class=""cloud-zoom"" id=""zoom1"" rel=""adjustX: 0, adjustY:0"">
                                        <img style=""display: block;"" src=""../Files/News/Images/{0}"" title=""{1}"" alt="""" id=""image"">
                                    </a>
                                </div>
                                <div class=""zoom""><a id=""zoomer"" class=""colorbox cboxElement"" href=""../Files/News/Images/{0}"">
                                    + بزرگنمایی</a></div>
                            </div>
                        </div>
                        <div class=""right"">
                            <div class=""description"">
                                <div class=""price"">
                                    <span id=""line_s""></span>
                                    <p class=""wrap_price""><span class=""price-new"">{1}</span></p>
                                    <p style=""text-align: left""><span class=""price-tax"">{2}</span></p>
                                </div>
                            </div>
                            <div class=""desc2"">
                                <span>عنوان خبر :</span> <a href=""News.aspx?Id={3}"">{1}</a><br>
                                <span>تاریخ خبر :</span> {6}
                             </div>
                        </div>
                    </div>
                    <div id=""tabs"" class=""htabs"" style=""direction: rtl;"">
                        <a style=""display: inline;"" href=""#tab-description"">توضیحات</a>
                    </div>
                    <div id=""tab-description"" class=""tab-content"">
                        <div class=""cpt_product_description "">
                            <p>{5}</p>
                            <a href=""../Files/News/Files/{4}"">دانلود فایل</a>
                        </div>
                    </div>
                    ", selectedNews.ImageUrl, selectedNews.Title,
                     selectedNews.Date.ToShortDateString(), selectedNews.ID, selectedNews.FileUrl,
                     selectedNews.Description, selectedNews.Date.ToLongDateString());
            }
        }
    }
}
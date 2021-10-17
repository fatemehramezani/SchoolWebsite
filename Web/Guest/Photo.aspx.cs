using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Guest_Photo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Id"] != null)
            SetPhoto();
    }

    void SetPhoto()
    {
        imagecontainer.InnerHtml = string.Empty;
        if (string.IsNullOrEmpty(Request.QueryString["Id"]))
            return;
        string imagePath = string.Format("../Files/Photo/{0}", Request.QueryString["Id"]);
        string thumbnailPath = string.Format("../Files/Photo/{0}/Thumbnails", Request.QueryString["Id"]);
        DirectoryInfo directory = new DirectoryInfo(Server.MapPath(imagePath));
        if (!directory.Exists)
            return;
        string image = string.Empty;
        string thumb = string.Empty;

        FileInfo[] files = directory.GetFiles();
        if (files.Length > 0)
            for (int i = 0; i < files.Length; i++)
            {
                image += string.Format(@"<a href=""{0}/{1}"" download=""{1}"" title=""تصویر"" style=""height:500px;""> <img style=""display: none;"" src=""{0}/{1}"" /> </a>", imagePath, files[i].Name.ToString());
                thumb += string.Format(@"<div class=""thumb""><img src=""{0}/{1}"" /></div>", thumbnailPath, files[i].Name);
            }
        string content = string.Format(@"<div id=""tabs"" class=""htabs"" style=""direction: rtl;"">
                                            <a class="""" style=""display: inline;"" href=""#tab-description"">
                                                {2}
                                            </a>
                                        </div>
                                        <div id=""tab-description"" class=""tab-content"">
                                                  <div id=""sliderFrame"">
                                                        <div id=""slider"">
                                                            {0}
                                                        </div>
                                                        <!--thumbnails-->
                                                        <div id=""thumbs"">
                                                            
                                                                {1}
                                                            
                                                        </div>
                                                    </div>
                                        </div>", image, thumb, Request.QueryString["Title"]);
        imagecontainer.InnerHtml = content;
    }
}
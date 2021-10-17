using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class App_MasterPage_AdvertiseMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            #region Advertise
            string imagePath = "../Files/Advertise";
            DirectoryInfo directory = new DirectoryInfo(Server.MapPath(imagePath));
            FileInfo[] files = directory.GetFiles();
            if (files.Length > 0)
                for (int i = 0; i < files.Length; i++)
                    advertiseContainer.InnerHtml += string.Format(@"<div class=""banner-wrap""><img src=""{0}/{1}"" alt=""image{2}""></div>", imagePath, files[i].Name.ToString(), i + 1);
            #endregion
        }
    }
    string PersianDate(DateTime date)
    {
        PersianDateControls.PersianDateLabel currentPersianDate = new PersianDateControls.PersianDateLabel();
        currentPersianDate.DateValue = date;
        currentPersianDate.DateFormat = PersianDateControls.DateFormat.LongDate;

        return currentPersianDate.Text;
    }
}

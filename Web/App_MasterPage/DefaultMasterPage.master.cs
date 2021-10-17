using System;

public partial class App_MasterPage_DefaultMasterPage : System.Web.UI.MasterPage
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        Page.Theme = "Default";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            UserSiteMapDataSource.SiteMapProvider = "Default";
    }

}

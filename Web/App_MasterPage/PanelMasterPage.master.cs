using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_MasterPage_PanelMasterPage : System.Web.UI.MasterPage
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        Page.Theme = "Panel";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Profile.UserName == null)
                Response.Redirect("~/Default.aspx");
            else
            {
                string[] roles = Roles.GetRolesForUser(Profile.UserName);
                if (roles.Contains("Administrator"))
                    UserSiteMapDataSource.SiteMapProvider = "Administrator";
                else if (roles.Contains("Buyer"))
                    UserSiteMapDataSource.SiteMapProvider = "Buyer";
                else
                    Response.Redirect("~/UnauthorizedAccess.aspx");
                

            }
        }
    }
}

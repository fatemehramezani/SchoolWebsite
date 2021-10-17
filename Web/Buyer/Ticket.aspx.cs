using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Panel_Ticket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string encode = Convert.ToBase64String(System.Text.Encoding.ASCII.GetBytes("Applicant"));
        if (Profile.UserName != null)
        {
            string[] roles = Roles.GetRolesForUser(Profile.UserName);
            if (!roles.Contains("Applicant"))
                Response.Redirect("~/UnauthorizedAccess.aspx");
        }
        else
            Response.Redirect(string.Format("~/Register.aspx?ReturnUrl={0}&Roles=QnV5ZXI=", HttpUtility.UrlEncode("~/Guest/LastRequest.aspx")));
    }
    private void Calculate(string selected, int showTimeId)
    {
        //string[] chairs = selected.Split(';');
        //Profile.
        //Connect ToBank
        //bool successful = false;
    }
    protected void PrintImageButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Report/ReportViewer.aspx");
        //var report = new FastReport.Report();
        //report.Load("../Report/Ticket.aspx");
        //report.Dictionary.Connections[0].ConnectionString = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
        //report.SetParameterValue("ApplicantId", Profile.ApplicantId);
        //report.Show();
    }
}
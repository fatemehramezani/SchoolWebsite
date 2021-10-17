using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;

public partial class Applicant_LastRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Profile.UserName != null)
        {
            string[] roles = Roles.GetRolesForUser(Profile.UserName);
            if (!roles.Contains("Applicant"))
                Response.Redirect("~/UnauthorizedAccess.aspx");
        }
        else
            Response.Redirect(string.Format("~/Register.aspx?ReturnUrl={0}&Roles=QnV5ZXI=", HttpUtility.UrlEncode("~/Applicant/LastRequest.aspx")));
    }
     protected void BuyTicketButton_Click(object sender, EventArgs e)
    {
        //string encode = Convert.ToBase64String(System.Text.Encoding.ASCII.GetBytes("Applicant"));
        //DatabaseEntities _DatabaseEntities = new DatabaseEntities();
        //var list = _DatabaseEntities.BuyTickets.Where(item => (item.ApplicantId == Profile.ApplicantId && item.TicketStatusId == 2)).ToList();
    
        //if (list.Count == 0)
        //{
        //    string[] chairs = null;
        //    chairs = selected.Split(';');

        //    for (int i = 0; i < chairs.Length - 1; i++)
        //    {
        //        BuyTicket buyTicket = new BuyTicket();

        //        buyTicket.ShowTimeId = showTimeId;
        //        buyTicket.ChairId = Convert.ToInt32(chairs[i].ToString());
        //        buyTicket.ApplicantId = Profile.ApplicantId;
        //        //buyTicket.TimeShopping ;
        //        buyTicket.DateShopping = DateTime.Now;
        //        buyTicket.TicketStatusId = 2;//"Requested"??????
        //        buyTicket.TrackingCode = new Random((int)DateTime.Now.Ticks).Next().ToString();//??آیا همیشه غیر تکراری است

        //        _DatabaseEntities.BuyTickets.Add(buyTicket);
        //        _DatabaseEntities.SaveChanges();
        //    }
        //}
        //else
        //{
        //     Response.Redirect(string.Format("~/Applicant/LastRequest.aspx?ShowTimeId={0}", showTimeId));
        //}
        //Profile.
        //Connect ToBank
        //bool successful = false;
    }
}
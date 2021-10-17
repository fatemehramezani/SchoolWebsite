
<%@ Application Language="C#" %>

<script runat="server">
    protected void Application_BeginRequest(object sender, EventArgs e)
    {
        var persianCulture = new PersianCulture();
        System.Threading.Thread.CurrentThread.CurrentCulture = persianCulture;
        System.Threading.Thread.CurrentThread.CurrentUICulture = persianCulture;
    }
    
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
      ///  Application["NoOfVisitors"] = 0;

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
 
    void Application_Error(object sender, EventArgs e)
    {
        //Handler.ExceptionHandler exceptionHandler = new Handler.ExceptionHandler((Context.AllErrors[0].GetBaseException() == null ? new Exception("No Error Found") : Context.AllErrors[0].GetBaseException()), Request.AppRelativeCurrentExecutionFilePath);
        //string innerException = exceptionHandler.Exception.Message.ToString();
        //if (innerException.Contains("\'"))
        //    innerException = innerException.Substring(0, innerException.IndexOf('\''));
        //if (innerException.Contains("\""))
        //    innerException = innerException.Substring(0, innerException.IndexOf('\"'));
        //if (innerException == string.Empty)
        //    innerException = exceptionHandler.Exception.Message.ToString();

        //Response.Redirect(string.Format("~/Exception/ExceptionHandler.aspx?Error={0}&PageUrl={1}", innerException, Request.AppRelativeCurrentExecutionFilePath));
       
        
        
        // Code that runs when an unhandled error occurs
        //try
        //{        
        //bool IsValid = (Session["ExceptionHandler"] == null);
        //System.Collections.Generic.List<Handler.ExceptionHandler> exceptionHandlers = new System.Collections.Generic.List<Handler.ExceptionHandler>();            
        // exceptionHandlers.Add(new Handler.ExceptionHandler((Context.AllErrors[0].GetBaseException() == null ? new Exception("No Error Found") : Context.AllErrors[0].GetBaseException()),Request.AppRelativeCurrentExecutionFilePath));
        // Session["ExceptionHandler"] = exceptionHandlers;
        ////
        ////"~/ExceptionManagement/ExceptionHandler.aspx?Error=" + exceptionHandlers 

        // string redirectURL = (IsValid ? Request.AppRelativeCurrentExecutionFilePath : "~/FatalError.aspx");
        //Response.Redirect((Request.QueryString.Count == 0 ? redirectURL : redirectURL + "?" + Request.QueryString.ToString()));
        //}
        //catch
        //{
        //    Session["ExceptionHandler"] = null;
        //}
    }
    void Session_Start(object sender, EventArgs e)
    {
        //Session["ExceptionHandler"] = null;
        ///////////////////////////////////
       // Application.Lock();
      //  Application["NoOfVisitors"] = (int)Application["NoOfVisitors"] + 1;
      //  Application.UnLock();
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>

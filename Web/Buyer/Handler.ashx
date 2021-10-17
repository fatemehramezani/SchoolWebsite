<%@ WebHandler Language="C#" Class="Handler" %>
using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.IO;
using DataLayer;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        try
        {
            //DataLayer.DatabaseEntities databaseEntities = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString());
            //byte doctorId = Convert.ToByte(context.Request.QueryString["DoctorId"]);
            //Doctor doctor = databaseEntities.Doctors.FirstOrDefault(item => item.Id == doctorId);
            //context.Response.ContentType = "jpeg";
            //context.Response.BinaryWrite((byte[]) doctor.Picture);
        }
        catch
        {            
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
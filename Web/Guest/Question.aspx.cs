using DataLayer;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Guest_Question : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SetQuestions();
            if (Request.QueryString["Id"] != null)
                SetItem();
        }
    }
    private void SetQuestions()
    {
        string category = string.Empty;
        DatabaseEntities _DatabaseEntities = new DatabaseEntities();
        foreach (Question question in _DatabaseEntities.Questions.OrderByDescending(item => item.Date))
        {
            category += string.Format(@"<li><a href=""Question.aspx?Id={0}"">{1}</a></li>",
                   question.Id,
                   question.Title);
        }
        questionContainer.InnerHtml = category;
    }
    private void SetItem()
    {
        string imagePath = string.Format("../Files/Question/{0}", Request.QueryString["Id"].ToString());
        DirectoryInfo directory = new DirectoryInfo(Server.MapPath(imagePath));
        if (!directory.Exists)
            return;
        int questionId = int.Parse(Request.QueryString["Id"]);
        DatabaseEntities _DatabaseEntities = new DatabaseEntities();
        Question selectedQuestion = _DatabaseEntities.Questions.FirstOrDefault(question => question.Id == questionId);
        FileInfo[] files = directory.GetFiles();
        string content = string.Format(@"<h2>{0}</h2>
                        <div class=""content"">
                            <ul class=""greenrect"">", selectedQuestion.Title);
        if (files.Length > 0)
            for (int i = 0; i < files.Length; i++)
            {
                content += string.Format(@"<li><a href=""../Files/Question/{0}/{1}"">{2}</a></li>",
                    selectedQuestion.Id, files[i].Name, files[i].Name.Split('.')[0]);
            }
        content += "</ul></div>";
        questionContent.InnerHtml = content;
    }
}
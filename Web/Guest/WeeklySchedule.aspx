<%@ Page Title="برنامه هفتگی" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="WeeklySchedule.aspx.cs" Inherits="Guest_WeeklySchedule" %>

<%@ OutputCache Duration="10" VaryByParam="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="App_Themes/Default/js/jquery.js"></script>
    <script src="App_Themes/Default/js/jquery-1.js"></script>
    <script src="App_Themes/Default/js/cuties.js"></script>
    <link href="App_Themes/Default/css/stylesheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContent" runat="Server">
<div class="box">
        <div>
            <h1 class="title_module"><span>برنامه هفتگی</span></h1>
            <div class="box-content" id="photosContainer" runat="server">

                 <div class="box-product">
                    <img src="../Files/WeeklySchedule/13.JPG" alt="پایه:پیش دبستانی" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/13.JPG">"پایه:پیش دبستانی"</a></h3>
                </div>

                <div class="box-product">
                    <img src="../Files/WeeklySchedule/1.JPG" alt="پایه:اول1" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/1.JPG">"پایه:اول1"</a></h3>
                </div>
                <div class="box-product">
                    <img src="../Files/WeeklySchedule/2.JPG" alt="پایه:اول2" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/2.JPG">"پایه:اول2"</a></h3>
                </div>

                 <div class="box-product">
                    <img src="../Files/WeeklySchedule/3.JPG" alt="پایه:دوم1" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/3.JPG">"پایه:دوم1"</a></h3>
                </div>
                 <div class="box-product">
                    <img src="../Files/WeeklySchedule/4.JPG" alt="پایه:دوم2" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/4.JPG">"پایه:دوم2"</a></h3>
                </div>

                 <div class="box-product">
                    <img src="../Files/WeeklySchedule/5.JPG" alt="پایه:سوم1" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/5.JPG">"پایه:سوم1"</a></h3>
                </div>
                 <div class="box-product">
                    <img src="../Files/WeeklySchedule/6.JPG" alt="پایه:سوم2" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/6.JPG">"پایه:سوم2"</a></h3>
                </div>

                 <div class="box-product">
                    <img src="../Files/WeeklySchedule/7.JPG" alt="پایه:چهارم1" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/7.JPG">"پایه:چهارم1"</a></h3>
                </div>
                 <div class="box-product">
                    <img src="../Files/WeeklySchedule/8.JPG" alt="پایه:چهارم2" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/8.JPG">"پایه:چهارم2"</a></h3>
                </div>

                 <div class="box-product">
                    <img src="../Files/WeeklySchedule/9.JPG" alt="پایه:پنجم1" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/9.JPG">"پایه:پنجم1"</a></h3>
                </div>
                 <div class="box-product">
                    <img src="../Files/WeeklySchedule/10.JPG" alt="پایه:پنجم2" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/10.JPG">"پایه:پنجم2"</a></h3>
                </div>

                 <div class="box-product">
                    <img src="../Files/WeeklySchedule/11.JPG" alt="پایه:ششم1" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/11.JPG">"پایه:ششم1"</a></h3>
                </div>
                 <div class="box-product">
                    <img src="../Files/WeeklySchedule/12.JPG" alt="پایه:ششم2" width="210px" height="180px" />
                    <h3 class="name"><a href="../Files/WeeklySchedule/12.JPG">"پایه:ششم2"</a></h3>
                </div>

               
            </div>
        </div>
    </div>
    <div class="clear"></div>
</asp:Content>

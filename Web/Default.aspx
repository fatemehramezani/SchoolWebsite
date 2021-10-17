<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ OutputCache Duration="10" VaryByParam="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="App_Themes/Default/js/jquery.js" type="text/jscript"></script>
    <script src="App_Themes/Default/js/jquery-1.js" type="text/jscript"></script>
    <script src="App_Themes/Default/js/cuties.js" type="text/jscript"></script>
    <script type="text/javascript" src="App_Themes/Default/js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="App_Themes/Default/js/jquery.cycle.all.js"></script>
    <script type="text/javascript" src="App_Themes/Default/js/jquery.flexslider.js"></script>
    <link href="App_Themes/Default/css/flexslider.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="App_Themes/Default/css/stylesheet.css" rel="stylesheet" />
     <script type="text/javascript">

         $(window).load(function () {
             $('.flexslider').flexslider({
                 animation: "slide",
                 start: function (slider) {
                     $('body').removeClass('loading');
                     $('.menu').singlePageNav();
                 }
             });
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContent" runat="Server">
    <div id="slide_wrapper">

         <div class="flexslider"> 
             <ul id="slider" class="slides" runat="server">
                 
                 <%--<li>
                     <img src="Files/Slider/s2.jpg" width="696px" height="319px" alt="slide 2" />
                 </li>
                 <li>
                     <img src="Files/Slider/s1.jpg" width="696px" height="319px" alt="slide 3" />
                 </li>--%>
             </ul>
             
                    </div>
        <div class="border_on_img"></div>


<%--        <ul style="position: relative;" id="slider" class="slider" runat="server">
        </ul>--%>
    </div>
    <div class="banner">
        <div>
            <a href="Guest/TeacherRelatedContent.aspx">
                <img src="App_Themes/Default/image/banner1.png" alt="توضیحات خود را در این قسمت می توانید بنویسید." title="بهره گیری از کادری مجرب" />
            </a>
        </div>
    </div>
    <div class="banner">
        <div>

            <a href="Guest/FamilyRelatedContent.aspx">
                <img src="App_Themes/Default/image/banner2.png" alt="توضیحات خود را در این قسمت می توانید بنویسید." title="ارتباط موثر با اولیای دانش آموزان" />
            </a>
        </div>
    </div>
    <div class="box">
        <div>
            <h1 class="title_module"><span>آخرین اخبار</span></h1>
            <div class="box-content" id="newsContainer" runat="server">
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="box">
        <div>
            <h1 class="title_module"><span>آخرین تصاویر</span></h1>
            <div class="box-content" id="photosContainer" runat="server">
            </div>
        </div>
    </div>
    <div class="clear"></div>
</asp:Content>


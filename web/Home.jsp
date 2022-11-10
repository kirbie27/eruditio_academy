<%@page import="eruditio.models.Programs"%>
<%@page import="eruditio.models.ProgramList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eruditio.models.AboutModel"%>
<%@page import="eruditio.models.About"%>
<%
    boolean loggedIn = (session.getAttribute("loggedInUser") != null);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&family=Roboto&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Eruditio Academy</title>
        <link href="css/Header.css" rel="stylesheet" type="text/css"/>
        <style>
            * 
            {
                margin: 0;
                padding: 0;
            }

            html {
                scroll-behavior: smooth;
            }

            ::-webkit-scrollbar
            {
                display: none;
            }

            body
            {
                text-align: center;
                background-color: #F6F5F5;
                background-color: #FFFAF0;


            }

            header
            {
                display: flex;
                align-items: center;
                justify-content: space-around;
            }

            .headerLabel
            {

                height: 100%;
                width: 20%;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 5px;

            }

            .headerLabel p
            {
                font-size: clamp(10px, 80%, 15px);
            }

            .headerLabel a
            {
                text-decoration: none;
                font-size: clamp(10px, 80%, 15px);
                font-family: 'Roboto', sans-serif;
            }
            .headerLabel span
            {
                margin-left: 8px;
            }

            ul 
            {
                list-style: none; 
                display: flex;
                width: 100%;
                height: auto;
                align-items: center;
                justify-content: center;
            }
            ul li
            {
                margin: 15px;
            }

            ul li a {
                font-family: 'Roboto', sans-serif;
                font-weight: bold;
                color: #B6922E;
                text-decoration: none;
                padding: 10px;
            }

            ul li a:hover
            {
                background-color: #B6922E;
                color: black;
            }

            .Containers
            {
                min-height: 100vh;

            }

            #HomeContent {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                /*padding-bottom: 3vmax;*/
                padding-bottom: 1vmax;
                padding-top: 3vmax;
                align-items: center;
                text-align: left;
                
               
                
            }

            #HomeContent div {
                margin: 5%;
                width: 400px;
            }


            #HomeContent div h1 {
                font-family: 'Patua One', cursive;
                font-weight: normal;
                color: #0A2351;
            }

            #HomeContent div p {
                font-family: 'Roboto', sans-serif;
                text-align: justify;
                font-size: clamp(15px, 80%, 20px);
                
            }

            #applynow {
                background-color: #FFFFFF;
                border: 1px solid #0A2351;
                box-sizing: border-box;
                font-family: 'Roboto', sans-serif;
                font-style: normal;
                font-weight: bold;
                font-size: clamp(15px, 80%, 20px); 
                color: #B6922E;
                text-align: center;
                /*padding: 10px 50px 10px 50px;
                margin-top: 100px;
                margin-left: 300px;*/
                padding: 2% 10% 2% 10%;
                margin-top: 8%;
                margin-left: 20%;
                cursor: pointer;
            }

            #applynow:hover {
                background-color: #B6922E;
                color: black;
                border: 1px solid #B6922E
            }


            video {
                width: clamp(370px, 37vmax, 740px);
                height: auto;
                margin: 4vmax 5% 6vmax 5%;
            }

            #Reviews {
                width: 80%;
                margin: 5% 10% 5% 10%;
            }

            .reviewPanel {
                justify-content: center;
                width: clamp(200px, 20%, 400px);
                margin: 2vmax;  
            }
            
            .reviewPanel p {
                margin-top: 1vmax;
            }
            
            .panels {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
                background-color: white;
                box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
                border-radius: 10px;
                /*border: 1px solid blue;*/
            }

            #Reviews h1{
                font-family: 'Patua One', sans-serif;
                font-size: clamp(25px, 80%, 30px);
                font-weight: normal;
                letter-spacing: 0.1em;
                color: #B6922E;
                margin-bottom: 2vmax;
            }

            .reviewPanel p {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(15px, 80%, 20px);
            }

            #About {
                /* display: flex;
                 flex-direction: column;*/
                /* justify-content: center;
                 align-items: center;*/
                padding-bottom: 2vmax;
                padding-top: 2vmax;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }   

            .aboutus {
                margin-bottom: 2vmax;
                height: 150px;
                display: flex;
                flex-direction: column;
                align-items: center;
                width: clamp(600px, 60%, 1200px);
            }

            .aboutus h1 {
                font-family: 'Patua One', cursive;
                font-size: clamp(25px, 80%, 30px);
                font-weight: normal;
                color: #B6922E;
                letter-spacing: 0.2em;
                margin-bottom: 1vmax;
            }

            .aboutus p {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(15px, 80%, 20px);
                text-align: justify;
                /*  margin-right: 12vmax;
                  margin-left: 12vmax;*/
                /*text-align: justify;*/
            }

            .additional {
                margin-top: 110px;
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                width: 100%;
                
                align-items: center;
                justify-content: space-around;
            }

            .moreinfo {
                width: 340px;
                height: 200px;
               
                margin-bottom: 1vmax;
            }

            .additional h2 {
                font-family: 'Patua One', cursive;
                font-weight: normal;
                font-size: clamp(20px, 80%, 40px);
                text-align: left;
                margin-bottom: .5vmax;
                color: #B6922E;
            }

            .additional p {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(14px, 80%, 20px);
                text-align: justify;

            }

            #Programs h1 {
                font-family: 'Patua One', cursive;
                font-size: clamp(25px, 80%, 30px);
                font-weight: normal;
                color: #B6922E;
                letter-spacing: 0.2em;
            }

            #Programs h2 {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(10px, 80%, 20px);
                letter-spacing: 0.2em;
            }


            .programSelect {
                display: flex;
                flex-direction: row;
                justify-content: center;
                padding-top: 2vmax;
            }

            .prog {
                margin-right: 2vmax;
                margin-left: 2vmax;
                background-color: #FFFAF0;

            }

            .prog:hover
            {
                transform: scale(1.2);
                transition: 0.3s ease-out;
            }

            .prog p {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(10px, 80%, 20px);
            }

            #Teachers {
                margin-top: 7vmax;
                /*   background-color: pink;*/
            }

            .meetTeach {
                padding-bottom: 1vmax;
            }

            .meetTeach h1 {
                font-family: 'Patua One', cursive;
                font-weight: normal;
                font-size: clamp(25px, 80%, 30px);
                color: #B6922E;
            }

            .meetTeach p {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(15px, 80%, 20px);
            }

            .teacherContainer {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;

            }

            .teacherDisplay {
                /*  background-color: lavender;*/
                border: 1px solid blue;
                padding-top: 1vmax;
                padding-bottom: 1vmax;
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                margin-bottom: 2vmax;
                width: 90%;
                justify-content: space-around;
            }

            .teacherName {
                width: clamp(300px, 30%, 600px);

            }

            .teacherName h1 {
                font-family: 'Patua One', cursive;
                font-size: clamp(20px, 80%, 25px);
            }

            .teacherName p {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(15px, 80%, 20px);
            }

            .teacherDesc {
                width: 60%;
                display: flex;
                align-items: center;
                /* border: 1px solid black;*/
                padding-bottom: 3vmax;
            }

            .teacherDesc p {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(15px, 80%, 20px);
                text-align: left;
            }

            #Admin {
                margin-top: 7vmax;

            }

            .meetAdmin {
                margin-top: 5vmax;

            }

            .meetAdmin h1 {
                font-family: 'Patua One', cursive;
                font-weight: normal;
                font-size: clamp(25px, 80%, 30px);
                color: #B6922E;
            }

            .meetAdmin p {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(15px, 80%, 20px);
            }


            .adminContainer {
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: center;
                align-items: center;
            }

            /*  .adminDivide {
                  display: flex;
                  flex-direction: row;
                  justify-content: center;
                  align-items: center;
                 
              }*/

            .adminName {
                border: 1px solid blue;
                border-radius: 10px;
                padding: 3vmax;
                margin: 4vmax;
            }

            .adminName h1 {
                font-family: 'Patua One', cursive;
                font-size: clamp(20px, 80%, 25px);
            }

            .adminName p {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(15px, 80%, 20px);
            }

            #Featured {

            }

            * {
                box-sizing: border-box;
            }
            
           

            img {
                vertical-align: middle;
            }

            /* Position the image container (needed to position the left and right arrows) */
            .container {
                position: relative;
            }

            /* Hide the images by default */
            .mySlides {
                display: none;
            }

            /* Add a pointer when hovering over the thumbnail images */
            .cursor {
                cursor: pointer;
            }

            /* Next & previous buttons */
            .prev,
            .next {
                cursor: pointer;
                position: absolute;
                top: 40%;
                width: auto;
                padding: 16px;
                margin-top: -50px;
                color: white;
                font-weight: bold;
                font-size: 20px;
                border-radius: 0 3px 3px 0;
                user-select: none;
                -webkit-user-select: none;
            }

            /* Position the "next button" to the right */
            .next {
                right: 0;
                border-radius: 3px 0 0 3px;
                color: #C4C4C4;
            }

            .prev {
                left: 0;
                border-radius: 3px 0 0 3px;
                color: #C4C4C4;
            }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover,
            .next:hover {
                background-color: rgba(0, 0, 0, 0.8);
            }


            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            /* Six columns side by side */
            .column {
                float: left;
                width: 16.66%;
            }

            /* Add a transparency effect for thumnbail images */
            .demo {
                opacity: 0.6;
            }

            .active,
            .demo:hover {
                opacity: 1;
            }



            .featuredText h1 {
                font-family: 'Patua One', cursive;
                font-size: clamp(25px, 80%, 30px);
                color: #B6922E;
                font-weight: normal;
            }

            .featuredText p {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(15px, 80%, 20px);
            }

            .featuredText {
                padding-bottom: 2vmax;
            }

            .schoolQuote {
                margin-top: 8vmax;
                margin-bottom: 4vmax;
                background-color: #B5A8BA;
                padding-top: 25px;
                padding-bottom: 25px;
            }

            .schoolQuote h1 {
                font-family: 'Patua One', cursive; 
                font-size: clamp(20px, 80%, 30px);
                font-weight: normal;
              

            }

            .schoolQuote p {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(15px, 80%, 30px);
                color: #0A2351;
            }

            .bottomInfo {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                flex-direction: row;
                margin-bottom: 2%;
            }

            .bottomInfo h2 {
                font-family: 'Patua One', cursive;
                font-weight: normal;
                text-align: left;
                font-size: clamp(20px, 80%, 30px);
                width: clamp(150px, 15%, 300px);
                margin: 1vmax 2vmax 1vmax 2vmax;
                color: #B6922E;
            }

            footer {
                background-color: #391847; 
                padding: 10px;
            }

            footer p {
                color: white;
                font-weight: bold;
                font-family: 'Roboto', sans-serif;
                font-size: clamp(10px, 80%, 20px);
                margin-top: .3%;
            }
            .footInfo {
                display: flex;
                flex-direction: column;
                width: clamp(150px, 15%, 300px);
                margin: 1vmax 2vmax 1vmax 2vmax;
            }

            .footInfo h3 {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(17px, 80%, 30px);
                text-align: left;
                font-weight: bold;
            }

            .footInfo p {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(12px, 80%, 30px);
                text-align: left;
                color: black;
            }

            /* media query */

            @media only screen and (max-width: 1024px) 
            {
                .bottomInfo h2, .footInfo h3, .footInfo p
                {
                    text-align: center;
                }

                .programSelect {
                    display: flex;
                    flex-direction: column;
                }

                .headerLabel
                {
                    display: none;
                }

                #welcome
                {
                    height: 100%;
                    width: 20%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 5px;
                    width: 100% !important;
                    font-size: 30px !important;
                }




            }

            @media only screen and (max-width: 850px)
            {
                body
                {

                }
                .aboutus {
                    width: 320px;
                    margin: 0;
                }
                header
                {
                    width: 100%;
                }
                .teacherDesc p {
                    text-align: justify;
                }




            }

            #myBtn 
            {
                display: none;
                position: fixed;
                bottom: 20px;
                right: 30px;
                z-index: 99;
                font-size: 12px;
                border: none;
                outline: none;
                background-color: #391847;
                color: white;
                cursor: pointer;
                padding: 10px;
                border-radius: 4px;
                font-family: 'Roboto', sans-serif;
                text-decoration: none;
            }

            #myBtn:hover
            {
                background-color: #B6922E;
            }
        </style>
        <script>
            //Get the button
            var mybutton = document.getElementById("myBtn");

            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction()
            };

            function scrollFunction() {
                if (document.body.scrollTop > 5 || document.documentElement.scrollTop > 5) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }

            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
    </head>
    <body>
        <a href ="#Home" id="myBtn" title="Go to top">BACK TO TOP</a>
        <header id = "Home"style = "height: 50px; background-color: #391847; color: white;">


            <div class = "headerLabel">
                <i class="fa fa-phone"></i>
                <span>
                    <p>
                        (02) 7213 7246   
                    </p>
                    <p>
                        (02) 8478 5165  
                    </p>

                </span>
            </div>
            <div class = "headerLabel">
                <i class="fa fa-envelope"></i>
                <span>
                    <p>
                        Eruditio.Academy21@gmail.com   
                    </p>                     
                </span>
            </div>
            <div class = "headerLabel" id = "welcome">
                <p><%= getServletContext().getInitParameter("header")%></p>        
            </div>
            <div class = "headerLabel">
                <i class="fa fa-map-marker"></i>
                <span>
                    <p>
                        47 Kalayaan Avenue, Diliman,  
                    </p>
                    <p>
                        Quezon City 1101 Philippines
                    </p>

                </span>
            </div>

            <div class = "headerLabel">
                <i class="fa fa-facebook"></i>
                <a href = "https://www.facebook.com/EruditioAcademy/" target = "_blank"  style ="cursor: pointer; color: white;">@ERUDITIOACADEMY</a>  
            </div>


        </header>

        <nav id="Top">
            <img alt="Eruditio Logo" src = "Assets/Pictures/logo_transparent.png" style="max-width:350px;max-height:123px;">
            <ul>
                
                <li><a href = "#About">ABOUT</a></li>
                <li><a href = "#Programs">PROGRAMS</a></li>
                <li><a href = "#Featured">GALLERY</a></li>
                
                <% 
                    if (!loggedIn) 
                    {
                %>
                    <li><a href = "LoginToEruditio">LOGIN</a></li>

                <%  } 
                    else 
                    {
                %>
                    <li><a href = "loggedIn/MyDashboard">DASHBOARD</a></li>
                    <li><a href = "loggedIn/SeeYouAgain">LOGOUT</a></li>
                <%  } %>

            </ul>
        </nav>

        <div id = "Home">
            <div id = "HomeContent" style="margin-top: 2%;">
                <div>
                    <h1>Eruditio Academy</h1>
                    <p>Bringing 21<sup>st</sup> Century Education to Every Home. Eruditio Academy<sup>TM</sup> is a joint venture of highly experienced education service providers. We offer online learning programs for preschool up to high school.</p>
                    <% if (!loggedIn) {
                    %>
                    <a href = "RegisterToEruditio" ><button id = "applynow">APPLY NOW</button></a>
                    <%  }
                    %>
                </div>

                <video controls autoplay muted>
                    <source src="Assets/Videos/harrypotter.mp4" type="video/mp4">
                </video>
            </div>


        </div>

        <div id="About">
            <%
                About am = (About) getServletContext().getAttribute("About");
                AboutModel main = am.getMain();
                ArrayList<AboutModel> list = am.getAdditionals();
           
            %>
            <div class="aboutus">
                <h1><%= main.getTitle()%></h1>
                <p><%= main.getDescription()%></p>
            </div>
            <div class="additional">
                <%
                    for(int i = 0; i < list.size(); i++)
                    {
                       AboutModel current = list.get(i); 
                       String s = String.format("<div class = 'moreinfo'>\n"
                               + "<h2>%s</h2>\n"
                               + "<p>%s</p>\n"
                               + "</div>",current.getTitle(), current.getDescription());
                       
                       out.println(s);
                    }
                %>
            </div>
        </div>

        <div id = "Reviews">
            <!-- make model for reviews-->
            <h1>PROGRAM FEATURES & INCLUSIONS</h1>
            <div class="panels">
                <div class = "reviewPanel">
                <img alt="Phone Icon" src="https://i.imgur.com/jEUEZ4B.png" style="width: 50px; height: 50px">
                <p>Online and Offline Learning</p>
            </div>
            <div class = "reviewPanel">
                <img alt="User Icon" src="https://i.imgur.com/p0yHwpV.png" style="width: 50px; height: 50px">
                <p>Parent and Empowerment Learning</p>
            </div>
            <div class = "reviewPanel">
                <img alt="User Icon" src="https://i.imgur.com/QApFKG5.png" style="width: 50px; height: 50px">
                <p>Club Membership</p>
            </div>
            </div>
            
            <!-- <div class = "reviewPanel">
                 <h2>ADVERTISEMENT #4</h2>
                 <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ac cursus lectus, ac scelerisque ante.</p>
             </div> -->
        </div>

        <div id="Programs">
            <h1>PROGRAMS</h1>
            <h2>TO CHOOSE FROM</h2>
            <div class="programSelect">
                 <%
                    ProgramList pl = (ProgramList) getServletContext().getAttribute("programList");
                    ArrayList<Programs> list2 = pl.getProgramList();
                    for (int i = 0; i < list2.size(); i++)
                    {
                        Programs current = list2.get(i);
                        String s = String.format("<div class = 'prog'>\n"
                                + "<img alt = %s src = %s style = 'max-width: 210px; max-height: 220px;'>\n"
                                + "<p>%s</p>"
                                + "</div>", current.getProgramTitle(),current.getDefaultPic(),current.getProgramTitle().toUpperCase());
                        out.println(s);
                    }
                %>
            </div>
        </div>
        <div id="Teachers">
            <div class="meetTeach">
                <p>MEET THE</p>
                <h1>TEACHERS</h1>
            </div>
            <div class="teacherContainer">
                <div class="teacherDisplay">
                    <div class="teacherName">
                        <img alt="Teacher" src = "https://i.imgur.com/lZfYqL4.png" style="max-width:150px;max-height:150px; border-radius: 50%">
                        <h1>NAME</h1>
                        <p>SUBJECT</p>
                    </div>
                    <div class="teacherDesc">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ac cursus lectus, ac scelerisque ante. Donec vulputate sem nunc, lobortis luctus est tincidunt vitae. Praesent elit magna, eleifend at semper quis, pulvinar congue massa. Integer dictum dui a lectus consequat, et lobortis nisl luctus.</p>
                    </div>
                </div>

                <div class="teacherDisplay">
                    <div class="teacherName">
                        <img alt="Teacher" src = "https://i.imgur.com/fovY3c5.png" style="max-width:150px;max-height:150px; border-radius: 50%">
                        <h1>NAME</h1>
                        <p>SUBJECT</p>
                    </div>
                    <div class="teacherDesc">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ac cursus lectus, ac scelerisque ante. Donec vulputate sem nunc, lobortis luctus est tincidunt vitae. Praesent elit magna, eleifend at semper quis, pulvinar congue massa. Integer dictum dui a lectus consequat, et lobortis nisl luctus.</p>
                    </div>
                </div>
            </div>
        </div>

        <div id="Admins">
            <div class="meetAdmin">
                <p>MEET THE</p>
                <h1>ADMINS</h1>
            </div>
            <div class="adminContainer">

                <div class="adminName">
                    <img alt="Teacher" src = "https://i.imgur.com/0WKdpQu.png" style="max-width:150px;max-height:150px; border-radius: 50%">
                    <h1>NAME</h1>
                    <p>CO-FOUNDER</p>
                </div>

                <div class="adminName">
                    <img alt="Teacher" src = "https://i.imgur.com/5g20Ihh.png" style="max-width:150px;max-height:150px; border-radius: 50%">
                    <h1>NAME</h1>
                    <p>CO-FOUNDER</p>
                </div>

                <div class="adminName">
                    <img alt="Teacher" src = "https://i.imgur.com/IBP6Eq5.png" style="max-width:150px;max-height:150px; border-radius: 50%">
                    <h1>NAME</h1>
                    <p>CO-FOUNDER</p>
                </div>
            </div> 
        </div>

        <div id = "Featured">
            <div class="featuredText">
                <p>FEATURED</p>
                <h1>GALLERY</h1>
            </div>
            <div class="container">
                <div class="mySlides">

                    <img src="Assets/Pictures/white1.JPG" style="width:30%">
                </div>

                <div class="mySlides">

                    <img src="Assets/Pictures/white2.JPG" style="width:30%">
                </div>

                <div class="mySlides">

                    <img src="Assets/Pictures/white3.JPG" style="width:30%">
                </div>

                <div class="mySlides">

                    <img src="Assets/Pictures/white4.JPG" style="width:30%">
                </div>

                <div class="mySlides">

                    <img src="Assets/Pictures/white5.JPG" style="width:30%">
                </div>

                <div class="mySlides">

                    <img src="Assets/Pictures/yellow3.JPG" style="width:30%">
                </div>

                <a class="prev" onclick="plusSlides(-1)">❮</a>
                <a class="next" onclick="plusSlides(1)">❯</a>

                <div class="caption-container">
                    <p id="caption" style = "color: #FFFAF0;">Eruditio</p>
                </div>

                <div class="row">
                    <div class="column">
                        <img class="demo cursor" src="Assets/Pictures/white1.JPG" style="width:100%" onclick="currentSlide(1)">
                    </div>
                    <div class="column">
                        <img  class="demo cursor" src="Assets/Pictures/white2.JPG" style="width:100%" onclick="currentSlide(2)">
                    </div>
                    <div class="column">
                        <img   class="demo cursor" src="Assets/Pictures/white3.JPG" style="width:100%" onclick="currentSlide(3)">
                    </div>
                    <div class="column">
                        <img   class="demo cursor" src="Assets/Pictures/white4.JPG" style="width:100%" onclick="currentSlide(4)">
                    </div>
                    <div class="column">
                        <img  class="demo cursor" src="Assets/Pictures/white5.JPG" style="width:100%" onclick="currentSlide(5)">
                    </div>    
                    <div class="column">
                        <img   class="demo cursor" src="Assets/Pictures/yellow3.JPG" style="width:100%" onclick="currentSlide(6)">
                    </div>
                </div>
            </div>
            <script>
                var slideIndex = 1;
                showSlides(slideIndex);

                function plusSlides(n) {
                    showSlides(slideIndex += n);
                }

                function currentSlide(n) {
                    showSlides(slideIndex = n);
                }

                function showSlides(n) {
                    var i;
                    var slides = document.getElementsByClassName("mySlides");
                    var dots = document.getElementsByClassName("demo");

                    if (n > slides.length) {
                        slideIndex = 1;
                    }
                    if (n < 1) {
                        slideIndex = slides.length;
                    }
                    for (i = 0; i < slides.length; i++) {
                        slides[i].style.display = "none";
                    }
                    for (i = 0; i < dots.length; i++) {
                        dots[i].className = dots[i].className.replace(" active", "");
                    }
                    slides[slideIndex - 1].style.display = "block";
                    dots[slideIndex - 1].className += " active";

                }
            </script>
        </div> 
        <div class="schoolQuote">
            <h1>“We believe in the development of the four human dimensions in children: mental, socio-emotional physical and spiritual."
            </h1>

        </div>


        <div class="bottomInfo">
            <h2>FOR MORE INFORMATION</h2>

            <div class="footInfo">
                <h3>ADDRESS</h3>
                <p>47 KALAYAAN AVENUE, DILIMAN, QUEZON CITY 1101 PHILIPPINES</p>

            </div>
            <div class="footInfo">
                <h3>WORK HOURS</h3>
                <p>MON-FRI 8:00AM - 4:00PM</p>
            </div>
            <div class="footInfo">
                <h3>CONTACT</h3>
                <p>(02) 7213 7246 | (02) 8478 5165</p>
            </div>
            <div class="footInfo">
                <h3>EMAIL</h3>
                <p>Eruditio.Academy21@gmail.com</p>
            </div>
        </div>

        <footer>        
            <p>&#169 <%= getServletContext().getInitParameter("footer")%></p>
        </footer>
        <script>
            //Get the button
            var mybutton = document.getElementById("myBtn");

            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction()
            };

            function scrollFunction() {
                if (document.body.scrollTop > 5 || document.documentElement.scrollTop > 5) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }

            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
               
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
                window.location.href("#Top");
            }
        </script>
    </body>
</html>
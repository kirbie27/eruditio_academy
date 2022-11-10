<%@page import="java.util.ArrayList"%>
<%@page import="eruditio.models.RegistrationModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    //clears cache so that if session is already destroyed then user won't be able to go 
    //back to the success page
    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expire", 0);

    if (session.getAttribute("loggedInUser") == null) {
        response.sendRedirect("/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/errorSession.jsp");
    }

    ResultSet record = (ResultSet) session.getAttribute("UserRecord");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&family=Roboto&display=swap" rel="stylesheet">
        <title>Eruditio Dashboard</title>

        <script>
            function edit()
            {
                var change = document.getElementsByClassName("inputs");
                var change2 = document.getElementsByClassName("details");
                var toggle = document.getElementById("button");
                var i = 0;
                if (change[i].style.display == "none")
                {
                    toggle.innerHTML = "Cancel Edit";
                    for (i = 0; i < change.length; i++)
                    {
                        change[i].style.display = "inline";

                    }
                    for (i = 0; i < change2.length; i++)
                    {
                        change2[i].style.display = "none";
                    }
                } else
                {
                    toggle.innerHTML = "Edit Profile";
                    for (i = 0; i < change.length; i++)
                    {
                        change[i].style.display = "none";

                    }

                    for (i = 0; i < change2.length; i++)
                    {
                        change2[i].style.display = "inline";
                    }
                }
            }
        </script>
        
        <style>

            *
            {
                margin: 0px;
                padding: 0px;
                text-align: center;
            }

            ::-webkit-scrollbar
            {
                display: none;
            }

            body 
            {
                min-width: 350px;

            }
            header div 
            {
                display: flex;
                align-items: center;
                justify-content: space-around;
                height: 100%;

            }
            header div p 
            {
                display: block;
                font-size: clamp(10px, 100%,10px);
                font-family: 'Roboto', sans-serif;
                font-weight: 500;
                font-size: .9vw;  
            }
            footer
            {
                text-align: center;
            }
            footer div 
            {
                display: flex;
                justify-content: space-around;
            }
            footer div p 
            {
                display: inline;
            }
            footer p {
                color: white;
                font-weight: bold;
                font-family: 'Roboto', sans-serif;
                font-size: clamp(10px, 80%, 20px);
             
            }

            #DashboardBody
            {
                height: 100vh;
                display: flex;
                text-align: center;
                
            }
            #DashboardBody div
            {
                text-align: center;
            }

            #menu
            {
                display: flex;
                justify-content: space-around;
                flex-direction: column;
                height: 100%;

            }
            #menu a
            {
                display: flex;
                align-items: center;
                align-content: flex-start;
                justify-content: space-around;
                text-decoration: none;
                background-color: white;
                color: black;
                font-family: 'Roboto', sans-serif;
                width: 100%;
                height: 12.5%;
            }

            .text {
                text-align: left;
            }

            .icon{
                display: none !important;
            }

            .logo
            {
                display: none;
            }
            #menu a:hover
            {
                background-color: #391847;
                color: white;
            }

            #Logo
            {
                /* background-color: white !important;*/
            }

            #Logo img
            {
                width: 50%;
                height: auto;
            }
            #DashboardContent
            {
                width: 82%;
                
            }


            .topInfo {
              /*  background-color: antiquewhite;*/
                display: flex;
                justify-content: center;
              
            }
            
            .topInfo img {
                /*margin-left: 15%;*/
                align-content: center;
                
            }

            .dbProfile {
               /* background-color: aliceblue;*/
                width: 100%;
                
                box-sizing: border-box;             
                display: flex;
                justify-content: space-around;
                flex-direction: column;
            }

            .infoHold {
                display: flex;
                flex-direction: column;
                justify-content: space-around;     
              /*background-color: pink;*/
                height: 60vh;
                align-items: center;
                align-content: center;
            }

            .realInfo {
                display: flex;
                flex-direction: column;
                width: 70%;
                height: auto;
                
            }

            .infoContainer h2 {
                font-family: 'Patua One', cursive;
                font-weight: normal;
                text-align: left;
            }

            .infoContainer {
                width: 100%;
                
                display: flex;
                flex-direction: column; 
                justify-content: space-around;
               /* border: 1px solid black;*/
                box-sizing: border-box;
                border-radius: 10px;
                text-align: left;
           
            }

            .info {
                background-color: #faf3f3;
                display: flex;
                box-sizing: border-box;
                border: 1px solid black;
               /* padding: 2px 2px 4px 2px;*/
                padding: 2px;
              /*  border: 1px solid aliceblue;*/
            }

            .infoTitle {
                display: flex;
               /*justify-content: flex-start;*/
               
            }

            .infoTitle h2 {
                font-family: 'Patua One', cursive;
                font-size: clamp(25px, 80%, 30px);
                letter-spacing: 0.1em;
                color: #B6922E;
                text-align: left;
            }

            .info h3 {
                background-color: #B5A8BA;
                font-family: 'Roboto', sans-serif;
                font-size: clamp(15px, 80%, 25px);
                letter-spacing: 0.1em;
                font-weight: normal;
                padding: 5px;
                width: 20%;
                text-align: left;
                color: white;
            }

            .details{
                font-family: 'Roboto', sans-serif;
                font-size: clamp(15px, 80%, 25px);
                padding: 5px;
                width: 20%;
                text-align: left;
                
            }
            
            .inputs {
                font-family: 'Roboto', sans-serif;
                font-size: clamp(15px, 80%, 25px);
                padding: 5px;
                width: 80%;
                text-align: left;
            }
            
            #payment {
                width: 100%;
            }

            #button {
                background-color: #B5A8BA;
                border: none;
                color: white;
                padding: 10px 30px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: clamp(15px, 80%, 20px);
                cursor: pointer;
                font-family: 'Roboto', sans-serif;
                
                
            }
            
            #apply {
                background-color: #B5A8BA;
                border: none;
                color: white;
                padding: 10px 30px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: clamp(15px, 80%, 20px);
                cursor: pointer;
                font-family: 'Roboto', sans-serif;
                
                align-content: flex-start;
                width: 150px !important;
            }
            
            form
            {
            
                flex-direction: column;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: space-around;
               
            }
            
           
            
            @media only screen and (max-width: 1024px)
            {
                header {
                    background-color: #391847;
                }

                #DashboardBody
                {
                    flex-direction: column;
                    width: 100%;
                    background-color: white;
                    min-height: 100vh;
                }

                #menu
                {
                    flex-direction: row;
                    min-width: 100%;
                    max-height: 70px;
                    min-height: 50px;
                }

                #Logo {
                    width: 12.5%;
                    height: 100%;
                }

                #menu a
                {
                    width: 12.5%;
                    height: 100%;
                    font-size: clamp(5px, 80%, 20px);
                    color: black;
                }

                #menu a:hover {
                    background-color: #B5A8BA;
                    color: #391847;      
                }

                #DashboardContent
                {
                    width: 100%;
                    height: 100vh;
                    
                  
                }   
                
                form
                {
                    height: 100%;
                }
            }

            @media only screen and (max-width: 850px)
            {
                header {
                    background-color: white !important;
                }
                .label
                {
                    display: none;
                }

                #welcome
                {
                    font-size: clamp(8px, 100%,30px);
                }

                .logo
                {
                    width: 100%;
                    height: auto;
                    display: block !important;
                }

                .logo img
                {
                    width: 150px;
                }

                /* #menu a
                 {
                     width: 14.28%;
                     height: 100%;
                     font-size: clamp(5px, 80%, 20px);
                 }*/
                #Logo
                {
                    display: none !important;
                }
            
                #menu a {
                    display: none;
                }

                .icon {
                    display: block !important;
                }

                .icon i{
                    font-size: clamp(20px, 100%, 30px);
                    vertical-align: middle;
                    height: 100%;
                    width: 100%;
                    padding: auto;
                    color: black;
                    padding-top: 15px;
                }

                .icon {
                    display: flex;
                    text-align: center;
                    justify-content: space-around;
                    align-items: center;
                    align-content: center;
                    vertical-align: middle;
                }
                
                .info h3{
                    width: 35%;
                }
                
                .inputs {
                    width: 70%;
                }
                
                .infoHold
                {
                    font-size: 10px;
                }
                
                .infoTitle h2 {
                   
                    font-size: clamp(15px, 80%, 30px);
                   
                }

                .info h3 {
                   
                    font-size: clamp(10px, 80%, 25px);
                   
                }

                .details{
                    
                    font-size: clamp(10px, 80%, 25px);
                  

                }

                .inputs {
                  
                    font-size: clamp(10px, 80%, 25px);
                }
                
               
            }
            
            @media only screen and (max-height: 800px)
            {
               #boy
               {
                  width: 150px !important;
                  height: 150px !important; 
               }
            }
         
        </style>
    </head>
    <body>

        <header style = "height: 45px; background-color: #391847;  color: white;">

            <div>

                <p class = "label" id = "welcome"><%= getServletContext().getInitParameter("header")%></p> 
                <p class = "logo"><img  alt =" header logo" src ="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/logo_rectangle_transparent.png"></p>
            </div>
        </header>

        <div id = "DashboardBody"> 
            <div id = "menu" style ="width: 18%;">
                <div id = "Logo"><img  alt =" header logo" src ="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/logo_transparent.png"></div>
                <a class="text" href = "MyDashboard">Dashboard</a>
                <a class="icon" href= "MyDashboard"><i class="fa fa-bandcamp"></i></a>

                <a class="text" href = "MyProfile">PROFILE</a>
                <a class="icon" href = "MyProfile"><i class="fa fa-user-circle-o"></i></a>

                <a class="text" href = "MyCourses">COURSES</a>
                <a class="icon" href = "MyCourses"><i class="fa fa-list"></i></a>

                <a class="text" href = "MyResources">RESOURCES</a>
                <a class="icon" href = "MyResources"><i class="fa fa-file-text"></i></a>

                <a class="text" href = "ChangeMyPassword">CHANGE PASSWORD</a>
                <a class="icon" href = "ChangeMyPassword"><i class="fa fa-unlock-alt"></i></a>

                <a class="text" href = "/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/EruditioHome">HOME</a>
                <a class="icon" href = "/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/EruditioHome"><i class="fa fa-home"></i></a>

                <a class="text" href = "SeeYouAgain">LOG OUT</a>
                <a class="icon" href = "SeeYouAgain"><i class="fa fa-sign-out"></i></a>
            </div>

            <div id = "DashboardContent">
                <form action = "UpdateInfo" method = "POST">
                    <div class="topInfo">
                        <img id = "boy" alt="Little boy with red cap" src="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/yellow3.JPG" style="width: 180px; height: 180px; border-radius: 50%">
                        <!--<h1>Personal Information</h1>-->
                    </div>
                    <div class="dbProfile">
                        <div class="infoHold">
                                <div class="realInfo">
                                    <div class="infoTitle">
                                        <h2>Basic Information</h2>
                                    </div>
                                    <div class="infoContainer">       
                                        <div class="info">
                                            <h3>Given Name</h3>
                                            <p class="details"><%= record.getString("given_name")%></p>
                                            <input name = "changeGivenName" type = "text" class = "inputs" style = "display: none;" required>
                                        </div>
                                        <div class="info">
                                            <h3>Middle Name</h3>
                                            <p class="details"><%= record.getString("middle_name")%></p>
                                            <input name = "changeMiddleName" type = "text" class = "inputs" style = "display: none;" required>
                                        </div>
                                        <div class="info">
                                            <h3>Last Name</h3>
                                            <p class="details"><%= record.getString("last_name")%></p>
                                            <input name = "changeLastName" type = "text" class = "inputs" style = "display: none;" required>
                                        </div>
                                        <div class="info">
                                            <h3>Birthdate</h3>
                                            <p class="details"><%= record.getString("birthdate")%></p>
                                            <input name = "changeBirthday" type = "date" class = "inputs" style = "display: none;" required>
                                        </div>
                                    </div>
                                </div>
                            
                                <div class="realInfo">
                                    <div class="infoTitle">
                                        <h2>Contact Information</h2>
                                    </div>
                                    <div class="infoContainer">
                                        <div class="info">
                                            <h3>Email</h3>
                                            <p class="details"><%= record.getString("email")%></p>
                                            <input name = "changeEmail" type = "email" class = "inputs" style = "display: none;" required>
                                        </div>
                                        <div class="info">
                                            <h3>Contact</h3>
                                            <p class="details"><%= record.getString("contact_number")%></p>
                                            <input name = "changeNumber" type = "number" class = "inputs" style = "display: none;" required>
                                        </div>    
                                    </div>
                                </div>
                                <div class="realInfo">
                                    <div class="infoTitle">
                                        <h2>Preferred Payment Option</h2>
                                    </div>
                                    <%
                                        RegistrationModel eruditioR = (RegistrationModel) getServletContext().getAttribute("registration");
                                        ArrayList<String> payments = eruditioR.getPayments();          
                                    %>
                                    <div class="infoContainer">
                                        <div class="info">
                                            <p class="details"><%= record.getString("payment")%></p>
                                            <select id="payment" name="changePayment" class = "inputs" style = "display: none;">
                                                <%
                                                    for (int i = 0; i < payments.size(); i++)
                                                    {
                                                        String s = String.format("<option value=%s>%s</option>",payments.get(i),payments.get(i));
                                                        out.println(s);
                                                    }
                                                %>
                                            </select>
                                        </div>

                                    </div>
                                </div>
                            

                        </div>
                    </div>
                    
                        <p style ="font-family: 'Roboto', sans-serif;">
                            <% String changeMessage = "";
                                if (session.getAttribute("changeMessage") != null) {
                                    changeMessage = (String) session.getAttribute("changeMessage");
                                    session.removeAttribute("changeMessage");
                                }
                            %>
                            <%= changeMessage%> 
                        </p>
                        <div>
                        <a id = "button" onclick = edit() href = "#">Edit Profile</a>
                        <input type ="submit" value = "Apply Changes" id="apply" class = "inputs" style = "display: none;">
                        </div>
                </form>    
            </div>
        </div>


        <footer style = "height: 20px; background-color: #391847; padding: 10px;">
            <p>&#169 <%= getServletContext().getInitParameter("footer")%></p>
        </footer>
    </body>
</html>
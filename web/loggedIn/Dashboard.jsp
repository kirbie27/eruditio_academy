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


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&family=Roboto&display=swap" rel="stylesheet">
        <title>Eruditio Dashboard</title>

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
                margin-top: .3%;
            }

            #DashboardBody
            {
                height: 100vh;
                display: flex;
                text-align: center;
                background-color: white;
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
                /*background-color: white !important; */
            }

            #Logo img
            {
                width: 50%;
                height: auto;
            }
            #DashboardContent
            {
                width: 82%;
                background-color: white;
            }
            .dboardWelcome {
                height: 20%;
                padding-left: 7%;
                
            }

            .dboardWelcome h1 {
                font-family: 'Patua One', cursive;
                font-weight: normal;
                font-size: clamp(60px, 80%, 30px);
                text-align: left !important;
                padding-top: 4%;
                color: #B6922E;

            }

            .dboardWelcome h2 {
                font-family: 'Roboto', sans-serif;
                font-weight: normal;
                font-size: clamp(15px, 80%, 20px);
                text-align: left !important;
                color: #8B8A8A;
            }

            .dbSched {
               
                height: 80%;
                width: 100%;
                box-sizing: border-box;
                padding: 5%;
                display: flex;
                justify-content: space-around;
                flex-direction: column;
            }

            .sched {
                width: 100%;
                background-color: #B5A8BA;
                display: flex;
                flex-direction: row; 
                justify-content: space-between;
                height: 25%;
                border: 1px solid #faf3f3;
                box-sizing: border-box;
                border-radius: 10px;
                margin-bottom: 1%;
              /*  padding-top: 2%;
                padding-left: 2%;*/
              align-items: center;
                padding-left: 25px;
                padding-right: 25px;
            }

            .sched:hover {
                background-color: #faf3f3;
                border: 1px solid #faf3f3;
            }

            .subject {
                display: flex;
                flex-direction: row;
                justify-content: flex-start;
                width: 70%;
            }

            .iconSub {
                margin-right: 5%;
                min-width: 50px;
            }

            .iconSub h2 {
                font-weight: normal;
                font-family: 'Patua One', cursive;
                border: 1px solid #0A2351;
                background-color: #0A2351;
                border-radius: 10px;
                padding: 10%;
                color: white;
                font-size: clamp(25px, 80%, 30px);
            }

            .daySub {
                display: flex;
                flex-direction: column; 
                padding-left: 2%;
                min-width: 200px;
            }

            .daySub h1 {
                font-family: 'Roboto', sans-serif !important;
                font-size: clamp(10px, 80%, 20px) !important;
                letter-spacing: 0.1em;
                font-weight: normal;              
                text-align: left;

            }

            .daySub p {
                font-family: 'Patua One', cursive;
                font-size: clamp(20px, 80%, 20px);
                text-align: left;
                padding-top: 1%;
                color: #0A2351;
            }

            .teacherSub {
                /*padding-right: 3%;*/
               
                width: 30%;
            }

            .teacherSub p {
                font-family: 'Roboto', sans-serif;
                letter-spacing: 0.1em;
            }
                  
            @media only screen and (max-width: 1024px)
            {
                header {
                    background-color: #391847;
                }
                header div p {
                    font-size: clamp(10px, 80%, 20px);
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
                    min-height: 50px;
                    max-height: 70px;
                }
                
                
                #Logo {
                    width: 12.5%;
                    height: 100%;
                }
                
                
                .logo img {
                    width: 150px;
                }

               #menu a
                {
                    width: 12.5%;
                    height: 100%;
                    font-size: clamp(15px, 80%, 20px);
                    color: black;
                }
                
                #menu a:hover {
                    background-color: #B5A8BA;
                    color: #391847;      
                }

                #DashboardContent
                {
                    width: 100%;
                    height: 93%;
                }
                
                .sched {
                    height: 15%;
                }
                
                .daySub h1 {
                    font-size: clamp(25px, 80%, 30px);
                }
                
                .daySub p {
                    font-size: clamp(20px, 80%, 30px);
                }
                
                .dboardWelcome h1 {
                    font-size: clamp(50px, 80%, 60px);
                }
                
                .dboardWelcome h2 {
                    font-size: clamp(25px, 80%, 30px);
                }
                
                .dbSched {
                    padding-top: 0;
                }
                
                .iconSub h2 {
                    font-size: clamp(30px, 80%, 40px);
                    padding: 5%;
                }
                
                .teacherSub {
                    font-size: clamp(15px, 80%, 20px);
                }
                
                footer p {
                    font-size: clamp(15px, 80%, 20px);
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
                
                #menu a {
                    display: none;
                }
                
                .icon {
                    display: block !important;
                }

                #Logo
                {
                    display: none !important;
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
                
                .dboardWelcome h1 {
                    font-size: clamp(40px, 80%, 50px);
                }
                
                .dboardWelcome h2 {
                    font-size: clamp(25px, 80%, 30px);
                }
                
                .iconSub {
                    font-size: clamp(15px, 80%, 20px);
                }
                
                .daySub h1 {
                    font-size: clamp(20px, 80%, 25px);
                }
                
                .daySub p {
                    font-size: clamp(15px, 80%, 30px);
                }
                
                .teacherSub p {
                    font-size: clamp(13px, 50%, 20px);
                    
                }
                .teacherSub {
                   
                }
                
                .sched {
                    padding-left: 5px;
                    padding-right: 5px;
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
                <div class="dboardWelcome">
                    <h1>Hello, <%= (String) session.getAttribute("loggedInUser")%> </h1>  
                    <h2><%= (String) session.getAttribute("loggedInRole")%> </h2>   
                </div>
                <div class="dbSched">         
                    <div class="sched">
                        <div class="subject">
                            <div class="iconSub">
                                <h2>SW</h2>
                            </div>
                            <div class="daySub">
                                <h1>MONDAY 1AM-2AM</h1>
                                <p>Smart Writer<p>
                            </div>
                        </div>    
                        <div class="teacherSub">
                            <p>Teacher's Name</p>
                        </div>
                    </div>

                    <div class="sched">
                        <div class="subject">
                            <div class="iconSub">
                                <h2>C</h2>
                            </div>
                            <div class="daySub">
                                <h1>TUESDAY 2AM-3AM</h1>
                                <p>Compass</p>
                            </div>
                        </div>
                        <div class="teacherSub">
                            <p>Teacher's Name</p>
                        </div>
                    </div>

                    <div class="sched">
                        <div class="subject">
                            <div class="iconSub">
                                <h2>IR</h2>
                            </div>
                            <div class="daySub">
                                <h1>WEDNESDAY 3AM-4AM</h1>
                                <p>Instant Reader<p>
                            </div>
                        </div>

                        <div class="teacherSub">
                            <p>Teacher's Name</p>
                        </div>
                    </div>

                    <div class="sched">
                        <div class="subject">
                            <div class="iconSub">
                                <h2>CK</h2>
                            </div>
                            <div class="daySub">
                                <h1>THURSDAY 4AM-5AM</h1>
                                <p>Coding for Kids</p>
                            </div>
                        </div>

                        <div class="teacherSub">
                            <p>Teacher's Name</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <footer style = "height: 20px; background-color: #391847; padding: 10px;"> 
        <p>&#169 <%= getServletContext().getInitParameter("footer")%></p>
    </footer>

</body>
</html>
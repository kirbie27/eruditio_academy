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
        <link href="../css/DashboardMenu.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&family=Roboto&display=swap" rel="stylesheet">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <title>Eruditio Dashboard</title>

        <style>
            #DashboardContent 
            {
               
                display: flex;
                align-items: center;
                justify-content: space-around;
                flex-wrap: wrap;
            }
            .gallery 
            {
                border: none;
                width: 450px;
                height: 310px;
            }
            
            .gallery img 
            {
                max-width: 100%;
                height: auto;
            }

            .desc 
            {
                display: flex;
                align-items: center;
                justify-content: space-around; 
            }
            
            .downloadButton
            {
                background-color: white;
                text-decoration: none;
                display: block;
                width: 100%;
                color: white;
                font-weight: 700;
                border: none;
                padding: 11px;
                border-radius: 8px;
                font-size: 0.75rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                cursor: pointer;
                color: black;
                border: 1px solid black;
            }
            
            .downloadButton:hover
            {
                background: #0A2351 !important;
                color: white;
                border: none !important;
                transition: 0.3s ease-out;
            }
            
            @media only screen and (max-width: 1024px)
            {
               
                #DashboardBody
                {
                    flex-direction: column;
                    width: 100%;
                    background-color: white;
                    min-height: 100vh;
                }

                #DashboardContent
                {
                    width: 100%;
                    height: 93%;
                }
                #menu a 
                {
                    display: none;
                }

            }



        </style>
    </head>
    <body>

          <header style = "height: 45px; background-color: #391847; color: white;">

            <div class="HeaderContainer">
                <div class="contextHeader">
                   <p class = "label" id = "welcome"><%= getServletContext().getInitParameter("header") %>
                   <p class = "logo"><img  alt =" header logo" src ="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/logo_rectangle_transparent.png"></p>
                </div>
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
                <div class="gallery">                  
                    <img src="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/EruditioPDF_logo.png" alt="Cinque Terre" width="600" height="400"> 
                    <div class="desc">
                        <a class = "downloadButton" target="_blank" href="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/PDF/Eruditio_Profile for website.pdf">
                            Know more about Eruditio
                        </a>     
                    </div>
                </div>
                
                <div class="gallery">                  
                    <img src="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/Eruditio_OffProgram.png" alt="Cinque Terre" width="600" height="400"> 
                    <div class="desc">
                        <a class = "downloadButton" target="_blank" href="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/PDF/Eruditio Off Gadgets Program Flyer.pdf">
                            Off Gadgets Courses
                        </a>     
                    </div>
                </div>


                <form class="gallery" action="EruditioDownloadables" target = "_blank" method="POST">                  
                    <img src="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/Eruditio_MyData.png" alt="Northern Lights" width="600" height="400">
                    <div class="desc">

                        <button class="downloadButton" type="submit" name="GuestButton" value="guest">Download Record</button>
                    </div>        
                </form>
                
                <% if (session.getAttribute("loggedInRole").equals("Admin")) { %>
                    <form class="gallery" action="EruditioDownloadables" target = "_blank" method="POST">                
                        <img src="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/Eruditio_AllData.png" alt="Mountains" width="600" height="400">
                        <div class="desc">
                            <button class="downloadButton" type="submit" name="AdminButton" value="admin">Download All Records</button>
                        </div>
              
                    </form>
                <% }%>
                
            </div>
        </div>




    </div>
    <footer style = "height: 20px; background-color: #391847; padding: 10px;"> 
        <p>&#169 <%= getServletContext().getInitParameter("footer")%></p>
    </footer>

</body>
</html>
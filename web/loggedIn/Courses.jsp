<%@page import="eruditio.models.Programs"%>
<%@page import="eruditio.models.ProgramList"%>
<%@page import="java.util.*;"%>
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
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&family=Roboto&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&family=Roboto&display=swap" rel="stylesheet">
      
        <title>Eruditio Dashboard</title>

        <style>


            #DashboardContent
            {
              width: 82%;      
              display: flex;
              align-items: center;
              justify-content: space-around;
              flex-wrap: wrap;
              overflow: scroll;
              
            }
  
            
          


        </style>

        
        <!-- STYLES FOR HOVER IMAGE COURSES -->
        <style>
            .container
            {   
              width: 320px;
              height: 320px;
              margin: 20px;
              border-radius: 50%;
              border: 3px solid black;
            }

            .container img 
            {
                display: block;         
                width: 100%;
                height: 100%;
               
            }

            .overlay 
            {
                width: 100%;
                height: 100%;
                display: none;
                border-radius: 50%;
                background-color: #B5A8BA;
                align-items: center;
                justify-content: space-around;
                text-align: justify;
                transition: 0.3s linear; 
                
           }
           
           .texts
           {
               font-size: 22px;
               width: 100%;
               display: flex;
               
               flex-direction: column;
               align-items: center;
               padding: 10px;
               justify-content: space-around;
               
           }
           
           .texts p
           {
               text-align: center;
               margin-bottom: 10px;
           }
           
            
            .container:hover img
            {
                display: none;
                
            }
            
            .container:hover .overlay
            {
                display: flex;
                
            }
            .button
            {
                text-decoration: none;
                display: block;
                width: 50%;
                background: white !important;
                font-weight: 700;
                border: none;
                padding: 1rem;
                border-radius: 8px;
                font-size: 0.75rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                background-color: gold;
                font-family: 'Patua One', cursive; 
                color:black;
                cursor: pointer;
            }

            .button:hover
            {
                background: #391847 !important;
                color: white;
                transition: 0.3s ease-out;
            }

            #paymentModal
            {
                position: fixed; /* Stay in place */

                display: none;
                height: 100%;
                width: 100%;

                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                -webkit-animation-name: fadeIn; /* Fade in the background */
                -webkit-animation-duration: 0.4s;
                animation-name: fadeIn;
                animation-duration: 0.4s
            }

            .mContent
            {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                -webkit-animation-name: slideIn;
                -webkit-animation-duration: 0.4s;
                animation-name: slideIn;
                animation-duration: 0.4s
            }

            .mContent img
            {
                border-radius: 8px;
            }

            .close
            {
              position: absolute;
              color: black;
              float: right;
              font-size: 28px;
              font-weight: bold;
              right: 10px;
            }

        .close:hover, .close:focus 
        {
          color: red;
          text-decoration: none;
          cursor: pointer;
        }
        
        @-webkit-keyframes slideIn 
        {
            from {bottom: -300px; opacity: 0} 
            to {bottom: 0; opacity: 1}
        }

        @keyframes slideIn 
        {
            from {bottom: -300px; opacity: 0}
            to {bottom: 0; opacity: 1}
        }

        @-webkit-keyframes fadeIn 
        {
            from {opacity: 0} 
            to {opacity: 1}
        }

        @keyframes fadeIn 
        {
            from {opacity: 0} 
            to {opacity: 1}
        }
        </style>
        
        <script>
    
            function openModal()
            {
                var modal = document.getElementById("paymentModal");
                modal.style.display = "block";
                
            }
            
            function closeModal()
            {
                
                var modal = document.getElementById("paymentModal");
                modal.style.display = "none";
            }
            
            window.onclick = function(event) 
            {
                var modal = document.getElementById("paymentModal");
                if (event.target == modal) 
                {
                  modal.style.display = "none";
                }
            }
 
        </script>
        <link href="../css/DashboardMenu.css" rel="stylesheet" type="text/css"/>
    
            
    </head>
    <body>
        <div id = "paymentModal" class = "modal">
              <div class ="mContent">
                  <span onclick = "closeModal()" class ="close">&times;</span>
                  <img src = "/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/payment.png">
              </div>
        </div>
        
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

            
            <div id = "DashboardContent" style = "background-color: white;">                 
                <%
                    ProgramList pl = (ProgramList) getServletContext().getAttribute("programList");
                    ArrayList<Programs> list = pl.getProgramList();
                    for (int i = 0; i < list.size(); i++)
                    {
                        Programs current = list.get(i);
                        String s = String.format("<div class = 'container'>\n <img alt = %s src = %s>\n<div class = 'overlay'>\n<div class = 'texts'>\n<p>%s</p>\n"
                                + "<a onclick = 'openModal()' class = 'button'>Enroll Now!</a>\n</div>\n</div>\n</div>"
                                ,current.getProgramTitle(),current.getCirclePic(), current.getProgramDescription());
                        out.println(s);
                    }
                %>
            </div>
        </div>
        
        <footer style = "height: 20px; background-color: #391847; padding: 10px; "> 
            <p > &#169 <%= getServletContext().getInitParameter("footer") %></p>
        </footer>


    </body>
</html>
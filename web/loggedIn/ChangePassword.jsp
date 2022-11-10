<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
 
    //clears cache so that if session is already destroyed then user won't be able to go 
    //back to the success page
    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expire", 0);
 
   if (session.getAttribute("loggedInUser") == null)
   {
        response.sendRedirect("/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/errorSession.jsp");
   }
 
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/f65a9886dd.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&family=Roboto&display=swap" rel="stylesheet">
        <title>Eruditio Dashboard</title>
        
        <style>
             :root
            {
                font-size: 100%;
                font-size: 16px;
                line-height: 1.5;
            }
            ::-webkit-scrollbar
            {
                display: none;
            }
            body
            {
                margin: 0;
                padding: 0;
                font-family: 'Roboto', sans-serif;;
                font-weight: 500;
            }
            
            h1
            {
                font-size: clamp(30px, 100%, 50px);
                font-weight: 700;
            }
            
            h2
            {
                font-size: 1.5rem;
                font-weight: 700;
            }
            *
            {
                margin: 0px;
                padding: 0px;
                text-align: center;
            }
          
            header div 
            {
                 line-height: normal;
                display: flex;  
                align-items: center;
                justify-content: space-around;
                height: 100%;
                
            }
            header div p 
            {
                display: block;
                font-size: clamp(8px, 100%,20px);
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
            
            #DashboardBody
            {
                height: 90vh;
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
                line-height: normal;
            }
            #menu a
            {
               display: flex;
               align-items: center;
               justify-content: space-around;
               text-decoration: none;
               background-color: white;
               color: black;
               
               width: 100%;
               height: 12.5%;
   
            }
            
         
            label
            {
                display: block;
                margin-bottom: 0.5rem;
                font-size: 0.75;
            }
            .logo
            {
                display: none;
            }
            #menu a:hover
            {
               background-color: black;
               color: white;
            }
            
            #Logo
            {
               background-color: white !important;
             
               
            }
              
            form input[type = "text"], form input[type = "password"]
            {

                display: block;
                width: 100%;
                box-sizing: border-box;
                border-radius: 8px;
                border: 1px solid #c4c4c4;
                padding: 1em;
                margin-bottom: 1.5rem;
                font-size: 0.875rem;
            }
            
            form label
            {
                margin-left: 10px;
                text-align: left;
                margin-bottom: 1.2rem;
            }
            #changeButton
            {
                display: block;
                width: 100%;
                background: #B5A8BA;
                color: white;
                font-weight: 700;
                border: none;
                padding: 1rem;
                border-radius: 8px;
                font-size: 0.75rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                cursor: pointer;
                color: black;
            }
            
         
            #DashboardContent
            {
                display: flex;
                justify-content: center;
                align-items: center;
                box-sizing: border-box;
                padding: 10px;
            }
            
            #DashboardContent form
            {
                width: 350px;
                padding: 15px;
                background-color: #391847;
                border-radius: 8px;
            }
             
            .user-box
             {
                 position: relative;
             }
             
            
             .user-box i
             {
                position: absolute;
                top: 60px;
                right: 15px;
                color: black;
                cursor: pointer;
                
             }
              
            #Logo img
            {
                width: 100%;
                height: auto;
            }
            #DashboardContent
            {
                width: 82%;
                background-color: white;
            }
            
            #DashboardContent form
            {
               
                box-shadow:-5px 5px lightcyan;
                background-color: #391847;
                color: white;
                transition: 0.3s linear;
            }
            
             #DashboardContent form:hover
            {
               transform: scale(1.2);
               
            }
            
       
            
            #changeButton:hover
            {
                background: #B6922E !important;
                color: white;
                transition: 0.3s ease-out;
            }
            
            
            @media only screen and (max-width: 1024px)
            {
                
                #DashboardBody
                 {
                    flex-direction: column;
                    width: 100%;
                    
                 }
                         
                 #menu
                 {
                    flex-direction: row;
                    min-width: 100%;
                   
                    max-height: 70px;
                    min-height: 50px;
                 }
               
                 
                 #menu a
                 {
                     width: 12.5%;
                     height: 100%;
                     font-size: clamp(5px, 80%, 20px);
                 }
                 
           
                 #DashboardContent
                 {
                     width: 100%;
                     height: 93%;
                 }  
                 
         
                
            }
            
            @media only screen and (max-width: 850px)
            {
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
                    width: 200px;
                }
                
                #menu a
                {
                    width: 14.28%;
                    height: 100%;
                    font-size: clamp(5px, 80%, 20px);
                }

                #Logo
                {
                    display: none !important;
                }
                
                 #DashboardContent form:hover
                {
                   transform: scale(1);

                }
                
                
            }    
        </style>
        <link href="../css/DashboardMenu.css" rel="stylesheet" type="text/css"/>
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
           
            <div id = "DashboardContent" style ="background-color: white;">
                
                <form method = "POST" action = "ChangePassword">
                  
                    <section class = "copy">
                        <div>
                            <h1 style = "font-family: 'Patua One', cursive; font-size: 20px;">CHANGE PASSWORD HERE</h1>
                        </div>
                    </section>  
                    
                    <div class="user-box">
                        <label for = "oldpwordC">Old Password</label>
                        <input id = "changePassword" name = "oldpwordC" type = "password" placeholder = "Enter old password" required>
                        <i class="far fa-eye" id="cPassword"></i>
                    </div>
                    <script src="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/js/changeToggle.js"></script>
                    <div class="user-box">
                        <label for = "newpwordC">New Password</label>
                        <input id = "changePassword2" name = "newpwordC" type = "password" placeholder = "Enter New password" required>
                        <i class="far fa-eye" id="cPassword2"></i>
                    </div>
                    <script src="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/js/changeToggle2.js"></script>
                    <div class="user-box">
                        <label for = "newpwordC2">Confirm New Password</label>
                        <input id = "changePassword3" name = "newpwordC2" type = "password" placeholder = "Enter Password again" required>
                        <i class="far fa-eye" id="cPassword3"></i>
                    </div>
                    <script src="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/js/changeToggle3.js"></script>
                    <%
                        String changePasswordMessage = "";
                        if (session.getAttribute("ChangePasswordMessage") != null)
                        {
                            changePasswordMessage = (String) session.getAttribute("ChangePasswordMessage");
                            session.removeAttribute("ChangePasswordMessage");
                        }
                    %>
                    <p> <%= changePasswordMessage %> </p>
                    
                    <section class = "copy">
                        <div>
                            <input id ="changeButton" type ="submit" value = "Change Password">
                        </div>
                    </section>  
                    
                   
                </form>
            </div>
        
        </div>
                    
    <footer style = "height: 20px; background-color: #391847; padding: 10px;"> 
        <p>&#169 <%= getServletContext().getInitParameter("footer")%></p>
    </footer>
    
    </body>
</html>

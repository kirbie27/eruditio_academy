<%
 
    //clears cache so that if session is already destroyed then user won't be able to go 
    //back to the success page
    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expire", 0);
 
    session.removeAttribute("registering");
    if (session.getAttribute("loggedInUser") != null)
    {
         response.sendRedirect("loggedIn/Dashboard.jsp");
    }
 
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&family=Roboto&display=swap" rel="stylesheet">
        <title>Login to Eruditio</title>
        <!--<link rel="stylesheet" href="css/loginCSS.css"/> -->

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
                font-family: 'Roboto', sans-serif;
                font-weight: 500;
            }
            
            h1
            {
                font-size: 2.25rem;
                font-weight: 700;
            }
            
            h2
            {
                font-size: 1.5rem;
                font-weight: 700;
            }
            
            #loginBox
            {
                display: flex;
                flex-direction: column;
                width: 100%;
                height: 100vh;
                background-color: #FFE4E1;
            }
            
            #err
            {
                text-align: center;
            }
            .left
            {
                height: 200px;
                background-color: pink;
                background: linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.5)),url('Assets/Pictures/stock3-antonsukhinov.jpg');
                background-size: cover;
 
                
                
            }
            
            .right
            {
                background-color: #FAF0E6;
               
            }
            
            .left, .right
            {
                display: flex;
                justify-content: center;
                align-items: center;
                box-sizing: border-box;
                padding: 10px;
                
            }
            
            .left .copy
            {
                color: white;
                text-align: center;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }
            
            .left p
            {
                font-weight: 400;
            }
            
            .right .copy
            {
                color: black;
                text-align: center;
            }
            
            .right .copy p
            {
                margin: 1.5em 0;
                font-size: 0.875rem;
            }
            
            .content
            {
                color: white;
            }
            .right form
            {
                width: 350px;
                
            }
          
            #desc
            {
              
                background-color: none;
                padding: 5px;
                box-shadow: none;
                color: white;
                border-radius: 8px;
                
            }
            
            #desc h2
            {
                font-family: 'Patua One', cursive;
                font-weight: normal;
                
                font-size: clamp(15px, 1.5em, 40px)
            }
            
            #desc p
            {
                line-height: 1 !important;
                font-famiy: 'Roboto', sans-serif;
                font-size: clamp(15px, 1em, 30px)
              
            }
            

            
            form input[type = "text"], form input[type = "password"]
            {
                display: block;
                width: 100%;
                box-sizing: border-box;
                border-radius: 8px;
                border: 1px solid #c4c4c4;
                padding: 1em;
                margin-bottom: 1.25rem;
                font-size: 0.875rem;
            }
            
            form input[type = "submit"]
            {
                cursor: pointer;
            }
            
            label
            {
                display: block;
                margin-bottom: 0.5rem;
                font-size: 0.75;
            }
            
            #containerPass
            {
                position: relative;
            }
            
            #containerPass i
            {
                position: absolute;
                top: 45px;
                right: 15px;
            }
            
            #loginButton
            {
                display: block;
                width: 100%;
                background: #391847;
                color: white;
                font-weight: 700;
                border: none;
                padding: 1rem;
                border-radius: 8px;
                font-size: 0.75rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }
            
            #loginButton:hover
            {
                background: gold;
                color: black;
                transition: 0.3s ease-out;
            }
            
            @media screen and (min-width: 900px)
            {
                #loginBox
                {
                    flex-direction: row;
                    height: 100vh;
                    width: 100%;
                }
                
                .left, .right
                {
                    display: flex;
                    width: 50%;
                    height: auto;   
                }
                
                #desc
                {
                    padding: 10px;
                    color: white;
                    border-radius: 8px;
                }
                #desc h2
                {
                    
                    font-size: clamp(15px, 3em, 30px)
                }
            
                #desc p
                {
                  
                    font-size: clamp(15px, 1em, 30px)

                }
                
            }
            
            
        </style>

 
    </head>

    <body>


        <div id = "loginBox">  
            
            <div class = "left">
                <section class = "content" class = "copy" id = "desc">
                    <h2><%= getServletContext().getInitParameter("header")%></h1>
                    <p>A comfortable place for learning</p>
                    <p>Bringing 21<sup>st</sup> Century Education to Every Home.</p>
                </section>
            </div>
            <div class = "right">
                <form action="LoggingIn" method = "POST">
                    
                    <section class = "copy">
                        <div>
                            <img alt ="header logo" src ="Assets/Pictures/logo_rectangle_transparent.png" style="max-width:350px;max-height:123px;">

                            <h2 style="color:#8B4513">Login</h2>
                        </div>
                    </section>    
                    
                    <div class="user-box">
                        <label for="uname" >Username:</label>
                        <input type="text"  name = "uname" type="text" placeholder ="Enter your username" required >
                    </div>

                    <div class="user-box" id = "containerPass">
                        <label for="pword" >Password:</label>
                        <input name = "pword" type="password" id="loginPassword" placeholder ="Enter your password" required>
                        <i class="far fa-eye" id="togglePassword"></i>
                    </div>
                    <script src="js/toggle.js"></script>
                    <p id = "err" style = "font-family: 'Roboto', sans-serif;">
                        <% String ErrorMessage = "";
                            if (session.getAttribute("ErrorMessageL") != null) {
                                ErrorMessage = (String) session.getAttribute("ErrorMessageL");
                                session.removeAttribute("ErrorMessageL");
                            }
                        %>
                        <%= ErrorMessage%> 
                    </p>

                    <section class = "copy">
                        <div>
                            <input id = "loginButton" type="submit" value = "Login"  ><br> <br><br>
                            <a href="RegisterToEruditio">Create an Account</a><br><br><br>
                            <a href="EruditioHome">Go back to Home Page</a>
                            <p>&#169 <%= getServletContext().getInitParameter("footer")%></p>
                        </div>
                    </section>
                        
                </form>
             </div>
                    
         </div>
    </body>

</html>

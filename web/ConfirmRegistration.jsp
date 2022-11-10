<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
 
    //clears cache so that if session is already destroyed then user won't be able to go 
    //back to the success page
    
    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expire", 0);
 
   if (session.getAttribute("registering") == null)
   {
        response.sendRedirect("RegisterToEruditio");
   }

   
 
    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <title>Register to Eruditio</title>
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
                font-family: 'Montserrat', sans-serif;
                font-weight: 500;
            }
            
            i
            {
                cursor: pointer;
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
            
            #registerBox
            {
                display: flex;
                flex-direction: column;
                width: 100%;
                min-height: 100vh;
                background-color: #FFE4E1;
            }
            
            .left
            {
                height: 200px;
                background-color: pink;
                background: linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.5)),url('Assets/Pictures/stock1-hopehouse.jpg');
                background-size: cover;
                background-position: center;
            }
            
            .right
            {
                background-color: #FFE4E1;
               
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
            
            .user-box p
            {
                border-bottom: 3px solid black;
            }
            .right form
            {
                width: 350px;
                
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
            
            .containerPass
            {
                position: relative;
            }
            
            .containerPass i
            {
                position: absolute;
                top: 41px;
                right: 15px;
            }
            
            #registerButton
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
                text-decoration: none;
            }
            
            #registerButton:hover
            {
                background:  #00cc33;
                color: white;
                transition: 0.3s ease-out;
            }
            
            #cancelButton
            {
                display: block;
                width: 100%;
                background: #391847;
                color: white;
                font-weight: 700;
                border: none;
                padding: 1rem;
                padding-left: 0px;
                padding-right: 0px;
                border-radius: 8px;
                font-size: 0.75rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                text-decoration: none;
            }
            #cancelButton:hover
            {
                background: red;
                color: white;
                transition: 0.3s ease-out;
            }
            
            @media screen and (min-width: 900px)
            {
                #registerBox
                {
                    flex-direction: row;
                    min-height: 100vh;
                    width: 100%;
                }
                
                .left, .right
                {
                    display: flex;
                    width: 50%;
                    height: auto;   
                }
                
            }
            
            
        </style>

 
    </head>

    <body>


        <div id = "registerBox">  
            
            <div class = "left">
                <section class = "content" class = "copy">
                    <h2><%= getServletContext().getInitParameter("header")%></h1>
                    <p>Are you ready to be a part of our family?</p>
                    
                </section>
            </div>
            <div class = "right">
                <form id = "Registration" method = "POST" action = "loggedIn/Success">
                    
                    <section class = "copy">
                        <div>
                            <img alt =" header logo" src ="Assets/Pictures/logo_rectangle_transparent.png" style="max-width:350px;max-height:123px;">
                            <h2 style="color:#8B4513">Registration Details</h2>
                        </div>
                    </section>
                    
                    <section class = "copy">
                        <div>
                            <h2 style="color:black">Role and Payment</h2>
                        </div>
                    </section> 
                    
                    <div class="user-box">
                        <label for="role">What are you applying as?</label>
                        <p><%= (String) session.getAttribute("role") %></p>
                    </div>
                    
                    <div class="user-box">
                        <label for="payment">What is your preferred payment option?</label>
                        <p><%= (String) session.getAttribute("payment") %></p>
                    </div>
                    
                    <section class = "copy">
                        <div>
                            <h2 style="color:black">Personal Details</h2>
                        </div>
                    </section> 
                    
                    <div class="user-box">
                        <label for="givenName" >Given Name</label>
                        <p><%= (String) session.getAttribute("givenName") %></p>
                    </div>
                    <div class="user-box">
                        <label for="middleName" >Middle Name</label>
                        <p><%= (String) session.getAttribute("middleName") %></p>
                    </div>
                    <div class="user-box">
                        <label for="lastName" >Last Name</label>
                        <p><%= (String) session.getAttribute("lastName") %></p>
                    </div>
                    <div class="user-box">
                        <label for="contactNumber" >Contact Number</label>
                        <p><%= (String) session.getAttribute("contactNumber") %></p>
                    </div>
                    <div class="user-box">
                        <label for="email" >Email</label>
                        <p><%= (String) session.getAttribute("email") %></p>
                    </div>
                    <div class="user-box">
                        <label for="birthday" >Birthdate</label>
                        <p><%= (String) session.getAttribute("birthday") %></p>
                    </div>
                    
                    <section class = "copy">
                        <div>
                            <h2 style="color:black">Account Details</h2>
                        </div>
                    </section>   
         
                    <div class="user-box">
                        <label for="uname" >Username</label>
                        <p><%= (String) session.getAttribute("unameR") %></p>
                    </div>

            
                    <section class = "copy">
                        <div>
                            <input  id = "registerButton" type = "submit" value = "Confirm Registration"><br>
                            <a id = "cancelButton" href="RegisterToEruditio">Cancel Registration</a><br>
                           
                            <a href="EruditioHome">Go back to Home Page</a>
                            
                            <p>&#169 <%= getServletContext().getInitParameter("footer")%></p>
                        </div>
                    </section>
                        
                </form>
             </div>
                    
         </div>
    </body>

</html>
<%@page import="eruditio.models.AccountDetails"%>
<%@page import="eruditio.models.PersonalDetails"%>
<%@page import="eruditio.models.RegistrationModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&family=Roboto&display=swap" rel="stylesheet">
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
                font-family: 'Roboto', sans-serif;
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
                background-position:  center;
            }
            
            .right
            {
                background-color: #FFF0F5;
               
            }
            
            .left, .right
            {
                display: flex;
                justify-content: center;
                align-items: center;
                box-sizing: border-box;
                padding: 10px;
                
            }
            
            #err
            {
                text-align: center;
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
              
            form input[type = "text"], form input[type = "password"], form input[type = "date"], form input[type = "email"], form input[type = "number"], form select
            {
                display: block;
                width: 100%;
                box-sizing: border-box;
                border-radius: 8px;
                border: 1px solid #c4c4c4;
                padding: 0.6em;
                margin-bottom: 0.5rem;
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
            }
            
            #registerButton:hover
            {
                background: gold;
                color: black;
                transition: 0.3s ease-out;
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
                <section id = "desc" class = "content" class = "copy">
                    <h2><%= getServletContext().getInitParameter("header")%></h1>
                    <p>A comfortable place for learning</p>
                    <p>Bringing 21<sup>st</sup> Century Education to Every Home.</p>
                </section>
            </div>
            <div class = "right">
                <form action="Registration" method = "POST">
                    
                    <section class = "copy">
                        <div>
                            <img alt =" header logo" src ="Assets/Pictures/logo_rectangle_transparent.png" style="max-width:350px;max-height:123px;">
                            <h2 style="color:#8B4513">Register Here</h2>
                        </div>
                    </section>
                    
                    <section class = "copy">
                        <div>
                            <h2 style="color:black">Role and Payment</h2>
                        </div>
                    </section> 
                    <%
                        RegistrationModel eruditioR = (RegistrationModel) getServletContext().getAttribute("registration");
                        ArrayList<PersonalDetails> pd = eruditioR.getPersonalDetails();
                        ArrayList<AccountDetails> ad = eruditioR.getAccountDetails();
                        ArrayList<String> roles = eruditioR.getRoles();
                        ArrayList<String> payments = eruditioR.getPayments();          
                    %>
                    
                    <div class="user-box">
                        <label for="role">What are you applying as?</label>
                        <select id="role" name="role">
                           <%         
                                for (int i = 0; i < roles.size(); i++)
                                {
                                     String s = String.format("<option value = %s>%s</option>", roles.get(i), roles.get(i));
                                     out.println(s);
                                }
                           %>
                        </select>
                    </div>
                    
                    <div class="user-box">
                        <label for="payment">What is your preferred payment option?</label>
                        <select id="payment" name="payment">
                            <%         
                                for (int i = 0; i < payments.size(); i++)
                                {
                                     String s = String.format("<option value = %s>%s</option>", payments.get(i), payments.get(i));
                                     out.println(s);
                                }
                           %>
                        </select>
                    </div>
                    
                    <section class = "copy">
                        <div>
                            <h2 style="color:black">Personal Details</h2>
                        </div>
                    </section> 
                     <%         
                            for (int i = 0; i < pd.size(); i++)
                            {
                                PersonalDetails current = pd.get(i);
                                String s = String.format("<div class = 'user-box'>\n"
                                        + "<label for = %s>%s</label>\n"
                                        + "<input type = %s name = %s placeholder = '%s' required>\n"
                                        + "</div>",
                                        current.getName(),current.getDetail(),current.getType(),current.getName(),current.getPlaceholder());
                                out.println(s);
                            }
                      %>
                
                    
                    <section class = "copy">
                        <div>
                            <h2 style="color:black">Account Details</h2>
                        </div>
                    </section>   
                    
                    <div class="user-box">
                        <label for="unameR" >Username</label>
                        <input type="text"  name = "unameR" type="text" placeholder ="Enter your Username" required >
                    </div>

                    <div class="user-box, containerPass">
                        <label for="pwordR" >Password</label>
                        <input id = "pwordR" name = "pwordR" type="password" placeholder ="Enter your Password" required>
                        <i class="far fa-eye" id="rPassword"></i>
                    </div>
                      
                    <script src="js/registerToggle.js"></script>
                    
                    <div class="user-box, containerPass">
                        <label for="pwordR2" >Confirm Password</label>
                        <input id = "pwordR2" name = "pwordR2" type="password" placeholder ="Enter your Password again" required>
                        <i class="far fa-eye" id="rPassword2"></i>
                    </div>
  
                    <script src="js/registerToggle2.js"></script>
                     <section class = "copy">
                        <div>
                            <img src ="Captcha"><br>
                             <input name = "captchaR" type="text" placeholder ="Enter Captcha" required>
                        </div>
                     </section>  
                    <p id = "err">
                        <% String ErrorMessage = "";
                            if (session.getAttribute("ErrorMessageR") != null) {
                                ErrorMessage = (String) session.getAttribute("ErrorMessageR");
                                session.removeAttribute("ErrorMessageR");
                            }
                        %>
                        <%= ErrorMessage%> 
                    </p>

                    <section class = "copy">
                        <div>
                            <input id = "registerButton" type="submit" value = "REGISTER"  ><br><br>
                            <a href="LoginToEruditio">Already have an account?</a><br><br>
                            <a href="EruditioHome">Go back to Home Page</a>
                            <p>&#169 <%= getServletContext().getInitParameter("footer")%></p>
                        </div>
                    </section>
                        
                </form>
             </div>
                    
         </div>
    </body>

</html>
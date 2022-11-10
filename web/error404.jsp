<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
        <link href="css/DashboardMenu.css" rel="stylesheet" type="text/css"/>

        <title>Error 404</title>

        <style>
            *
            {
                margin: 0;
                padding: 0;
            }
            html 
            {
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

            }

      
            
            a{
                text-decoration: none;
                display: block;
                width: 100%;
                font-weight: 700;
                border: none;
                padding: 1rem;
                padding-left: 0;
                padding-right: 0;
                border-radius: 8px;
                font-size: 0.75rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-top: 15px;  
                background-color: orange;
                font-family: 'Patua One', cursive; 
                color:black;
            }
            a:hover
            {
                background: #0A2351 !important;
                color: white !important;
                transition: 0.3s ease-out;
            }
            
            
            #content
            {
               
               background-color: white;
            }
            
            #body
            {
                padding: 5%;
            }
            
            header div p
            {
                font-family: 'Roboto', sans-serif !important;
            }
           

        </style>

        


    </head>

    <body style="background-color:white">
        <header style = "height: 45px;  background-color: #391847;  color: white;">
            <div>
                <p class = "label" id = "welcome"><%= getServletContext().getInitParameter("header")%></p> 
                <p class = "logo"><img  alt =" header logo" src ="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/logo_rectangle_transparent.png"></p>
            </div>
        </header>
        <div id = "content" style="min-height:100vh;line-height: 1.5; display: flex; align-items: center; justify-content: space-around;text-align: center; ">
            <div id = "body" style="text-align: center;">
                <img alt="lostGirl" src="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/LostGirl.png" style="background-color: #faf3f3; border-radius: 50%; max-width:500px;max-height: 600px;">
                <h1 style="font-family: 'Patua One', cursive;font-size: clamp(50px,100%,80px); font-weight: normal; letter-spacing: 0.1em;">ERROR 404</h1>
                <h2 style="font-family: 'Roboto', sans-serif;font-weight: normal;">Uh Oh! Looks like you got Lost!</h2>
                <a  href="/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/EruditioHome" id="homeButton">GO BACK HOME</a> 
            </div>
        </div>
            
        <footer style = "height: 20px; background-color: #391847; padding: 10px;"> 
            <p>&#169 <%= getServletContext().getInitParameter("footer")%></p>
        </footer>

</body>
</html>
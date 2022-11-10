package eruditio.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nl.captcha.Captcha;

public class RegisteringServlet extends HttpServlet {

    Connection con;
  
    @Override
    public void init(ServletConfig config) throws ServletException 
    {
        super.init(config);
        try 
        {	
            Class.forName(config.getInitParameter("jdbcClassName"));
            //System.out.println("jdbcClassName: " + config.getInitParameter("jdbcClassName"));
            //creates the url for database
            String dbusername = config.getInitParameter("dbUserName");
            String dbpassword = config.getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(config.getInitParameter("dbHostName"))
                    .append(":")
                    .append(config.getInitParameter("dbPort"))
                    .append("/")
                    .append(config.getInitParameter("databaseName"));
            con =  DriverManager.getConnection(url.toString(),dbusername, dbpassword);
        } 
        catch (SQLException sqle)
        {
            System.out.println("SQLException error occured - " + sqle.getMessage());
        } 
        catch (ClassNotFoundException nfe)
        {
            System.out.println("ClassNotFoundException error occured - " + nfe.getMessage());
        }
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try 
        {	

            if (con != null) 
            {
               
                //initializes the personal detail variables with the inputs from the user
                String role = request.getParameter("role");
                String payment = request.getParameter("payment");
                String givenName = request.getParameter("givenName");
                String middleName = request.getParameter("middleName");
                String lastName = request.getParameter("lastName");
                String contactNumber = request.getParameter("contactNumber");
                String email = request.getParameter("email");
                String birthday = request.getParameter("birthday");
               
                //initializes the security details for registering username, passwords, captcha
                String unameR = request.getParameter("unameR");
                String pwordR = request.getParameter("pwordR");
                String pwordR2 = request.getParameter("pwordR2");
                String captchaR = request.getParameter("captchaR");
                
                
                //sets up the captcha
                Captcha checker = (Captcha) request.getSession().getAttribute("captchaGenerated");
                String trueCaptcha = checker.getAnswer();
                
                //query
                String query;
                PreparedStatement ps;
                
                //gets the record for the input of the user
                query = "SELECT Username FROM USER_INFO where username = ?";
                ps = con.prepareStatement(query);
                ps.setString(1, unameR);
                
           
                ResultSet inputCheckers = ps.executeQuery();
                
               
                //if this is true then that means the user is already existing and the account cannot be made
                if (inputCheckers.next())
                {
                    request.getSession().setAttribute("ErrorMessageR", "User already Exists!");
                    response.sendRedirect("RegisterToEruditio");
                }
                else if (!(pwordR.equals(pwordR2)))
                {
                    request.getSession().setAttribute("ErrorMessageR", "Passwords do not match!");
                    response.sendRedirect("RegisterToEruditio");
                }
                else if (!(captchaR.equals(trueCaptcha)))
                {
                    request.getSession().setAttribute("ErrorMessageR", "Captcha is incorrect");
                    response.sendRedirect("RegisterToEruditio");
                }
                else
                {
                    HttpSession setters = request.getSession();
                    setters.setAttribute("role", role);
                    setters.setAttribute("payment", payment);
                    setters.setAttribute("givenName", givenName);
                    setters.setAttribute("middleName", middleName);
                    setters.setAttribute("lastName", lastName);
                    setters.setAttribute("contactNumber", contactNumber);
                    setters.setAttribute("email", email);
                    setters.setAttribute("birthday", birthday);
                    setters.setAttribute("unameR", unameR);
                    setters.setAttribute("pwordR", Security.encrypt(pwordR));
                    setters.setAttribute("registering", "registration");
                   
                    //sends to the confirmation page
                    response.sendRedirect("Confirmation");
                }
              
              
            } 
            
            
        } 
        catch (SQLException sqle)
        {
               sqle.printStackTrace();
        } 

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

package eruditio.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangePasswordServlet extends HttpServlet {

    Connection conn;

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
            conn =  DriverManager.getConnection(url.toString(),dbusername, dbpassword);
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
            throws ServletException, IOException {
        //gets the session from the request
        HttpSession session = request.getSession();
        
        //gets the important info for checking if user has inputted
        //the real old password, or if the new password matches before updating
        //the password in the database
        String loggedInUser = (String) session.getAttribute("loggedInUser");
        //for debugging System.out.println(loggedInUser);
        String oldpwordC = request.getParameter("oldpwordC");
        String newpwordC = request.getParameter("newpwordC");
        String newpwordC2 = request.getParameter("newpwordC2");
        String query = "SELECT password FROM USER_INFO WHERE username = ?";
        String update = "UPDATE USER_INFO SET password = ? where username = ?";
     
        try 
        {
            if (conn != null) 
            {
                  PreparedStatement ps = conn.prepareStatement(query);
                  ps.setString(1, loggedInUser);
                  
                  ResultSet checkPassword = ps.executeQuery();
                  checkPassword.next();
                  String truePassword = (String) Security.decrypt(checkPassword.getString("password"));
                  //System.out.println("Test here: "+oldpwordC);
                   // for debugging System.out.println(oldpwordC);
                  
                  //for debugging System.out.println(truePassword);
                  //if conditions to check if passwords match the database, and if new passwords are the same.
                  if (oldpwordC.equals(truePassword))
                  {
                      if (newpwordC.equals(newpwordC2))
                      {
                          //change password
                          ps = conn.prepareStatement(update);
                          
                          ps.setString(1, Security.encrypt(newpwordC));
                          ps.setString(2, loggedInUser);
                          
                          ps.executeUpdate();
                          
                          session.setAttribute("ChangePasswordMessage", "Your password has been changed!");
                          response.sendRedirect("ChangeMyPassword");
                      }
                      else
                      {
                          session.setAttribute("ChangePasswordMessage", "New passwords entered do not match.");
                          response.sendRedirect("ChangeMyPassword");
                      }
                  }
                  else
                  {
                      session.setAttribute("ChangePasswordMessage", "The old password you entered is incorrect.");
                      response.sendRedirect("ChangeMyPassword");
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

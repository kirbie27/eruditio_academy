/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eruditio.controllers;

import java.io.IOException;
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

public class ChangeInfo extends HttpServlet {

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
        String changeGivenName = request.getParameter("changeGivenName");
        String changeMiddleName = request.getParameter("changeMiddleName");
        String changeLastName = request.getParameter("changeLastName");
        String changeBirthday = request.getParameter("changeBirthday");
        String changeEmail = request.getParameter("changeEmail");    
        String changeNumber = request.getParameter("changeNumber");
        String changePayment = request.getParameter("changePayment");

        String query = "SELECT * FROM USER_INFO WHERE username = ?";
        String update = "UPDATE USER_INFO SET given_name = ?, middle_name = ?, last_name = ?, birthdate = ?, email = ?, contact_number = ?, payment = ? where username = ?";
        
        try 
        {
            if (conn != null) 
            {
                  PreparedStatement ps = conn.prepareStatement(update);
                
                  //sets the parameters of what values to change.
                  ps.setString(1, changeGivenName);
                  ps.setString(2, changeMiddleName);
                  ps.setString(3, changeLastName);
                  ps.setString(4, changeBirthday);
                  ps.setString(5, changeEmail);
                  ps.setString(6, changeNumber);
                  ps.setString(7, changePayment);
                  ps.setString(8, loggedInUser);
                  
                  
                  ps.executeUpdate();
                  
                  ps = conn.prepareStatement(query);
                  ps.setString(1, loggedInUser);
                  ResultSet record = ps.executeQuery();
                  
                  session.setAttribute("changeMessage", "Information Updated Successfully");
                  record.next();
                  session.removeAttribute("UserRecord");
                  session.setAttribute("UserRecord", record);
                  response.sendRedirect("MyProfile");
                  // for debugging System.out.println(oldpwordC);
                  //for debugging System.out.println(truePassword);
                  
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
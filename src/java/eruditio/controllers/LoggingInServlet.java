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
import java.util.*;

public class LoggingInServlet extends HttpServlet {

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
            throws ServletException, IOException 
    {
        String unameL = request.getParameter("uname");
        String pwordL = request.getParameter("pword");

        String query = "SELECT username, password FROM USER_INFO WHERE username = ?";
        String query2 = "SELECT * FROM USER_INFO WHERE username = ?";
        String display = "SELECT username, role FROM USER_INFO WHERE username = ? AND password = ?";
       
        
        HttpSession session = request.getSession();
        
      
        try 
        {
            if (conn != null) 
            {

                PreparedStatement pstmt = conn.prepareStatement(query);

                pstmt.setString(1, unameL);
                ResultSet records = pstmt.executeQuery();

                if (records.next()) 
                {
                    String dbPass = records.getString("password");

                    if (!dbPass.equals(Security.encrypt(pwordL))) 
                    {
                        //if incorrect password then the message will be stored in the ErrorMEssageL attribute in the session
                        session.setAttribute("ErrorMessageL", "Incorrect Password.");
                        response.sendRedirect("LoginToEruditio");
                    } 
                    else 
                    {

                        pstmt = conn.prepareStatement(display);
                        pstmt.setString(1, unameL);
                        pstmt.setString(2, Security.encrypt(pwordL));
                        records = pstmt.executeQuery();
                        records.next();
                        session.setAttribute("loggedInUser", unameL);
                        session.setAttribute("loggedInRole", records.getString("role"));
                        //this attribute is removed so that the user won't be able to access the register confirmation page, in case the
                        //user tried to register before logging in.
                        session.removeAttribute("registering");
                        
                        
                        pstmt = conn.prepareStatement(query2);
                        pstmt.setString(1, unameL);
                        records = pstmt.executeQuery();
                        //sets the record in the UserRecord attribute so that the result set will be accessible in the session
                        System.out.println(records.next());
                        session.removeAttribute("UserRecord");
                        session.setAttribute("UserRecord", records);
                     
                        response.sendRedirect("loggedIn/MyDashboard");
                    }
                } 
                else 
                {
                    //if incorrect password and username then the message will be stored in the ErrorMEssageL attribute in the session
                    session.setAttribute("ErrorMessageL", "Incorrect login credentials.");
                    response.sendRedirect("LoginToEruditio");
                }

            } 
            else 
            {
                System.out.println("Not connected.");
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

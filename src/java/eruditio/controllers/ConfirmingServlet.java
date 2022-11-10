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
import java.util.*;

public class ConfirmingServlet extends HttpServlet {

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
               
                //query for inserting the registration details
                String query;
                PreparedStatement ps;
                
                //gets the record for the input of the user
                query = "INSERT INTO USER_INFO VALUES(?,?,?,?,?,?,?,?,?,?)";
                ps = con.prepareStatement(query);
            
                ArrayList<String> inputs = new ArrayList<>();
                //puts the data from the registration in a list, so that it can be added as arguments using a loop below.
                inputs.add( (String) request.getSession().getAttribute("role"));
                inputs.add( (String) request.getSession().getAttribute("unameR"));
                inputs.add( (String) request.getSession().getAttribute("pwordR"));
                inputs.add( (String) request.getSession().getAttribute("givenName"));
                inputs.add( (String) request.getSession().getAttribute("middleName"));
                inputs.add( (String) request.getSession().getAttribute("lastName"));
                inputs.add( (String) request.getSession().getAttribute("email"));
                inputs.add( (String) request.getSession().getAttribute("contactNumber"));
                inputs.add( (String) request.getSession().getAttribute("birthday"));
                inputs.add( (String) request.getSession().getAttribute("payment"));
                
                for (int i = 1; i <= inputs.size(); i++)
                {
                    ps.setString(i, inputs.get(i-1));
                }
                
                ps.executeUpdate();
                
                query = "SELECT * FROM USER_INFO where username = ?";
                ps = con.prepareStatement(query);
                
                //sets the username into the prepared statement
                ps.setString(1, inputs.get(1));
                
                ResultSet records = ps.executeQuery();
                
               
                
                HttpSession setter = request.getSession();
                records.next();
                setter.removeAttribute("UserRecord");
                setter.setAttribute("UserRecord", records);
                setter.setAttribute("loggedInUser",  inputs.get(1));
                setter.setAttribute("loggedInRole",  inputs.get(0));
                //sends to the confirmation page
                response.sendRedirect("MyDashboard");
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

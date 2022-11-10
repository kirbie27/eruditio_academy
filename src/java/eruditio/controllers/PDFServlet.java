package eruditio.controllers;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.*;
import java.time.format.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import eruditio.models.*;

public class PDFServlet extends HttpServlet {

    Connection conn;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
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
            conn = DriverManager.getConnection(url.toString(), dbusername, dbpassword);
        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - " + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - " + nfe.getMessage());
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf;charset=UTF-8");
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time
        String date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time
        //and is converted into a String variable;
        String filename = date + "-Eruditio"+".pdf"; //Current date and time is used as the name of the CSV File

        String footer = request.getServletContext().getInitParameter("footer");
        response.addHeader("Content-Disposition", "inline; filename=" + filename);
        HttpSession session = request.getSession();
        String guestButton = request.getParameter("GuestButton");
        String adminButton = request.getParameter("AdminButton");
        try {
            if (conn != null) {
                if ((session.getAttribute("loggedInRole").equals("Teacher") || session.getAttribute("loggedInRole").equals("Student") || session.getAttribute("loggedInRole").equals("Admin")) 
                        && guestButton != null) {
                    String query = "SELECT * FROM USER_INFO WHERE username = ?";
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, session.getAttribute("loggedInUser").toString());
                    ResultSet rs = pstmt.executeQuery();
                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                    //gets the real path for the image object inside the project so that it can be used for the pdf later.
                    String path = getServletContext().getRealPath("WEB-INF/classes/Pictures/logo_rectangle_transparent.png");
                    System.out.println(path);
                    ByteArrayOutputStream pdf = doc.userRecord(rs, (String) request.getSession().getAttribute("loggedInUser"), footer, path);
                     
                   
                    pdf.writeTo(sos);
                } else if (session.getAttribute("loggedInRole").equals("Admin") && adminButton != null) {
                    String query = "SELECT * FROM USER_INFO";
                    Statement stmt = conn.createStatement();
                    ResultSet result = stmt.executeQuery(query);
                    //for admin users, they can download all of the records in the database, the loop below counts how many records / pages the pdf will generate and then
                    //it will pass it as an argument in the function that generates all pdfs.
                    int numRecord = 0;
                    while (result.next()) {
                        numRecord++;
                        
                    }
                    
                    ResultSet rs = stmt.executeQuery(query);
                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                     //gets the real path for the image object inside the project so that it can be used for the pdf later.
                    String path = getServletContext().getRealPath("WEB-INF/classes/Pictures/logo_rectangle_transparent.png");
                    System.out.println(path);
                    ByteArrayOutputStream pdf = doc.userRecord(rs, (String) request.getSession().getAttribute("loggedInUser"), footer, numRecord, path);
                    pdf.writeTo(sos);
                }
            }
        } catch (SQLException sqle) {
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
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eruditio.models;
import javax.servlet.*;

/**
 *
 * @author Kirby Wenceslao
 */
public class WebAppListener implements ServletContextListener
{

    @Override
    public void contextInitialized(ServletContextEvent event) 
    {
        ServletContext sc = event.getServletContext();
        
        //creates the ProgramList object
        ProgramList list = new ProgramList();
        
        //creates the model for the registration details
        RegistrationModel eruditioR = new RegistrationModel();
        
        //creates the model for the about information
        About about = new About();
        //creates an object name and value pair that would be 
        //set to the servlet context so that it can be accessible on the jsp or servlets
        sc.setAttribute("programList", list);
        sc.setAttribute("registration", eruditioR);
        sc.setAttribute("About", about);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) 
    {
        //nothing
    }
    
}

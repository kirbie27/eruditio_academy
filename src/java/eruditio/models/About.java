/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eruditio.models;

import java.util.*;

public class About 
{
    AboutModel main;
    ArrayList<AboutModel> additionals;
    
    public About()
    {
        setMain();
        setAdditionals();
    }
    
    //setters
    public void setMain()
    {
        main = new AboutModel("ABOUT US","Eruditio Academy is an education service institution that offers online and offline learning and development programs for"
                + " preschool to high school. Eruditio subscribes to the whole child development approach. We develop the four human dimensions "
                + "in children and youth: body, mind, heart and spirit. Moreover, we give equal emphasis to parent education and empowerment "
                + "thru parenting seminars, workshops and access to learning and development materials.");
        
    }
    public void setAdditionals()
    {
        additionals = new ArrayList<>();
        
        additionals.add(new AboutModel("Our Experience","We have over 12 years cumulative experience in education services. "
                + "We have successfully delivered online learning programs to over 200 students. "
                + "We have been supporting several homeschooling families during this pandemic."));
        
        additionals.add(new AboutModel("Our Approach","Eruditio subscribes to the Whole Child Development approach. We believe "
                + "in the development of the four human dimensions in children: mental, socio-emotional, physical and spiritual."));
                
        additionals.add(new AboutModel("Parent Empowerment","Eruditio gives equal emphasis to parent education and empowerment. "
                + "We conduct webinars and workshops that equip parents to effectively support their children’s learning and development."));
        
    }
    
    //getters
    public AboutModel getMain()
    {
        return main;
    }
    
    public ArrayList getAdditionals()
    {
        return additionals;
    }
    
}

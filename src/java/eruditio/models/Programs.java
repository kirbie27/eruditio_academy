/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eruditio.models;

import java.util.*;

public class Programs 
{
    String circlePic, defaultPic, programTitle, programDescription;
    
    public Programs(String circlePic, String defaultPic, String programTitle, String programDescription)
    {
       setCirclePic(circlePic);
       setDefaultPic(defaultPic);
       setProgramTitle(programTitle);
       setProgramDescription(programDescription);
        
        
    }
    
    
    //setters
    public void setCirclePic(String circlePic)
    {
        this.circlePic = circlePic;
    }
    
    public void setDefaultPic(String defaultPic)
    {
         this.defaultPic = defaultPic; 
    }
     
    public void setProgramTitle(String programTitle)
    {
        this.programTitle = programTitle;
    }
      
       public  void setProgramDescription(String programDescription)
    {
         this.programDescription = programDescription;
    }
       
       
    //getters
    public String getCirclePic()
    {
        return circlePic;
    }
    
    public String getDefaultPic()
    {
        return defaultPic;
    }
     
    public String getProgramTitle()
    {
       return programTitle;
    }
      
    public  String getProgramDescription()
    {
       return programDescription; 
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eruditio.models;

public class AboutModel 
{
    String title, description;
    
    public AboutModel(String title, String description)
    {
        setTitle(title);
        setDescription(description);
    }
    
    //setters
    public void setTitle(String title)
    {
        this.title = title;
    }
    
    public void setDescription(String description)
    {
        this.description = description;
    }
    
    //getters
    public String getTitle()
    {
        return title;
    }
    
    public String getDescription()
    {
        return description;
    }
            
            
}

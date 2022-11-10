/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eruditio.models;
import java.util.*;


public class RoleOptions 
{
    ArrayList<String> roles;
            
    public RoleOptions()
    {
        roles = new ArrayList<>();
        setRoles();
    }
    
    
    //setters
    public void setRoles()
    {
        roles.add("Teacher");
        roles.add("Student");
    }
    
    
    //getters
    public ArrayList getRoles()
    {
        return roles;
    }
    
    
}

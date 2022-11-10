/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eruditio.models;


public class AccountDetails 
{
    String detail, type, name, placeholder;
    
    public AccountDetails(String detail, String type, String name, String placeholder)
    {
        setDetail(detail);
        setType(type);
        setName(name);
        setPlaceholder(placeholder);
    }
    
    
    //setters
    public void setDetail(String detail)
    {
        this.detail = detail;
    }
    
    public void setType (String type)
    {
        this.type = type;
    }
    
    public void setName (String name)
    {
        this.name = name;
    }
    
    public void setPlaceholder (String placeholder)
    {
       this.placeholder = placeholder;  
    }
    
    //getters
    
    public String getDetail()
    {
        return detail;
    }
    
    public String getType()
    {
        return type;
    }
    
    public String getName()
    {
        return name;
    }
    
    public String getPlaceholder()
    {
        return placeholder;
    }
    
}

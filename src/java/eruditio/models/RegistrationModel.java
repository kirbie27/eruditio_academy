/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eruditio.models;

import java.util.*;


public class RegistrationModel 
{
    ArrayList<String> roles, payments;
    ArrayList<PersonalDetails> personalDetails;
    ArrayList<AccountDetails> accountDetails;
    
    
    public RegistrationModel()
    {
        personalDetails = new ArrayList<>();
        accountDetails = new ArrayList<>();
        setRoles();
        setPayments();
        setPersonalDetails();
        setAccountDetails();
    }
    
    //setters
    public void setRoles()
    {
        roles = new RoleOptions().getRoles();
    }
    
    public void setPayments()
    {
        payments = new PaymentOptions().getPayments();
    }
    
    public void setPersonalDetails()
    {
        personalDetails.add(new PersonalDetails("Given Name", "text", "givenName", "Enter your Given Name"));
        personalDetails.add(new PersonalDetails("Middle Name", "text", "middleName", "Enter your Middle Name"));
        personalDetails.add(new PersonalDetails("Last Name", "text", "lastName", "Enter your Last Name"));
        personalDetails.add(new PersonalDetails("Contact Number", "number", "contactNumber", "Enter your Contact Number"));
        personalDetails.add(new PersonalDetails("Email", "email", "email", "Enter your Email"));
        personalDetails.add(new PersonalDetails("Birthdate", "date", "birthday", "Enter your Birthdate"));
    }
    
    public void setAccountDetails()
    {
        accountDetails.add(new AccountDetails("Username", "text", "unameR", "Enter your Username"));
        accountDetails.add(new AccountDetails("Password", "password", "pwordR", "Enter your Password"));
        accountDetails.add(new AccountDetails("Confirm Password", "password", "pwordR2", "Enter your Password again"));
    }
    
    
    public ArrayList getRoles()
    {
        return roles;
    }
    
    public ArrayList getPayments()
    {
        return payments;
    }
    
    public ArrayList getPersonalDetails()
    {
        return personalDetails;
    }
    
    public ArrayList getAccountDetails()
    {
        return accountDetails;
    }
}

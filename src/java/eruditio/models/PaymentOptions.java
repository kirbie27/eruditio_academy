/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eruditio.models;
import java.util.*;


public class PaymentOptions 
{
    ArrayList<String> payments;
            
    public PaymentOptions()
    {
        payments = new ArrayList<>();
        setPayments();
    }
    
    
    //setters
    public void setPayments()
    {
        payments.add("GCASH");
        payments.add("PAYMAYA");
        payments.add("BANK");
        payments.add("PAYPAL");
        payments.add("COINSPH");
    }
    
    
    //getters
    public ArrayList getPayments()
    {
        return payments;
    }
    
    
}

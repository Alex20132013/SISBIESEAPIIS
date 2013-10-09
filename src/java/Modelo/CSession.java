/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;


public class CSession 
{
    String user;
    String passwd;
    
   public Object[]varuser=null;

    public CSession(String user, String passwd) 
    {
        this.user = user;
        this.passwd = passwd;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getUser() 
    {
        return user;
    }

    public void setUser(String user) 
    {
        this.user = user;
    }

    
    
    
   public Object[] Usuario() throws Exception
    { 
        Object[] session;
        
        
           CUsuario user=new CUsuario();
          
           session=user.user(this.getUser(), this.getPasswd());
           
            if (session==null) 
            {
             CAdministrador admi=new CAdministrador();         
             session=admi.user(this.getUser(), this.getPasswd());   
            }        
       
      return session;
    }
    
    private boolean DeterminarLogo(String logueo)
    {
        boolean verdad=false;
        for (int i = 0; i <logueo.length(); i++) 
        {
            if (logueo.charAt(i)=='@') 
            {
                verdad=true;
                break;
            }
    
        }
        return verdad;
    }
}

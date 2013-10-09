
package Modelo;


import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author 2012
 */
public class Cmiconexion 
{
    public Connection miconexion; 
    
    
    
    public Cmiconexion() throws SQLException, NamingException 
    {  
        
      miconexion=this.getMiconexion().getConnection();
    }

//    private DataSource getMiconexion() throws NamingException {
//        Context c = new InitialContext();
//        return (DataSource) c.lookup("java:comp/env/Miconexion");
//    }

    private DataSource getMiconexion() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/Miconexion");
    }

   
    
    
}

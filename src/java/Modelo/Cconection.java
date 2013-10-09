
package Modelo;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;


public class Cconection 
{

    public Connection miconexion=null;
     Statement stPuente;
     ResultSet rsDatos;

    public Cconection()  throws Exception
    {
      String driver="com.mysql.jdbc.Driver";
        //String url="jdbc:mysql://localhost/academico";
        String url="jdbc:mysql://localhost/db_bibliotecaeapiis";
        
        String user="root";
        String passw="biblio2013";
        
        
            Class.forName(driver);
            miconexion= (Connection) DriverManager.getConnection(url, user, passw);
            stPuente=(Statement) miconexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            
        
    }

    
    
    
    
   
    
    
}

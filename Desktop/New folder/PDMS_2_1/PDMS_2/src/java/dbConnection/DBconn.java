package dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBconn {
    
    Connection conn;
    
    //OPEN CONNECTION TO DATABASE
    public Connection Connection()
    {
        try 
        {            
            Class.forName("com.mysql.jdbc.Driver");            
            String link = "jdbc:mysql://localhost:3306/pdms?autoReconnect=true&useSSL=false";
            conn = DriverManager.getConnection(link,"root","root");   
            
            return conn;
            
        } catch (ClassNotFoundException | SQLException ex) {Logger.getLogger(DBconn.class.getName()).log(Level.SEVERE, null, ex);}
        return null;
    }
    
    //CLOSE CONNECTION TO DATABASE
    public void closeConn(){
        try{
                conn.close();
                System.out.println("Closed");
              
        }
        catch (SQLException e){
                System.err.println(e);
        }
    }
}
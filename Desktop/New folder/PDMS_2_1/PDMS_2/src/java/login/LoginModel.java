/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import dbConnection.DBconn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author nadia
 */
public class LoginModel {
    
    String username, password, usertype, name;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }
    
    //CHECK FOR MATCHING USERNAME AND PASSWORD
    public boolean checkLogin(){
        
        boolean check =false;
        try 
        {      
            DBconn dbconn=new DBconn();
            Connection conn= dbconn.Connection();

            PreparedStatement ps =conn.prepareStatement("SELECT * FROM login WHERE username=? and password=?");

            ps.setString(1, getUsername());
            ps.setString(2, getPassword());
            ResultSet rs=ps.executeQuery();
            check = rs.next();
            setUsertype(rs.getString("usertype"));
            conn.close();        
            
        }catch(SQLException e){}

        return check;  
    }
    
    //GET THE NAME OF THE USER TO BE DISPLAY AFTER LOGIN
    public String getName(){
        
        String name=null;
        try 
        {      
            DBconn dbconn=new DBconn();
            Connection conn= dbconn.Connection();

            PreparedStatement ps =conn.prepareStatement("SELECT * FROM user WHERE user_id=?");
            ps.setString(1, getUsername());
            ResultSet rs=ps.executeQuery();
            rs.next();
            name=(rs.getString("user_name"));
            conn.close();        

        }catch(SQLException e){}
        return name;  
    }
}

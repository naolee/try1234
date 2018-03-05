/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appointment;

import dbConnection.DBconn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

/**
 *
 * @author nadia
 */
public class AppointmentModel {
    
    String std_id, std_name, exmr1_id, exmr1_name, exmr2_id, exmr2_name,venue,date, time, proj_title;
    int check;
    DBconn db = new DBconn();
    
    public String getStd_id() {
        return std_id;
    }

    public void setStd_id(String std_id) {
        this.std_id = std_id;
    }

    public String getStd_name() {
        return std_name;
    }

    public void setStd_name(String std_name) {
        this.std_name = std_name;
    }

    public String getExmr1_id() {
        return exmr1_id;
    }

    public void setExmr1_id(String exmr1_id) {
        this.exmr1_id = exmr1_id;
    }

    public String getExmr2_id() {
        return exmr2_id;
    }

    public void setExmr2_id(String exmr2_id) {
        this.exmr2_id = exmr2_id;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getExmr1_name() {
        return exmr1_name;
    }

    public void setExmr1_name(String exmr1_name) {
        this.exmr1_name = exmr1_name;
    }

    public String getExmr2_name() {
        return exmr2_name;
    }

    public void setExmr2_name(String exmr2_name) {
        this.exmr2_name = exmr2_name;
    }

    public String getProj_title() {
        return proj_title;
    }

    public void setProj_title(String proj_title) {
        this.proj_title = proj_title;
    }
  
    public int checkAppointment_std(String username){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        //IF STUDENT OR EXAMINER
        try{            
            String query="SELECT * FROM appointment WHERE std_id=?"; //IF STUDENT               
            ps=conn.prepareStatement(query);
            ps.setString(1, username.toLowerCase());
            rs=ps.executeQuery();
            
            if(rs.next()){//STUDENT HAS APPOINTMENT
                
                setExmr1_id(rs.getString("exmr1_id"));
                setExmr1_name(rs.getString("exmr1_name"));
                setExmr2_id(rs.getString("exmr2_id"));
                setExmr2_name(rs.getString("exmr2_name"));
                setVenue(rs.getString("appt_venue"));
                setDate(rs.getString("appt_date"));
                setTime(rs.getString("appt_time"));
                
                db.closeConn();
                check=1;
                
            }else {
                db.closeConn(); 
                check=0;
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        return check;
    }
    public int checkAppointment_supv(String username){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        try{            
            String query="SELECT * FROM appointment WHERE exmr1_id=? OR exmr2_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, username.toLowerCase());
            ps.setString(2, username.toLowerCase());
            rs=ps.executeQuery();
            
            if(rs.next()){//SUPERVISOR HAS APPOINTMENT
                setVenue(rs.getString("appt_venue"));
                setDate(rs.getString("appt_date"));
                setTime(rs.getString("appt_time"));
                setProj_title(rs.getString("proj_title"));
                setStd_name(rs.getString("std_name"));
                db.closeConn();
                check=1;
                
            }else {
                db.closeConn(); 
                check=0;
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        return check;
    }
    
    public int getRow(String username){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM appointment WHERE exmr1_id=? OR exmr2_id=? OR std_id=?");
            ps.setString(1, username);
            ps.setString(2, username);    
            ps.setString(3, username);

            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return row;
    }
    public int getRow_all(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM appointment");
            
            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return row;
    }
    public String[][] listAppointment(String username){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=getRow(username);
        String[][] array = new String[row][10];        
        try{
            ps=conn.prepareStatement("SELECT * FROM appointment WHERE exmr1_id=? OR exmr2_id=? OR std_id=?");
            ps.setString(1, username);
            ps.setString(2, username);  
            ps.setString(3, username); 
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString("std_id");
                array[i][1]= rs.getString("std_name");
                array[i][2]= rs.getString("exmr1_id");
                array[i][3]= rs.getString("exmr1_name");
                array[i][4]= rs.getString("exmr2_id");
                array[i][5]= rs.getString("exmr2_name");
                array[i][6]= rs.getString("appt_venue");
                array[i][7]= rs.getString("appt_date");
                array[i][8]= rs.getString("appt_time");
                array[i][9]= rs.getString("proj_title");
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
    }
    
    
    public String[][] listAppointment_all(){
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        String[][] array = new String[getRow_all()][10];        
        try{
            ps=conn.prepareStatement("SELECT * FROM appointment");
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString("std_id");
                array[i][1]= rs.getString("std_name");
                array[i][2]= rs.getString("exmr1_id");
                array[i][3]= rs.getString("exmr1_name");
                array[i][4]= rs.getString("exmr2_id");
                array[i][5]= rs.getString("exmr2_name");
                array[i][6]= rs.getString("appt_venue");
                array[i][7]= rs.getString("appt_date");
                array[i][8]= rs.getString("appt_time");
                array[i][9]= rs.getString("proj_title");
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        db.closeConn();
        return array;
    }
    public void checkExist(){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        
        try{            
            String query="SELECT std_id FROM appointment WHERE std_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, getStd_id());
            
            rs=ps.executeQuery();
            if(rs.next()){
                db.closeConn();
                //updateAppointment();
            }else {
                db.closeConn(); 
                insertAppointment();
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
    }
    public void updateAppointment(){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        try{
            String query = "UPDATE appointment SET appt_venue=? ,appt_date=?, appt_time=? WHERE std_id=?";
            ps=conn.prepareStatement(query);
            ps.setString(1, getVenue());
            ps.setString(2, getDate());
            ps.setString(3, getTime());
            ps.setString(4, getStd_id());   
            ps.executeUpdate();
        }catch (SQLException e){
            System.err.println(e);
        }
        db.closeConn();
    }
    public void insertAppointment(){
       
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        try{
            String query = "INSERT INTO appointment (std_id,std_name, exmr1_id, exmr1_name, exmr2_id, exmr2_name) VALUES (?,?,?,?,?,?);";
            ps=conn.prepareStatement(query);
            ps.setString(1, getStd_id());
            ps.setString(2, getStd_name());
            ps.setString(3, getExmr1_id());
            ps.setString(4, getExmr1_name());
            ps.setString(5, getExmr2_id());
            ps.setString(6, getExmr2_name());
            ps.executeUpdate();
        }catch (SQLException e){
            System.err.println(e);
        }
        db.closeConn();
    }
    public int getRow_unassigned(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM appointment WHERE appt_venue IS NULL");
            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return row;
    }
    
    public String[][] listUnassignedAppt(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row = getRow_unassigned();
        String[][] array = new String[row][6];   
        
        try{
            ps=conn.prepareStatement("SELECT * FROM appointment WHERE appt_venue IS NULL");
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString(1);
                array[i][1]= rs.getString(2);
                array[i][2]= rs.getString(3);
                array[i][3]= rs.getString(4);
                array[i][4]= rs.getString(5);
                array[i][5]= rs.getString(6);
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
    }
    
    public int countTime1(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM daytime WHERE available1=?");
            ps.setString(1, "Available");
            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}

        db.closeConn();
        return row;
    }
    public String[][] listTime1(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        String[][] array = new String[countTime1()][1];        
        try{
            ps=conn.prepareStatement("SELECT time1 FROM daytime WHERE available1=?");
            ps.setString(1, "Available");
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString("time1");
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
    }
    public int countTime2(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM daytime WHERE available2=?");
            ps.setString(1, "Available");
            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}

        db.closeConn();
        return row;
    }
    public String[][] listTime2(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        String[][] array = new String[countTime2()][1];        
        try{
            ps=conn.prepareStatement("SELECT time2 FROM daytime WHERE available2=?");
            ps.setString(1, "Available");
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString("time2");
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        db.closeConn();
        return array;
    }
}

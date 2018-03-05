/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dbConnection.DBconn;
import java.sql.Timestamp;
/**
 *
 * @author nadia
 */
public class EvaluationModel {
    
    String std_id, exmr1_id, exmr2_id, exmr_id;
    double std_mark_exmr1, std_mark_exmr2;

    public double getStd_mark_exmr1() {
        return std_mark_exmr1;
    }

    public void setStd_mark_exmr1(double std_mark_exmr1) {
        this.std_mark_exmr1 = std_mark_exmr1;
    }
    DBconn db = new DBconn();

    public String getExmr_id() {
        return exmr_id;
    }

    public void setExmr_id(String exmr_id) {
        this.exmr_id = exmr_id;
    }

    public String getStd_id() {
        return std_id;
    }

    public void setStd_id(String std_id) {
        this.std_id = std_id;
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

    public double getStd_mark_exmr2() {
        return std_mark_exmr2;
    }

    public void setStd_mark_exmr2(double std_mark_exmr2) {
        this.std_mark_exmr2 = std_mark_exmr2;
    }
    public int countRow(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM examiner WHERE exmr1_id=? OR exmr2_id=?");
            ps.setString(1, getExmr_id());  
            ps.setString(2, getExmr_id());    
            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return row;
    }
    public String[][] listCandidate(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row = countRow();
        String[][] array = new String[row][3];   
        
        try{
            ps=conn.prepareStatement("SELECT std_id, std_name, prop_title FROM examiner WHERE exmr1_id=? OR exmr2_id=?");
            ps.setString(1, getExmr_id());  
            ps.setString(2, getExmr_id()); 
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString("std_id");
                array[i][1]= rs.getString("std_name");
                array[i][2]= rs.getString("prop_title");
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
    }
    public int checkEx1(){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        int exist=0;
        try{            
            String query="SELECT * FROM examiner WHERE exmr1_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, getExmr_id());
            rs=ps.executeQuery();
            if(rs.next()){
              exist=1;
            }
            else{
                exist=0;
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
        return exist;
    }
    public int checkEx2(){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        int exist=0;
        try{            
            String query="SELECT * FROM examiner WHERE exmr2_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, getExmr_id());
            rs=ps.executeQuery();
            if(rs.next()){
              exist=1;
            }
            else{
                exist=0;
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
        return exist;
    }
    public void addMark1(){
        
        int x=checkExist();
        if(x==0){
            insertMark1();
        }
        if(x==0){
            updateMark1();
        }
    }
    public void insertMark1(){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        try{
            
            String query = "INSERT INTO evaluation (std_id, std_mark_exmr1, exmr1_id) values (?,?,?)";
            ps=conn.prepareStatement(query);
            ps.setString(1, getStd_id());                   //SUPERVISOR ID
            ps.setDouble(2, getStd_mark_exmr1());               //STUDENT ID
            ps.setString(3, getExmr1_id());                  //STUDENT NAME
            ps.executeUpdate();
        }catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
        
    }public void updateMark1(){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        try{
            
            String query = "UPDATE evaluation SET std_mark_exmr1=?, exmr1_id=? WHERE std_id=?";
            ps=conn.prepareStatement(query);
            ps.setDouble(1, getStd_mark_exmr1());               //STUDENT ID
            ps.setString(2, getExmr1_id());                  //STUDENT NAME
            ps.setString(3, getStd_id());                   //SUPERVISOR ID
            ps.executeUpdate();
        }catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
    }
    
    public void addMark2(){
        
        int x=checkExist();
        if(x==0){
            insertMark2();
        }
        if(x==0){
            updateMark2();
        }
    }
    public void insertMark2(){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        try{
            
            String query = "INSERT INTO evaluation (std_id, std_mark_exmr2, exmr2_id) values (?,?,?)";
            ps=conn.prepareStatement(query);
            ps.setString(1, getStd_id());                   //SUPERVISOR ID
            ps.setDouble(2, getStd_mark_exmr2());               //STUDENT ID
            ps.setString(3, getExmr2_id());                  //STUDENT NAME
            ps.executeUpdate();
        }catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
        
    }public void updateMark2(){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        try{
            String query = "UPDATE evaluation SET std_mark_exmr2=?, exmr2_id=? WHERE std_id=?";
            ps=conn.prepareStatement(query);
            ps.setDouble(1, getStd_mark_exmr2());               //STUDENT ID
            ps.setString(2, getExmr2_id());                  //STUDENT NAME
            ps.setString(3, getStd_id());                   //SUPERVISOR ID
            ps.executeUpdate();
        }catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
    }
    public int checkExist(){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        int exist=0;
        try{            
            String query="SELECT * FROM examiner WHERE exmr2_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, getExmr_id());
            rs=ps.executeQuery();
            if(rs.next()){
              exist=1;
            }
            else{
                exist=0;
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
        return exist;
    }
    
    public int checkMark1(String std_id){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        int mark=0;
        try{        
            String query="SELECT std_mark_exmr1 FROM evaluation WHERE std_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, std_id);
            rs=ps.executeQuery();
            if(rs.next()){
                mark=1;
            }
            else{
                mark=0;
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
        return mark;
    }
    public double mark1(String std_id){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        double mark=0;
        try{            
            String query="SELECT std_mark_exmr1 FROM evaluation WHERE std_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, std_id);
            rs=ps.executeQuery();
            if(rs.next()){
                mark=rs.getDouble("std_mark_exmr1");
            }
            else{
                mark=0;
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
        return mark;
    }
}

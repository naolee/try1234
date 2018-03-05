/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examiner;

import dbConnection.DBconn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import proposal.ProposalModel;

/**
 *
 * @author nadia
 */
public class ExaminerModel {
    
    String std_id, std_name, exmr1_id, exmr1_name, exmr2_id, exmr2_name, prop_title;
    DBconn db = new DBconn();
    
    public String getStd_id() {
        return std_id;
    }

    public void setStd_id(String std_id) {
        this.std_id = std_id;
    }

    public String getStd_name() {
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        
        try{
            ps=conn.prepareStatement("SELECT user_name FROM user where user_id=?");
            ps.setString(1,getStd_id());
            rs = ps.executeQuery();
            if(rs.next())
                std_name= rs.getString("user_name");
            
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        //return getUser_name();
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

    public String getExmr1_name() {
        return exmr1_name;
    }

    public void setExmr1_name(String exmr1_name) {
        this.exmr1_name = exmr1_name;
    }

    public String getExmr2_id() {
        return exmr2_id;
    }

    public void setExmr2_id(String exmr2_id) {
        this.exmr2_id = exmr2_id;
    }

    public String getExmr2_name() {
        return exmr2_name;
    }

    public void setExmr2_name(String exmr2_name) {
        this.exmr2_name = exmr2_name;
    }

    public String getProp_title() {
        return prop_title;
    }

    public void setProp_title(String prop_title) {
        this.prop_title = prop_title;
    }
    
    public void insertExaminer(){
       
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        try{
            String query = "INSERT INTO examiner (std_id,std_name, prop_title) VALUES (?,?,?);";
            ps=conn.prepareStatement(query);
            ps.setString(1, getStd_id());
            ps.setString(2, getStd_name());
            ps.setString(3, getProp_title());
            ps.executeUpdate();
        }catch (SQLException e){
            System.err.println(e);
        }
        db.closeConn();
    }
    public void updateExaminer(){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
                
        //Timestamp time = new Timestamp(System.currentTimeMillis());
        try{
            String query = "UPDATE examiner SET exmr1_id=?, exmr1_name=?, exmr2_id=?, exmr2_name=? WHERE std_id=?";
            ps=conn.prepareStatement(query);
            ps.setString(1, getExmr1_id());
            ps.setString(2, getExmr1_name());
            ps.setString(3, getExmr2_id());
            ps.setString(4, getExmr2_name());
            ps.setString(5, getStd_id());   
            ps.executeUpdate();
            //System.out.println("File is successfully saved!");
        }catch (SQLException e){
            System.err.println(e);
        }
        db.closeConn();
    }
    public void updateExaminer1(){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
                
        //Timestamp time = new Timestamp(System.currentTimeMillis());
        try{
            String query = "UPDATE examiner SET exmr1_id=?, exmr1_name=? WHERE std_id=?";
            ps=conn.prepareStatement(query);
            ps.setString(1, getExmr1_id());
            ps.setString(2, getExmr1_name());
            ps.setString(3, getStd_id());
            ps.executeUpdate();
            //System.out.println("File is successfully saved!");
        }catch (SQLException e){
            System.err.println(e);
        }
        db.closeConn();
    }
    public void updateExaminer2(){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
                
        //Timestamp time = new Timestamp(System.currentTimeMillis());
        try{
            String query = "UPDATE examiner SET exmr2_id=?, exmr2_name=? WHERE std_id=?";
            ps=conn.prepareStatement(query);
            ps.setString(1, getExmr2_id());
            ps.setString(2, getExmr2_name());
            ps.setString(3, getStd_id());   
            ps.executeUpdate();
            //System.out.println("File is successfully saved!");
        }catch (SQLException e){
            System.err.println(e);
        }
        db.closeConn();
    }
     public int getRow_allHardcopy(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM proposal WHERE prop_hardcopy_status=?");
            ps.setString(1, "Submitted");
            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return row;
    }
     public int getRow_unassigned(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM examiner WHERE exmr1_id IS NULL");
            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return row;
    }
    public String[][] listHardcopy(){
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        ProposalModel a = new ProposalModel();
        int row = a.getRow_allHardcopy();
        String[][] array = new String[row][5];   
        
        try{//SELECT pdms.proposal.std_name, pdms.examiner.exmr1_id FROM pdms.examiner INNER JOIN pdms.proposal ON pdms.proposal.std_id = pdms.examiner.std_id ;
            ps=conn.prepareStatement("SELECT proposal.std_id, proposal.std_name, proposal.prop_title, examiner.exmr1_id, examiner.status FROM proposal INNER JOIN examiner ON proposal.std_id=examiner.std_id");
            //ps.setString(1,"Submitted");
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString(1);
                array[i][1]= rs.getString(2);
                array[i][2]= rs.getString(3);
                array[i][3]= rs.getString(4);
                array[i][4]= rs.getString(5);
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
    }
    
    public int countRow(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM expertise");
            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return row;
    }
    
    public int countRow_examiner(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM examiner WHERE exmr1_id IS NOT NULL");
            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return row;
    }
    public String[][] listExaminer(){
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row = countRow_examiner();
        String[][] array = new String[row][7];   
        
        try{
            ps=conn.prepareStatement("SELECT * FROM examiner WHERE exmr1_id IS NOT NULL");
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString(1);
                array[i][1]= rs.getString(2);
                array[i][2]= rs.getString(3);
                array[i][3]= rs.getString(4);
                array[i][4]= rs.getString(5);
                array[i][5]= rs.getString(6);
                array[i][6]= rs.getString(7);
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        db.closeConn();
        return array;
    }
    
    public String[][] listExpertise(){
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        //ProposalModel a = new ProposalModel();
        int row = countRow();
        String[][] array = new String[row][9];   
        
        try{
            ps=conn.prepareStatement("SELECT e.exmr_id, u.user_name, e.qual_id,e.exp1_id,e.exp1_field,e.exp2_id,e.exp2_field,e.exp3_id,e.exp3_field\n" +
                                      "FROM expertise e JOIN user u ON u.user_id=e.exmr_id ");
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString(1);
                array[i][1]= rs.getString(2);
                array[i][2]= rs.getString(3);
                array[i][3]= rs.getString(4);
                array[i][4]= rs.getString(5);
                array[i][5]= rs.getString(6);
                array[i][6]= rs.getString(7);
                array[i][7]= rs.getString(8);
                array[i][8]= rs.getString(9);
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
            String query="SELECT std_id FROM examiner WHERE std_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, getStd_id());
            
            rs=ps.executeQuery();
            if(rs.next()){
                db.closeConn();
                updateExaminer();
            }else {
                db.closeConn(); 
                insertExaminer();
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
    }
    public void deleteExaminer(){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        
        try{            
            String query="DELETE FROM examiner WHERE std_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, getStd_id());
            ps.executeUpdate();
        }
        catch (SQLException e){
                System.err.println(e);
        }
    }
    public String[][] listUnassignedExaminer(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row = countRow();
        String[][] array = new String[row][3];   
        
        try{
            ps=conn.prepareStatement("SELECT std_id, std_name, prop_title FROM examiner WHERE exmr1_id IS NULL");
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString(1);
                array[i][1]= rs.getString(2);
                array[i][2]= rs.getString(3);
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
    }
}

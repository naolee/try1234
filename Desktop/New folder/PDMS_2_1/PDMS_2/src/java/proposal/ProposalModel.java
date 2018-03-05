package proposal;

import dbConnection.DBconn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class ProposalModel {
    
    int alert;
    String user_name;
    String supv_id, std_id, std_name, prop_title, prop_filename, prop_approval, prop_hardcopy_status;
    Timestamp prop_softcopy_timestamp, prop_hardcopy_timestamp;
    DBconn db = new DBconn();

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getSupv_id() {
        return supv_id;
    }

    public void setSupv_id(String supv_id) {
        this.supv_id = supv_id;
    }

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

    public String getProp_title() {
        return prop_title;
    }

    public void setProp_title(String prop_title) {
        this.prop_title = prop_title;
    }

    public String getProp_filename() {
        return prop_filename;
    }

    public void setProp_filename(String prop_filename) {
        this.prop_filename = prop_filename;
    }

    public String getProp_approval() {
        return prop_approval;
    }

    public void setProp_approval(String prop_approval) {
        this.prop_approval = prop_approval;
    }

    public String getProp_hardcopy_status() {
        return prop_hardcopy_status;
    }

    public void setProp_hardcopy_status(String prop_hardcopy_status) {
        this.prop_hardcopy_status = prop_hardcopy_status;
    }

    public Timestamp getProp_softcopy_timestamp() {
        return prop_softcopy_timestamp;
    }

    public void setProp_softcopy_timestamp(Timestamp prop_softcopy_timestamp) {
        this.prop_softcopy_timestamp = prop_softcopy_timestamp;
    }

    public Timestamp getProp_hardcopy_timestamp() {
        return prop_hardcopy_timestamp;
    }

    public void setProp_hardcopy_timestamp(Timestamp prop_hardcopy_timestamp) {
        this.prop_hardcopy_timestamp = prop_hardcopy_timestamp;
    }

    //GET THE NAME TO BE DISPLAYED AFTER LOGGING IN
    public String viewName(String stdID){
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        
        try{
            ps=conn.prepareStatement("SELECT user_name FROM user where user_id=?");
            ps.setString(1,stdID);
            rs = ps.executeQuery();
            if(rs.next())
                setUser_name(rs.getString("user_name"));
            
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return getUser_name();
    }
    
    //GET TITLE OF THE PROPOSAL AND SUPERVISOR
    public String[] viewTitleSupv(String stdID){
        
        String[] array = new String[2];
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        
        try{
            ps=conn.prepareStatement("SELECT * FROM studentsupervisor where std_id=?");
            ps.setString(1,getStd_id());
            rs = ps.executeQuery();
            while(rs.next()){
                
                    array[0]=rs.getString("supv_id");
                    array[1]=rs.getString("title");
                    return array;
            }
        }catch (SQLException e){System.err.println(e);}
        db.closeConn();
       
        return array;
    }
    
    //STUDENT SUBMIT THEIR SOFTCOPY SUBMISSION 
    public void insertSoftcopy(){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        
        String[] array = new String[2];
        array=viewTitleSupv(getStd_id());
        supv_id=array[0];
        prop_title=array[1];
        std_name = viewName(getStd_id());
        
        Timestamp time = new Timestamp(System.currentTimeMillis());
        setProp_softcopy_timestamp(time);
        //String supv_id, std_id, std_name, prop_title, prop_filename, , prop_softcopy_timestamp, prop_approval, prop_hardcopy_status, prop_hardcopy_timestamp;
        try{
            
            String query = "INSERT INTO proposal values (?,?,?,?,?,?,?,?,?)";
            ps=conn.prepareStatement(query);
            ps.setString(1, supv_id);                   //SUPERVISOR ID
            ps.setString(2, getStd_id());               //STUDENT ID
            ps.setString(3, std_name);                  //STUDENT NAME
            ps.setString(4, prop_title);                //PROPOSAL TITLE
            ps.setString(5, getProp_filename());        //PROPOSAL FILENAME
            ps.setTimestamp(6, prop_softcopy_timestamp);//PROPOSAL SOFTCOPY SUBMISSION DATE AND TIME               
            ps.setString(7, "Not Approved Yet");        //PROPOSAL APPROVAL STATUS BY THE SUPERVISOR
            ps.setString(8, "Not Submitted");           //PROPOSAL HARDCOPY SUBMISSION STATUS 
            ps.setTimestamp(9, null);                   //PROPOSAL SOFTCOPY SUBMISSION DATE AND TIME 
            
            ps.executeUpdate();
            
            System.out.println("File is successfully saved!");
        }catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
    }
    
    //STUDENT UPDATE THEIR SOFTCOPY SUBMISSION 
    public void updateSoftcopy(){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        Timestamp time = new Timestamp(System.currentTimeMillis());
        
        try{
            
            String query="UPDATE proposal SET prop_filename=? ,prop_softcopy_timestamp=?, prop_approval=?, prop_hardcopy_status=? WHERE std_id = ?";
                       
            ps=conn.prepareStatement(query);
            ps.setString(1, getProp_filename());
            ps.setTimestamp(2, time);
            ps.setString(3, "Not Approved Yet");
            ps.setString(4, "Not Submitted");
            ps.setString(5, getStd_id());
            ps.executeUpdate();
        }
        catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn(); 
    }
    
    //SUPERVISOR UPDATE APPROVAL OF EACH OF THE STUDENT 
    public void updateApproval(String std_id, String prop_approval){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;

        try{
            String query = "UPDATE proposal SET prop_approval=? WHERE std_id=?";
            ps=conn.prepareStatement(query);
            ps.setString(1, prop_approval);
            ps.setString(2, std_id);
            ps.executeUpdate();
            
            System.out.println("File is successfully saved!");
        }catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn(); 
    }
    
    //ADMIN UPDATE HARDCOPY SUBMISSION OF EACH OF THE STUDENT
    public void updateHardcopy(String std_id, String prop_hardcopy_status){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        Timestamp time = new Timestamp(System.currentTimeMillis());
        setProp_hardcopy_timestamp(time);

        try{
            String query = "UPDATE proposal SET prop_hardcopy_status=?, prop_hardcopy_timestamp=? WHERE std_id=?";
            ps=conn.prepareStatement(query);
            ps.setString(1, prop_hardcopy_status);
            ps.setTimestamp(2, getProp_hardcopy_timestamp());
            ps.setString(3, std_id);
            ps.executeUpdate();
            
        }catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn(); 
    }
    public void checkExist(){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        
        try{            
            String query="SELECT prop_filename FROM proposal WHERE std_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, getStd_id());
            
            rs=ps.executeQuery();
            if(rs.next()){
                db.closeConn();
                updateSoftcopy();
            }else {
                db.closeConn(); 
                insertSoftcopy();
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
    }
    public int checkSubmit(){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        
        try{            
            String query="SELECT prop_filename FROM proposal WHERE std_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, getStd_id());
            
            rs=ps.executeQuery();
            if(rs.next()){
                db.closeConn();
                alert=1;
            }else {
                db.closeConn(); 
                alert=0;
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        return alert;
    }
    public String checkApproval(){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        String approval="";
        try{            
            String query="SELECT prop_approval FROM proposal WHERE std_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, getStd_id());
            rs=ps.executeQuery();
            if(rs.next()){
              approval=rs.getString("prop_approval");
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
        return approval;
    }
    
    public int getRow(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM proposal WHERE supv_id=?");
            ps.setString(1, getSupv_id());
            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return row;
    }
    public int getRow_allApprove(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM proposal WHERE prop_approval=?");
            ps.setString(1, "Approve");
            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}
        db.closeConn();
        return row;
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
    
    public String[][] listApproved(){
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row = getRow_allApprove();
        String[][] array = new String[row][4];   
        
        try{
            ps=conn.prepareStatement("SELECT * FROM proposal WHERE prop_approval=?");
            ps.setString(1,"Approve");
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString("std_id");
                array[i][1]= rs.getString("std_name");
                array[i][2]= rs.getString("prop_title");
                array[i][3]= rs.getString("prop_hardcopy_status");
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
        
    }
    
    public String[][] listHardcopy(){
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row = getRow_allHardcopy();
        String[][] array = new String[row][4];   
        //SELECT COUNT(*) AS row FROM proposal WHERE prop_hardcopy_status=?
        try{
            ps=conn.prepareStatement("SELECT * FROM proposal WHERE prop_hardcopy_status=?");
            ps.setString(1,"Submitted");
            rs = ps.executeQuery();
            int i=0;
            
            while(rs.next()){
                array[i][0]= rs.getString("std_id");
                array[i][1]= rs.getString("std_name");
                array[i][2]= rs.getString("prop_title");
                array[i][3]= rs.getString("prop_hardcopy_status");
                i++;
            }
            
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
        
    }
    public String[][] listProposal(){
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row = getRow();
        String[][] array = new String[row][4];   
        
        try{
            ps=conn.prepareStatement("SELECT * FROM proposal WHERE supv_id=?");
            ps.setString(1, getSupv_id());
            rs = ps.executeQuery();
            int i=0;
            
            while(rs.next()){
                array[i][0]= rs.getString("std_id");
                array[i][1]= rs.getString("std_name");
                array[i][2]= rs.getString("prop_title");
                array[i][3]= rs.getString("prop_approval");
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
    }
    
    public String getSupv(){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        String supv_id="";
        try{            
            String query="SELECT supv_id FROM studentsupervisor WHERE std_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, getStd_id());
            rs=ps.executeQuery();
            if(rs.next()){
              supv_id=rs.getString("supv_id");
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
        return supv_id;
    }
    public String getEmailSupv(String supv_id){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        String approval="";
        try{            
            String query="SELECT user_email FROM user WHERE user_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, supv_id);
            rs=ps.executeQuery();
            if(rs.next()){
              approval=rs.getString("user_email");
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
        return approval;
    }
    public String getEmailStd(String std_id){
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        String approval="";
        try{            
            String query="SELECT user_email FROM user WHERE user_id=?";                
            ps=conn.prepareStatement(query);
            ps.setString(1, std_id);
            rs=ps.executeQuery();
            if(rs.next()){
              approval=rs.getString("user_email");
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        db.closeConn();
        return approval;
    }
}

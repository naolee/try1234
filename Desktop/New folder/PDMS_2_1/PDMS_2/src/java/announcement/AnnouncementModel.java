package announcement;


import javax.servlet.http.HttpServletRequest;
import dbConnection.DBconn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.http.HttpSession;

public class AnnouncementModel {
    
    String ann_id, ann_title, ann_content, ann_accesstype, ann_timestamp;
    DBconn db = new DBconn();
    
    public String getAnn_id() {
        return ann_id;
    }

    public void setAnn_id(String ann_id) {
        this.ann_id = ann_id;
    }

    public String getAnn_title() {
        return ann_title;
    }

    public void setAnn_title(String ann_title) {
        this.ann_title = ann_title;
    }

    public String getAnn_content() {
        return ann_content;
    }

    public void setAnn_content(String ann_content) {
        this.ann_content = ann_content;
    }

    public String getAnn_accesstype() {
        return ann_accesstype;
    }

    public void setAnn_accesstype(String ann_accesstype) {
        this.ann_accesstype = ann_accesstype;
    }

    public String getAnn_timestamp() {
        return ann_timestamp;
    }

    public void setAnn_timestamp(String ann_timestamp) {
        this.ann_timestamp = ann_timestamp;
    }
   
    
    public void insertAnnouncement(){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
                
        Timestamp time = new Timestamp(System.currentTimeMillis());
        try{
            String query = "INSERT INTO announcement (ann_title, ann_content, ann_accesstype, ann_timestamp) VALUES (?,?,?,?)";
            ps=conn.prepareStatement(query);
            ps.setString(1, getAnn_title() );   
            ps.setString(2, getAnn_content() );
            ps.setString(3, getAnn_accesstype());
            ps.setTimestamp(4, time);
            ps.executeUpdate();
            
           // System.out.println("File is successfully saved!");
        }catch (SQLException e){
            System.err.println(e);
        }
        db.closeConn();
    }
    
    public void updateAnnouncement(){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
       // Timestamp time = new Timestamp(System.currentTimeMillis());
        
        try{
            String query = "UPDATE announcement SET ann_title=?, ann_content=?, ann_accesstype=? WHERE ann_id=?";
            ps=conn.prepareStatement(query);
            ps.setString(1, getAnn_title());   
            ps.setString(2, getAnn_content());
            ps.setString(3, getAnn_accesstype());
            ps.setString(4, getAnn_id());
            ps.executeUpdate();
            
            //System.out.println("File is successfully saved!");
        }catch (SQLException e){
            System.err.println(e);
        }
        db.closeConn();
    }
    
    public void deleteAnnouncement(String ann_id){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        //Timestamp time = new Timestamp(System.currentTimeMillis());
        
        try{
            String query = "DELETE FROM announcement WHERE ann_id=?";
            ps=conn.prepareStatement(query);
            ps.setString(1, getAnn_id());
            ps.executeUpdate();
            
            System.out.println("File is successfully saved!");
        }catch (SQLException e){
            System.err.println(e);
        }
        db.closeConn();
    }
    
    public void latestAnnouncement(){
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        
        try{
            ps=conn.prepareStatement("SELECT * FROM announcement WHERE ann_accesstype=? OR ann_accesstype=? ORDER BY ann_timestamp DESC LIMIT 1");
            ps.setString(1, "all");
            ps.setString(2, getAnn_accesstype());
            rs = ps.executeQuery();
            if(rs.next()){
                setAnn_id(rs.getString("ann_id"));
                setAnn_title(rs.getString("ann_title"));
                setAnn_content(rs.getString("ann_content"));
                setAnn_accesstype(rs.getString("ann_accesstype"));
                setAnn_timestamp(rs.getTimestamp("ann_timestamp").toString());
            }
            else {
                //HttpServletRequest request;
               // HttpSession session=request.getSession();  
                //session.setAttribute("username",username.toUpperCase()); 
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
    }
    
    public String[][] listAnnouncement_all(){
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        String[][] array = new String[getRow()][5];        
        try{
            ps=conn.prepareStatement("SELECT * FROM announcement");
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString("ann_id");
                array[i][1]= rs.getString("ann_title");
                array[i][2]= rs.getString("ann_accesstype");
                array[i][3]= rs.getString("ann_content");
                array[i][4]= rs.getTimestamp("ann_timestamp").toString();
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
    }
    
    public String[][] listAnnouncement_all_old(){
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        String[][] array = new String[getRow_all()][5];        
        try{
            ps=conn.prepareStatement("SELECT * FROM announcement ORDER BY ann_timestamp ASC");
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString("ann_id");
                array[i][1]= rs.getString("ann_title");
                array[i][2]= rs.getString("ann_accesstype");
                array[i][3]= rs.getString("ann_content");
                array[i][4]= rs.getTimestamp("ann_timestamp").toString();
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
    }
    
    public String[][] listAnnouncement_all_new(){
        
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        String[][] array = new String[getRow_all()][5];        
        try{
            ps=conn.prepareStatement("SELECT * FROM announcement ORDER BY ann_timestamp DESC");
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString("ann_id");
                array[i][1]= rs.getString("ann_title");
                array[i][2]= rs.getString("ann_accesstype");
                array[i][3]= rs.getString("ann_content");
                array[i][4]= rs.getTimestamp("ann_timestamp").toString();
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        db.closeConn();
        return array;
    }
    
    public String[][] listAnnouncement_old(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        String[][] array = new String[getRow()][4];        
        try{
            ps=conn.prepareStatement("SELECT * FROM announcement WHERE ann_accesstype=? OR ann_accesstype=? ORDER BY ann_timestamp ASC");
            ps.setString(1, "all");
            ps.setString(2, getAnn_accesstype());
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                array[i][0]= rs.getString("ann_title");
                array[i][1]= rs.getString("ann_content");
                array[i][2]= rs.getTimestamp("ann_timestamp").toString();
                array[i][3]= rs.getString("ann_id");
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
    }
    
    public String[][] listAnnouncement_new(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        String[][] array = new String[getRow()][4];        
        try{
            ps=conn.prepareStatement("SELECT * FROM announcement WHERE ann_accesstype=? OR ann_accesstype=? ORDER BY ann_timestamp DESC");
            ps.setString(1, "all");
            ps.setString(2, getAnn_accesstype());
            rs = ps.executeQuery();
            int i=0;
            while(rs.next()){
                
                array[i][0]= rs.getString("ann_title");
                array[i][1]= rs.getString("ann_content");
                array[i][2]= rs.getString("ann_timestamp").toString();
                array[i][3]= rs.getString("ann_id");
                i++;
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
    }
    public int getRow(){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        int row=0;
        
        try{
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM announcement WHERE ann_accesstype=? OR ann_accesstype=?");
            ps.setString(1, "all");
            ps.setString(2, getAnn_accesstype());
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
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM announcement");
            rs = ps.executeQuery();
            if(rs.next()){
                row=rs.getInt("row");
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return row;
    }
    
    public String[] getAnnouncement(String ann_id){
        Connection conn = db.Connection();        
        PreparedStatement ps;
        ResultSet rs;
        String[] array = new String[5];        
        try{
            ps=conn.prepareStatement("SELECT * FROM announcement WHERE ann_id=?");
            ps.setString(1, ann_id);
            rs = ps.executeQuery();
            if(rs.next()){
                array[0]= rs.getString("ann_id");
                array[1]= rs.getString("ann_title");
                array[2]= rs.getString("ann_accesstype");
                array[3]= rs.getString("ann_content");
                array[4]= rs.getTimestamp("ann_timestamp").toString();
            }
        }catch (SQLException e){System.err.println(e);}
        
        db.closeConn();
        return array;
    }
    
    public int checkAnn(){
        
        Connection conn = db.Connection(); 
        PreparedStatement ps;
        ResultSet rs;
        int check=0;
        //IF STUDENT OR EXAMINER
        try{            
            ps=conn.prepareStatement("SELECT COUNT(*) AS row FROM announcement WHERE ann_accesstype=? OR ann_accesstype=? ");
            //ps=conn.prepareStatement(query);
            ps.setString(1, getAnn_accesstype());
            ps.setString(2, "all");
            rs=ps.executeQuery();
            
            //HAS ANNOUNCEMENT
            if(rs.next()){
                check=rs.getInt("row");
                db.closeConn();
                
            //NO ANNOUNCEMENT
            }else {
                db.closeConn(); 
            }
        }
        catch (SQLException e){
                System.err.println(e);
        }
        return check;
    }
}

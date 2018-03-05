/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package announcement;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nadia
 */
public class AnnouncementViewController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AnnouncementViewController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AnnouncementViewController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        HttpSession session=request.getSession(); 
        AnnouncementModel a = new AnnouncementModel();
        int row; 
        String usertype= session.getAttribute("usertype").toString();
        
        if(usertype.equals("admin")){
            row=a.getRow_all();
           // request.setAttribute("select1","selected");
            //request.setAttribute("select2","");
            //IF THERE EXIST ANNOUNCEMENT
            if(row!=0){ 
                String[][] array;
                array=a.listAnnouncement_all_new();
                request.setAttribute("row",row);
                for(int i=0; i<row; i++){
                    request.setAttribute("id_"+i, array[i][0]);
                    request.setAttribute("title_"+i, array[i][1]);
                    request.setAttribute("accesstype_"+i, array[i][2]);
                    request.setAttribute("content_"+i, array[i][3]);
                    request.setAttribute("date_"+i,array[i][4].substring(0,10));
                    request.setAttribute("time_"+i,array[i][4].substring(11,16));
                }
                request.getRequestDispatcher("newjsp3.jsp").forward(request,response);
            }
        }
        else{
            a.setAnn_accesstype(usertype);
            row=a.getRow();
            
            if(row!=0){
            session.setAttribute("select1","selected");
            session.setAttribute("select2","");
            //IF THERE EXIST ANNOUNCEMENT
            if(row!=0){ 
                String[][] array;
                array=a.listAnnouncement_new();
                session.setAttribute("row",row);
                for(int i=0; i<row; i++){
                    session.setAttribute("title_"+i, array[i][0]);
                    session.setAttribute("content_"+i, array[i][1]);
                    session.setAttribute("timestamp_"+i, array[i][2]);
                    session.setAttribute("id_"+i, array[i][3]);
                }
                if(usertype.equals("student")){
                usertype="Std";
                }if(usertype.equals("supervisor")||usertype.equals("coordinator")){
                    usertype="Supv";
                }
                response.sendRedirect(usertype+"Announcement.jsp");
            }}
            else{
                int i=0, ann=0;
                
                session.setAttribute("ann",0);
                session.setAttribute("row",1);
                    session.setAttribute("title_"+i,"");
                    session.setAttribute("content_"+i,"");
                    session.setAttribute("timestamp_"+i,"asasasasasasasasasasasasassasasas");
                    session.setAttribute("id_"+i, "");
                if(usertype.equals("student")){
                usertype="Std";
                }if(usertype.equals("supervisor")||usertype.equals("coordinator")){
                    usertype="Supv";
                }
                response.sendRedirect(usertype+"Announcement.jsp");
            }
        }
    }
        
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session=request.getSession(); 
        AnnouncementModel ann = new AnnouncementModel();
        String sortby = request.getParameter("sortby");
        String usertype= session.getAttribute("usertype").toString();
        
        if(usertype.equals("admin")){
            ann.setAnn_accesstype(usertype);
            int row=ann.getRow_all();
            request.setAttribute("row",row);
            String[][] array = new String[row][5];

            if(sortby.equals("Oldest -- Newest")){
                array = ann.listAnnouncement_all_old();
            }
            if(sortby.equals("Newest -- Oldest")){
               array = ann.listAnnouncement_all_new();
            }
            for(int i=0; i<row; i++){
                session.setAttribute("id_"+i, array[i][0]);
                session.setAttribute("title_"+i, array[i][1]);
                session.setAttribute("accesstype_"+i, array[i][2]);
                session.setAttribute("content_"+i, array[i][3]);
                session.setAttribute("timestamp_"+i, array[i][4]);
            }      
            if (session.getAttribute("select1").equals("")){
                session.setAttribute("select1","selected");
                session.setAttribute("select2","");
            }
            else{
                session.setAttribute("select1","");
                session.setAttribute("select2","selected");
            }
            response.sendRedirect("AdmAnnouncement.jsp");
        }
        else
        {
            ann.setAnn_accesstype(usertype);
            int row=ann.getRow();
            request.setAttribute("row",row);
            String[][] array = new String[row][3];

            if(sortby.equals("Oldest -- Newest")){
                array = ann.listAnnouncement_old();
            }
            if(sortby.equals("Newest -- Oldest")){
               array = ann.listAnnouncement_new();
            }
            for(int i=0; i<row; i++){
                session.setAttribute("title_"+i, array[i][0]);
                session.setAttribute("content_"+i, array[i][1]);
                session.setAttribute("timestamp_"+i, array[i][2]);
                    session.setAttribute("id_"+i, array[i][3]);
            }      
            if (session.getAttribute("select1").equals("")){
                session.setAttribute("select1","selected");
                session.setAttribute("select2","");
            }
            else{
                session.setAttribute("select1","");
                session.setAttribute("select2","selected");
            }
            if(usertype.equals("student")){usertype="Std";}
            if(usertype.equals("supervisor")||usertype.equals("coordinator")){
                    usertype="Supv";
            }
            response.sendRedirect(usertype+"Announcement.jsp");
        }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    
    public String[] getLatestAnnouncement(String usertype){
        
        AnnouncementModel ann = new AnnouncementModel();
        String title, content, time,date,dateDD,dateMM,dateYY,datetime;

        ann.latestAnnouncement();
        ann.setAnn_accesstype(usertype);
        title=ann.getAnn_title();
        content=ann.getAnn_content();
        datetime=ann.getAnn_timestamp();
        dateYY=datetime.substring(0, 4);
        dateMM=datetime.substring(5, 7);
        dateDD=datetime.substring(8, 10);
        
        switch (dateMM){
            case "01": dateMM="Jan";break;
            case "02": dateMM="Feb";break;
            case "03": dateMM="Mar";break;
            case "04": dateMM="Apr";break;
            case "05": dateMM="May";break;
            case "06": dateMM="Jun";break;
            case "07": dateMM="Jul";break;
            case "08": dateMM="Aug";break;
            case "09": dateMM="Sep";break;
            case "10": dateMM="Oct";break;
            case "11": dateMM="Nov";break;
            case "12": dateMM="Dec";break;
        }
        date=dateDD+"-"+dateMM+"-"+dateYY;
        time=datetime.substring(11, 16); 
        
        String[] array = new String[4];
        array[0] = title;
        array[1] = content;
        array[2] = date;
        array[3] = time;
        
        return array;
    }
    
}

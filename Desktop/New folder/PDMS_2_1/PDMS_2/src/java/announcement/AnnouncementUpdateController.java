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
public class AnnouncementUpdateController extends HttpServlet {

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
            out.println("<title>Servlet AnnouncementUpdateController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AnnouncementUpdateController at " + request.getContextPath() + "</h1>");
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
        
        AnnouncementModel a = new AnnouncementModel();
        String access_1="",access_2="",access_3="",access_4="";
        String id= request.getParameter("id");
        String[] array= a.getAnnouncement(id);
        String title = array[1];
        String accesstype = array[2];
        String content = array[3];
        String timestamp = array[4];
        
        switch(accesstype){
            case "all": access_1="selected"; break;
            case "student": access_2="selected"; break;
            case "supervisor": access_3="selected"; break;
            case "coordinator": access_4="selected"; break;
        }
        request.setAttribute("id",id);
        request.setAttribute("title",title);
        request.setAttribute("access_1",access_1);
        request.setAttribute("access_2",access_2);
        request.setAttribute("access_3",access_3);
        request.setAttribute("access_4",access_4);
        request.setAttribute("content",content);
        request.setAttribute("timestamp",timestamp);
        
        request.getRequestDispatcher("newjsp3.jsp").forward(request,response);
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
        
        //HttpSession session = request.getSession(); 
        AnnouncementModel a = new AnnouncementModel();
        String id= request.getParameter("uid");
        String title= request.getParameter("utitle");
        String accesstype= request.getParameter("uaccess");
        String content= request.getParameter("ucontent");
        
        switch(accesstype){
            case "All": accesstype="all"; break;
            case "Student Only": accesstype="student"; break;
            case "Supervisor Only": accesstype="supervisor"; break;
            case "Coordinator Only": accesstype="coordinator"; break;
        }
        
        a.setAnn_id(id);
        a.setAnn_title(title);
        a.setAnn_accesstype(accesstype);
        a.setAnn_content(content);
        a.updateAnnouncement();
        
        int row=a.getRow_all();
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

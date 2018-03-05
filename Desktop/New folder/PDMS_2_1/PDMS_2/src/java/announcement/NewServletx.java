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
public class NewServletx extends HttpServlet {

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
            out.println("<title>Servlet NewServletx</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServletx at " + request.getContextPath() + "</h1>");
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
         /*<form id="fr<%= request.getAttribute("id_"+i)%>" name="formUpdate" action="AnnouncementSelectController" method="get" target="_blank">
                            <input type="hidden" id="id" name="id" value="<%= request.getAttribute("id_"+i)%>">
                            <input type="hidden" id="title" name="title" value="<%= request.getAttribute("title_"+i)%>">
                            <input type="hidden" id="content<%= request.getAttribute("id_"+i)%>" name="content" value="<%= request.getAttribute("content_"+i)%>">
                            <input type="hidden" id="date" name="date" value="<%= request.getAttribute("date_"+i)%>">
                            <input type="hidden" id="time" name="time" value="<%= request.getAttribute("time_"+i)%>">
                        </form>*/
        String uid=request.getParameter("id");
        String utitle=request.getParameter("title");
        String ucontent=request.getParameter("content");
       
        request.setAttribute("uid",uid);
        request.setAttribute("utitle",utitle);
        request.setAttribute("ucontent",ucontent);
        
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
        processRequest(request, response);
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

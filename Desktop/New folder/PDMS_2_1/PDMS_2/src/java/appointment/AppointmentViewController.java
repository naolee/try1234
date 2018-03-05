/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appointment;

import announcement.AnnouncementModel;
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
public class AppointmentViewController extends HttpServlet {

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
            out.println("<title>Servlet AppointmentViewController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AppointmentViewController at " + request.getContextPath() + "</h1>");
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
        AppointmentModel a = new AppointmentModel();
        int row; 
        String usertype= session.getAttribute("usertype").toString();
        
        if(usertype.equals("admin")){
            row=a.getRow_all();
            session.setAttribute("select1","selected");
            session.setAttribute("select2","");
            //IF THERE EXIST ANNOUNCEMENT
            if(row!=0){ 
                String[][] array;
                array=a.listAppointment_all();
                session.setAttribute("row",row);
                for(int i=0; i<row; i++){
                    
                    session.setAttribute("std_id_"+i, array[i][0]);
                    session.setAttribute("std_name_"+i, array[i][1]);
                    session.setAttribute("exmr1_id_"+i, array[i][2]);
                    session.setAttribute("exmr1_name_"+i, array[i][3]);
                    session.setAttribute("exmr2_id_"+i, array[i][4]);
                    session.setAttribute("exmr2_name_"+i, array[i][5]);
                    session.setAttribute("appt_venue_"+i, array[i][6]);
                    session.setAttribute("appt_date_"+i, array[i][7]);
                    session.setAttribute("appt_time_"+i, array[i][8]);
                    session.setAttribute("proj_title_"+i, array[i][9]);
                }
                response.sendRedirect("AdmAppointment.jsp");
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

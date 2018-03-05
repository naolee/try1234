/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appointment;

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
public class AppointmentViewSupv extends HttpServlet {

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
            out.println("<title>Servlet AppointmentViewSupv</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AppointmentViewSupv at " + request.getContextPath() + "</h1>");
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
        String username = session.getAttribute("username").toString(); 
        AppointmentModel a = new AppointmentModel();
        int check= a.checkAppointment_supv(username);
        
        if(check==1){
            String[][] arrayAppt = a.listAppointment(username);
            int row = a.getRow(username);

            if(row!=0){ 
                session.setAttribute("row143",row);
                for(int i=0; i<row; i++){
                    session.setAttribute("std_id_"+i, arrayAppt[i][0]);
                    session.setAttribute("std_name_"+i, arrayAppt[i][1]);
                    session.setAttribute("exmr1_id_"+i, arrayAppt[i][2]);
                    session.setAttribute("exmr1_name_"+i, arrayAppt[i][3]);
                    session.setAttribute("exmr2_id_"+i, arrayAppt[i][4]);
                    session.setAttribute("exmr2_name_"+i, arrayAppt[i][5]);
                    session.setAttribute("appt_venue_"+i, arrayAppt[i][6]);
                    session.setAttribute("appt_date_"+i, arrayAppt[i][7]);
                    session.setAttribute("appt_time_"+i, arrayAppt[i][8]);
                    session.setAttribute("proj_title_"+i, arrayAppt[i][9]);
                }
                response.sendRedirect("SupvAppointment.jsp");
            }                        
        }else{
            
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

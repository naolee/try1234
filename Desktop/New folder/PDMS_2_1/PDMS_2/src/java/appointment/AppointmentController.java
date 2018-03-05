/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appointment;

import announcement.AnnouncementModel;
import examiner.ExaminerModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nadia
 */
@WebServlet(name = "AppointmentController", urlPatterns = {"/AppointmentController"})
public class AppointmentController extends HttpServlet {

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
            out.println("<title>Servlet AppointmentController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AppointmentController at " + request.getContextPath() + "</h1>");
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
        
        AppointmentModel e = new AppointmentModel();
        int x=e.getRow_unassigned();
        request.setAttribute("x",x);
        
        if(x!=0){ 
            String[][] array;
            array=e.listUnassignedAppt();
            for(int i=0; i<x; i++){
                request.setAttribute("astd_id_"+i, array[i][0]);
                request.setAttribute("astd_name_"+i, array[i][1]);
                request.setAttribute("aexmr1_id"+i, array[i][2]);
                request.setAttribute("aexmr1_name_"+i, array[i][3]);
                request.setAttribute("aexmr2_id_"+i, array[i][4]);
                request.setAttribute("aexmr2_name_"+i, array[i][5]);
            }
        }
        
        //TIME FOR 1ST DAY
        int length1 =e.countTime1();
        request.setAttribute("length1",length1);
        if(length1!=0){
            String[][] arrayTime1;
            arrayTime1= e.listTime1();
            for(int a=0; a<length1; a++){
                request.setAttribute("time1_"+a, arrayTime1[a][0]);
            }
        }
        
        //TIME FOR 2ND DAY
        int length2 =e.countTime2();
        request.setAttribute("length2",length2);
        if(length2!=0){
            String[][] arrayTime2;
            arrayTime2= e.listTime2();
            for(int a=0; a<length2; a++){
                request.setAttribute("time2_"+a, arrayTime2[a][0]);
            }
        }
        request.getRequestDispatcher("AdmAppointment.jsp").forward(request,response);
    }
    
    public int getRow(String username){
        AppointmentModel a= new AppointmentModel();
        return a.getRow(username);
    }
    
    public String[][] getAppointmentList(String username){
        AppointmentModel a= new AppointmentModel();
        return a.listAppointment(username);
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

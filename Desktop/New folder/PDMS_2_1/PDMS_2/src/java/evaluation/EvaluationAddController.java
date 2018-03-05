/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evaluation;

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
public class EvaluationAddController extends HttpServlet {

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
            out.println("<title>Servlet EvaluationAddController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EvaluationAddController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String exmr_id = session.getAttribute("username").toString().toLowerCase();
        String std_id = request.getParameter("std_id1");
        String std_name = request.getParameter("std_name1");
        String prop_title = request.getParameter("prop_title1");
        
        //MARK CALCULATION
        double abs =         0.4 * Integer.parseInt(request.getParameter("abs"));
        double intro =       0.6 * Integer.parseInt(request.getParameter("intro"));
        double literature =  0.6 * Integer.parseInt(request.getParameter("literature"));
        double methodology = 1 * Integer.parseInt(request.getParameter("methodology"));
        double result =      3 * Integer.parseInt(request.getParameter("result"));
        double conclusion =  0.8 * Integer.parseInt(request.getParameter("conclusion"));
        double reference =   0.6 * Integer.parseInt(request.getParameter("conclusion"));
        double grammar =     0.4* Integer.parseInt(request.getParameter("grammar"));
        double organization =0.6 * Integer.parseInt(request.getParameter("organization"));
        
        double totalmark = abs+intro+literature+methodology+result+conclusion+reference+grammar+organization;
        
        //CHECK WHICH EXAMINER
        EvaluationModel e = new EvaluationModel();
        e.setExmr_id(exmr_id);
        e.setStd_id(std_id);
        
        int ex1 = e.checkEx1();
        int ex2 = e.checkEx2();
        
        if(ex1==1&&ex2==0){
            e.setExmr1_id(exmr_id);
            e.setStd_mark_exmr1(totalmark);
            e.addMark1();
        }
        if(ex1==0&&ex2==1){
            e.setExmr2_id(exmr_id);
            e.setStd_mark_exmr2(totalmark);
            e.addMark2();
        }
        EvaluationController ev = new EvaluationController();
        ev.doGet(request, response);
//        request.getRequestDispatcher("SupvEvaluation.jsp").forward(request,response);
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

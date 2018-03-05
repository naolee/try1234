/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evaluation;

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
@WebServlet(name = "EvaluationController", urlPatterns = {"/EvaluationController"})
public class EvaluationController extends HttpServlet {

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
            out.println("<title>Servlet EvaluationController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EvaluationController at " + request.getContextPath() + "</h1>");
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
        String exmr_id =session.getAttribute("username").toString(); 
        
        EvaluationModel e = new EvaluationModel();
        e.setExmr_id(exmr_id);
        int row = e.countRow();
        request.setAttribute("row",row);
        if(row!=0){
            //String[][]mark = new String[][4];
            int row2=0;
            String[][]array = e.listCandidate();
            for(int i=0; i<row; i++){
                request.setAttribute("std_id_"+i,array[i][0]);
                request.setAttribute("std_name_"+i,array[i][1]);
                request.setAttribute("prop_title_"+i,array[i][2]);
                
                e.setStd_id(array[i][0]);
                int ex1 = e.checkEx1();
                int ex2 = e.checkEx2();
                
                if(ex1==1&&ex2==0){
                    int markexist = e.checkMark1(array[i][0]);
                    
                    if(markexist==1){
                        row2++;
                        String markq = Double.toString(e.mark1(array[i][0]));
                        int y= row2-1;
                        request.setAttribute("std_id_A"+y,array[i][0]);
                        request.setAttribute("std_name_A"+y,array[i][1]);
                        request.setAttribute("prop_title_A"+y,array[i][2]);
                        request.setAttribute("mark_A"+y,markq);
                    }
                }
                if(ex1==0&&ex2==1){
                    //mark[i][3]= Integer.toString(e.mark1());
                }
            }
            request.setAttribute("row2",row2);
        request.getRequestDispatcher("SupvEvaluation.jsp").forward(request,response);
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

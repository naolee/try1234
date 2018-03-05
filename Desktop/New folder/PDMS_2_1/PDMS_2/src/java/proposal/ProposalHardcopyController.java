/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proposal;

import examiner.ExaminerModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**listt
 *
 * @author nadia
 */
public class ProposalHardcopyController extends HttpServlet {

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
            out.println("<title>Servlet ProposalHardcopyController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProposalHardcopyController at " + request.getContextPath() + "</h1>");
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
        int row; 
        ProposalModel a = new ProposalModel();
        //a.setSupv_id(session.getAttribute("username").toString());
        row=a.getRow_allApprove();
        session.setAttribute("row",row);
        
        //IF THERE EXIST ANNOUNCEMENT
        if(row!=0){ 
            String[][] array;
            array=a.listApproved();
            for(int i=0; i<row; i++){
                session.setAttribute("std_id_"+i, array[i][0]);
                session.setAttribute("std_name_"+i, array[i][1]);
                session.setAttribute("prop_title_"+i, array[i][2]);
                session.setAttribute("prop_hardcopy_status_"+i, array[i][3]);
            }            
            response.sendRedirect("AdmProposalHardcopy.jsp");
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
        String stdid = request.getParameter("submit_id");
        String std_name = request.getParameter("std_name");
        String prop_title = request.getParameter("prop_title");
        String status = request.getParameter("hardcopy");
        ProposalModel a = new ProposalModel();
        a.updateHardcopy(stdid, status);
        
        ExaminerModel e = new ExaminerModel();
        e.setStd_id(stdid);
        e.setStd_name(std_name);
        e.setProp_title(prop_title);
        if(status.equals("Submitted")){
            e.checkExist();
        }else{
            e.deleteExaminer();
        }
        
        int row=a.getRow_allApprove();
        session.setAttribute("row",row);
        if(row!=0){ 
            String[][] array;
            array=a.listApproved();
            for(int i=0; i<row; i++){
                session.setAttribute("std_id_"+i, array[i][0]);
                session.setAttribute("std_name_"+i, array[i][1]);
                session.setAttribute("prop_title_"+i, array[i][2]);
                session.setAttribute("prop_hardcopy_status_"+i, array[i][3]);
            }            
            response.sendRedirect("AdmProposalHardcopy.jsp");
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

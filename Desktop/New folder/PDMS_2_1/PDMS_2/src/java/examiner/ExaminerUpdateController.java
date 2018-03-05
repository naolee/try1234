/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examiner;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nadia
 */
public class ExaminerUpdateController extends HttpServlet {

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
            out.println("<title>Servlet ExaminerUpdateController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExaminerUpdateController at " + request.getContextPath() + "</h1>");
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
        
        String std_id = request.getParameter("std_id2");
        String std_name = request.getParameter("std_name2");
        String prop_title = request.getParameter("prop_title2");
        String ex1 = request.getParameter("ex12");
        String ex2 = request.getParameter("ex22");
        String ex1_id = request.getParameter("ex1_id2");
        String ex2_id = request.getParameter("ex2_id2");
        
        ExaminerModel e = new ExaminerModel();
        e.setStd_id(std_id);
        e.setStd_name(std_name);
        e.setProp_title(prop_title);
        e.setExmr1_id(ex1_id);
        e.setExmr1_name(ex1);
        e.setExmr2_id(ex2_id);
        e.setExmr2_name(ex2);
        
        if(ex1_id.equals("")){
           e.updateExaminer2();
        }
        if(ex2_id.equals("")){
           e.updateExaminer1();
        }
        if(!ex1_id.equals("")&&!ex2_id.equals("")){
           e.updateExaminer();
        }
        //UPDATE THE VALUES IN THE CORDASSIGNEXAMINER
        //ExaminerModel e = new ExaminerModel();
        int x=e.getRow_unassigned();
        request.setAttribute("x",x);
        
        if(x!=0){ 
            String[][] array;
            array=e.listUnassignedExaminer();
            for(int i=0; i<x; i++){
                request.setAttribute("astd_id_"+i, array[i][0]);
                request.setAttribute("astd_name_"+i, array[i][1]);
                request.setAttribute("aprop_title_"+i, array[i][2]);
            }
        }
        
        std_id = request.getParameter("std_id");
        std_name = request.getParameter("std_name");
        prop_title = request.getParameter("prop_title");
        
        request.setAttribute("std_id",std_id);
        request.setAttribute("std_name",std_name);
        request.setAttribute("prop_title",prop_title);
        
        //GET A LIST OF EXAMINERS WITH THEIR EXPERTISE FIELD
        ExaminerModel b = new ExaminerModel();
        int row1=b.countRow();
        
        String array1[][]=b.listExpertise();
        for(int i=0; i<row1; i++){
            request.setAttribute("exmr_id_"+i, array1[i][0]);
            request.setAttribute("exmr_name_"+i, array1[i][1]);
            request.setAttribute("qual_id_"+i, array1[i][2]);
            request.setAttribute("exp1_id_"+i, array1[i][3]);
            request.setAttribute("exp1_field_"+i, array1[i][4]);
            request.setAttribute("exp2_id_"+i, array1[i][5]);
            request.setAttribute("exp2_field_"+i, array1[i][6]);
            request.setAttribute("exp3_id_"+i, array1[i][7]);
            request.setAttribute("exp3_field_"+i, array1[i][8]);
        }
        request.setAttribute("row1",row1);
        
        int row2=b.countRow_examiner();
        String array2[][]=b.listExaminer();
        for(int i=0; i<row2; i++){
            request.setAttribute("std_id_"+i, array2[i][0]);
            request.setAttribute("std_name_"+i, array2[i][1]);
            request.setAttribute("prop_title_"+i, array2[i][2]);
            request.setAttribute("exmr1_id_"+i, array2[i][3]);
            request.setAttribute("exmr1_name_"+i, array2[i][4]);
            request.setAttribute("exmr2_id_"+i, array2[i][5]);
            request.setAttribute("exmr2_name_"+i, array2[i][6]);
        }
        request.setAttribute("row2",row2);
        request.getRequestDispatcher("CordAssignExaminer.jsp").forward(request,response);
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



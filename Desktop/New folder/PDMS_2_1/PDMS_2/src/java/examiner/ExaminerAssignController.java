/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examiner;

import appointment.AppointmentModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import proposal.ProposalModel;

import static com.sun.xml.ws.security.impl.policy.Constants.logger;
import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
     
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author nadia
 */
public class ExaminerAssignController extends HttpServlet {

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
            out.println("<title>Servlet ExaminerAssign</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExaminerAssign at " + request.getContextPath() + "</h1>");
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

        ExaminerModel e = new ExaminerModel();
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
        
        String std_id = request.getParameter("std_id");
        String std_name = request.getParameter("std_name");
        String prop_title = request.getParameter("prop_title");
        
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
        
        String std_id = request.getParameter("std_id1");
        String std_name = request.getParameter("std_name1");
        String prop_title = request.getParameter("prop_title1");
        String ex1 = request.getParameter("ex11");
        String ex2 = request.getParameter("ex21");
        String ex1_id = request.getParameter("ex1_id1");
        String ex2_id = request.getParameter("ex2_id1");
        
        request.setAttribute("std_id",std_id);
        request.setAttribute("std_name",std_name);
        request.setAttribute("prop_title",prop_title);
        request.setAttribute("ex1_id",ex1_id);
        request.setAttribute("ex1",ex1);
        request.setAttribute("ex2_id",ex2_id);
        request.setAttribute("ex2",ex2);
        
        ExaminerModel e = new ExaminerModel();
        e.setStd_id(std_id);
        e.setStd_name(std_name);
        e.setProp_title(prop_title);
        e.setExmr1_id(ex1_id);
        e.setExmr1_name(ex1);
        e.setExmr2_id(ex2_id);
        e.setExmr2_name(ex2);
        e.updateExaminer();
        
        //INSERT INTO APPOINTMENT
        AppointmentModel c = new AppointmentModel();
        c.setStd_id(std_id);
        c.setStd_name(std_name);
        c.setExmr1_id(ex1_id);
        c.setExmr1_name(ex1);
        c.setExmr2_id(ex2_id);
        c.setExmr2_name(ex2);
        //b.
        c.checkExist();        
        
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
        
        std_id = request.getParameter("std_id");/**/
        System.out.println(std_id);
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

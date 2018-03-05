/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import announcement.AnnouncementModel;
import announcement.AnnouncementViewController;
import appointment.AppointmentController;
import appointment.AppointmentModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import proposal.ProposalModel;

/**
 *
 * @author nadia
 */
public class LoginController extends HttpServlet {

    int x;
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
            out.println("<title>Servlet LoginController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
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
        
        //GET THE USER CREDENTIALS
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean check;
        
        //CREATE A CONNECTION TO LOGINMODEL
        LoginModel loginM = new LoginModel();
        loginM.setUsername(username);
        loginM.setPassword(password);
        check = loginM.checkLogin();
        
        //CHECK LOGIN DETAILS
        if(check){
            
            HttpSession session=request.getSession(); 
            session.setAttribute("username",username.toUpperCase()); 
            session.setAttribute("name",loginM.getName()); 
            session.setAttribute("usertype",loginM.getUsertype()); 
            String usertype = loginM.getUsertype();
            
            //GET THE LATEST ANNOUNCEMENT
            if(!usertype.equals("admin")){
                String title, content, time,date;
                String[] array;
                AnnouncementModel ann = new AnnouncementModel();
                AnnouncementViewController a = new AnnouncementViewController();

                int checkAnn = ann.checkAnn();
                
                if (checkAnn==0){
                    session.setAttribute("ann", "0");
                }
                else{
                    session.setAttribute("ann", "1");
                    array=a.getLatestAnnouncement(usertype);
                    session.setAttribute("title", array[0]);
                    session.setAttribute("content", array[1]);
                    session.setAttribute("date", array[2]);
                    session.setAttribute("time", array[3]);
                }
                
            }
            //IF THE USER IS SUPERVISOR OR COORDINATOR 
            if(usertype.equals("supervisor")||usertype.equals("coordinator")){
                
                //CHECK IF THE SUPERVISOR HAS ANY APPOINTMENT SETUP  
                AppointmentController ac = new AppointmentController();
                int row = ac.getRow(username);
                session.setAttribute("row",row);
                
                //WHEN THERE EXISTS APPOINTMENT FOR THE SUPERVISOR
                if(row!=0){ 
                    
                    String [][] array = ac.getAppointmentList(username);
                    
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
                }
            }
            if(usertype.equals("student")){
                //CHECK IF STUDENT HAS SUBMITTED PROPOSAL
                ProposalModel proposal =  new ProposalModel();
                proposal.setStd_id(username);
                x=proposal.checkSubmit();
                session.setAttribute("checkSoftcopy",x);

                //CHECK IF THE PROPOSAL HAS BEEN APPROVED
                String approval=proposal.checkApproval();
                
                if(approval.equals("Approve"))
                    session.setAttribute("checkApproval","1");
                if(approval.equals("Reject"))
                    session.setAttribute("checkApproval","2");
                if(approval.equals("Not Approved Yet"))
                    session.setAttribute("checkApproval","3");
                
                
                //CHECK IF THE STUDENT HAS ANY APPOINTMENT SETUP   
                AppointmentModel app = new AppointmentModel();
                int z= app.checkAppointment_std(username);
                if(z==1){
                    String exmr1, exmr2, venue, date1, time1;
                    exmr1=app.getExmr1_name();
                    exmr2=app.getExmr2_name();
                    venue=app.getVenue();
                    date1=app.getDate();
                    time1=app.getTime();
                    session.setAttribute("exmr1", exmr1);
                    session.setAttribute("exmr2", exmr2);
                    session.setAttribute("venue1", venue);
                    session.setAttribute("date1", date1);
                    session.setAttribute("time1", time1);
                    session.setAttribute("checkAppt", 1);
                }
                if(z==0){
                    session.setAttribute("checkAppt", 0);
                }
            }
                   
            switch(usertype){
                case "coordinator":
                    response.sendRedirect("CordMainView.jsp"); break;
                case "supervisor":
                    response.sendRedirect("SupvMainView.jsp"); break;
                case "admin":
                    response.sendRedirect("AdmMainView.jsp"); break;
                case "student":
                    response.sendRedirect("StdMainView.jsp"); break;
            }
        }
        else{
            java.io.PrintWriter out = response.getWriter( );
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Incorrect username / password');");
            out.println("location='index.jsp';");
            out.println("</script>");
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

package proposal;
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
public class ProposalSoftcopyController extends HttpServlet {
       
   private boolean isMultipart;
   private String filePath;
   private final long maxFileSize = 25 * 1048576 ;
   private final int maxMemSize = 25 * 1048576 ;
   private File file ;
   private String username;
   //int check;
   //String fieldName,fileName, contentType;
    
   @Override
   public void init( ){
      // Get the file location where it would be stored.
      filePath = getServletContext().getInitParameter("file-upload"); 
   }
   
   public void uploadFile(HttpServletRequest request,HttpServletResponse response)
      throws ServletException, java.io.IOException {
   }
   
    @Override
    public void doPost(HttpServletRequest request,HttpServletResponse response)
        throws ServletException, java.io.IOException {
       
        HttpSession session=request.getSession();  
        username=session.getAttribute("username").toString(); 
         
        // Check that we have a file upload request
        isMultipart = ServletFileUpload.isMultipartContent(request);
        response.setContentType("text/html");
        java.io.PrintWriter out = response.getWriter( );
                
        if( !isMultipart ){
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet upload</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<p>No file uploaded</p>"); 
            out.println("</body>");
            out.println("</html>");
            return;
        }
        
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);   // maximum size that will be stored in memory
        factory.setRepository(new File("C:\\Users\\nadia\\Desktop\\PDMS_2_1\\PDMS_2\\files\\")); // Location to save data that is larger than maxMemSize.
        ServletFileUpload upload = new ServletFileUpload(factory);// Create a new file upload handler
        upload.setSizeMax( maxFileSize );// maximum file size to be uploaded.

        try{ 
            List fileItems = upload.parseRequest(request);// Parse the request to get file items.
            Iterator i = fileItems.iterator(); // Process the uploaded file items
            
            while ( i.hasNext () ) 
            {
               FileItem fi = (FileItem)i.next();
               if ( !fi.isFormField () )	
               {
                  String filetype = fi.getContentType();
                  long filesize = fi.getSize();
                  
                  if(filetype.contains("pdf")&& filesize<maxFileSize){
                    
                    //SAVE TO REPOSITORY
                    String filename= username.toUpperCase()+"_Proposal.pdf";
                    file = new File( filePath + filename);
                    fi.write( file ) ;
                    
                    //UPDATE PROPOSAL TABLE
                    ProposalModel proposal =  new ProposalModel();
                    proposal.setStd_id(username);
                    proposal.setProp_filename(filename);
                    proposal.checkExist();
                    
                    //String supv = proposal.getSupv();
                    //String emailsupv = proposal.getEmailSupv(supv);
                    
                    //POPOUT MESSAGE TO NOTIFY THAT THE FILE IS UPLOADED
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('File uploaded!');");
                    out.println("location='StdMainView.jsp';");
                    out.println("</script>");
                    session.setAttribute("alert", 1);
                                   
                    
            try{
            String host ="smtp.gmail.com" ;
            String user = "toocheekymaxie@gmail.com";
            String pass = "imeem.com";
            String to = "nadiahfazlii@gmail.com";
            String from = "toocheekymaxie@gmail.com";
            String subject = "Student Submission";
            String messageText = "<!DOCTYPE html>\n" +
            "<html>\n" +
            "<head>\n" +
            "  <style>\n" +
            "    table, th, td {\n" +
            "      border: 1px solid #A9A9A9;\n" +
            "      border-collapse: collapse;\n" +
            "      text-align:left;\n" +
            "    }\n" +
            "    th{\n" +
            "      width:35%;\n" +
            "      height:35px;\n" +
            "    }\n" +
            "    img{\n" +
            "    	vertical-align:middle;\n" +
            "  		\n" +
            "    }\n" +
            "    #div1{\n" +
            "    	text-align:center;\n" +
            "        border: 2px solid #A9A9A9;\n" +
            "    	border-radius: 10px;\n" +
            "    }\n" +
            "    p{\n" +
            "    	line-height: 150%;\n" +
            "    }\n" +
            "  </style>\n" +
            "</head>\n" +
            "<body>\n" +
            "\n" +
            "  <div id=\"div1\" style=\"background-image: url(https://image.ibb.co/eGxrkm/header_2.jpg);text-align: center;border: 2px solid #A9A9A9;border-radius: 10px;\">\n" +
            "    <img class=\"img-fluid style\" src=\"https://image.ibb.co/mS7kBR/Webp_net_resizeimage_1.png\" style=\"vertical-align: middle;\">\n" +
            "    PROPOSAL DEFENSE MANAGEMENT SYSTEM </div>\n" +
            "  \n" +
            "  <h1>Hi, Maxie</h1>\n" +
            "  <p style=\"line-height: 150%;\">This is to inform that your student, Nurul Nadiah Binti Mohd Fazli has successfully submitted their proposal on 17-Oct-2017 at 8.48pm. The following is the details of your student submission;</p>\n" +
            "  <table style=\"width: 100%;border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;\">\n" +
            "    <tr>\n" +
            "	<th style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;width: 35%;height: 35px;\">&nbsp;Name</th>\n" +
            "        <td style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;\">&nbsp;Nurul Nadiah Binti Mohd Fazli</td>\n" +
            "    </tr>\n" +
            "    <tr>\n" +
            "	<th style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;width: 35%;height: 35px;\">&nbsp;Matric ID</th>\n" +
            "        <td style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;\">&nbsp;CB14032</td>\n" +
            "    </tr>\n" +
            "    <tr>\n" +
            "	<th style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;width: 35%;height: 35px;\">&nbsp;Project Title</th>\n" +
            "        <td style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;\">&nbsp;Proposal Defense Management System</td>\n" +
            "    </tr>\n" +
            "    <tr>\n" +
            "        <th style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;width: 35%;height: 35px;\">&nbsp;Submission date</th>\n" +
            "        <td style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;\">&nbsp;17-Oct-2017</td>\n" +
            "    </tr>\n" +
            "    <tr>\n" +
            "        <th style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;width: 35%;height: 35px;\">&nbsp;Submission time</th>\n" +
            "        <td style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;\">&nbsp;9.00pm</td>\n" +
            "    </tr>\n" +
            "  </table>  \n" +
            "</body></html>";
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            //msg.setText(messageText);
            msg.setContent(messageText,"text/html" );  
            //msg.

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("message send successfully");
        }catch(Exception ex)
        {
            System.out.println(ex);
        }

                    
               

                  }
                  else{
                      if(!filetype.contains("pdf")){
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Only PDF file is accepted!');");
                        out.println("location='StdMainView.jsp';");
                        out.println("</script>");
                      }
                      else if(filesize>maxFileSize){
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('File size must not exceed 25MB!');");
                        out.println("location='StdMainView.jsp';");
                        out.println("</script>");
                      }
                      else{
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Only PDF file is accepted and file size must not exceed 25MB!');");
                        out.println("location='StdMainView.jsp';");
                        out.println("</script>");
                      }
                  }
               }
            }
            out.close();
        }catch(Exception ex) {System.out.println(ex);}
   }
   
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
 
   }
   
}
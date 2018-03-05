<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbConnection.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String msg;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="css/admpage.css">
    <link rel="stylesheet" href="css/newcss.css">
    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/tab.js"></script>
</head>
<body>   
    <table width="90%" align="center">
        <tr>
            <td colspan="3">
                <div align="center">
                <img src="image/header.png" alt="header" align="center" width="100%"></div>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div align="center">     
                <ul>                
                  <li><a href="AdmMainView.jsp">Home</a></li>
                  <li><a class="active" href="AdmAnnouncement.jsp">Announcement</a></li>
                  <li><a href="AdmAppointment.jsp">Appointment</a></li>
                  <li><a href="AdmProposalHardcopy.jsp">Proposal</a></li>
                </ul>
            </div><br>
            </td>
        </tr>
        <tr>
            <td><b>Welcome, <%= session.getAttribute("name") %></b></td>
            <td></td>
            <td align="right"><a href="LogoutController"><img src="image/logout.png" alt="logout" width="3.5%">&nbsp;<b><u>Logout</u></b></a></td>
        </tr>
        <tr height="10px"></tr>
        <tr>
            <td id="td1" width="50%" colspan="3"><br>
                <table align="center" width="95%">
                    <tr>
                        <td id="td2" height="35px" width="50px" align="center">
                            <img src="image/navigation/proposal.png" width="40px"></h3>
                        </td>
                        <td id="td2" align="left">
                            <h3>&nbsp;MANAGE ANNOUNCEMENT</h3>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><br>
                            <div id="tabs">
                                <ul>
                                    <li><a href="#AddAnnouncement"><b>Add Announcement</b></a></li>
                                    <li><a href="#EditAnnouncement"><b>Edit Announcement</b></a></li>
                                    <li><a href="#DeleteAnnouncement"><b>Delete Announcement</b></a></li>
                                </ul>
                                    <div id="AddAnnouncement">
                                         <form method="post" action="AnnouncementAddController">
                                            <label for="title">Title of Announcement</label>
                                            <input type="text" id="title" name="title" placeholder="Title..."><br>
                                            
                                            <label for="target">To</label>
                                            <select id="target" name="target">
                                              <option value="all">All</option>
                                              <option value="student">Student Only</option>
                                              <option value="supervisor">Supervisor Only</option>
                                            </select><br>
                                            <label for="annContent">Content of Announcement</label>
                                            <textarea id="annContent" name="content" rows="10" cols="35"></textarea>
                                            <input type="submit" value="Submit">
                                          </form>
                                    </div>
                                
                                    <div id="EditAnnouncement">
                                    
                                    </div>
                                    <div id="DeleteAnnouncement">
                                    
                                    </div>
                                
                                    
                                
                            </div>
                        </td>
                    </tr>
                </table><br>
            </td>
        </tr>
        <tr><td height="100px" colspan="3"></td></tr>
    </table>
</body>
</html>

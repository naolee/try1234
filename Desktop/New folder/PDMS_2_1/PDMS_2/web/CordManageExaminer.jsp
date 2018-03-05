<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/OO.css" type="text/css">
  <script type="text/javascript" src="js/caleandar.js"></script>
  <style> 
    .liEvent{
        background: url('image/green.png') no-repeat 0px 2px;
        display: inline;
        padding-left: 20px;
    }
    .liToday{
        background: url('image/gray.png') no-repeat 0px 2px;
        display: inline;
        padding-left: 20px;
    }
  </style>
  
</head>

<body onload="show_hide()">
  <div class="">
    <div class="container">
      <div class="row">
        <div class="col-md-4 h-5 bg-dark ShadowsIntoLight style top-left-radius">
          <a class="navbar-brand text-white bg-dark" href="#" contenteditable="true"><i class="fa d-inline fa-lg fa-book"></i><b class="changeFont welcome">&nbsp;PDMS</b></a>
        </div>
        <div class="col-md-4 text-white bg-dark changeFont text-center welcome"> Welcome, <%= session.getAttribute("name") %></div>
        <div class="col-md-4 text-right bg-dark logout top-right-radius">
          <a href="LogoutController" class="btn navbar-btn ml-2 changeFont ShadowsIntoLight text-dark btn-light"><i class="fa fa-fw fa-sign-out"></i>LOGOUT</a>
        </div>
      </div>
    </div>
  </div>
  <div class="">
    <div class="container">
      <div class="row">
        <div class="col-md-12 my-0" style="background-image: url(image/header_1.jpg)">
          <img class="img-fluid d-block mx-auto py-4" src="image/logo_1.png">
          <h1 class="mb-4 text-center display-4 text-dark">PROPOSAL DEFENSE&nbsp;
            <br>MANAGEMENT SYSTEM</h1>
          <p class="lead text-center text-white changeFont ShadowsIntoLight">UNIVERSITI MALAYSIA PAHANG (FSKKP)</p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12 bg-dark bottom-radius">
          <ul class="nav nav-pills bg-dark w-100">
            <li class="nav-item">
              <a class="active nav-link" href="#"> <i class="fa fa-home fa-home"></i>&nbsp;Home</a>
            </li>
            <li class="nav-item bg-dark">
                <form class="login-form" action="AnnouncementViewController" method="get" id="Announcement" name="Announcement">
                    <a href="#" class="nav-link text-white" onclick="document.getElementById('Announcement').submit(); return false;">Announcement</a>
                </form>
            </li>
            <li class="nav-item bg-dark">
                <form class="login-form" action="AppointmentController" method="get" id="Appointment" name="Appointment">
                    <a href="#" class="nav-link text-white" onclick="document.getElementById('Appointment').submit(); return false;">Appointment</a>
                </form>
            </li>
            <li class="nav-item bg-dark">
                <form class="login-form" action="ProposalApprovalController" method="get" id="Proposal" name="Proposal">
                    <a href="#" class="nav-link text-white" onclick="document.getElementById('Proposal').submit(); return false;">Proposal</a>
                </form>
            </li>
            <li class="nav-item bg-dark">
              <a class="nav-link text-white" href="#">Evaluation</a>
            </li>
            <li class="nav-item bg-dark">
              <a class="nav-link text-white" href="#">Examiner</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12 py-2">
          <ul class="breadcrumb my-2" style="margin-bottom:0px;margin-top:0px">
            <li class="breadcrumb-item active">Home</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  
  <div class="">
    <div class="container">
      <div class="row">
        <div class="col-md-12 py-3 my-2 bordergray" style="border-radius: 10px;">
          <h3 class=""><i class="fa fa-fw fa-list-alt "></i>manage examiner</h3>
          <br>
          <div class="top-left-radius top-right-radius bottom-radius bordergray">
            <div class="bg-secondary r5">
              <p class="lead text-uppercas"><b><b>&nbsp;&nbsp;List of Candidate with No Assigned Examiners&nbsp;</b></b>
              </p>
            </div>
            <div class="mx-3 bordergray py-1 r5">
              <table class="table">
                <thead>
                  <tr>
                    <th width="10%">Matric ID</th>
                    <th width="25%">Student Name</th>
                    <th width="50%">Project Title</th>
                    <th class="text-center top-right-radius">Status</th>
                  </tr>
                </thead> 
                <tbody>
                    <% 
                        int row = Integer.parseInt(session.getAttribute("row").toString());
                        for(int i=0; i<row; i++){
                    %>
                  <tr>
                    <td><%= session.getAttribute("std_id_"+i)%></td>
                    <td><%= session.getAttribute("std_name_"+i)%></td>
                    <td><%= session.getAttribute("prop_title_"+i)%></td>
                    <td align="center">
                      <form name="form1" id="form1" method="get" action="ExaminerAssignController">
                        <input type="hidden" name="std_id" value="<%= session.getAttribute("std_id_"+i)%>">
                        <input type="hidden" name="std_name" value="<%= session.getAttribute("std_name_"+i)%>">
                        <input type="hidden" name="prop_title" value="<%= session.getAttribute("prop_title_"+i)%>">
                        <button type="submit" class="btn btn-primary text-white">Assign Now</button>
                      </form>
                    </td>
                    <%   
                    }
                    %>
                  </tr>
                </tbody>
              </table>
            </div>
            <br> </div><br>
            <div class="top-left-radius top-right-radius bottom-radius bordergray">
               <div class="bg-secondary r5">
                 <p class="lead text-uppercas">&nbsp;&nbsp;List of Proposal Approval&nbsp;</p>
            </div>
        <div class="mx-3 bordergray py-1 r5">
          <table class="table">
            <thead>
              <tr>
                <th width="10%">Matric ID</th>
                <th width="25%">Student Name</th>
                <th width="50%">Project Title</th>
                <th class="text-center top-right-radius">Examiner Status</th>
              </tr>
            </thead>
                <tbody>
                    <% 
                        for(int i=0; i<row; i++){
                    %>
                  <tr>
                    <td><%= session.getAttribute("std_id_"+i)%></td>
                    <td><%= session.getAttribute("std_name_"+i)%></td>
                    <td><%= session.getAttribute("prop_title_"+i)%></td>
                    <td class="text-center"><%= session.getAttribute("prop_harcopy_status_"+i)%></td>
                    <%   
                    }
                    %>
                  </tr>
                </tbody>
          </table>
        </div>
        <br> 
        </div>
      <br>
      <br>
        </div>
        <br> 
      </div>
    </div>
  </div>
  <div class="my-4">
    <div class="container py-2">
      <div class="row">
        <div class="col-md-12 border border-dark text-center bg-dark text-white py-2 bottom-radius top-right-radius top-left-radius">
          <p class="welcome">© Copyright 2017 Proposal Defense Management System (FSKKP) - All rights reserved.</p>
        </div>
      </div>
    </div>
  </div>
                                        
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<script>
    function show_hide() { 
        var alert_appt = document.getElementById("alert_appt");   
        var appt_table = document.getElementById("appt_table");
        var checkAppt = <%= session.getAttribute("checkAppt")%> ;
        
        if(checkAppt===0){
            alert_appt.style.display = "block";
            appt_table.style.display = "none";
        }
        if(checkAppt===1){
            alert_appt.style.display = "none";
        }
    }
  </script>
 
</body>
</html>
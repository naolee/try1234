<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/OO.css" type="text/css"> 
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <link rel="stylesheet" href="css/jquery.dataTables.min.css" type="text/css">
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
  <script>
  $(document).ready(function(){
    $('#appointmentL').dataTable();
  });
  </script>
</head>

<body>
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
              <a class="active nav-link" href="SupvMainView.jsp"> <i class="fa fa-home fa-home"></i>&nbsp;Home</a>
            </li>
            <li class="nav-item bg-dark">
                <form class="login-form" action="AnnouncementViewController" method="get" id="Announcement" name="Announcement">
                    <a href="#" class="nav-link text-white" onclick="document.getElementById('Announcement').submit(); return false;">Announcement</a>
                </form>
            </li>
            <li class="nav-item bg-dark">
                <form class="login-form" action="AppointmentViewSupv" method="get" id="Appointment" name="Appointment">
                    <a href="#" class="nav-link text-white" onclick="document.getElementById('Appointment').submit(); return false;">Appointment</a>
                </form>
            </li>
            <li class="nav-item bg-dark">
                <form class="login-form" action="ProposalApprovalController" method="get" id="Proposal" name="Proposal">
                    <a href="#" class="nav-link text-white" onclick="document.getElementById('Proposal').submit(); return false;">Proposal</a>
                </form>
            </li>
            <li class="nav-item bg-dark">
                <form class="login-form" action="EvaluationController" method="get" id="Evaluation" name="Evaluation">
                    <a href="#" class="nav-link text-white" onclick="document.getElementById('Evaluation').submit(); return false;">Evaluation</a>
                </form>
            </li>
          </ul>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12 py-2">
          <ul class="breadcrumb my-2" style="margin-bottom:0px;margin-top:0px">
            <li class="breadcrumb-item">
              <a href="SupvMainView.jsp">Home</a>
            </li>
            <li class="breadcrumb-item active">Appointment</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="my-4">
    <div class="container">
      <div class="row">
  <div style=""  id="inser" class="container py-2">  
      <div class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
      
      <div id="s" style="" class="col-md-12 bottom-radius bordergray">
           <br>
           Search appointment
           <table id="appointmentL" class="table table-striped table-hover">
                <thead>
                    <th id="th1">Student Name</th>
                    <th id="th1">Project Title</th>
                    <th id="th1">Examiner 1</th>
                    <th id="th1">Examiner 2</th>
                    <th id="th1">Venue</th>
                    <th id="th1">Date</th>
                    <th id="th1">Time</th>
                  </tr>
                </thead> 
                <tbody>
                    <% 
                        int row = Integer.parseInt(session.getAttribute("row143").toString());
                        for(int i=0; i<row; i++){
                    %>
                  <tr>
                    <td><%= session.getAttribute("std_name_"+i)%></td>
                    <td><%= session.getAttribute("proj_title_"+i)%></td>
                    <td><%= session.getAttribute("exmr1_name_"+i)%></td>
                    <td><%= session.getAttribute("exmr2_name_"+i)%></td>
                    <td><%= session.getAttribute("appt_venue_"+i)%></td>
                    <td><%= session.getAttribute("appt_date_"+i)%></td>
                    <td><%= session.getAttribute("appt_time_"+i)%></td>
                    <%     
                    }
                    %>
                  </tr>
                </tbody>
              </table>
       </div>
    <br>      
      </div>  
  </div>
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
                  
</body>

</html>
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
            <li class="breadcrumb-item active">Home</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="">
    <div class="container">
      <div class="row">
        <div class="col-md-6 py-3 my-2 bordergray" style="border-radius: 10px;">
          <h3 class=""><i class="fa fa-user fa-fw"></i>announcement</h3>
          <br>
          <div class="alert bottom-radius top-right-radius alert-secondary text-dark my-0" role="alert">
            <h4 class="alert-heading Dosis text-capitalize"><b><u><%= session.getAttribute("title")%></u></b></h4>
            <p class="my-2 py-2"><%= session.getAttribute("content")%></p>
            <p class="mb-0 f14"><b>Posted on: &nbsp;<%= session.getAttribute("time")%> <%= session.getAttribute("date")%></b></p>
            <div align="right">
                 <form class="login-form" action="AnnouncementViewController" method="get" id="Announcement" name="Announcement">
                    <a href="#" class="btn btn-primary text-white" onclick="document.getElementById('Announcement').submit(); return false;">More</a>
                </form>
            </div>
          </div>
          <br> </div>
        <div class="col-md-6 py-3 my-2 bordergray" style="border-radius: 10px;">
          <h3 class=""><i class="fa fa-fw fa-calendar"></i>appointment</h3>
          <br>
          <div align="center" id="caleandar"></div>
        <div align="left">
            <ul>
            &nbsp;&nbsp;&nbsp;
                <li class="liToday">Today</li>
                <li class="liEvent">Event</li>
            </ul>
        </div>  
         
          <div align="right">
              <form class="login-form" action="AppointmentController" method="get" id="Appointment" name="Appointment">
                    <a href="#" class="btn btn-primary text-white" onclick="document.getElementById('Appointment').submit(); return false;">More</a>
                </form>
          </div>
        </div>
        <br> </div>
    </div>
  </div>
  <div class="my-4">
    <div class="container">
      <div class="row">
        <div class="col-md-6 py-3 bordergray text-center" style="border-radius: 10px;">
          <h3 class=""><i class="fa fa-fw fa-list-alt"></i>proposal submission</h3>
          <br>
          <div class="text-center text-white">
              <form class="login-form" action="ProposalApprovalController" method="get" id="Proposal" name="Proposal">
                    <a href="#" class="btn btn-primary pi-draggable text-white w50" href=""onclick="document.getElementById('Proposal').submit(); return false;">Manage Proposal</a>
              </form>
          </div>
        </div>
        <div class="col-md-6 py-3 bordergray text-center" style="border-radius: 10px;">
          <h3 class=""><i class="fa fa-fw fa-bar-chart "></i>student evaluation</h3>
          <br>
          <div class="text-center text-white">
            <form class="login-form" action="EvaluationController" method="get" id="Evaluation" name="Evaluation">
                    <a href="#" class="btn btn-primary pi-draggable text-white w50" href=""onclick="document.getElementById('Evaluation').submit(); return false;">Manage Evaluation</a>
            </form>
              
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
                                        
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<script>
    function show_hide() { 
        var alert_appt = document.getElementById("alert_appt");   
        var appt_table = document.getElementById("appt_table");
        var checkAppt = <%= session.getAttribute("checkAppt")%> ;
        var approval = <%= session.getAttribute("approval")%> ;
        if(checkAppt===0){
            alert_appt.style.display = "block";
            appt_table.style.display = "none";
        }
        if(checkAppt===1){
            alert_appt.style.display = "none";
        }
    }
  </script>
  <script>
    var xyz=[];
    <% int row= Integer.parseInt(session.getAttribute("row").toString()); %>  
    xyz.length=<%= row%>;
    <% int abc=0;%>
    for(var z=0; z<xyz.length; z++){
        xyz[z]= '<%= session.getAttribute("std_id_"+abc)%>';  
        <% abc=abc+1;%>
        var x= '<%=abc%>';
    }
    var xxx = "New Garfield movie comes out! <br>New Garfield movie comes out!";
    var events = [
      {Date: new Date(2017, 10, 11), Title: xyz[0]},
      {Date: new Date(2017, 10, 18), Title: xyz[1], Link: 'https://garfield.com'},
      {Date: new Date(2017, 10, 27), Title: xyz[2], Link: 'https://www.google.com.au/#q=anniversary+gifts'}
    ];
    var settings = {};
    var element = document.getElementById('caleandar');
    caleandar(element, events, settings);
  </script>    
</body>
</html>
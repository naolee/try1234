<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/OO.css" type="text/css"> </head>

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
              <a href="StdMainView.jsp" class="active nav-link"> <i class="fa fa-home fa-home"></i>&nbsp;Home</a>
            </li>
            <li class="nav-item bg-dark">
                <form class="login-form" action="AnnouncementViewController" method="get" id="Announcement" name="Announcement">
                    <a href="#" class="nav-link text-white" onclick="document.getElementById('Announcement').submit(); return false;">Announcement</a>
                </form>
            </li>
            <li class="nav-item bg-dark">
                <form class="login-form" action="AppointmentViewStd" method="get" id="Appointment" name="Appointment">
                    <a href="#" class="nav-link text-white" onclick="document.getElementById('Appointment').submit(); return false;">Appointment</a>
                </form>
            </li>
            <li class="nav-item bg-dark">
              <a href="StdProposal.jsp" class="nav-link text-white">Proposal</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12 py-2">
          <ul class="breadcrumb my-2" style="margin-bottom:0px;margin-top:0px">
            <li class="breadcrumb-item">
              <a href="StdMainView.jsp">Home</a>
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
        <div class="col-md-12 bordergray py-3" style="border-radius: 10px;">          <h3 class=""><i class="fa fa-fw fa-calendar"></i>appointment</h3><br>
          <div id="noAppt" class="alert bottom-radius top-right-radius alert-secondary text-dark" role="alert">
            <h5 class="alert-heading Dosis m-0"><b>Rest assured,</b></h5>
            <p class="m-1">There is no appointment has been set up for you yet.</p>
          </div>
          
          <div id="apptTable"><table class="table">
            <tbody>
              <tr>
                <th>Date</th>
                <td><%= request.getAttribute("date1")%></td>
              </tr>
              <tr>
                <th>Time</th>
                <td><%= request.getAttribute("time1")%></td>
              </tr>
              <tr>
                <th>Venue</th>
                <td><%= request.getAttribute("venue1")%></td>
              </tr>
              <tr>
                <th>Examiner 1</th>
                <td><%= request.getAttribute("exmr1")%></td>
              </tr>
              <tr>
                <th>Examiner 2</th>
                <td><%= request.getAttribute("exmr2")%></td>
              </tr>
            </tbody>
          </table>
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
        var checkAppt = <%= session.getAttribute("checkAppt")%> ;           //CHECK IF THE STUDENT HAS APPOINTMENT
        var noAppt = document.getElementById("noAppt");                     //NO APPOINTMENT FOR THE STUDENT MESSAGE
        var apptTable = document.getElementById("apptTable");               //TABLE OF APPOINTMENT WHICH CONTAINS THE DETAILS OF APPOINTMENT
        if(checkAppt==0){
            noAppt.style.display = "block";
            apptTable.style.display = "none";
        }
        if(checkAppt==1){
            noAppt.style.display = "none";
            apptTable.style.display = "block";            
        }
    }
  </script>
</body>

</html>
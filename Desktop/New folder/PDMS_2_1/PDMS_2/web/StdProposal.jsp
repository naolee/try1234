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
      </div><div class="row">
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
            <li class="breadcrumb-item active">Proposal</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="my-4">
    <div class="container">
      <div class="row">
        <div class="col-md-12 border border-dark py-3" style="border-radius: 10px;">
           <h3 class=""><i class="fa fa-fw fa-list-alt "></i>proposal submission</h3>
          <br>
          <div id="proposalSubmit" class="alert alert-success" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
            <h4 class="alert-heading Dosis">Well done!</h4>
            <p>Your proposal has been submitted!&nbsp;</p>
            <p class="mb-0">Please check later to check whether your proposal has been approved by your supervisor</p>
          </div>
          <div id="proposalStatus" style="display:none" class="alert alert-success" role="alert">
            <h4 class="alert-heading Dosis">Well done!</h4>
            <p>Your proposal has been approved!&nbsp;</p>
          </div>
          <div id="proposalStatusReject" style="display:none" class="alert alert-success" role="alert">
            <h4 class="alert-heading Dosis">Unfortunately,</h4>
            <p>Your proposal has been rejected. Please submit again&nbsp;</p>
          </div>
          <form id="uploadBtn" action="ProposalSoftcopyController" method="post" enctype="multipart/form-data" >
              <div class="form-group"> <label><b>Select file to upload</b></label>
              <input type="file" name="file" accept="application/pdf" class="form-control"> </div>
            <div align="right">
              <div style="color:#a3041a;">* Please note that only PDF file that is not bigger than 25MB will be accepted.</div><br><br>
              <a href="ProposalDownloadController"><button id="downloadBtn" type="button" class="btn btn-primary text-white"><i class="fa fa-fw fa-download"></i>Download</button></a>
              <button type="submit" class="btn btn-primary text-white"><i class="fa fa-fw fa-upload"></i>Upload</button>
            </div>
          </form>
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
  <script> function show_hide() {
        var checkSoftcopy = <%= session.getAttribute("checkSoftcopy")%> ;   //CHECK IF THE STUDENT HAS SUBMIT PROPOSAL SOFTCOPY
        var checkApproval = <%= session.getAttribute("checkApproval")%> ;   //CHECK WHETHER THE PROPOSAL IS APPROVED OR REJECTED
        var proposalSubmit = document.getElementById("proposalSubmit");     //PROPOSAL SUBMITTED MESSAGE
        var proposalStatus = document.getElementById("proposalStatus");     //PROPOSAL STATUS MESSAGE
        var checkAppt = <%= session.getAttribute("checkAppt")%> ;           //CHECK IF THE STUDENT HAS APPOINTMENT
        var noAppt = document.getElementById("noAppt");                     //NO APPOINTMENT FOR THE STUDENT MESSAGE
        var apptTable = document.getElementById("apptTable");               //TABLE OF APPOINTMENT WHICH CONTAINS THE DETAILS OF APPOINTMENT
        var downloadBtn = document.getElementById("downloadBtn");           //DOWNLOAD BUTTON SHOW WHEN THE STUDENT HAS SUBMITTED PROPOSAL
        var uploadBtn = document.getElementById("uploadBtn");               //UPLOAD BUTTON SHOW WHEN THE STUDENT HAS NOT SUBMIT PROPOSAL/NOT APPROVED YET AND HIDDEN WHEN THE PROPOSAL HAS BEEN APPROVED. 
        var proposalStatusReject = document.getElementById("proposalStatusReject");
        
        if(checkSoftcopy==0){
            proposalSubmit.style.display = "none";
            downloadBtn.style.display = "none";
        }
        //APPROVED
        if(checkApproval==1 && checkSoftcopy==1){
            proposalStatus.style.display = "block";
            proposalSubmit.style.display = "none";
            uploadBtn.style.display = "none";
        }
        //REJECTED
        if(checkApproval==2 && checkSoftcopy==1){
            proposalStatusReject.style.display = "block";
            proposalStatus.style.display = "none";
            proposalSubmit.style.display = "none";
        }
        //NOT YET APPROVED
        if(checkApproval==3 && checkSoftcopy==1){
            proposalStatus.style.display = "none";
        }
    }
  </script>        
</body>

</html>
<%-- 
    Document   : AdmAnnouncement
    Created on : Nov 15, 2017, 10:26:00 AM
    Author     : nadia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/OO.css" type="text/css">
  <style>
      
    div.inline { display: inline-block}
    .clearBoth { clear:both; }

    /* Style the tab */
    div.tab {
        float: left;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
        width: 100px;
        height: 100%;
    }

    /* Style the buttons inside the tab */
    div.tab button {
        display: block;
        background-color: inherit;
        color: black;
        padding: 22px 16px;
        width: 100%;
        border: none;
        outline: none;
        text-align: center;
        cursor: pointer;
        transition: 0.3s;
    }

    /* Change background color of buttons on hover */
    div.tab button:hover {
        background-color: #ddd;
    }

    /* Create an active/current "tab button" class */
    div.tab button.active {
        background-color: #ccc;
    }

    /* Style the tab content */
    .tabcontent {
        padding: 22px 16px;
        border: 1px solid #ccc;
        width: 100%;
        height: 100%;
    }
    </style>
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
              <a href="AdmMainView.jsp" class="active nav-link"> <i class="fa fa-home fa-home"></i>&nbsp;Home</a>
            </li>
            <li class="nav-item bg-dark">
               <form class="login-form" action="AnnouncementViewController" method="get" id="Announcement" name="Announcement">
                    <a href="#" class="nav-link text-white" onclick="document.getElementById('Announcement').submit(); return false;">Announcement</a>
                </form>
            </li>
            <li class="nav-item bg-dark">
               <form class="login-form" action="AppointmentController" method="get" id="Appointment" name="Announcement">
                    <a href="#" class="nav-link text-white" onclick="document.getElementById('Appointment').submit(); return false;">Appointment</a>
                </form>
            </li>
            <li class="nav-item bg-dark">
                <form class="login-form" action="ProposalHardcopyController" method="get" id="Proposal" name="Proposal">
                    <a href="#" class="nav-link text-white" onclick="document.getElementById('Proposal').submit(); return false;">Proposal</a>
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
        <div class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
          <h3 class=""><i class="fa fa-user fa-fw"></i>manage announcement</h3>
          <div><br>
            <h4>List of Announcement</h4><br>
            <div class="">
                <form class="login-form" action="AnnouncementUpdateController" method="POST">
                    <input type="hidden" name="id" id="id" value="<%= request.getAttribute("id")%>">
                    <h5>Title:</h5>
                    <input class="r5" style="width:100%" type="text" name="title" id="title" placeholder="Title of announcement" value="<%= request.getAttribute("title")%>"><br><br> 
                    <h5>Accessibility:</h5>
                    <select name="access" id="access" class="r5" style="width:100%">
                        <option <%= request.getAttribute("access_1")%> >All</option> 
                        <option <%= request.getAttribute("access_2")%>>Student Only</option>
                        <option <%= request.getAttribute("access_3")%>>Supervisor Only</option>
                        <option <%= request.getAttribute("access_4")%>>Coordinator Only</option>
                    </select><br><br>
                    <h5>Content:</h5>
                    <textarea name="content" id="content" class="r5" style="width:100%" name="message" rows="10" cols="30" placeholder="Content of announcement"><%= request.getAttribute("content")%></textarea><br>
                    <div align="right"><button type="submit" style="width:100px" class="btn btn-primary text-white">Save</button></div>
                </form>
            </div>
          </div><br>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12"> </div>
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
</body>
</html>
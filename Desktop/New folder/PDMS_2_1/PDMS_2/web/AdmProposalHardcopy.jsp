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
    $('#diehard').dataTable();
  });
  </script>
  <style> 
    #h3{
        background-image: url("http://www.zingerbug.com/Backgrounds/background_images/small_off_white_bricks_seamless_pattern.gif");
    }   
    input[type=submit]{
        background-color: white;
        border: none;
        color: black;
        text-decoration: none;
        cursor: pointer;
    }   
    .bg1{
        background-color: #78ABC6;
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
            <li class="breadcrumb-item">Home</li>          
            <li class="breadcrumb-item active">Proposal</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
                  
  <div class="container">
    <div class="row">
      <div onclick="show_hide('EditProposal')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3>Edit Proposal Hardcopy Submission</h3>
      </div>
    </div>
  </div>       
  <div style="display:none" id="EditProposal" class="container">
    <div class="row">      
     <div class="col-md-12 bottom-radius top-right-radius top-left-radius bordergray"><br>
      <table id="" class="table table-striped table-hover" >
            <thead>
              <tr>
                <th>Matric ID</th>
                <th>Student Name</th>
                <th>Project Title</th>
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
                    <td>
                    <form name="form1" id="form1" method="POST" action="ProposalHardcopyController">
                        <input type="hidden" name="submit_id" value="<%= session.getAttribute("std_id_"+i)%>">
                        <input type="hidden" name="std_name" value="<%= session.getAttribute("std_name_"+i)%>">
                        <input type="hidden" name="prop_title" value="<%= session.getAttribute("prop_title_"+i)%>">
                        <input type="hidden" name="i" value="<%= i%>">
                        <div class="text-center"> 
                          <select name="hardcopy" id="hardcopy" class="r5" onchange="this.form.submit(); document.myForm.myMenu[document.myForm.myMenu.selectedIndex].value;">
                            <option selected disabled>- Select -</option>
                            <option value="Submitted">Submitted</option>
                            <option value="Not Submitted">Not Submitted</option>
                          </select>
                          <br> 
                        </div>
                      </form>
                    </td>
                    <%   
                    }
                    %>
                  </tr>
                </tbody>
          </table>
    </div>
    </div>
</div>  
<div class="container">
  <div class="row">
    <div onclick="show_hide('ListProposal')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
      <h3>View List of Proposal Hardcopy Submission</h3>
    </div>
  </div>
</div>
  <div  style="display:none" id="ListProposal" class="container">
    <div class="row">      
     <div class="col-md-12 bottom-radius top-right-radius top-left-radius bordergray"><br>
      <table id="diehard" class="table table-striped table-hover" >
            <thead>
              <tr>
                <th>Matric ID</th>
                <th>Student Name</th>
                <th>Project Title</th>
                <th class="text-center top-right-radius">Status</th>
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
                    <td class="text-center"><%= session.getAttribute("prop_hardcopy_status_"+i)%></td>
                    <%   
                    }
                    %>
                  </tr>
                </tbody>
          </table>
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
<script>
    function show_hide(qwe){
    var x = document.getElementById(qwe);
    if(qwe=='EditProposal'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('ListProposal').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }
    if(qwe=='ListProposal'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('EditProposal').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }
}
</script>
</body>
</html>
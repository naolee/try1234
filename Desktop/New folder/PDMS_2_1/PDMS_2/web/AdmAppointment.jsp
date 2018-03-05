<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/OO.css" type="text/css">
  <script type="text/javascript" src="js/caleandar.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script><link rel="stylesheet" href="css/jquery.dataTables.min.css" type="text/css">
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
  <script>
  $(document).ready(function(){
    $('#examiner1').dataTable();
  });
  
  $(document).ready(function(){
    $('#examiner2').dataTable();
  });
  
  $(document).ready(function(){
    $('#student1').dataTable();
  });
  
  $(document).ready(function(){
    $('#student2').dataTable();
  });
  
  $(document).ready(function(){
    $('#listunassigned').dataTable();
  });
  
  $(document).ready(function(){
    $('#listassigned').dataTable();
  });
  </script>
  <style>
    input[type=text]{
    background: #ffd59b;
    color: black;
    }
    table{
        table-layout: fixed;
        width:100%;
    }
    #th1{ background-color: pink; }
    button{ width:100px; }
    #h3{ background-image: url("http://www.zingerbug.com/Backgrounds/background_images/small_off_white_bricks_seamless_pattern.gif"); }
    h4{ font-family: Dosis;}
    #h4{ background-image: url("http://www.zingerbug.com/Backgrounds/background_images/small_off_white_bricks_seamless_pattern.gif"); }
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
        <div class="col-md-12">
          <ul class="breadcrumb my-2" style="margin-bottom:0px;margin-top:0px">
            <li class="breadcrumb-item active">Home</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  
  <div class="container py-2">
    <div onclick="show_hide('new')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>New Appointment</h3>
    </div>
  </div>
  <div style="display:none" id="new" class="container py-2">  
      <div class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
       <div align="center">
       <form name="new" method="post" action="AppointmentAddController" >
          <table>
             <tr>
                 <th width="10%">Student ID</th>
                 <td width="40%">:&nbsp;&nbsp;<input name="std_id1" id="std_id1" size="55" type="text" readonly></td>
                 <th width="10%">&nbsp;&nbsp;Examiner 1</th>
                 <td width="40%">:&nbsp;&nbsp;<input name="ex11" id="ex11" size="55" type="text" readonly></td>
             </tr> 
             <tr>                  
                 <th>Student Name</th>
                 <td>:&nbsp;&nbsp;<input name="std_name1" id="std_name1" size="55" type="text" readonly></td>
                 <th>&nbsp;&nbsp;Examiner 2</th>
                 <td>:&nbsp;&nbsp;<input id="ex21" size="55" type="text" name="ex21" readonly></td>
             </tr>
             <tr>                  
                 <th>Date</th>
                 <td>:&nbsp;&nbsp;
                    <select id="date1" name="date1">
                        <option selected disabled>- Select Date - </option>
                        <option onclick="a('date1')">4 February 2018</option>
                        <option onclick="a('date2')">5 February 2018</option>
                    </select>
                 </td>
                 <th>&nbsp;&nbsp;Time</th>
                 <td>:&nbsp;&nbsp;
                     <select style="display:none" id="time1" name="time1">
                        <option selected disabled>- Select Time 1 - </option>
                        <%
                            int length1 = Integer.parseInt(request.getAttribute("length1").toString());
                            for(int i=0; i<length1; i++){
                        %>
                        <option onclick="a('time1')"><%= request.getAttribute("time1_"+i)%></option><%}%>
                    </select>
                    
                    <select style="display:none" id="time2" name="time2">
                        <option selected disabled>- Select Time 2 - </option>
                        <%
                            int length2 = Integer.parseInt(request.getAttribute("length2").toString());
                            for(int i=0; i<length2; i++){
                        %>
                        <option onclick="a('time2')"><%= request.getAttribute("time2_"+i)%></option><%}%>
                    </select>
                 </td>
             </tr>
             <tr>
                <th>Venue</th>
                <td>:&nbsp;&nbsp;
                    <select id="venue1" name="venue1">
                        <option selected disabled>- Select Venue - </option>
                        <option>FSK20</option>
                        <option>FSK21</option>
                        <option>FSK22</option>
                        <option>FSK23</option>
                        <option>FSK24</option>
                        <option>FSK25</option>
                        <option>FSK26</option>
                        <option>FSK27</option>
                        <option>FSK28</option>
                    </select>
                </td>
                <td colspan="2">
                </td>
             </tr>
          </table>
                 <br>
             <div align="center">
                 <button type="reset" class="text-black">Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <button type="submit">Save</button>
             </div>
       </form>
       </div> 
         <br>
      <div id="h4" align="center" class="col-md-12 bordergray" onclick="show_hide('FindStudent1')">
          <h4><b>Find Student</b></h4>
      </div>
      <div id="FindStudent1" style="display:none" class="col-md-12 bottom-radius bordergray">
           <br>
           Search student
           <table id="student1" class="table table-striped table-hover">
                <thead>
                    <th id="th1">Student ID</th>
                    <th id="th1">Student Name</th>
                    <th id="th1">Examiner 1</th>
                    <th id="th1">Examiner 2</th>
                  </tr>
                </thead> 
                <tbody>
                    <% 
                        int row = Integer.parseInt(request.getAttribute("x").toString());
                        for(int i=0; i<row; i++){
                    %>
                  <tr>
                    <td><%= request.getAttribute("astd_id_"+i)%></td>
                    <td><%= request.getAttribute("astd_name_"+i)%></td>
                    <td><%= request.getAttribute("aexmr1_name_"+i)%></td>
                    <td><%= request.getAttribute("aexmr2_name_"+i)%></td>
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
  <div class="container py-2">
    <div onclick="show_hide('edit')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>Edit Appointment</h3>
    </div>
  </div>
<div class="container py-2">
    <div onclick="show_hide('view')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>View Appointment</h3>
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
    function a(qwe){
        if(qwe=='date1'){
            var x = document.getElementById("time1");
            if (x.style.display == "none") {
                x.style.display = "inline";
                document.getElementById('time2').style.display= 'none';
            } else {
                x.style.display = "none";
            }
        }
        if(qwe=='date2'){
            var x = document.getElementById("time2");
            if (x.style.display == "none") {
                x.style.display = "inline";
                document.getElementById('time1').style.display= 'none';
            } else {
                x.style.display = "none";
            }
        }
    }
</script>                  
<script>
    
    var s1 = document.getElementById('student1');
    for(var i = 1; i < s1.rows.length; i++){
        s1.rows[i].onclick = function(){
          var asd =this.cells[0].innerHTML; 
          document.getElementById("std_id1").value = this.cells[0].innerHTML;   
          document.getElementById("std_name1").value = this.cells[1].innerHTML;   
          document.getElementById("ex11").value = this.cells[2].innerHTML;        
          document.getElementById("ex21").value = this.cells[3].innerHTML;        
        };
    }
    
    var s2 = document.getElementById('student2');
    for(var i = 1; i < s2.rows.length; i++){
        s2.rows[i].onclick = function(){
          var asd =this.cells[0].innerHTML; 
          document.getElementById("std_id2").value = this.cells[0].innerHTML;   
          document.getElementById("std_name2").value = this.cells[1].innerHTML;   
          document.getElementById("prop_title2").value = this.cells[2].innerHTML;   
          document.getElementById("ex12").value = this.cells[3].innerHTML;  
          document.getElementById("ex22").value = this.cells[4].innerHTML;              
        };
    }
       
</script>
<script>
function show_hide(qwe) {
    var x = document.getElementById(qwe);
    if(qwe=='view'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('new').style.display= 'none';
        document.getElementById('edit').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }    
    if(qwe=='assigned'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('view').style.display= 'none';
        document.getElementById('new').style.display= 'none';
        document.getElementById('edit').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }  
    if(qwe=='new'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('view').style.display= 'none';
        document.getElementById('assigned').style.display= 'none';
        document.getElementById('edit').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }
    if(qwe=='edit'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('view').style.display= 'none';
        document.getElementById('assigned').style.display= 'none';
        document.getElementById('new').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }
    if(qwe=='FindExaminer1'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('FindStudent1').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }
    if(qwe=='FindStudent1'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('FindExaminer1').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }
    if(qwe=='FindExaminer2'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('FindStudent2').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }
    if(qwe=='FindStudent2'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('FindExaminer2').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }
}
</script>
</body>
</html>
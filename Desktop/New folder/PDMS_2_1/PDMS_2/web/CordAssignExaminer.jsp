<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/OO.css" type="text/css">
  <script type="text/javascript" src="js/caleandar.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <link rel="stylesheet" href="css/jquery.dataTables.min.css" type="text/css">
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
        <div class="col-md-12">
          <ul class="breadcrumb my-2" style="margin-bottom:0px;margin-top:0px">
            <li class="breadcrumb-item active">Home</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  
  <div class="container py-2">
    <div onclick="show_hide('AssignExaminer')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>Assign examiner</h3>
    </div>
  </div>
  <div style="display:none" id="AssignExaminer" class="container py-2">  
      <div class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
       <div align="center">
       <form name="AssignExaminer" method="post" onsubmit="return validateForm('AssignExaminer')" action="ExaminerAssignController" >
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
                 <th>Project Title</th>
                 <td colspan="2">:&nbsp;&nbsp;<input name="prop_title1" id="prop_title1" size="55" type="text" readonly></td>
             </tr>  
          </table>
                 <br>
             <div align="center">
                 <input type="hidden" id="ex1_id1" name="ex1_id1">
                 <input type="hidden" id="ex2_id1" name="ex2_id1">
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
                    <th id="th1">Project Title</th>
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
                    <td><%= request.getAttribute("aprop_title_"+i)%></td>
                    <%     
                    }
                    %>
                  </tr>
                </tbody>
              </table>
       </div>
    <br>
    <div id="h4" align="center" class="col-md-12 bordergray" onclick="show_hide('FindExaminer1')">
        <h4><b>Find Examiner</b></h4>
    </div>
    <div id="FindExaminer1" style="display:none" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
           <b>Find Examiner : 
           <select id="find_exmr1">
               <option>Examiner 1</option>
               <option>Examiner 2</option>
           </select></b> 
        <br><br>   
           <table id="examiner1" class="table table-striped table-hover">
                <thead>
                    <th id="th1">Examiner Name</th>
                    <th id="th1">Qualification Level</th>
                    <th id="th1">Expertise Field 1</th>
                    <th id="th1">Expertise Field 2</th>
                    <th id="th1">Expertise Field 3</th>
                  </tr>
                </thead> 
                <tbody>
                    <% 
                        row = Integer.parseInt(request.getAttribute("row1").toString());
                        for(int i=0; i<row; i++){
                    %>
                  <tr>
                    <td><div style="display:none"><%= request.getAttribute("exmr_id_"+i)%></div> <%= request.getAttribute("exmr_name_"+i)%></td>
                    <td><%= request.getAttribute("qual_id_"+i)%></td>
                    <td><%= request.getAttribute("exp1_field_"+i)%></td>
                    <td><%= request.getAttribute("exp2_field_"+i)%></td>
                    <td><%= request.getAttribute("exp3_field_"+i)%></td>
                    <%     
                    }
                    %>
                  </tr>
                </tbody>
              </table>
      </div>        
      </div>  
      
  </div>
        
  
  <div class="container py-2">
    <div onclick="show_hide('EditExaminer')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>edit examiner</h3>
    </div>
  </div>
  <div style="display:none" id="EditExaminer" class="container py-2">  
      <div class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
       <div align="center">
       <form name="EditExaminer" method="post"  onsubmit="return validateForm('EditExaminer')" action="ExaminerUpdateController" >
          <table>
             <tr>
                 <th width="10%">Student ID</th>
                 <td width="40%">:&nbsp;&nbsp;<input name="std_id2" id="std_id2" size="55" type="text" readonly></td>
                 <th width="10%">&nbsp;&nbsp;Examiner 1</th>
                 <td width="40%">:&nbsp;&nbsp;<input name="ex12" id="ex12" size="55" type="text" readonly></td>
             </tr> 
             <tr>                  
                 <th>Student Name</th>
                 <td>:&nbsp;&nbsp;<input name="std_name2" id="std_name2" size="55" type="text" readonly></td>
                 <th>&nbsp;&nbsp;Examiner 2</th>
                 <td>:&nbsp;&nbsp;<input id="ex22" size="55" type="text" name="ex22" readonly></td>
             </tr>
             <tr>
                 <th>Project Title</th>
                 <td colspan="2">:&nbsp;&nbsp;<input name="prop_title2" id="prop_title2" size="55" type="text" readonly></td>
             </tr>  
          </table>
                 <br>
             <div align="center">
                 <input type="hidden" id="ex1_id2" name="ex1_id2">
                 <input type="hidden" id="ex2_id2" name="ex2_id2">
                 <button type="reset" class="text-black">Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <button type="submit">Save</button>
             </div>
       </form>
       </div> 
         <br>
      <div id="h4" align="center" class="col-md-12 bordergray" onclick="show_hide('FindStudent2')">
          <h4><b>Find Student</b></h4>
      </div>
      <div id="FindStudent2" style="display:none" class="col-md-12 bottom-radius bordergray">
           <br>
           Search student
           <table id="student2" class="table table-striped table-hover">
                <thead>
                    <th id="th1">Student ID</th>
                    <th id="th1">Student Name</th>
                    <th id="th1">Project Title</th>
                    <th id="th1">Examiner 1</th>
                    <th id="th1">Examiner 2</th>
                  </tr>
                </thead> 
                <tbody>
                    <% 
                        row = Integer.parseInt(request.getAttribute("row2").toString());
                        for(int i=0; i<row; i++){
                    %>
                  <tr>
                    <td><%= request.getAttribute("std_id_"+i)%></td>
                    <td><%= request.getAttribute("std_name_"+i)%></td>
                    <td><%= request.getAttribute("prop_title_"+i)%></td>
                    <td><%= request.getAttribute("exmr1_name_"+i)%></td>
                    <td><%= request.getAttribute("exmr2_name_"+i)%></td>
                    <%     
                    }
                    %>
                  </tr>
                </tbody>
              </table>
       </div>
    <br>
    <div id="h4" align="center" class="col-md-12 bordergray" onclick="show_hide('FindExaminer2')">
        <h4><b>Find Examiner</b></h4>
    </div>
    <div id="FindExaminer2" style="display:none" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
           <b>Find Examiner : 
           <select id="find_exmr2">
               <option>Examiner 1</option>
               <option>Examiner 2</option>
           </select></b> 
        <br><br>   
           <table id="examiner2" class="table table-striped table-hover">
                <thead>
                    <th id="th1">Examiner Name</th>
                    <th id="th1">Qualification Level</th>
                    <th id="th1">Expertise Field 1</th>
                    <th id="th1">Expertise Field 2</th>
                    <th id="th1">Expertise Field 3</th>
                  </tr>
                </thead> 
                <tbody>
                    <% 
                        row = Integer.parseInt(request.getAttribute("row1").toString());
                        for(int i=0; i<row; i++){
                    %>
                  <tr>
                    <td><div style="display:none"><%= request.getAttribute("exmr_id_"+i)%></div> <%= request.getAttribute("exmr_name_"+i)%></td>
                    <td><%= request.getAttribute("qual_id_"+i)%></td>
                    <td><%= request.getAttribute("exp1_field_"+i)%></td>
                    <td><%= request.getAttribute("exp2_field_"+i)%></td>
                    <td><%= request.getAttribute("exp3_field_"+i)%></td>
                    <%     
                    }
                    %>
                  </tr>
                </tbody>
              </table>
      </div>        
      </div>  
  </div>
<div class="container py-2">
    <div onclick="show_hide('unassigned')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>Student List With No Assigned Examiners</h3>
    </div>
</div>
<div class="container">
    <div id="unassigned" style="display:none" class="col-md-12 bottom-radius bordergray">
           <br>
           <table id="listunassigned" class="table table-striped table-hover">
                <thead>
                    <th id="th1">Student ID</th>
                    <th id="th1">Student Name</th>
                    <th id="th1">Project Title</th>
                  </tr>
                </thead> 
                <tbody>
                    <% 
                        row = Integer.parseInt(request.getAttribute("x").toString());
                        for(int i=0; i<row; i++){
                    %>
                  <tr>
                    <td><%= request.getAttribute("astd_id_"+i)%></td>
                    <td><%= request.getAttribute("astd_name_"+i)%></td>
                    <td><%= request.getAttribute("aprop_title_"+i)%></td>
                    <%     
                    }
                    %>
                  </tr>
                </tbody>
              </table><br>
       </div>
</div>
                  
<div class="container py-2">
    <div onclick="show_hide('assigned')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>Student List With  Assigned Examiners</h3>
    </div>
</div>
<div class="container">
    <div id="assigned" style="display:none" class="col-md-12 bottom-radius bordergray">
           <br>
           <table id="listassigned" class="table table-striped table-hover">
                <thead>
                    <th id="th1">Student ID</th>
                    <th id="th1">Student Name</th>
                    <th id="th1">Project Title</th>
                    <th id="th1">Examiner 1</th>
                    <th id="th1">Examiner 2</th>
                  </tr>
                </thead> 
                <tbody>
                    <% 
                        row = Integer.parseInt(request.getAttribute("row2").toString());
                        for(int i=0; i<row; i++){
                    %>
                  <tr>
                    <td><%= request.getAttribute("std_id_"+i)%></td>
                    <td><%= request.getAttribute("std_name_"+i)%></td>
                    <td><%= request.getAttribute("prop_title_"+i)%></td>
                    <td><%= request.getAttribute("exmr1_name_"+i)%></td>
                    <td><%= request.getAttribute("exmr2_name_"+i)%></td>
                    <%     
                    }
                    %>
                  </tr>
                </tbody>
              </table><br>
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
    var s1 = document.getElementById('student1');
    for(var i = 1; i < s1.rows.length; i++){
        s1.rows[i].onclick = function(){
          var asd =this.cells[0].innerHTML; 
          document.getElementById("std_id1").value = this.cells[0].innerHTML;   
          document.getElementById("std_name1").value = this.cells[1].innerHTML;   
          document.getElementById("prop_title1").value = this.cells[2].innerHTML;        
        };
    }
    var e1 = document.getElementById('examiner1');
    for(var i = 1; i < e1.rows.length; i++){
        e1.rows[i].onclick = function(){
            var select = document.getElementById("find_exmr1");
            var answer = select.options[select.selectedIndex].value;
            
            var str = this.cells[0].innerHTML;
            var n = str.lastIndexOf("</div>");
            var j = str.lastIndexOf("none");
            var front =  str.substr(0, j+7);
            var end =  str.substr(n, str.length);
            var a = str.length - front.length - end.length;
            var exmr_id = str.substr(j+7, a);
            var exmr_name = str.substr(n+7, str.length);
            
            if(answer=="Examiner 1"){
                document.getElementById("ex11").value = exmr_name;
                document.getElementById("ex1_id1").value = exmr_id;
            }
            if(answer=="Examiner 2"){
                document.getElementById("ex21").value = exmr_name;
                document.getElementById("ex2_id1").value = exmr_id;
            }
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
    
    var e2 = document.getElementById('examiner2');
    for(var i = 1; i < e2.rows.length; i++){
        e2.rows[i].onclick = function(){
            var select = document.getElementById("find_exmr2");
            var answer = select.options[select.selectedIndex].value;
            
            var str = this.cells[0].innerHTML;
            var n = str.lastIndexOf("</div>");
            var j = str.lastIndexOf("none");
            var front =  str.substr(0, j+7);
            var end =  str.substr(n, str.length);
            var a = str.length - front.length - end.length;
            var exmr_id = str.substr(j+7, a);
            var exmr_name = str.substr(n+7, str.length);
            
            if(answer=="Examiner 1"){
                document.getElementById("ex12").value = exmr_name;
                document.getElementById("ex1_id2").value = exmr_id;
            }
            if(answer=="Examiner 2"){
                document.getElementById("ex22").value = exmr_name;
                document.getElementById("ex2_id2").value = exmr_id;
            }
        };
    }
    
</script>
<script>

function validateForm(formname) {
    
    if(formname=="AssignExaminer"){
        var std_id = document.forms[formname]["std_id1"].value;
        var ex1 = document.forms[formname]["ex11"].value;
        var ex2 = document.forms[formname]["ex21"].value;
    }
    if(formname=="EditExaminer"){
        var std_id = document.forms[formname]["std_id2"].value;
        var ex1 = document.forms[formname]["ex12"].value;
        var ex2 = document.forms[formname]["ex22"].value;
    }
    if (std_id == "") {
        alert("Student is not selected!");
        return false;
    }
    if (ex1 == "") {
        alert("Examiner 1 is not selected!");
        return false;
    }
    if (ex2 == "") {
        alert("Examiner 2 is not selected!");
        return false;
    }
    if (ex1 == ex2) {
        alert("Examiner 1 and Examiner 2 cannot be the same!");
        return false;
    }
}    
       
</script>
<script>
function show_hide(qwe) {
    var x = document.getElementById(qwe);
    if(qwe=='unassigned'){
        if (x.style.display == "none") {
        x.style.display = "block";
        //document.getElementById('assigned').style.display= 'none';
        document.getElementById('AssignExaminer').style.display= 'none';
        document.getElementById('EditExaminer').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }    
    if(qwe=='assigned'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('unassigned').style.display= 'none';
        document.getElementById('AssignExaminer').style.display= 'none';
        document.getElementById('EditExaminer').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }  
    if(qwe=='AssignExaminer'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('unassigned').style.display= 'none';
        document.getElementById('assigned').style.display= 'none';
        document.getElementById('EditExaminer').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }
    if(qwe=='EditExaminer'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('unassigned').style.display= 'none';
        document.getElementById('assigned').style.display= 'none';
        document.getElementById('AssignExaminer').style.display= 'none';
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
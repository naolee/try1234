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
    $('#candidate').dataTable();
  });
  
  $(document).ready(function(){
    $('#candidate2').dataTable();
  });
  
  $(document).ready(function(){
    $('#marklist').dataTable();
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
  <div class="container py-2">
    <div onclick="show_hide('inser')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>Start Evaluation</h3>
    </div>
  </div>
  <div style=""  id="inser" class="container py-2">  
      <div class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
       <div align="center">
       <form name="form1" method="post" action="EvaluationAddController" >
          <table>
             <tr>
                 <th width="30%">Student ID</th>
                 <td width="60%">:&nbsp;&nbsp;<input name="std_id1" id="std_id1" size="100" type="text" readonly></td>                
             </tr> 
             <tr>  
                 <th>Student Name</th>
                 <td>:&nbsp;&nbsp;<input name="std_name1" id="std_name1" size="100" type="text" readonly></td>
             </tr>  
             <tr>  
                 <th>Project Title</th>
                 <td colspan="2">:&nbsp;&nbsp;<input name="prop_title1" id="prop_title1" size="100" type="text" readonly></td>
             </tr>
             <tr>  
                 <th>Abstract</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select width="100px" id="abs" name="abs">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Introduction</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="intro" name="intro">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Literature Review</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="literature" name="literature">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Methodology</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="methodology" name="methodology">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Result and Discussion</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="result" name="result">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Conclusion and Recommendation</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="conclusion" name="conclusion">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>References and Citation</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="reference" name="reference">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Grammar and Spelling</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="grammar" name="grammar">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Organization and Format</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="organization" name="organization">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
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
      <div id="FindStudent1" style="" class="col-md-12 bottom-radius bordergray">
           <br>
           Search student
           <table id="candidate" class="table table-striped table-hover">
                <thead>
                    <th id="th1">Student ID</th>
                    <th id="th1">Student Name</th>
                    <th id="th1">Project Title</th>
                  </tr>
                </thead> 
                <tbody>
                    <% 
                        int row = Integer.parseInt(request.getAttribute("row").toString());
                        for(int i=0; i<row; i++){
                    %>
                  <tr>
                    <td><%= request.getAttribute("std_id_"+i)%></td>
                    <td><%= request.getAttribute("std_name_"+i)%></td>
                    <td><%= request.getAttribute("prop_title_"+i)%></td>
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
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>Edit Evaluation</h3>
    </div>
  </div>

  <div style=""  id="inser" class="container py-2">  
      <div class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
       <div align="center">
       <form name="form1" method="post" action="EvaluationAddController" >
          <table>
             <tr>
                 <th width="30%">Student ID</th>
                 <td width="60%">:&nbsp;&nbsp;<input name="std_id2" id="std_id2" size="100" type="text" readonly></td>                
             </tr> 
             <tr>  
                 <th>Student Name</th>
                 <td>:&nbsp;&nbsp;<input name="std_name2" id="std_name2" size="100" type="text" readonly></td>
             </tr>  
             <tr>  
                 <th>Project Title</th>
                 <td colspan="2">:&nbsp;&nbsp;<input name="prop_title2" id="prop_title2" size="100" type="text" readonly></td>
             </tr>
             <tr>  
                 <th>Abstract</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select width="100px" id="abs" name="abs">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Introduction</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="intro" name="intro">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Literature Review</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="literature" name="literature">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Methodology</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="methodology" name="methodology">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Result and Discussion</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="result" name="result">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Conclusion and Recommendation</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="conclusion" name="conclusion">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>References and Citation</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="reference" name="reference">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Grammar and Spelling</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="grammar" name="grammar">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
                 </td>
             </tr>
             <tr>  
                 <th>Organization and Format</th>
                 <td colspan="2">:&nbsp;&nbsp;
                     <select id="organization" name="organization">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                     </select>
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
      <div id="FindStudent1" style="" class="col-md-12 bottom-radius bordergray">
           <br>
           Search student
           <table id="candidate2" class="table table-striped table-hover">
                <thead>
                    <th id="th1">Student ID</th>
                    <th id="th1">Student Name</th>
                    <th id="th1">Project Title</th>
                  </tr>
                </thead> 
                <tbody>
                    <% 
                         row = Integer.parseInt(request.getAttribute("row").toString());
                        for(int i=0; i<row; i++){
                    %>
                  <tr>
                    <td><%= request.getAttribute("std_id_"+i)%></td>
                    <td><%= request.getAttribute("std_name_"+i)%></td>
                    <td><%= request.getAttribute("prop_title_"+i)%></td>
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
    <div onclick="show_hide('view')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>View Evaluation</h3>
    </div>
  </div>   
                  
  <div style=""  id="inser" class="container py-2">  
      <div class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
      
      <div id="FindStudent1" style="" class="col-md-12 bottom-radius bordergray">
           <br>
           Search student
           <table id="marklist" class="table table-striped table-hover">
                <thead>
                    <th id="th1">Student ID</th>
                    <th id="th1">Student Name</th>
                    <th id="th1">Project Title</th>
                    <th id="th1">Mark</th>
                  </tr>
                </thead> 
                <tbody>
                    <% 
                        int row2 = Integer.parseInt(request.getAttribute("row2").toString());
                        for(int i=0; i<row; i++){
                    %>
                  <tr>
                    <td><%= request.getAttribute("std_id_A"+i)%></td>
                    <td><%= request.getAttribute("std_name_A"+i)%></td>
                    <td><%= request.getAttribute("prop_title_A"+i)%></td>
                    <td><%= request.getAttribute("mark_A"+i)%></td>
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
function show_hide(a) {
    var abc = document.getElementById(a);
    if(qwe=='inser'){
        if (x.style.display == "none") {
        x.style.display = "block";
        //document.getElementById('unassigned').style.display= 'none';
        //document.getElementById('assigned').style.display= 'none';
        //document.getElementById('EditExaminer').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }
    
}
</script>
<script>
    var s1 = document.getElementById('candidate');
    for(var i = 1; i < s1.rows.length; i++){
        s1.rows[i].onclick = function(){
          var asd =this.cells[0].innerHTML; 
          document.getElementById("std_id1").value = this.cells[0].innerHTML;   
          document.getElementById("std_name1").value = this.cells[1].innerHTML;   
          document.getElementById("prop_title1").value = this.cells[2].innerHTML;   
        };
    }
    var s3 = document.getElementById('candidate2');
    for(var i = 1; i < s3.rows.length; i++){
        s3.rows[i].onclick = function(){
          var asd =this.cells[0].innerHTML; 
          document.getElementById("std_id2").value = this.cells[0].innerHTML;   
          document.getElementById("std_name2").value = this.cells[1].innerHTML;   
          document.getElementById("prop_title2").value = this.cells[2].innerHTML;   
        };
    }
    var s2 = document.getElementById('marklist');
    for(var i = 1; i < s1.rows.length; i++){
        s1.rows[i].onclick = function(){
          var asd =this.cells[0].innerHTML; 
          document.getElementById("std_id1").value = this.cells[0].innerHTML;   
          document.getElementById("std_name1").value = this.cells[1].innerHTML;   
          document.getElementById("prop_title1").value = this.cells[2].innerHTML;   
        };
    }
</script>
</body>
</html>
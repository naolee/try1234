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
    $('#viewList').dataTable();
  });
  $(document).ready(function(){
    $('#viewList1').dataTable();
  });
  $(document).ready(function(){
    $('#dviewList').dataTable();
  });
  </script>
  <style>
    textArea,select,input[type=text]{
    background: #ffd59b;
    color: black;
    }
    option{
    background: pink;
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
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>Add New Announcement</h3>
    </div>
  </div>
  <div style="display:none" id="new" class="container">  
      <div class="col-md-12 bottom-radius top-right-radius top-left-radius bordergray">
       <div align="center"><br>
       <form name="new" method="post" action="AnnouncementAddController" >
          <table>
             <tr>
                 <th width="5%">Title</th>
                 <td width="40%"><input class="r5" style="width:100%" name="title" id="title" size="100%" type="text" placeholder="Title of announcement"></td>
             </tr> 
             <tr>
                 <th width="5%">Access Type</th>
                 <td width="40%">
                  <select name="access" id="access" class="r5" style="width:100%">
                      <option>All</option>
                      <option>Student Only</option>
                      <option>Supervisor Only</option>
                      <option>Coordinator Only</option>
                  </select></td>
             </tr>
             <tr>                  
                 <th style="vertical-align: top">Content</th>
                 <td><textarea name="content" id="content" class="r5" style="width:100%" rows="10" cols="30" placeholder="Content of announcement"></textarea><br>
                 </td>
             </tr>
          </table>
                 <br>
             <div align="center">
                 <button type="reset" class="text-black">Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <button type="submit">Save</button>
             </div><br>
       </form>
       </div>      
      </div>  
  </div> 
  <div class="container py-2">
    <div onclick="show_hide('update')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>Update Announcement</h3>
    </div>
  </div>
  <div style="display:none" id="update" class="container">  
      <div class="col-md-12 bottom-radius top-right-radius top-left-radius bordergray"><br>
           <table id="viewList" class="table-striped table-hover">
                <thead>
                    <th width="60%" id="th1">Title</th>
                    <th width="10%" style="text-align:center"  id="th1">Access Type</th>
                    <th width="10%" style="text-align:center" id="th1">Date</th>
                    <th width="10%" style="text-align:center" id="th1">Time</th>
                    <th width="10%" style="text-align:center" id="th1">Option</th>
                </thead> 
                <tbody>
                    <% 
                        int row = Integer.parseInt(request.getAttribute("row").toString());
                        for(int i=0; i<row; i++){
                    %>
                    <tr>
                        <td><%= request.getAttribute("title_"+i)%>
                            <div style="display:none"><%= request.getAttribute("content_"+i)%></div>
                        </td>
                        <td style="text-align:center"><%= request.getAttribute("accesstype_"+i)%></td>
                        <td style="text-align:center"><%= request.getAttribute("date_"+i)%></td>
                        <td style="text-align:center"><%= request.getAttribute("time_"+i)%></td>
                        <td style="text-align:center">
                            <button class="btn btn-primary text-white" 
                                    onclick="asd('<%= request.getAttribute("id_"+i)%>','<%= request.getAttribute("title_"+i)%>','<%= request.getAttribute("content_"+i)%>','<%= request.getAttribute("accesstype_"+i)%>','<%= request.getAttribute("date_"+i)%>','<%= request.getAttribute("time_"+i)%>')">Update</button>    
                        </td>
                    <%     
                    }
                    %>
                  </tr>
                </tbody>
              </table>
                  <br>
    <div align="center">
       <form name="update" method="post" action="AnnouncementUpdateController" >
          <table>
             <tr>
                 <th width="5%">Title</th>
                 <td width="40%"><input class="r5" style="width:100%" name="utitle" id="utitle" size="100%" type="text"></td>
             </tr> 
             <tr>
                 <th width="5%">Access Type</th>
                 <td width="40%">
                  <select name="uaccess" id="uaccess" class="r5" style="width:100%">
                      <option>All</option>
                      <option>Student Only</option>
                      <option>Supervisor Only</option>
                      <option>Coordinator Only</option>
                  </select></td>
             </tr>
             <tr>                  
                 <th style="vertical-align: top">Content</th>
                 <td><textarea name="ucontent" id="ucontent" class="r5" style="width:100%" rows="10" cols="30" placeholder="Content of announcement"></textarea><br>
                 </td>
             </tr>
          </table>
                 <br>
             <div align="center">
                 <input id="uid" name="uid" type="hidden" value="">
                 <button type="reset" class="text-black">Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <button type="submit">Save</button>
             </div>
                 <br>
       </form>
       </div> 
      </div>  
  </div>
        
  <div class="container py-2">
    <div onclick="show_hide('delete')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>Delete Announcement</h3>
    </div>
  </div>
                  
  <div style="display:none" id="delete" class="container">  
      <div class="col-md-12 bottom-radius top-right-radius top-left-radius bordergray"><br>
           <table id="dviewList" class="table-striped table-hover">
                <thead>
                    <th width="60%" id="th1">Title</th>
                    <th width="10%" style="text-align:center"  id="th1">Access Type</th>
                    <th width="10%" style="text-align:center" id="th1">Date</th>
                    <th width="10%" style="text-align:center" id="th1">Time</th>
                    <th width="10%" style="text-align:center" id="th1">Option</th>
                </thead> 
                <tbody>
                    <% 
                        row = Integer.parseInt(request.getAttribute("row").toString());
                        for(int i=0; i<row; i++){
                    %>
                    <tr>
                        <td><%= request.getAttribute("title_"+i)%>
                            <div style="display:none"><%= request.getAttribute("content_"+i)%></div>
                        </td>
                        <td style="text-align:center"><%= request.getAttribute("accesstype_"+i)%></td>
                        <td style="text-align:center"><%= request.getAttribute("date_"+i)%></td>
                        <td style="text-align:center"><%= request.getAttribute("time_"+i)%></td>
                        <td style="text-align:center">
                            <button onclick="delConfirm('delAnn')" class="btn btn-primary text-white">Delete</button>
                            <form class="login-form" action="AnnouncementDeleteController" method="get" id="delAnn" name="delAnn">
                            <input type="hidden" name="id" value="<%= request.getAttribute("id_"+i)%>">
                          </form>
                        </td>
                    <%     
                    }
                    %>
                  </tr>
                </tbody>
              </table>
                  <br>
      </div>  
  </div>
  <div class="container py-2">
    <div onclick="show_hide('view')" id="h3" class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
        <h3 class=""><i class="fa fa-user fa-bullhorn"></i>View List of Announcement</h3>
    </div>
  </div>
  <div style="display:none" id="view" class="container">  
      <div class="col-md-12 bottom-radius top-right-radius top-left-radius bordergray">
       <div align="center"><br>
           <table id="viewList1" class="table table-striped table-hover">
                <thead>
                    <th width="80%" id="th1">Title</th>
                    <th style="text-align:center" width="10%" id="th1">Access Type</th>
                    <th style="text-align:center" width="2%" id="th1">Date</th>
                    <th style="text-align:center" width="2%" id="th1">Time</th>
                  </tr>
                </thead> 
                <tbody>
                    <% 
//                        int row = Integer.parseInt(request.getAttribute("row").toString());
                        for(int i=0; i<row; i++){
                    %>
                  <tr  onclick="formSubmit('<%= request.getAttribute("id_"+i)%>')">
                    <td><%= request.getAttribute("title_"+i)%></td>
                    <td style="text-align:center" ><%= request.getAttribute("accesstype_"+i)%></td>
                    <td style="text-align:center" ><%= request.getAttribute("date_"+i)%></td>
                    <td style="text-align:center" >
                        <%= request.getAttribute("time_"+i)%>
                        <form id="<%= request.getAttribute("id_"+i)%>" name="formView" action="AnnouncementSelectController" method="get" target="_blank">
                            <input type="hidden" id="id" name="id" value="<%= request.getAttribute("id_"+i)%>">
                            <input type="hidden" id="title" name="title" value="<%= request.getAttribute("title_"+i)%>">
                            <input type="hidden" id="content" name="content" value="<%= request.getAttribute("content_"+i)%>">
                            <input type="hidden" id="date" name="date" value="<%= request.getAttribute("date_"+i)%>">
                            <input type="hidden" id="time" name="time" value="<%= request.getAttribute("time_"+i)%>">
                        </form>
                    </td>
                    <%     
                    }
                    %>
                  </tr>
                </tbody>
              </table><br>
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
function delConfirm(id) {
    var r = confirm("Are you sure to delete the announcement?");
    if (r == true) {
        document.getElementById(id).submit();
    }
}
</script>                  
<script>
    function asd(a,b,c,d,e,f){
        var uid= document.getElementById('uid');
        var utitle= document.getElementById('utitle');
        var ucontent= document.getElementById('ucontent');
        var uaccess = document.getElementById('uaccess');
        
        uid.value = a;
        utitle.value = b;
        ucontent.value=c;
        if(d=='all'){
        uaccess.selectedIndex = "0";  
        }
        if(d=='student'){
        uaccess.selectedIndex = "1";  
        }
        if(d=='supervisor'){
        uaccess.selectedIndex = "2";  
        }
        if(d=='coordinator'){
        uaccess.selectedIndex = "3";  
        }uaccess.selectedIndex
    }
</script>
<script>

function validateForm(formname) {
    
    if(formname=="new"){
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
    if(qwe=='new'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('update').style.display= 'none';
        document.getElementById('delete').style.display= 'none';
        document.getElementById('view').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }    
    if(qwe=='update'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('new').style.display= 'none';
        document.getElementById('delete').style.display= 'none';
        document.getElementById('view').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }  
    if(qwe=='delete'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('new').style.display= 'none';
        document.getElementById('update').style.display= 'none';
        document.getElementById('view').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }
    if(qwe=='view'){
        if (x.style.display == "none") {
        x.style.display = "block";
        document.getElementById('new').style.display= 'none';
        document.getElementById('update').style.display= 'none';
        document.getElementById('delete').style.display= 'none';
        } else {
            x.style.display = "none";
        }
    }
}
</script>
<script>
function formSubmit(id){
    document.getElementById(id).submit();
}
</script>
<script>
function dul(){
    alert('dulduldul');
}
</script>
</body>
</html> 
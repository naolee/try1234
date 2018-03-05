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
      overflow: hidden;
      border: 1px solid #ccc;
      background-color: #f1f1f1;
    }
    /* Style the buttons inside the tab */
    div.tab button {
      background-color: inherit;
      float: left;
      border: none;
      outline: none;
      cursor: pointer;
      padding: 14px 16px;
      transition: 0.3s;
      font-size: 17px;
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
      display: none;
      padding: 6px 12px;
      border: 1px solid #ccc;
      border-top: none;
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
          <div>
          <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'list')" id="defaultOpen">View</button>
            <button class="tablinks" onclick="openCity(event, 'add')">Add</button>
          </div>
          <div id="add" class="tabcontent"><br>
            <h4 class="text-left">Add New Announcement</h4>
                <form class="login-form" action="AnnouncementAddController" method="POST">
                  <h5>Title:</h5>
                  <input class="r5" style="width:100%" type="text" name="title" id="title" placeholder="Title of announcement"><br> <br>
                  <h5>Accessibility:</h5>
                  <select name="access" id="access" class="r5" style="width:100%">
                      <option>All</option>
                      <option>Student Only</option>
                      <option>Supervisor Only</option>
                      <option>Coordinator Only</option>
                  </select><br><br>
                  <h5>Content:</h5>
                  <textarea name="content" id="content" class="r5" style="width:100%" rows="10" cols="30" placeholder="Content of announcement"></textarea><br>
                  <div align="right"><button type="submit" class="btn btn-secondary">Submit</button></div>
                </form> <br>
          </div>
          <div id="list" class="tabcontent"><br>
            <h4>&nbsp;List of Announcement</h4>
            <div class="text-center">
                <form name="form1" id="form1" method="POST" action="AnnouncementViewController">
                <div class="text-right"> 
                  <label for="sel1" class="label"><b>Search :&nbsp;&nbsp;&nbsp;&nbsp; </b></label>
                    <input class="r5" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search entire table" title="Type in a name">
                  <label for="sel1" class="label"><b>Sort by :&nbsp;&nbsp;&nbsp;&nbsp; </b></label>
                  <select name="sortby" id="sortby" class="r5" onchange="this.form.submit(); document.myForm.myMenu[document.myForm.myMenu.selectedIndex].value;">
                    <option value="Newest -- Oldest" <%= session.getAttribute("select1")%>>Newest -- Oldest</option>
                    <option value="Oldest -- Newest" <%= session.getAttribute("select2")%>>Oldest -- Newest</option>
                  </select>
                  <br> 
                </div>
              </form>
              <table id="myTable" class="table">
                <thead>
                  <tr>
                    <th width="30%" class="text-left" onclick="sortTable(0)">Title</th>
                    <th width="12%" class="text-center" onclick="sortTable(1)">Access type</th>
                    <th width="12%" class="text-center">Date posted</th>
                    <th width="12%" class="text-center">Time posted</th>
                    <th width="20%" class="text-center">Option</th>
                  </tr>
                </thead>
                <tbody>
                    <% 
                        int row = Integer.parseInt(session.getAttribute("row").toString());
                        for(int i=0; i<row; i++){
                            String date = session.getAttribute("timestamp_"+i).toString().substring(0,10);
                            String time = session.getAttribute("timestamp_"+i).toString().substring(11,16);
                    %>
                  <tr>
                    <td class="text-left">
                        <form class="login-form" action="AnnouncementSelectController" method="get" target="_blank">
                            <input type="hidden" name="id" value="<%= session.getAttribute("id_"+i)%>">
                            <input type="hidden" name="title" value="<%= session.getAttribute("title_"+i)%>">
                            <input type="hidden" name="content" value="<%= session.getAttribute("content_"+i)%>">
                            <input type="hidden" name="date" value="<%= date%>">
                            <input type="hidden" name="time" value="<%= time%>">
                            <button type="submit" class="btn btn-primary style123 text-dark"><u><%= session.getAttribute("title_"+i)%></u></button>
                        </form>
                    </td>
                    <td class="text-center"><%= session.getAttribute("accesstype_"+i)%></td>
                    <td class="text-center"><%= date%></td>
                    <td class="text-center"><%= time%></td>
                    <td class="text-center">
                      <div class="inline text-white">
                          <form class="login-form" action="AnnouncementUpdateController" method="get" id="Proposal" name="Proposal">
                            <input type="hidden" name="id" value="<%= session.getAttribute("id_"+i)%>">
                            <button type="submit" class="btn btn-primary text-white">Update</button>
                          </form>
                      </div>
                      <div class="inline text-white">
                          <form class="login-form" action="AnnouncementDeleteController" method="get" id="Proposal" name="Proposal">
                            <input type="hidden" name="id" value="<%= session.getAttribute("id_"+i)%>">
                            <button type="submit" class="btn btn-primary text-white">Delete</button>
                          </form>
                      </div>
                    </td>
                    <% } %>
                  </tr>
                </tbody>
              </table>
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
  </div>
  <script>
    function openCity(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }
    
    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();
  </script>
  
<script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

<script>
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("myTable");
  switching = true;
  //Set the sorting direction to ascending:
  dir = "asc"; 
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.getElementsByTagName("TR");
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /*check if the two rows should switch place,
      based on the direction, asc or desc:*/
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      //Each time a switch is done, increase this count by 1:
      switchcount ++;      
    } else {
      /*If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again.*/
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>
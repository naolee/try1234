<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/OO.css" type="text/css"> 
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
            <li class="breadcrumb-item active">Announcement</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div id="ann1" class="my-4">
    <div class="container">
      <div class="row">
        <div class="col-md-12 bordergray py-3" style="border-radius: 10px;">
          <h3 class=""><i class="fa fa-fw fa-bullhorn"></i>announcement</h3>
          <div id="msg"></div>
          
          <div class="text-right">
              <form name="form1" id="form1" method="POST" action="AnnouncementViewController">
                <div class="text-right"> 
                  <label for="sel1" class="label"><b>Sort by :&nbsp;&nbsp;&nbsp;&nbsp; </b></label>
                  <select name="sortby" id="sortby" class="r5" onchange="this.form.submit(); document.myForm.myMenu[document.myForm.myMenu.selectedIndex].value;">
                    <option value="Newest -- Oldest" <%= session.getAttribute("select1")%>>Newest -- Oldest</option>
                    <option value="Oldest -- Newest" <%= session.getAttribute("select2")%>>Oldest -- Newest</option>
                  </select>
                  <br> </div>
              </form>
          </div>
          <div class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray">
            <br>
            <div class="text-center">
              <table class="table">
                <thead>
                  <tr>
                    <th class="text-left">Title</th>
                    <th width="12%" class="text-center">Date posted</th>
                    <th class="text-center" width="12%">Time posted</th>
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
                    <td class="text-center"><%= date%></td>
                    <td class="text-center"><%= time%></td>
                    <% } %>
                  </tr>
                </tbody>
              </table>
            </div>
        </div>
      </div>
    </div>
  </div>
  </div>
                  
  
  <div id="ann2" class="my-4">
    <div class="container">
      <div class="row">
        <div class="col-md-12 bordergray py-3" style="border-radius: 10px;">
          <h3 class=""><i class="fa fa-fw fa-bullhorn"></i>announcement</h3>
          <br>
            <div class="alert bottom-radius top-right-radius alert-secondary text-dark my-0" role="alert">
              <h4 class="alert-heading Dosis text-capitalize"><b>No announcement yet</b></h4>
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
  <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script type="text/javascript">
    var form = $('#form1');
    var x = $('#changeStatus');
    
    x.change(function(){
        $(this).closest(form).submit();
    });
    
    form.submit(function () {
        $.ajax({
        type: form.attr('method'),
        url: form.attr('action'),
        data: form.serialize(),
        success: function (data) {
            var result=data;
            $('#result').attr("value",result);
        }
        });
        return false;
    });
    </script>
    <script>
        
    function show_hide() {
        var checkAnn = <%= session.getAttribute("ann")%> ;  
        var ann1 = document.getElementById("ann1");     
        var ann2 = document.getElementById("ann2");     
        
        if(checkAnn==0){
            ann1.style.display = "none";
        }
        else{
            ann2.style.display = "none";
        }
    }
    </script>
  
  </body>

</html>
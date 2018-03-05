<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/OO.css" type="text/css">
</head>

<body>
    <div class="my-4">
      <div class="container py-2">
         <div class="col-md-12 py-3 my-2 bottom-radius top-right-radius top-left-radius bordergray" id="viewAnn">
            <div class="text-center">
              <div class="alert bottom-radius top-right-radius alert-secondary text-dark my-0" role="alert">
                <h4 class="alert-heading Dosis text-capitalize"><b><u> <%= request.getAttribute("title")%></u></b></h4>
                <p> <%= request.getAttribute("content")%> </p>
                <p class="mb-0 f14"><b>Posted on: &nbsp;<%= request.getAttribute("time")%>&nbsp;<%= request.getAttribute("date")%></b></p>
              </div>
            </div>
        </div>
      </div>
    </div>
    <div class="my-4">
    <div class="container py-2">
      <div class="row">
        <div class="col-md-12 bordergray text-center bg-dark text-white py-2 bottom-radius top-right-radius top-left-radius">
          <p class="welcome">© Copyright 2017 Proposal Defense Management System (FSKKP) - All rights reserved.</p>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
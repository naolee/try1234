<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/Untitled_1.css" type="text/css"> </head>
<body style="background-image: url('image/reit-insight-background.jpg'); height: 100%; background-position: center; background-size: cover">
  <nav class="container navbar navbar-expand-md bg-primary navbar-dark topradius5">
    <div class="container">
      <a class="navbar-brand" href="#"><i class="fa d-inline fa-lg fa-cloud"></i><b>&nbsp;Designex3D</b></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar2SupportedContent" aria-controls="navbar2SupportedContent" aria-expanded="false"
        aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
      <div class="collapse navbar-collapse text-center justify-content-end" id="navbar2SupportedContent">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link text-dark">You are logged in as Mamie Hamilton</a>
          </li>
        </ul>
        <a class="btn navbar-btn ml-2 text-white btn-dark"><i class="fa d-inline fa-lg fa-user-circle-o"></i> Log out </a>
      </div>
    </div>
  </nav>
  <div class="container bg-dark bottomradius5">
    <ul class="nav nav-pills border-dark bg-dark">
      <li class="nav-item">&nbsp;
        <div class="btn-group">
          <button class="active btn btn-outline-dark"><i class="fa fa-home fa-home"></i>&nbsp; Home </button>
        </div>
      </li>&nbsp;
      <li class="nav-item">
        <div class="dropdown">
          <button class="btn btn-outline-dark dropdown-toggle text-light" data-toggle="dropdown"> Sales </button>
          <div class="dropdown-menu dropdown-content">
            <a class="dropdown-item" href="#">Inquiry</a>
            <a class="dropdown-item" href="#">Quotation</a>
            <a class="dropdown-item" href="#">Sales Order</a>
            <a class="dropdown-item" href="#">Sales Invoice</a>
            <a class="dropdown-item" href="#">Shipping &amp; Transportation</a>
          </div>
        </div>
      </li>&nbsp;
      <li class="nav-item">
        <div class="dropdown">
          <button class="btn btn-outline-dark dropdown-toggle text-light" data-toggle="dropdown"> Purchasing </button>
          <div class="dropdown-menu dropdown-content">
            <a class="dropdown-item" href="#">Purchase Requisition</a>
            <a class="dropdown-item" href="#">Purchase Order</a>
            <a class="dropdown-item" href="#">Purchase Invoice</a>
          </div>
        </div>
      </li>&nbsp;
      <li class="nav-item">
        <div class="dropdown">
          <button class="btn btn-outline-dark dropdown-toggle text-light" data-toggle="dropdown"> Material Movement </button>
          <div class="dropdown-menu dropdown-content">
            <a class="dropdown-item" href="#">In/ Received</a>
            <a class="dropdown-item" href="#">Out/ Dispose</a>
            <a class="dropdown-item" href="#">Reject</a>
          </div>
        </div>
      </li>&nbsp;
      <li class="nav-item">
        <div class="dropdown">
          <button class="btn btn-outline-dark dropdown-toggle text-light" data-toggle="dropdown"> Inventory </button>
          <div class="dropdown-menu dropdown-content">
            <a class="dropdown-item" href="#">Item Registration </a>
            <a class="dropdown-item" href="#">Stock Overview </a>
            <a class="dropdown-item" href="#">Stock/ Requirements List</a>
          </div>
        </div>
      </li>&nbsp;
      <li class="nav-item">
        <div class="btn-group">
          <button class="btn btn-outline-dark text-light"> Accounting </button>
        </div>
      </li>&nbsp;
      <li class="nav-item">
        <div class="btn-group">
          <button class="btn btn-outline-dark text-light"> Budgeting </button>
        </div>
      </li>&nbsp;
      <li class="nav-item">
        <div class="btn-group">
          <button class="btn btn-outline-dark text-light"> Production </button>
        </div>
      </li>
    </ul>
  </div>
  <div class="py-3">
    <div class="container">
      <div class="row">
        <div class="col-md-12 darkbg radius5">
          <ul class="breadcrumb" style="margin-bottom:0px;margin-top:0px">
            <li class="breadcrumb-item">
              <a href="#">Home</a>
            </li>
            <li class="breadcrumb-item">
              <a href="#">Purchasing</a>
            </li>
            <li class="breadcrumb-item">
              <a href="#">Purchase Requisition</a>
            </li>
            <li class="breadcrumb-item active">New Vendor &amp; New Material</li>
          </ul>
        </div>
      </div>
      <div>
      <form action="NewServlet" method="post">
          <button name="submit_type" value="1" type="submit" class="btn btn-primary">Submit</button>
      </form>
  </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
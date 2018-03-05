<%-- 
    Document   : index
    Created on : Sep 18, 2017, 9:52:57 AM
    Author     : nadia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/reset.min.css">
        <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'>
        <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Montserrat:400,700'>
        <link rel='stylesheet prefetch' href="css/font.css">
        <link rel="stylesheet" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="info">
            <h1>Proposal Defense Management System</h1><span>Made for FSKKP UMP
        </div>
        </div>
        
        <div class="form">
            <div class="thumbnail"><img src="image/hat.svg"/></div>
            <form class="login-form" action="LoginController" method="post">
                <input type="text" name="username" placeholder="Username" autofocus/>
                <input type="password" name="password" placeholder="Password"/>
                <button>Login</button>
            </form>
        </div>
    </body>
</html>

<%-- 
    Document   : newjsp2
    Created on : Dec 4, 2017, 1:07:50 PM
    Author     : nadia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%= request.getAttribute("std_id")%> <br>
        <%= request.getAttribute("std_name")%> <br>
        <%= request.getAttribute("prop_title")%> <br>
        <%= request.getAttribute("ex1_id")%> <br>
        <%= request.getAttribute("ex1")%> <br>
        <%= request.getAttribute("ex2_id")%> <br>
        <%= request.getAttribute("ex2")%> <br>
        
        
        
    </body>
</html>

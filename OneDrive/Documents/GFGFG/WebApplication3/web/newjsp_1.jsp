<%-- 
    Document   : newjsp
    Created on : Mar 27, 2018, 10:12:08 AM
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
        <h1>Hello <%=session.getAttribute("nameid")%></h1>
    </body>
</html>

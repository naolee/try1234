<%-- 
    Document   : getdata
    Created on : Nov 16, 2017, 10:40:36 AM
    Author     : nadia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="x.DummyDB"%>
<%
	DummyDB db = new DummyDB();

	String query = request.getParameter("q");
	
	List<String> countries = db.getData(query);

	Iterator<String> iterator = countries.iterator();
	while(iterator.hasNext()) {
		String country = (String)iterator.next();
		out.println(country);
	}
%>

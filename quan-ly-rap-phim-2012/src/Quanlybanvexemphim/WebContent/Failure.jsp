<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%if (request.getAttribute("msg1")!=null){ %>
		<h2><font color="red"><%=request.getAttribute("msg1") %></font></h2>
	<%}else{ %>
	<h2><font color="red">Database connect error.</font></h2>
	<%} %>
</body>
</html>
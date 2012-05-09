<%@ page language="java" contentType="text/html; charset=windows-31j"
	pageEncoding="windows-31j"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-31j">
<title>Insert title here</title>
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%session.removeAttribute("tenDangNhapTV");
	response.sendRedirect("Trangchu.jsp");
%>
</head>
<body>

</body>
</html>
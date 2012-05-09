<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Xoá Phim</title>
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
</head>
<body>
<%
    Connection connection = null;
    String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
    String userName = "sa";
    String passWord = "123";
    String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
    Statement st = null;
    Class.forName(JDBC_Driver);
    connection = DriverManager.getConnection(data, userName, passWord);
    st = connection.createStatement();
    String masukien = request.getParameter("MaSuKien");
    System.out.println("Mã Sự kiện: " + masukien);
    
%>
<form>
<%
 
        String sql = "DELETE FROM [Quanlybanvephim].[dbo].[SuKien]WHERE [MaSuKien] ='" +masukien+ "'"; 
        System.out.println("sql : " + sql);
        int kq = st.executeUpdate(sql);
        System.out.println(kq);

    response.sendRedirect("Quanlysukien.jsp");
%>
</form>
</body>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Xử lý đăng nhập</title>
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<%@page import="javax.servlet.http.*"%>
<%
	Connection connection = null;
	String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
	String userName = "sa";
	String password = "123";
	String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
	Statement st = null;
	// ResultSet rs=null;
	try {
		Class.forName(JDBC_Driver);
		// connection
		connection = DriverManager.getConnection(data, userName,
				password);
		System.out.println(connection);
		st = connection.createStatement();
		String username = request.getParameter("TenDangNhapNV");
		String pass = request.getParameter("password");
		String sql = "SELECT [TenDangNhapNV],[MatKhauNV],[MaQuyen] FROM [Quanlybanvephim].[dbo].[NhanVien] where TenDangNhapNV like '"
				+ username + "' and MatKhauNV like '" + pass + "'";
		ResultSet rs = st.executeQuery(sql);
		if (rs.next()) {
			//System.out.println("Ten dang nhap: "+rs.getString(1)+" Mat khau: "+rs.getString(2));
			session.setAttribute("tenDangNhap", username); // nhét username vào session
			response.sendRedirect("Quanlyphim.jsp");
		} else {
			response
					.sendRedirect("Dangnhapadmin.jsp?error=InvalidLogin");
		}
	} catch (ClassNotFoundException e) {
		System.out.println("Class not found");
		e.printStackTrace();
	} catch (SQLException se) {
		System.out.println("SQL Error");
		se.printStackTrace();
	}
%>
</head>
<body>
</body>
</html>
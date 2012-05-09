<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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

		//System.out.println(connection);
		st = connection.createStatement();
		String usernameTV = request.getParameter("TenDangNhapTV");
		String passTV = request.getParameter("passwordTV");
		//select 1 record từ trong csdl , bang ThanhVien
		String sql = "SELECT [TenDangNhapTV] ,[HoTen],[NgaySinh] ,[DiaChi],"
				+ "[MatKhau],[SoDienThoai],[Email] ,[GioiTinh] "
				+ "FROM [Quanlybanvephim].[dbo].[ThanhVien] where TenDangNhapTV = '"
				+ usernameTV + "' and MatKhau = '" + passTV + "'";
		ResultSet rs = st.executeQuery(sql);
		//vì chắc chắn sẽ chỉ lấy về dc 1 record nếu có nên if (rs.next()) luôn 
		//vì rs.next() trả về 1 giá trị true nếu nhảy next dc
		if (rs.next()) {
			session.setAttribute("tenDangNhapTV", usernameTV);
			response.sendRedirect("Trangchu.jsp");
		} else {
			// nếu rs.next ko dc thì tức là ko có user trong hệ thống,
			// trả về trang Dangnhapuser với mã lỗi
			response
					.sendRedirect("Dangnhapuser.jsp?error=InvalidLogin");
		}
	} catch (ClassNotFoundException e) {
		System.out.println("Class not found");
		e.printStackTrace();
	} catch (SQLException se) {
		System.out.println("SQL Error");
		se.printStackTrace();
	}
%>
<title>Xử lý đăng ký thành viên</title>
</head>
<body>
</body>
</html>
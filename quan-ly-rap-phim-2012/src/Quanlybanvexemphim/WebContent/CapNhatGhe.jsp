<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<%@page import="java.util.*"%>
<%
	Connection connection = null;
	String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
	String userName = "sa";
	String password = "123";
	String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
	Statement st = null;

	try {
		Class.forName(JDBC_Driver);
		// connection
		connection = DriverManager.getConnection(data, userName,
				password);
		st = connection.createStatement();

	} catch (ClassNotFoundException e) {
		System.out.println("Class not found");
		e.printStackTrace();
	} catch (SQLException se) {
		System.out.println("SQL Error");
		se.printStackTrace();
	}
%>
<title>Cập nhật ghế</title>
</head>
<body>
<%
	String MaPhong = request.getParameter("maPhong");
%>


<%
	String sql2 = "SELECT [SoLuongDayGheToiDa],[SoLuongGheToiDaOMoiDay] FROM [Quanlybanvephim].[dbo].[Phong] where MaPhong='"
			+ MaPhong + "'";
	ResultSet rs2 = st.executeQuery(sql2);
	if (rs2.next()) {
		int SoLuongDayGheToiDa = Integer.parseInt(rs2.getString(1));
		int SoLuongGheToiDaOMoiDay = Integer.parseInt(rs2.getString(2));

		System.out.println("lam den vi tri 1");
		System.out.println(MaPhong);
		char tam = 'A';
		for (int i = 0; i < SoLuongDayGheToiDa; i++) {
			String[] day = request.getParameterValues(Character
					.toString(tam));
			System.out.println("gia tri cua day=="+day[i]);
			for (int j = 0; j < SoLuongGheToiDaOMoiDay; j++) {
				char s1 = day[j].charAt(0);
				char s2 = day[j].charAt(1);
				int so = j + 1;
				System.out.println("day thu: " + tam + "   so ghe:  "
						+ tam + j + "++++MaLoaiGhe===" + s1
						+ "  MaTinhTrang===" + s2);
				String sql4 = "UPDATE [Quanlybanvephim].[dbo].[Ghe] SET [MaLoaiGhe] = '"
						+ day[j].charAt(0)
						+ "',[MaTinhTrang] = '"
						+ day[j].charAt(1)
						+ "' WHERE SoGhe = '"
						+ tam
						+ so + "' and MaPhong = '" + MaPhong + "' ";
				st.executeUpdate(sql4);
				System.out.println("Da update thanh cong!!!!");
			}//for j
			tam++;
		}//for i

	}//if rs2
	System.out.println("lam den vi tri 3==================================");
	connection.close();
	response.sendRedirect("Quanlyghe_thu.jsp?MaPhong=" + MaPhong);
%>
</body>
</html>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
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
<title>Quản lý ghế</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="Header.jsp"%>
<%@include file="MenuAdmin.jsp"%>

<div id="ourCompany-bg">
<div id="ourCompany-part"><%--//Truv van du dlieu, gom 2 column MaGhe, TT

HashMap<String, String> map = new HashMap<String, String>();
while
map.put(rs.getString(1), rs.getString(2)); --%>
<form action="CapNhatGhe.jsp" method="post">
<table width="960">
	<%
		String maphong = request.getParameter("MaPhong");
	%>
	<tr>
		<td><input type="hidden" name="maPhong" value="<%=maphong%>" /></td>
	</tr>
	<tr align="center">
		<td colspan="17">
		<h2 class="ourCompany-hdr">Quản lý ghế</h2>
		</td>
	</tr>
	<tr class="ourCompany-list">
		<td colspan="3" align="left"><font color="blue">Mã phòng:
		<%=maphong%></font></td>
		<td colspan="13" align="right">VE: Ghế VIP sử dụng được VD: Ghế
		VIP hỏng</td>
	</tr>
	<tr align="right" class="ourCompany-list">
		<td colspan="16">TE: Ghế thường sử dụng được TD: Ghế thường hỏng</td>
	</tr>

	<%
		String sql1 = "SELECT [SoGhe],[MaLoaiGhe],[MaTinhTrang] FROM [Quanlybanvephim].[dbo].[Ghe] where MaPhong='"
				+ maphong + "'";
		HashMap<String, String> map = new HashMap<String, String>();
		//st = connection.createStatement();	
		ResultSet rs1 = st.executeQuery(sql1);
		while (rs1.next()) {
			map.put(rs1.getString(1), rs1.getString(2) + rs1.getString(3));
			//System.out.println("Col1 ===" + rs1.getString(1));
			//System.out.println("Col2 ===" + rs1.getString(3));
		}//while rs1
	%>
	<%
		String sql2 = "SELECT [SoLuongDayGheToiDa],[SoLuongGheToiDaOMoiDay] FROM [Quanlybanvephim].[dbo].[Phong] where MaPhong='"
				+ maphong + "'";
	System.out.println("sql2=="+sql2);
		ResultSet rs2 = st.executeQuery(sql2);

		while (rs2.next()) {
			int SoLuongDayGheToiDa = Integer.parseInt(rs2.getString(1));
			int SoLuongGheToiDaOMoiDay = Integer.parseInt(rs2.getString(2));
	%>

	<%
			char temp = 'A';
	%>
	<tr bgcolor="gray">
		<td></td>
		<%
			for (int k = 1; k <= SoLuongGheToiDaOMoiDay; k++) {
		%>
		<td><%=k%></td>
		<%
			}//for cua SoLuongGheToiDaOMoiDay
		%>
	</tr>

	<%
				for (int i = 1; i <= SoLuongDayGheToiDa; i++) {
	%>
	<tr>
		<td bgcolor="gray"><%=temp%></td>
		<%
					for (int j = 1; j <= SoLuongGheToiDaOMoiDay; j++) {
		%>
		<td><input type="text" name="<%=temp%>"
			value="<%=map.get("" + temp + j)%>"></td>

		<%
					}//for j
		%>
	</tr>
	<%
		
				temp++;

			}//for k

		}//while rs2
		connection.close();
	%>
	<tr>
		<td colspan="16" align="center"><input type="submit"
			name="btncapnhat" value="CapNhat"></td>

	</tr>

</table>
</form>
</div>
</div>
<%@include file="FooterAdmin.jsp"%>
</body>
</html>
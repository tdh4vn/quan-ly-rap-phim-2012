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
</head>
<body>
<form action="">
<table border="1" width="100%">
	<%
		String maphong = request.getParameter("maPhongParam");
	%>
	<tr align="center">
		<td colspan="16"><font color="red" size="10">Quản lý ghế</font></td>
	</tr>
	<tr align="right">
		<td colspan="3"><font color="blue">Mã phòng: <%=maphong%></font></td>
		<td colspan="13">VE: Ghế VIP sử dụng được VD: Ghế VIP hỏng</td>
	</tr>
	<tr align="right">
		<td colspan="16">TE: Ghế thường sử dụng được TD: Ghế thường hỏng</td>
	</tr>
	<%%>
	<%
		System.out.println("Ma phong =" + maphong);
		String sql1 = "SELECT [SoGhe],[MaLoaiGhe],[MaTinhTrang] FROM [Quanlybanvephim].[dbo].[Ghe] where MaPhong='"
				+ maphong + "'";
		HashMap<String, String> map = new HashMap<String, String>();
		ResultSet rs1 = st.executeQuery(sql1);
		if (rs1.next()) {

			while (rs1.next()) {
				map.put(rs1.getString(1),
						rs1.getString(2) + rs1.getString(3));
				//System.out.println("Col1 ===" + rs1.getString(1));
				//System.out.println("Col2 ===" + rs1.getString(3));
			}

			String sql4 = "SELECT [SoLuongDayGheToiDa],[SoLuongGheToiDaOMoiDay] FROM [Quanlybanvephim].[dbo].[Phong] where MaPhong='"
					+ maphong + "'";
			ResultSet rs4 = st.executeQuery(sql4);

			while (rs4.next()) {
				int SoLuongDayGheToiDa = Integer.parseInt(rs4.getString(1));
				int SoLuongGheToiDaOMoiDay = Integer.parseInt(rs4
						.getString(2));
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
			}
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
		<td width="12"><input type="text" name="<%=temp%>"
			value="<%=map.get("" + temp + j)%>" size="12"></td>

    </tr>
		<%
			}
		    temp++;
		}
			}
		} else //Them ghe neu nhu phong chua co ghe
		{

			//String maphong = request.getParameter("MaPhong");
			String sql2 = "SELECT [SoLuongDayGheToiDa],[SoLuongGheToiDaOMoiDay] FROM [Quanlybanvephim].[dbo].[Phong] where MaPhong='"
					+ maphong + "'";
			
			ResultSet rs2 = st.executeQuery(sql2);

			while (rs2.next()) {
				int SoLuongDayGheToiDa = Integer.parseInt(rs2.getString(1));
				int SoLuongGheToiDaOMoiDay = Integer.parseInt(rs2
						.getString(2));
				System.out.println(SoLuongDayGheToiDa);
				System.out.println(SoLuongGheToiDaOMoiDay);

				char temp = 'A';
				char soSach = 'K';
				for (int i = 1; i <= SoLuongDayGheToiDa; i++) {
					for (int j = 1; j <= SoLuongGheToiDaOMoiDay; j++) {
						
						// String MaLoaiGhe=ghe.charAt(1);
						if (temp <= soSach) {
							String sql3 = "INSERT INTO [Quanlybanvephim].[dbo].[Ghe]([SoGhe],[MaPhong],[MaLoaiGhe],[MaTinhTrang])VALUES('"
									+ temp
									+ j
									+ "','"
									+ maphong
									+ "','T','E')";
							st.executeUpdate(sql3);
						} else {
							String sql3 = "INSERT INTO [Quanlybanvephim].[dbo].[Ghe]([SoGhe],[MaPhong],[MaLoaiGhe],[MaTinhTrang])VALUES('"
									+ temp
									+ j
									+ "','"
									+ maphong
									+ "','V','E')";
							st.executeUpdate(sql3);
						}
					}

					temp++;

				}

			}

		}
	%>


	<tr>
		<td colspan="16" align="center"><input type="submit"
			name="btnCapNhat" value="Cập nhật"></td>
	</tr>
</table>
</form>

</body>
</html>
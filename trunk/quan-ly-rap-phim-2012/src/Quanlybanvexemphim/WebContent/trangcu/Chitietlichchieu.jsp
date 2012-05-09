<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Chi tiết lịch chiếu phim</title>
</head>
<body link="black" alink="black" vlink="black">
<!--Header Background Part Starts -->
<%@include file="Header.jsp"%>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%@include file="MenuUser.jsp"%>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg"><!--Our Company Part Starts -->
<div id="ourCompany-part">
<table width="100%">
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
String mphim1 = request.getParameter("mphim");
System.out.println("aaaaa====" + mphim1);
String sql = "SELECT [MaPhim],[AnhDaiDien],[TenPhim],[TenDangPhim],[TenLoaiPhim],[TenQuocGia],[DoDaiGio],[DoDaiPhut],[MoTaPhim]FROM [Quanlybanvephim].[dbo].[Phim],[DangPhim],[LoaiPhim],[QuocGia]where [Phim].[MaDangPhim]=[DangPhim].[MaDangPhim] and [Phim].[MaLoaiPhim]=[LoaiPhim].[MaLoaiPhim]and [Phim].[MaQuocGia]=[QuocGia].[MaQuocGia] and [Phim].[MaPhim]='"+ mphim1 +"'";
ResultSet rs = st.executeQuery(sql);


%>
	<% while(rs.next()) { %>
	<tr>
		<td colspan="8">
		<table width=100%>
			<tr class="ourCompany-list">
				<td align="left"><img src="<%out.println(rs.getString(2)); %>"
					width="300" height="450"></img></td>
				<td><font face="Arial " color="black" size="5">
				<%out.println(rs.getString(3));%>
				</font><br>

				Dạng phim: <%out.print(rs.getString(4));%><br>
				Loại phim: <%out.print(rs.getString(5));%><br>
				Quốc gia :<%out.print(rs.getString(6));%><br>
				Độ dài :<%out.print(rs.getString(7));%> giờ <%out.print(rs.getString(8));%>
				phút<br>
				Mô tả phim: <%out.print(rs.getString(9));%><br>

				</td>
				<%} %>
				<td>
				<form>
				<fieldset><legend> <font face="Arial "
					color="black" size="5"> Chọn xuất chiếu </font></legend> <%
String maPhim = request.getParameter("mphim");
System.out.print("xuat ra ma phim ne" +maPhim);
ArrayList<Date> dateList=new ArrayList<Date>(); 
String sql1 = "Select distinct NgayChieu from LichChieu, XuatChieu where LichChieu.MaXuatChieu = XuatChieu.MaXuatChieu and XuatChieu.MaPhim = '"+maPhim+"' ";
ResultSet rs1 = st.executeQuery(sql1);
dateList.size();
while(rs1.next()){
 dateList.add(rs1.getDate(1));
 System.out.println(dateList.size());
 System.out.println("ngay thu ====="+dateList);
}
rs1.close();


%>

				<table width="250">

					<%
String sql2 = null;
for(int i=0;i<dateList.size();i++){ %>
					<tr>
						<td><font face=" Arial " color="333333"><%=dateList.get(i)%>
						</font></td>
					</tr>
					<% sql2 = "Select GioChieu, PhutChieu from LichChieu, XuatChieu where  LichChieu.MaXuatChieu = XuatChieu.MaXuatChieu and XuatChieu.MaPhim = '"+maPhim+"' and LichChieu.NgayChieu = '"+dateList.get(i)+"' ";
String gioChieu = request.getParameter("gchieu");
ResultSet rs2=st.executeQuery(sql2);
 

while(rs2.next()){%>
					<tr class="ourCompany-list1">
						<td align=left><font face="Tahoma" size="2" color="006600"><a
							href="Giaodich.jsp?gchieu=<%=rs2.getString(1) %>h<%=rs2.getString(2)%>">
						</a></font></td>
						<%}}%>
					</tr>
				</table>
				</fieldset>
				</form>
				</td>
			</tr>
			<tr>
				<td colspan="8" align="center"><br>
				<br>
				<font color="#951509" face="Arial Narrow" size="3"> Quý khách
				vui lòng click vào xuất chiếu để đặt vé.</font></td>
			</tr>
		</table>
		<br>
		<br>
		</td>
	</tr>
</table>
</div>
<!--Our Company Part Ends --></div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<%@include file="Footer.jsp"%>
<!--Footer Part Ends -->
</body>

</html>
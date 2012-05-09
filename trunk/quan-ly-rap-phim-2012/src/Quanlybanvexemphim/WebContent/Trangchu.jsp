<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>
<link href="menucss.css" rel="stylesheet" type="text/css" />
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.util.*"%>
</head>

<body>
<%@include file="Header.jsp"%>
<% if(session.getAttribute("tenDangNhapTV")==null){%>
<%@include file="MenuUser.jsp"%>
<%}else{ %>
<%@include file="MenuUserDaDangNhap.jsp"%>
<%} %>

<div id="ourCompany-bg">
<div id="ourCompany-part">
<form action="Trangchu.jsp">
<table width="100% ">
	<tr>
		<td colspan=10 align="right"><a href="Dangnhapadmin.jsp">Admin</a></td>
	</tr>
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
String querｙ="SELECT count(*) FROM Phim";
ResultSet hang=st.executeQuery(querｙ);
String tk;  
ResultSet pt =null;
     
//Code tạo phân trang
int sohang =0;
if (hang.next()) {
    sohang = hang.getInt(1);
}
//ở đây biến phân trang dùng cho URL là p
int p = 0;
String sob = request.getParameter("p");
if (sob != null ) {
	if (sob.equals("0")) {
	    p = 0;
	} else {
	    p = Integer.parseInt(sob) - 1;
	}
}
int p_one = 2;
//số record
p_one=p_one+p;
String sql;
sql="select top 2 * from (select   top "+p_one+"  Phim.MaPhim, TenPhim,TenDangPhim,TenLoaiPhim,TenQuocGia, DoDaiGio,DoDaiPhut,AnhDaiDien, MoTaPhim,NgayChieu from Phim inner join LoaiPhim on LoaiPhim.MaLoaiPhim=Phim.MaLoaiPhim inner join DangPhim on DangPhim.MaDangPhim=Phim.MaDangPhim inner join QuocGia on QuocGia.MaQuocGia= Phim.MaQuocGia inner join XuatChieu on Phim.MaPhim=XuatChieu.MaPhim inner join LichChieu on XuatChieu.MaXuatChieu=LichChieu.MaXuatChieu where NgayChieu>=(getdate())order by Phim.MaPhim ASC)a  order by a.MaPhim desc";
ResultSet rs = st.executeQuery(sql);
while (rs.next()) {
	System.out.println("ten phim==="+rs.getString(2));
    %>
	<tr class="ourCompany-list">
		<td colspan="3" align="center"><a
			href="Chitietphim.jsp?mphim=<%=rs.getString(1)%>"> 
		<img src="<%out.println(rs.getString(8)); %>" width="300" height="450"></img>
		</a></td>
		<td colspan=3 align="left"><font face="Arial " color="black"
			size="5"> <%out.println(rs.getString(2));%> </font> <br>
		Dạng phim: <%out.println(rs.getString(3));%><br>
		Loại phim: <%out.print(rs.getString(4));%><br>
		Độ dài :<%out.print(rs.getString(6));%> giờ <%out.print(rs.getString(7));%>
		phút<br>
		Quốc gia :<%out.print(rs.getString(5));%><br>
		Ngày Chiếu:<%out.print(rs.getString(10));%><br>
		Mô tả phim:<%out.println(rs.getString(9));%><br>
		<a href="Chonxuatchieu_theophim.jsp">Xem lịch chiếu</a> <br>
		<br>
		</td>
	</tr>
	<% }%>
</table>
<div align="right">
<%
    int i=0;
    int n= sohang;
    int j=1; int m= p_one;
    for (i=0;i<n;i++) {
       if (i%m==0) {  
    	    if (p >= 0 ) {
                if (p+1== i ) {
                     out.print("<a href=?p="+ i + "><b>" + j +  "</b></a> ");
                } else { 
                    out.print("<a href=?p="+ i + ">"+ j +"</a> ");
                }
            }
    	    j++;
   	    }           
     }
    %>
</div>
</form>
</div>

</div>

<%@include file="Footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Thống kê vé</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--Header Background Part Starts -->
<%@include file="Header.jsp"%>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%@include file="MenuAdmin.jsp"%>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg"><!--Our Company Part Starts -->
<div id="ourCompany-part">
<form action="Thongkeve.jsp" method="post">
<table border="0" width=100%>
	<tr>

		<td colspan=10 align="center">
		<h2 class="ourCompany-hdr">Thống kê vé</h2>
		<br />
		<br />
		</td>
	</tr>
	<tr>
		<td colspan=10 align=right><font face=" Arial " color="333333">
		<%String TenDangNhapTV=request.getParameter("TenDangNhapTV");
  out.println("Xin chào "+TenDangNhapTV+"<br>"); %>
		</font>
		<div align="center">
		<table align="center" width=40%>
			<tr class="ourCompany-list">
				<td>Ngày</td>
				<td><select name="ngay">
					<option value="">chọn</option>
					<% for (int i=1;i<=31;i++){
    %><option value="<%=i %>"><%=i%></option>
					<%
    }%>
				</select></td>
				<td>Tháng</td>
				<td><select name="thang">
					<option value="">chọn</option>
					<% for (int i=1;i<=12;i++){
    %><option value="<%=i %>"><%=i%></option>
					<%
    }%>
				</select></td>
				<td>Năm</td>
				<td><select name="nam">
					<option value="">chọn</option>
					<% for (int i=2012; i<=2040;i++){
    %><option value="<%=i %>"><%=i%></option>
					<%
    }%>
				</select></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td align="right" colspan="2"><input type="submit"
					name="thongke" value="Thống kê"> <%
 String Ngay = request.getParameter("ngay");
 String Thang = request.getParameter("thang");
 String Nam = request.getParameter("nam");
 String nc =""+Thang+"/"+Ngay+"/"+Nam+"";
 System.out.println("NgayChon======"+Thang+"/"+Ngay+"/"+Nam+"====");
 %> <%!public void Xulythongkeve(String nc) 
     {
 Connection connection = null;
    String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
    String userName = "sa";
    String password = "123";
    String JDBC_Driver =  "net.sourceforge.jtds.jdbc.Driver";
    Statement st = null;
       try {
            Class.forName(JDBC_Driver);
            connection = DriverManager.getConnection(data, userName, password);
            st = connection.createStatement();
            String sql1="select convert(varchar(50),NgayChieu,103)as nc from LichChieu";
            st.executeQuery(sql1);
       } 
       catch (ClassNotFoundException e) {
        e.printStackTrace();
        } catch (SQLException se) {        
           se.printStackTrace();
        } finally {
    if (connection != null) {
    try {
     connection.close();
    }
    catch (Exception e) {
     System.out.println("Khong dong duoc ket noi");
    }
   }

   if (st != null) {
    try {
     st.close();
    }
    catch (Exception e) {
     System.out.println("Khong dong duoc ket noi");
    }
   }
        }
 }%> <%! String tk; %> <%
  tk=request.getParameter("thongke");
  System.out.println(request.getParameter("thongke"));
 
   if("Thá»ng kÃª".equals(tk))
  {
	   Xulythongkeve(nc);
  }
 %>
				</td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td colspan="3"><font color="#951509" face="Arial Narrow"
					size="3"> Số lượng vé bán được:</font></td>
			</tr>
		</table>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
</table>
</form>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
</div>
<!--Our Company Part Ends --></div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<%@include file="Footer.jsp"%>
<!--Footer Part Ends -->
</body>
</html>
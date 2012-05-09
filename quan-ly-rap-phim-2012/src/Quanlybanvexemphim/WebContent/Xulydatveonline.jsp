<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Xử lý đặt vé online</title>
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
<form action="Xulydatveonline.jsp" method="post">
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
%> <br>
<br>
<br>
<table width=100%>
	<tr>
		<td colspan="12" align="center">
		<h2 class="ourCompany-hdr">Danh sách thành viên đặt vé online</h2>
		</td>
	</tr>
</table>
<br>
<br>
<br>
<div="center">
<table width=100%>
	<tr class="ourCompany-list">
		<td colspan="4">Ngày chiếu: <select name="ngay">
			<% for (int ngay=1;ngay<=31;ngay++){
    %><option value="<%=ngay %>"><%=ngay%></option>
			<%
    }%>
		</select> <select name="thang">
			<% for (int thang=1;thang<=12;thang++){
    %><option value="<%=thang %>"><%=thang%></option>
			<%
    }%>
		</select> <select name="nam">
			<% for (int nam=2012; nam<=2040;nam++){
    %><option value="<%=nam %>"><%=nam%></option>
			<%
    }%>
		</select></td>
		<td colspan="2">Tên phim: <select name="tenphim"
			style="width: 130px; height: 18px; margin-left: 10px">
			<%
                       
                      String sql1 = "SELECT [Phim].[MaPhim],[Phim].[TenPhim]FROM [Quanlybanvephim].[dbo].[Phim] ";
                         ResultSet rs1 = st.executeQuery(sql1);
                         ResultSetMetaData rsmd = rs1.getMetaData();
                          while(rs1.next())
                            {
                          
                           {%>
			<option value="<%=rs1.getString(1) %>"><%=rs1.getString(2) %></option>
			<%}
                        }%>
		</select></td>
		<td colspan="2">Xuất chiếu: <select name="xuatchieu"
			style="width: 55px; height: 18px; margin-left: 10px">
			<%
                       
                      String sql2 = "select [XuatChieu].[MaXuatchieu], [XuatChieu].[GioChieu],[XuatChieu].[PhutChieu] from [XuatChieu] ";
                         ResultSet rs2 = st.executeQuery(sql2);
                         ResultSetMetaData rsm = rs2.getMetaData();
                       
                         while(rs2.next())
                            {
                             
                           {%>
			<option value="<%=rs2.getString(2)%>h<%=rs2.getString(3)%>">
			<%=rs2.getString(2)%>h<%=rs2.getString(3)%></option>
			<%}
                        }%>
		</select></td>
		<td colspan="3"><input type="text" name="tk" value="Nhập"
			width="10%" /> <input type="submit" name="timkiem1" value="Tìm kiếm" />
		</td>
	</tr>
	<tr></tr>
	<tr></tr>
	<tr></tr>
	<tr></tr>
	<tr>
		<td colspan="10">
		<table border="1" width="100%">
			<tr bgcolor="333333">
				<td style="background: gray; font-style: bold; font-size: 14px">STT</td>
				<td style="background: gray; font-style: bold; font-size: 14px">Tên
				thành viên</td>
				<td style="background: gray; font-style: bold; font-size: 14px">Tên
				đăng nhập</td>
				<td style="background: gray; font-style: bold; font-size: 14px">Mã
				xác nhận</td>
				<td style="background: gray; font-style: bold; font-size: 14px">Số
				lượng vé thường</td>
				<td style="background: gray; font-style: bold; font-size: 14px">Số
				lượng vé vip</td>
				<td style="background: gray; font-style: bold; font-size: 14px"></td>
			</tr>

		</table>
		</td>
	</tr>
	<tr>
		<td colspan="10">
		<table border="1" width=100%>
			<tr bgcolor="333333">
				<td style="background: gray; font-style: bold; font-size: 14px">STT</td>
				<td style="background: gray; font-style: bold; font-size: 14px">Tên
				thành viên</td>
				<td style="background: gray; font-style: bold; font-size: 14px">Tên
				đăng nhập</td>
				<td style="background: gray; font-style: bold; font-size: 14px">Mã
				xác nhận</td>
				<td style="background: gray; font-style: bold; font-size: 14px">Số
				lượng vé thường</td>
				<td style="background: gray; font-style: bold; font-size: 14px">Số
				lượng vé vip</td>
				<td style="background: gray; font-style: bold; font-size: 14px"></td>
			</tr>
			<%      String Ngay = request.getParameter("ngay");
        String Thang = request.getParameter("thang");
        String Nam = request.getParameter("nam");
        String Phim = request.getParameter("tenphim");
        String Xuat = request.getParameter("xuatchieu");
 		String tttk= request.getParameter("tk");
		String tk1=request.getParameter("timkiem1");
		 ResultSet rs3;
		  if ("TÃ¬m kiáº¿m".equals(tk1)) {
		   System.out.println("ra di mi");
		  // SELECT [ThanhVien].[HoTen],[DanhSachDatVeOnline].[TenDangNhapTV],[DanhSachDatVeOnline].[MaXacNhan],[DanhSachDatVeOnline].[SoLuongVe] FROM [Quanlybanvephim].[dbo].[DanhSachDatVeOnline],[Quanlybanvephim].[dbo].[ThanhVien],[Quanlybanvephim].[dbo].[LichChieu],[Quanlybanvephim].[dbo].[XuatChieu]where  [DanhSachDatVeOnline].[MaLichChieu]=[LichChieu].[MaLichChieu]	and [LichChieu].[MaXuatChieu]=[XuatChieu].[MaXuatChieu]	and	((day([LichChieu].[NgayChieu])='"+Ngay+"' and month ([LichChieu].[NgayChieu])='"+Thang+"'and year ([LichChieu].[NgayChieu])='"+Nam+"')or [XuatChieu].[MaPhim]='"+Phim+"' or [LichChieu].[MaXuatChieu]='"+Xuat+"')
		   String sql3 = "SELECT [ThanhVien].[HoTen],[DanhSachDatVeOnline].[TenDangNhapTV],[DanhSachDatVeOnline].[MaXacNhan],[DanhSachDatVeOnline].[SoLuongVeThuong],[DanhSachDatVeOnline].[SoLuongVeVip]FROM [Quanlybanvephim].[dbo].[DanhSachDatVeOnline],[Quanlybanvephim].[dbo].[ThanhVien],[Quanlybanvephim].[dbo].[LichChieu],[Quanlybanvephim].[dbo].[XuatChieu]where [DanhSachDatVeOnline].[TenDangNhapTV]=[ThanhVien].[TenDangNhapTV]and ([ThanhVien].[HoTen] like '%"+ tttk + "%'or [DanhSachDatVeOnline].[TenDangNhapTV]like '%"+ tttk + "%' or [DanhSachDatVeOnline].[MaXacNhan]like '%"+ tttk + "%')and  [DanhSachDatVeOnline].[MaLichChieu]=[LichChieu].[MaLichChieu]	and [LichChieu].[MaXuatChieu]=[XuatChieu].[MaXuatChieu]	and	((day([LichChieu].[NgayChieu])='"+Ngay+"' and month ([LichChieu].[NgayChieu])='"+Thang+"'and year ([LichChieu].[NgayChieu])='"+Nam+"')or( [XuatChieu].[MaPhim]='"+Phim+"' and [LichChieu].[MaXuatChieu]='"+Xuat+"'))";
        System.out.println("sql===================="+sql3);
 	   rs3 = st.executeQuery(sql3);
       		while (rs3.next()) {
			%>
			<tr class="ourCompany-list">
				<td></td>
				<td><label>
				<%out.println(rs3.getString(1)); %>
				</label> <input type="hidden" name="hotentv" value="<%= rs3.getString(1) %>" /></td>
				<td><label>
				<%out.println(rs3.getString(2)); %>
				</label> <input type="hidden" name="tendangnhaptv"
					value="<%= rs3.getString(2) %>" /></td>
				<td><label>
				<%out.println(rs3.getString(3)); %>
				</label> <input type="hidden" name="maxacnhan"
					value="<%= rs3.getString(3) %>" /></td>
				<td><label>
				<%out.println(rs3.getString(4)); %>
				</label> <input type="hidden" name="soluongvethuong"
					value="<%= rs3.getString(4) %>" /></td>
				<td><label>
				<%out.println(rs3.getString(5)); %>
				</label> <input type="hidden" name="soluongvevip"
					value="<%= rs3.getString(5) %>" /></td>
				<td><a
					href="xuatve.jsp?MaXacNhan=<%out.println(rs3.getString(3));%>">Xuất
				vé</a></td>
			</tr>
			<%} %>
			<tr>
				<%String sql4 = "select count ([DanhSachDatVeOnline].[TenDangNhapTV]) from [DanhSachDatVeOnline]";
		ResultSet rs4 = st.executeQuery(sql4);
		while (rs4.next()) {
			%>
				<td colspan="10" align="left">Tổng: <%out.println(rs4.getString(1)); %>
				</td>
			</tr>
			<%} %>
			<%} 
 else  { 
	 %>

			<%     
       String sql6="SELECT [ThanhVien].[HoTen],[DanhSachDatVeOnline].[TenDangNhapTV],[DanhSachDatVeOnline].[MaXacNhan],[DanhSachDatVeOnline].[SoLuongVeThuong],[DanhSachDatVeOnline].[SoLuongVeVip]FROM [Quanlybanvephim].[dbo].[DanhSachDatVeOnline],[Quanlybanvephim].[dbo].[ThanhVien]where [DanhSachDatVeOnline].[TenDangNhapTV]=[ThanhVien].[TenDangNhapTV]";
       ResultSet rs6 = st.executeQuery(sql6);
       while (rs6.next()) {
       %>
			<tr class="ourCompany-list">
				<td></td>
				<td><label>
				<%out.println(rs6.getString(1)); %>
				</label> <input type="hidden" name="hotentv" value="<%= rs6.getString(1) %>" /></td>
				<td><label>
				<%out.println(rs6.getString(2)); %>
				</label> <input type="hidden" name="tendangnhaptv"
					value="<%= rs6.getString(2) %>" /></td>
				<td><label>
				<%out.println(rs6.getString(3)); %>
				</label> <input type="hidden" name="maxacnhan"
					value="<%= rs6.getString(3) %>" /></td>
				<td><label>
				<%out.println(rs6.getString(4)); %>
				</label> <input type="hidden" name="soluongthuong"
					value="<%= rs6.getString(4) %>" /></td>
				<td><label>
				<%out.println(rs6.getString(5)); %>
				</label> <input type="hidden" name="soluongvip"
					value="<%= rs6.getString(5) %>" /></td>
				<td><a
					href="xuatve.jsp?MaXacNhan=<%out.println(rs6.getString(3));%>">Xuất
				vé</a></td>
			</tr>
			<%} %>
			<tr>
				<%String sql4 = "select count ([DanhSachDatVeOnline].[TenDangNhapTV]) from [DanhSachDatVeOnline]";
		ResultSet rs4 = st.executeQuery(sql4);
		while (rs4.next()) {
			%>
				<td colspan="10" align="left"><font face=" Arial "
					color="333333">Tổng số:</font> <font color="993300"> <%out.println(rs4.getString(1)); %>
				</font></td>
			</tr>
			<%}} %>
		</table>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		</td>
	</tr>
</table>
</div>
</form>
</div>
<!--Our Company Part Ends --></div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<%@include file="Footer.jsp"%>
<!--Footer Part Ends -->
</body>
</html>


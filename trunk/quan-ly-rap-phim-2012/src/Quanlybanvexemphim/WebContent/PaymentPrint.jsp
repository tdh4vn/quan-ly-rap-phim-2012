<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thanh toan KL</title>
</head>
<%@page import="Conver.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<body>
<%
	Connection connection = null;
	String data = "jdbc:jtds:sqlserver://localhost:3548/QuanLyKhachSan";
	String userName = "sa";
	String passWord = "123";
	String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
	Statement st = null;
	Class.forName(JDBC_Driver);
	connection = DriverManager.getConnection(data, userName, passWord);
	st = connection.createStatement();
	
	String maKhachHang = request.getParameter("MaKHD");
	String maPhong = request.getParameter("maPhongHidden");
	String ngayDat = request.getParameter("ngayDatPhongHidden");
	System.out.println("ngayDatPhongHidden========" + ngayDat);
	
	String[] tenDV = request.getParameterValues("tenDV");
	String[] soLuong = request.getParameterValues("soLuong");
	String[] gia = request.getParameterValues("gia");
	String[] thanhTien = request.getParameterValues("thanhTien");
	
	String ngayBatDau = request.getParameter("ngayBatDauHidden");
	String ngayKetThuc = request.getParameter("ngayKetThucHidden");
	String giaPhong = request.getParameter("giaPhongHidden");
	String tenKhachHang = request.getParameter("tenKHHidden");
	String diachiKH = request.getParameter("diaChiKHHidden");
	String sdtKhachHang = request.getParameter("sdtKHHidden");
	String emailKH = request.getParameter("emailKHHidden");
	String mucGiamGia = request.getParameter("mGGHidden");
	
	
	
	
	//String mucGG = request.getParameter("mucGiamG");
	//System.out.println(mucGG);
/*	String sql1 = "select top 1 year(NgayDat), month(NgayDat), day(NgayDat), GioDat, year(NgayBD), month(NgayBD), day(NgayBD), GioBD, year(NgayKT), month(NgayKT), day(NgayKT), GioKT, DatPhong.MaPhong, Gia, HoTen, DiaChi, SDT, Email, SoLanDaO, SoTien, MucGiamGia from (((KhachHang inner join LoaiKhach on KhachHang.MaLoaiKhach = LoaiKhach.MaLoaiKhach) inner join DatPhong on KhachHang.MaKH = DatPhong.MaKH) inner join Phong on DatPhong.MaPhong = Phong.MaPhong)inner join TrangThaiGiaoDich on TrangThaiGiaoDich.MaTrangThai_GD = DatPhong.MaTrangThai_GD where DatPhong.MaKH = '"+ maKH+ "' AND DatPhong.MaPhong ='"+ maPhong+ "' AND DatPhong.MaTrangThai_GD = 'TTGD2' order by NgayKT desc";
	System.out.println("sql1:----" + sql1);
	ResultSet rs1 = st.executeQuery(sql1);
	String ngDat, ngKT, ngBD;
	while (rs1.next()) {
		ngDat = rs1.getString(1) + "/" + rs1.getString(2) + "/"+ rs1.getString(3) + " " + rs1.getString(4);
		ngBD = rs1.getString(5) + "/" + rs1.getString(6) + "/"+ rs1.getString(7) + " " + rs1.getString(8);
		ngKT = rs1.getString(9) + "/" + rs1.getString(10) + "/"	+ rs1.getString(11) + " " + rs1.getString(12);
		gia = Float.parseFloat(rs1.getString(14));
		mucGiamGia = Float.parseFloat(rs1.getString(21));
		*/
%>
<%-- 
<input type="hidden" name="MaP" value="<%=maPhong%>">
<input type="hidden" name="MaKHD" value="<%=maKH%>">--%>
<form action="PaymentPrint.jsp">
<table>
	<tr>
		<td style="font-weight: bold;">Khách hàng</td>
		<td><%=rs1.getString(15)%></td>
		<td style="font-weight: bold;">Địa chỉ</td>
		<td><%=rs1.getString(16)%></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Ngày đặt phòng</td>
		<td><%=ngDat%></td>
		<td style="font-weight: bold;">Ngày bắt đầu</td>
		<td><%=ngBD%></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Mã phòng</td>
		<td><%=rs1.getString(13)%></td>
		<td style="font-weight: bold;">Ngày kết thúc</td>
		<td><%=ngKT%></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Giá phòng(USD)</td>
		<td><%=gia%></td>
		<td style="font-weight: bold;">Mức giảm giá(%)</td>
		<td><%=rs1.getString(21)%></td>
	</tr>
	<%
		ConvertDate cd = new ConvertDate();
			int soNgayO = cd.getNumberOfDate(ngBD, ngKT);
			//System.out.println("songayo==="+soNgayO);
			giamGia = soNgayO * gia * mucGiamGia / 100;
			//System.out.println("giamgia==="+giamGia);
			thanhTien = soNgayO * gia;
			//System.out.println("thanhTien==="+thanhTien);
			tienPhong = thanhTien - giamGia;
			//System.out.println("tienphong==="+tienPhong);
			tienCoc = Float.parseFloat(rs1.getString(19));
	%>
	<tr>
		<td style="font-weight: bold;">Thành tiền(USD)</td>
		<td><%=thanhTien%> <input type="hidden" name="TienPhongO"
			value="<%=thanhTien%>"></td>
		<td style="font-weight: bold;">Tiền đặt trước(USD)</td>
		<td><%=rs1.getString(20)%></td>
	</tr>
</table>

<%
	}
	rs1.close();
%> <%
 	ArrayList<String> ar2 = new ArrayList<String>();
 	String sql2 = "select TenDichVu, SoLuong, Gia, SoLuong*Gia as Tong from DatDichVu inner join DichVu on DatDichVu.MaDichVu = DichVu.MaDichVu where MaKH = '"
 			+ maKH
 			+ "' AND MaPhong ='"
 			+ maPhong
 			+ "' AND MaTrangThai_DV = 'MTT02'";
 	//System.out.println("sql2 = "+sql2);
 	ResultSet rs2 = st.executeQuery(sql2);
 	float tTien = 0;
 	//boolean columnCount = rs2.next();
 	//System.out.println(columnCount);
 	boolean kt = false;
 %>
<table style="width: 600px;">
	<tr>
		<th style="background: gray; font-style: bold; font-size: 14px;">STT</th>
		<th style="background: gray; font-style: bold; font-size: 14px;">Tên
		dịch vụ</th>
		<th style="background: gray; font-style: bold; font-size: 14px;">Số
		lượng</th>
		<th style="background: gray; font-style: bold; font-size: 14px;">Giá(USD)</th>
		<th style="background: gray; font-style: bold; font-size: 14px;">Thành
		tiền</th>
	</tr>
	<%
		int row2 = 1;
		while (rs2.next()) {
			tTien += Float.parseFloat(rs2.getString(4));
	%>
	<tr>
		<td><%=row2++%> <input type="hidden" name="tienDichVu"
			value="<%=tTien%>"></td>
		<td><%=rs2.getString(1)%></td>
		<td><%=rs2.getString(2)%></td>
		<td><%=rs2.getString(3)%></td>
		<td><%=rs2.getString(4)%></td>
	</tr>
	<%
		kt = true;
		}
		rs2.close();
	%>
</table>
<%
	if (kt == false) {
%>
<p style="color: blue;">Khách hàng ko sử dụng dịch vụ</p>
<%
	}
	float tienP = Float.parseFloat(request.getParameter("TienPhongO"));
	System.out.println("toi day dc ko he: "+tienP);
	float tienC = Float.parseFloat(request.getParameter("tienCoc"));
	float tienGG = Float.parseFloat(request.getParameter("giamGia"));
	float tienDV = Float.parseFloat(request.getParameter("tienDV"));
	float tt = tienP - tienGG - tienC + tienDV;
%>
<p style="font-weight: bold;">Tiền phòng(USD) <%=tienP - tienGG%></p>
<p style="font-weight: bold;">Tiền dịch vụ(USD) <%=tTien%></p>
<p style="font-weight: bold;">Tổng tiền(USD) <%=tt%></p>
</form>
--%>
<table style="width: 600px;">
	<tr>
		<td align="right" style="float: right;">
		<form
			action="PaymentPrint.jsp?MaP=<%=maPhong%>&MaKHD=<%=maKH%>&MucGG=<%=request.getParameter("MucGG")%>">
		<input type="submit" name="btnPayment" value="Payment"></form>
		<form action="ShowKL.jsp"><input type="submit" name="btnCancel"
			value="Cancel"></form>
		</td>
	</tr>
</table>


</body>
</html>
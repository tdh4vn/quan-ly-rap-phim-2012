<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<%@page import="java.util.*"%>
<title>Thông tin ghế</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="Header.jsp"%>
<%@include file="MenuAdmin.jsp"%>
<div id="ourCompany-bg">
<div id="ourCompany-part">
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

	String maPhong = request.getParameter("maPhongParam");

	String mp3 = request.getParameter("mp2");
	System.out.println("ma phim " + mp3);

	String soghe1 = request.getParameter("soGhe");
	String ngayc1 = request.getParameter("ngayc");
	String gioc1 = request.getParameter("gioc");
	String phutc1 = request.getParameter("phutc");

	String maLichChieu = "" + session.getAttribute("lc");
	String maXuatChieu = "" + session.getAttribute("xc");
%>
<form action="Xulybanve.jsp" method="post"><br>
<br>
<br>
<br>
<br>
<br>
<table width="100%">
	<tr>
		<td colspan=10>
		<fieldset><Legend> <font face="Arial " color="black" size="5"> Thông tin ghế </font> </Legend>
		<div align="center">
		<table width=80%>
			<tr class="ourCompany-list">
				<td align=left>Mã phòng :</td>
				<td align=left><label><%=maPhong%></label> <input type="hidden" name="maPhongName" value="<%=maPhong%>" /></td>
			<tr class="ourCompany-list">
				<td align=left>Tên phim :</td>
				<td align=left><label><%=session.getAttribute("tenPhim3")%></label> <input type="hidden" name="tenPhimName"
					value="<%=session.getAttribute("tenPhim3")%>" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td align=left>Ngày Chiếu :</td>
				<td align=left><label><%=ngayc1%></label> <input type="hidden" name="ngayChieuname" value="<%=ngayc1%>" /></td>
			<tr class="ourCompany-list">
				<td align=left>Xuất Chiếu :</td>
				<td align=left><label><%=gioc1%>h<%=phutc1%></label> <input type="hidden" name="gioChieuName"
					value="<%=gioc1%>" /> <input type="hidden" name="phutChieuName" value="<%=phutc1%>" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td width=40% align=left>Số ghế :</td>
				<td align=left><label><%=soghe1%></label><input type="hidden" name="soGheName" value="<%=soghe1%>" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td width=40% align=left >Trạng thái ghế :</td>
				<%
					String sql5 = "Select TrangThaiGhe from Ghe_LichChieu where SoGhe = '"
							+ soghe1
							+ "' and MaLichChieu ='"
							+ maLichChieu
							+ "' and MaXuatChieu = '" + maXuatChieu + "'";
					System.out.println("click vao link TE o trang giao dich: " + sql5);
					ResultSet rs5 = st.executeQuery(sql5);
					while (rs5.next()) {
				%>
				<td align=left id="trangThaiGheId"><%=rs5.getString(1)%></td>
				<%
					}
				%>
			</tr>
			<tr class="ourCompany-list">
				<td width=40% align=left>Tên sự kiện :</td>
				<td align=left><select name="tensukien" id="tenSuKien" onchange="changeTenSuKien();"
					style="width: 200px; height: 18px; margin-left: 10px">
					<%
						String sql1 = "SELECT [MaSuKien],[TenSuKien], [MucGiamGia] FROM [Quanlybanvephim].[dbo].[SuKien] ";
						System.out.println("sql1 : " + sql1);
						ResultSet rs1 = st.executeQuery(sql1);
						ArrayList<String> mucGiamGiaArray = new ArrayList<String>();
						ArrayList<String> maSuKienArray = new ArrayList<String>();
						String maSuKienDauTien = "";
						while (rs1.next()) {
							if ("".equals(maSuKienDauTien)) {
								maSuKienDauTien = rs1.getString(1);
							}
							mucGiamGiaArray.add(rs1.getString(3));
							maSuKienArray.add(rs1.getString(1));
					%>
					<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
					<%
						} //end while (rs1.next()) {
					%>
				</select> <%
 	for (int i = 0; i < mucGiamGiaArray.size(); i++) {
 %> <input type="hidden" id="<%=maSuKienArray.get(i)%>Hidden" name="<%=maSuKienArray.get(i)%>Hidden"
					value="<%=mucGiamGiaArray.get(i)%>" /> <%
 	} // end for (int i = 0; i < mucGiamGiaArray.size(); i++) {
 %>
				</td>
			</tr>
			<tr class="ourCompany-list">

				<td width=20% align=left>Mức giảm giá :</td>
				<td align=left><label id="giamGiaId"></label> %</td>
			</tr>
			<tr class="ourCompany-list">
				<td width=40% align=left>Đơn giá :</td>
				<%
					String sql4 = "select Ghe.MaLoaiGhe from "
							+ "Ghe_LichChieu join LichChieu on LichChieu.MaLichChieu=Ghe_LichChieu.MaLichChieu "
							+ "join Ghe on Ghe_LichChieu.SoGhe=Ghe.SoGhe and LichChieu.MaPhong=Ghe.MaPhong "
							+ "where LichChieu.MaPhong ='" + mp3
							+ "' and Ghe_LichChieu.MaLichChieu ='" + maLichChieu
							+ "'and Ghe_LichChieu.MaXuatChieu ='" + maXuatChieu
							+ "'and Ghe_LichChieu.SoGhe = '" + soghe1 + "'";
					System.out.println("sql4 " + sql4);
					ResultSet rs4 = st.executeQuery(sql4);
					while (rs4.next()) {
						String maLoaiGhe = rs4.getString(1);
						session.setAttribute("maLoaiGheAtrribute", maLoaiGhe);
						System.out.println("Ma loai ghe la==="
								+ session.getAttribute("maLoaiGheAtrribute"));
					}
					String sql2 = "Select SoTien from Gia where MaLoaiGhe = '"
							+ session.getAttribute("maLoaiGheAtrribute") + "'";
					ResultSet rs2 = st.executeQuery(sql2);
					while (rs2.next()) {
				%>
				<td align=left><label id="donGiaId"><%=rs2.getString(1)%></label> <%
 	}
 %>
				
			</tr>
			<tr class="ourCompany-list">
				<td width=40% align=left>Tổng tiền :</td>
				<td align=left><label id="tongTienId"></label></td>
			</tr>
			<tr class="ourCompany-list">
				<td align=center><input type="submit" name="banve" value="OK" onClick="return show_confirm()" /></td>
				<td align=left><input type="submit" value="Cancel" onclick="javascript:history.back(1);" /></td>
			</tr>
		</table>
		</div>
		</fieldset>
		</td>
	</tr>
</table>
<br>
<br>
<br>
<br>
<br>
<br>
</form>
</div>
</div>
<%@include file="FooterAdmin.jsp"%>
</body>
<script>
    function show_confirm() {
    var trangThaiGhe = document.getElementById("trangThaiGheId").innerHTML;
        if(trangThaiGhe == "Đ? bán") {
            return confirm("Ghế đã dc bán");
        }
        return confirm("Bạn có chắc chắn muốn bán không ?");
    }
    
    document.getElementById("giamGiaId").innerHTML = document.getElementById("<%=maSuKienDauTien%>Hidden").value;
    document.getElementById("tongTienId").innerHTML = (100 - document.getElementById("giamGiaId").innerHTML) * document.getElementById("donGiaId").innerHTML /100;
	
	function changeTenSuKien(){
	    var tenMucGiamGiaHidden = document.getElementById('tenSuKien').value + 'Hidden';
	    	document.getElementById("giamGiaId").innerHTML = document.getElementById(tenMucGiamGiaHidden).value;
	    var tenMucTongTienHidden = document.getElementById('tenSuKien').value + 'Hidden';
	        document.getElementById("tongTienId").innerHTML = (100 - document.getElementById("giamGiaId").innerHTML) * document.getElementById("donGiaId").innerHTML /100;
	    }    
    </script>
</html>
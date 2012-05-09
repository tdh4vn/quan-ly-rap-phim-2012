<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.util.*"%>
<title>Giao dịch</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
  function message()
  {
   alert("Chúc mừng bạn đặt vé thành công. Xin hãy nhớ mã vé này để đến quầy thanh toán và nhận vé trước giờ chiếu 30 phút. Xin cảm ơn! ");
  }
 </script>

<body>
<!--Header Background Part Starts -->
<%@include file="Header.jsp"%>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%@include file="MenuUser.jsp"%>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg"><!--Our Company Part Starts -->
<div id="ourCompany-part">
<form action="Datve2.jsp">
<table width="100%">
	<tr>
		<td colspan=8 align="center">
		<h2 class="ourCompany-hdr">Đặt vé</h2>
		</td>
	</tr>
	<tr>
		<td colspan="8"><br>
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
   
  %>
		<table width="80%" align="center">
			<tr>
				<td colspan="7" align="right"><font face=" Arial "
					color="333333"> Hello <%=session.getAttribute("tenDangNhapTV")%></font>


				</td>
			</tr>
			<tr>
				<td colspan=5><font color="#951509" face="Arial Narrow"
					size="3"> Chúng tôi đang có chương trình khuyến mãi vô cùng
				hấp dẫn. Hãy click</font> <a href="Sukien.jsp"><font color="blue"
					face="Arial Narrow" size="3">vào đây</font></a> <font color="#951509"
					face="Arial Narrow" size="3">để biết thêm chi tiết. </font></td>
			</tr>
		</table>
		<table width=100% border="1">
			<tr bgcolor="333333">
				<td><font color="#CBC387">Các loại vé:</font></td>
				<td><font color="#CBC387">Số lượng:</font></td>
				<td><font color="#CBC387">Đơn giá:</font></td>
				<td><font color="#CBC387">Thành tiền:</font></td>
			</tr>

			<tr class="ourCompany-list">
				<td><label> Vé thường </label></td>
				<td><select name="soluongVeThuong" id="SLveThuongid"
					onchange="tongTienThuong();">
					<% for (int i=0; i<=8;i++){
            %><option value="<%=i %>"><%=i%></option>
					<%
            }%>

				</select></td>
				<%
   String sql1 = "Select SoTien from Gia where MaLoaiGhe = 'T'";
   ResultSet rs1 = st.executeQuery(sql1); 
   while(rs1.next()) {
   %>
				<td><label id="giaVeThuong">
				<%out.println(rs1.getString(1)); }%>
				</label></td>

				<td><label id="tongTienThuongId"> </label></td>
			</tr>

			<tr class="ourCompany-list">
				<td><label> Vé VIP </label></td>
				<td><select name="soluongVeVip" id="SLveVIPid"
					onchange="tongTienVIP();">
					<% for (int j=0; j<=8;j++){
            %><option value="<%=j%>"><%=j%></option>
					<%
            }%>
				</select></td>
				<%
   String sql2 = "Select SoTien from Gia where MaLoaiGhe = 'V'";
   ResultSet rs2 = st.executeQuery(sql2); 
   while (rs2.next()) {
   %>
				<td><label id="giaveVIP"> <%out.println(rs2.getString(1)); }%>
				</label></td>
				<td><label id="tongTienVIPId"> </label></td>

			</tr>
		</table>
		<table width="100%">
			<tr>

				<%-- //String sql3 = "Select distinct Phim.MaPhim from Phim, LichChieu,XuatChieu where Phim.MaPhim = XuatChieu.MaPhim and LichChieu.MaXuatChieu = XuatChieu.MaXuatChieu and LichChieu.NgayChieu = '"+session.getAttribute("ngayChieuAttribute")+"' and Phim.TenPhim = '"+session.getAttribute ("tenPhim3")+"' and XuatChieu.GioChieu ='"+gioChieu2+"' and XuatChieu.PhutChieu='"+phutChieu2+"'";
    
    String sql3="select XuatChieu.MaPhim from XuatChieu,Phim,LichChieu where XuatChieu.MaPhim = Phim.MaPhim and LichChieu.MaXuatChieu=XuatChieu.MaXuatChieu and Phim.TenPhim ='"+session.getAttribute ("tenPhim3")+"'and LichChieu.NgayChieu = '"+session.getAttribute("ngayChieuAttribute")+"' and XuatChieu.GioChieu ='"+gioChieu2+"' and XuatChieu.PhutChieu ='"+phutChieu2+"'";
    ResultSet rs3 = st.executeQuery(sql3); 
    while (rs3.next()) {
    --%>
				<%
    String sql3=" Select  XuatChieu.MaXuatChieu,XuatChieu.MaPhim,LichChieu.MaLichChieu from XuatChieu, LichChieu, Phim where XuatChieu.MaPhim = Phim.MaPhim and XuatChieu.MaXuatChieu = LichChieu.MaXuatChieu and Phim.MaPhim ='"+session.getAttribute("maPhim3")+"'and LichChieu.NgayChieu ='"+session.getAttribute("ngayChieuAttribute")+"'";
    ResultSet rs3 = st.executeQuery(sql3); 
    while (rs3.next()) {
    %>
				<td><input type="hidden" name="maXuatchieu"
					value="<%=rs3.getString(1)%>"></td>
				<td><input type="hidden" name="maPhimName"
					value="<%=rs3.getString(2)%>"></td>
				<td><input type="hidden" name="maLichchieu"
					value="<%=rs3.getString(3)%>"></td>
				<%} %>

			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit"
					value="Đặt vé" name="DatVevalue" onClick="message()"> <%

 String SLveThuong = request.getParameter("soluongVeThuong");
 System.out.println("So luong ve thuong la====" + SLveThuong);
 String SLveVip = request.getParameter("soluongVeVip");
 System.out.println("So luong ve Vip la ====" + SLveVip);
 String maPhim3 = request.getParameter("maPhimName");
 System.out.print ("ma phim o day la ===" +maPhim3);
 String maXuatChieu = request.getParameter("maXuatchieu");
 System.out.print ("ma xuatchieu o day la ===" +maXuatChieu);
 String maLichChieu = request.getParameter("maLichchieu");
 System.out.print ("ma xuatchieu o day la ===" +maLichChieu);
 String tendn = ""+session.getAttribute("tenDangNhapTV");
 System.out.print ("ta la sieu nhan day, ten ta la ===" +tendn);
 %> <%!public void  Xulydatve(String SLveThuong,String SLveVip, String maPhim3,String maXuatChieu,String maLichChieu,String tendn) 
{
Connection connection = null;
String data = "jdbc:jtds:sqlserver://localhost:3548/Quanlybanvephim";
String userName = "sa";
String password = "123";
String JDBC_Driver =  "net.sourceforge.jtds.jdbc.Driver";
Statement st = null;
try {
 Class.forName(JDBC_Driver);
 connection = DriverManager.getConnection(data, userName, password);
 st = connection.createStatement();
 String sql ="INSERT INTO [Quanlybanvephim].[dbo].[DanhSachDatVeOnline]([TenDangNhapTV],[SoLuongVeThuong] ,[MaPhim],[SoLuongVeVip],[MaXuatChieu],[MaLichChieu])VALUES ('"+tendn+"','"+SLveThuong+"' ,'"+maPhim3+"' ,'"+SLveVip+"' ,'"+maXuatChieu+"' ,'"+maLichChieu+"')";
 System.out.println("============"+sql);
 st.executeUpdate(sql); 
}catch(ClassNotFoundException e){
e.printStackTrace();
}
catch (SQLException se) {        
     se.printStackTrace();
}finally{
if(connection !=null){
try{
connection.close();
}catch (Exception e) {
System.out.println("Khong dong duoc ket noi");
}
}
if(st!=null){
try{
st.close();
}catch (Exception e) {
System.out.println("Khong dong duoc ket noi");
}
}
}
}%> <%!String tk; %> <% 
tk=request.getParameter("DatVevalue");
System.out.println(tk);
if("Äáº·t vÃ©".equals(tk))
{
   Xulydatve( SLveThuong, SLveVip,  maPhim3, maXuatChieu, maLichChieu, tendn);

}

%>
				</td>
			</tr>
		</table>
		<table width="100%">
			<tr>
				<td colspan="5" align="left"><font color="#951509"
					face="Arial Narrow" size="3">Lưu ý : Giá vé trên sẽ được
				giảm đối với người già và trẻ em.<br>
				Giá sẽ được giảm khi quý khách đến thanh toán trực tiếp tại rạp. </font></td>
				<td colspan="3" align="right"><a href="Sodoghe.jsp">Xem sơ
				đồ ghế</a></td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<br>
		</td>
	</tr>
	<tr></tr>
	<tr></tr>
	<tr></tr>

</table>
</form>
<br>
<br>
<br>
<br>
</div>
<!--Our Company Part Ends --></div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<%@include file="Footer.jsp"%>
<!--Footer Part Ends -->
</body>
<Script>
function tongTienThuong()
{document.getElementById("tongTienThuongId").innerHTML = (document.getElementById("SLveThuongid").value) * (document.getElementById("giaVeThuong").innerHTML);
var tenMucTongTienThuong = document.getElementById('SLveThuongid').value ;
document.getElementById("tongTienThuongId").innerHTML = (document.getElementById("SLveThuongid").value) * (document.getElementById("giaVeThuong").innerHTML);
}

function tongTienVIP()
{
 document.getElementById("tongTienVIPId").innerHTML = (document.getElementById("SLveVIPid").value) * (document.getElementById("giaveVIP").innerHTML);
 var tenMucTongTienVIP = document.getElementById('SLveVIPid').value ;
 document.getElementById("tongTienVIPId").innerHTML = (document.getElementById("SLveVIPid").value) * (document.getElementById("giaveVIP").innerHTML);
}

</Script>
</html>
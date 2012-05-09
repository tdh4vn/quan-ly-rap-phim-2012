<%@page import="org.apache.catalina.Session"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
		function message()
		{
			alert("Ghế này không sử dụng được !");
		}
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<%@page import="java.util.*" %>
<%Connection connection = null;
	String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
    String userName = "sa";
    String password = "123";
    String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
   	Statement st = null;  
   

       try {
            Class.forName(JDBC_Driver);
            // connection
            connection = DriverManager.getConnection(data, userName, password);        
         	st = connection.createStatement();	     			
			
        } catch (ClassNotFoundException e) {
           System.out.println("Class not found");
           e.printStackTrace();
        } catch (SQLException se) {
           System.out.println("SQL Error");        	
           se.printStackTrace();
        } %>
<title> Giao dịch </title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="MenuAdmin.jsp" %>

<div id="ourCompany-bg">
<div id="ourCompany-part" >
<form action="Giaodich.jsp" method="post">
<table width="100%">
<%String maPhong1 = request.getParameter("maPhong"); 
System.out.println("ma phong hien tai la==="+maPhong1);

String ngaychieu = ""+session.getAttribute("ngayChieuAttribute");
System.out.println("ngay chieu bay gio la==="+ngaychieu);

String maXuatChieu1 = request.getParameter("maXuatChieu"); 
session.setAttribute("xc",maXuatChieu1);



String maLichChieu1 = request.getParameter("maLichChieu"); 
session.setAttribute("lc",maLichChieu1);


String gioChieu1 = request.getParameter ("gioChieu"); 
System.out.println("gio chieu la==="+gioChieu1);

String phutChieu1 = request.getParameter ("phutChieu"); 
System.out.println("gio chieu la==="+phutChieu1);

session.setAttribute("gc",gioChieu1);
System.out.println ("dddd" + session.getAttribute("gc"));

session.setAttribute("pc",phutChieu1);
System.out.println ("eeeeeeee" + session.getAttribute("pc"));
%>
<tr>
<td><input type="hidden" name="maPhong" value="<%=maPhong1%>" />
<input type="hidden" name="ngayChieu" value="<%=session.getAttribute("ngayChieuAttribute")%>" />
<input type="hidden" name="tenPhimChieu" value="<%=session.getAttribute("tenPhim3")%>" />
<input type="hidden" name="gioChieu" value="<%=gioChieu1%>" />
<input type="hidden" name="phutChieu" value="<%=phutChieu1%>" />

</td>
</tr>
<tr align="center"><td colspan="17"> <h2 class="ourCompany-hdr">Giao dịch</h2></td></tr>
<tr><td colspan="5" align="left"><font face="Arial" color ="333333"> Mã phòng:</font>  
<font color ="993300"><%=maPhong1%></font></td> 
<td colspan="5"> <font face="Arial" color ="333333">Ngày chiếu:</font>
<font color ="993300"><%=session.getAttribute("ngayChieuAttribute")%></font> </td>
<td colspan="5"> <font face="Arial" color ="333333">Tên phim:</font>
<font color ="993300"><%=session.getAttribute("tenPhim3")%></font></td>
<td colspan="5"> <font face="Arial" color ="333333">Xuất chiếu:</font>
<font color ="993300"><%=gioChieu1%>h<%=phutChieu1%></font></td>
</tr>
<tr> <td colspan="10"> 
<fieldset>
<legend> <font face="Arial " color="black" size="5">Hướng dẫn</font></legend>
<table width = 100%>
<tr > <td width = "10px" bgcolor = "CCCCCC"></td> 
<td width = "90px">  <font face="Arial" color ="333333"> Ghế chưa bán </font> </td>
<td width = "10px" bgcolor="990000"></td> 
<td width = "90px">  <font face="Arial" color ="333333">Ghế đã bán </font> </td>
<td width = "10px" bgcolor="666666"></td> 
<td width = "90px">  <font face="Arial" color ="333333">Ghế hỏng </font></td>
</tr>
</table>
</fieldset>
</td>
<% String sql3 = "Select sum (SoLuongVeThuong) from DanhSachDatVeOnline inner join LichChieu on LichChieu.MaLichChieu= DanhSachDatVeOnline.MaLichChieu and LichChieu.NgayChieu = '"+ngaychieu+"' and LichChieu.MaPhong = '"+maPhong1+"'inner join XuatChieu on XuatChieu.MaXuatChieu = LichChieu.MaXuatChieu and XuatChieu.GioChieu = '"+gioChieu1+"' and XuatChieu.PhutChieu = '"+phutChieu1+"'";
ResultSet rs3 =st.executeQuery(sql3); 

while(rs3.next()){
%>
<td> </td> 
<td colspan ="7">
<fieldset>
<legend> <font face="Arial " color="black" size="5">Thống kê </font></legend>
<table>
<tr>
  <td width ="10px"> </td> <td>  <font face=" Arial " color ="333333"> Số lượng vé thường đã đặt online còn lại :</font> 
  <font color ="993300"><%=rs3.getString(1)%></font> </tr>
  
  <%} %>


 <tr> <td width ="20px"> </td>
 <td>
  <%String sql4 = "Select sum (SoLuongVeVip) from DanhSachDatVeOnline inner join LichChieu on LichChieu.MaLichChieu= DanhSachDatVeOnline.MaLichChieu and LichChieu.NgayChieu = '"+ngaychieu+"' and LichChieu.MaPhong = '"+maPhong1+"'inner join XuatChieu on XuatChieu.MaXuatChieu = LichChieu.MaXuatChieu and XuatChieu.GioChieu = '"+gioChieu1+"' and XuatChieu.PhutChieu = '"+phutChieu1+"'";
ResultSet rs4 =st.executeQuery(sql4); 
while(rs4.next()){
%>
   <font face=" Arial " color ="333333">Số lượng vé VIP đã đặt online còn lại : </font> 
    <font color ="993300"><%=rs4.getString(1)%> </font>
  <%} %>
  </td> </tr>
  <tr> <td width ="20px"> </td>
  <td>
  <%
  String sql10="Select count (SoGhe) from Ghe_LichChieu where MaLichChieu = '"+session.getAttribute("lc")+"' and MaXuatChieu = '"+session.getAttribute("xc")+"' and MaPhong ='"+maPhong1+"' and TrangThaiGhe = 'Chưa bán'";
  ResultSet rs10 =st.executeQuery(sql10); 
 while(rs10.next()){ 
   %>
   <font face=" Arial " color ="333333">Số lượng vé đã bán :</font> 
   <font color ="993300"><%=rs10.getString(1)%></font>
  <%} %>
  </td> </tr>
  <tr> <td width ="20px"> </td>
  <td>
  <%
  String sql11="Select count (SoGhe) from Ghe_LichChieu where MaLichChieu = '"+session.getAttribute("lc")+"' and MaXuatChieu = '"+session.getAttribute("xc")+"' and MaPhong ='"+maPhong1+"' and TrangThaiGhe = 'Đã bán'";
  ResultSet rs11 =st.executeQuery(sql11); 
 while(rs11.next()){ 
   %>
   <font face=" Arial " color ="333333">Số lượng vé chưa bán : </font> 
   <font color ="993300"><%=rs11.getString(1)%></font>
  <%} %>
  </td>
</tr>
</table>
</fieldset>
</td>
<%  

session.setAttribute("mp1",maPhong1);
System.out.println ("bbbbb" + session.getAttribute("mp1"));

session.setAttribute("nc",ngaychieu);
System.out.println ("aaaaa" + session.getAttribute("nc"));

session.setAttribute("gc",gioChieu1);
System.out.println ("dddd" + session.getAttribute("gc"));

session.setAttribute("pc",phutChieu1);
System.out.println ("eeeeeeee" + session.getAttribute("pc"));

    String sql1="select Ghe_LichChieu.SoGhe, LichChieu.MaPhong, MaLoaiGhe, MaTinhTrang from Ghe_LichChieu join LichChieu on LichChieu.MaLichChieu=Ghe_LichChieu.MaLichChieu join Ghe on Ghe_LichChieu.SoGhe=Ghe.SoGhe and LichChieu.MaPhong= Ghe.MaPhong where LichChieu.MaPhong ='"+maPhong1+"' and Ghe_LichChieu.MaLichChieu ='"+maLichChieu1+"'and Ghe_LichChieu.MaXuatChieu ='"+maXuatChieu1+"'";
    System.out.println("k an sua chua dau" +sql1);
    HashMap<String, String> map = new HashMap<String, String>();
	ArrayList<String> soGheArray=new ArrayList<String>();
	ArrayList<String> trangThaiGheArray=new ArrayList<String>();
	//st = connection.createStatement();
	ResultSet rs1 =st.executeQuery(sql1);
	while(rs1.next()){
		map.put(rs1.getString(1),rs1.getString(3)+rs1.getString(4));
		soGheArray.add(rs1.getString(1));
		trangThaiGheArray.add(rs1.getString(4));		
	}
	rs1.close();
	String sql5=null;
 %>
 <%
 	String sql2="SELECT [SoLuongDayGheToiDa],[SoLuongGheToiDaOMoiDay] FROM [Quanlybanvephim].[dbo].[Phong] inner join [Quanlybanvephim].[dbo].[LichChieu] on LichChieu.MaPhong = Phong.MaPhong where LichChieu.MaPhong='"+maPhong1+"'";
 	ResultSet rs2 =st.executeQuery(sql2);
 	
 	ArrayList<Integer> soLuongArray=new ArrayList<Integer>();
 	while(rs2.next()){
 		
 	 	soLuongArray.add(Integer.parseInt(rs2.getString(1)));
 	 	soLuongArray.add(Integer.parseInt(rs2.getString(2)));
 	}rs2.close(); 
 	
 	%>
 
<% char temp = 'A';%>
</tr></table>
<table width =100%>
<tr bgcolor ="333333">
<td ></td>
<%for(int k=1;k<=soLuongArray.get(1);k++) {%>
	<td><%=k %></td>
	<%} %>
</tr>

<%for(int i=0;i<soLuongArray.get(0);i++){
 %>
	 <tr>
		 <td width="10px" bgcolor ="333333"><%=temp%></td>
	 	<%for(int j=1;j<=soLuongArray.get(0);j++){
	 	%>
	 	<%
	 		String sg=Character.toString(temp)+Integer.toString(j);
	 		
	 		sql5="SELECT [SoGhe],[TrangThaiGhe] FROM [Quanlybanvephim].[dbo].[Ghe_LichChieu], [LichChieu] where Ghe_LichChieu.MaPhong='"+maPhong1+"' and [SoGhe]= '"+sg+"' and Ghe_LichChieu.MaLichChieu = '"+session.getAttribute("lc")+"' and Ghe_LichChieu.MaXuatChieu ='"+session.getAttribute("xc")+"'";
	 		ResultSet rs5=st.executeQuery(sql5);
	 	
	 		if(rs5.next()){
	 			if("Chưa bán".equals(rs5.getString(2))){
	 		%>
	 			<td align = "center"  bgcolor = "CCCCCC"><a href="Thongtinghe.jsp?mp2=<%=session.getAttribute("mp1")%>&ngayc=<%=session.getAttribute("nc")%>&tenp=<%=session.getAttribute("tp")%>&gioc=<%=session.getAttribute("gc")%>&phutc=<%=session.getAttribute("pc")%>&lChieu=<%=session.getAttribute("lc")%>&soGhe=<%=temp%><%=j%>"><%=map.get("" + temp + j)%>
	 	</a></td>
	 	<%	}else if ("Hỏng".equals(rs5.getString(2))){
	 	%>
	 		<td align = "center"  bgcolor = "666666"><a href onClick="message()"><%=map.get("" + temp + j)%>
		 	</a></td>
		
	 	<%}
	 	else {%>
<td align = "center"  bgcolor = "990000"> <a href="Thongtinghe.jsp?mp2=<%=session.getAttribute("mp1")%>&ngayc=<%=session.getAttribute("ngayChieuAttribute")%>&tenp=<%=session.getAttribute("tenPhim3")%>&gioc=<%=session.getAttribute("gc")%>&lChieu=<%=session.getAttribute("lc")%>&phutc=<%=session.getAttribute("pc")%>&soGhe=<%=temp%><%=j%>"><%=map.get("" + temp + j)%>
		 	</a></td>
	 	<% }}rs5.close();
	 	//}
	 	
	 } %>
	 <%
	 temp++;
	 } %>
	 </tr>
<%
connection.close();
%> 

<tr> <td colspan = 15> </td> </tr>

<tr>
<td colspan = 4> <font face=" Arial " color ="333333"><%=session.getAttribute("tenDangNhap")%> </font></td>

<td colspan = 12 align = center> <input type="button" value = " Xuất vé"></input> </td>
</tr>

</table>
</form>
</div>
</div>
<%@include file="FooterAdmin.jsp" %>
</body>
</html>
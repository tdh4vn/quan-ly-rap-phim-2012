<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.util.*" %>
<title>Quản lý phim</title>
</head>

<Script>
function show_confirm()
{
return confirm("Bạn có chắc chắn muốn xoá không ?");
}
</Script>
<body >
 <!--Header Background Part Starts -->
<%@include file="Header.jsp" %>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%@include file="MenuAdmin.jsp" %>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg">
	<!--Our Company Part Starts -->
	<div id="ourCompany-part" >
<form action="Quanlyphim.jsp" method="post">
 <table  width = "800px" > 
<tr>
<td align="center"> <h2 class="ourCompany-hdr">Quản lý phim </h2> </td>
<td align = "center">
<br><br><br><br>
<p align = "right">  
<input type ="text" name ="txttimkiem">
<input type = "submit" name ="timkiem" value ="Tìm kiếm"></p>
<br>
</tr>
    <tr><td colspan = "9">
        <br>
<table border ="1" width = "100%" align = "center">
<tr  bgcolor ="333333" style="color:white">
<td align="center">Mã phim</td>
<td align="center">Tên phim</td>
<td align="center">Dạng phim</td>
<td align="center">Loại phim</td>
<td align="center">Độ dài giờ</td>
<td align="center">Độ dài phút</td>
<td align="center">Quốc gia</td>
<td align="center">Ngày bắt đầu chiếu</td>
<td align="center">Ngày kết thúc chiếu</td>
<td align="center">Ảnh đại diện</td>
<td align="center">Ghi chú</td>
<td align="center">Mô tả phim</td>
<td></td>
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
        String tk;
        String sql1,sql,sql2,sql3;  
        ResultSet rs ;
        System.out.println("vao di"); 
        String timkiem = request.getParameter("timkiem");
        System.out.println("vao di===="+timkiem); 
        String txttimkiem=request.getParameter("txttimkiem");
        if ("TÃ¬m kiáº¿m".equals(timkiem)) {
        	System.out.println("vao di tim kiem"); 
        sql = "select [MaPhim],[TenPhim],Phim.[MaDangPhim],Phim.[MaLoaiPhim],[DoDaiGio],[DoDaiPhut],Phim.[MaQuocGia],[NgayBatDau],[NgayKetThuc],[AnhDaiDien],[GhiChu],[MoTaPhim]from Phim where  MaPhim like '%"+txttimkiem+"%' or TenPhim  like '%"+txttimkiem+"%' or MaDangPhim like '%"+txttimkiem+"%'or MaLoaiPhim like '%"+txttimkiem+"%'  ";
        System.out.println("tim kiem=============="+sql); 
        
        rs = st.executeQuery(sql);
        
        while (rs.next()) {
           %>
 <tr class="ourCompany-list">
<td><font color="black"><%out.println(rs.getString(1));%></font>
   <input type="hidden" size="2%" name="MaPhim" value="<%out.print(rs.getString(1));%>"/>
</td>
<td><input type="text" name="TenPhim" size="10%" value="<%out.print(rs.getString(2));%>"/></td>
<td><input type="text" name="MaDangPhim" size="10%" value="<%out.print(rs.getString(3));%>"/></td>
<td><input type="text" name="MaLoaiPhim" size="10%" value="<%out.print(rs.getString(4));%>"/></td>
<td><input type="text" name="DoDaiGio" size="10%" value="<%out.print(rs.getString(5));%>"/></td>
<td><input type="text" name="DoDaiPhut" size="10%" value="<%out.print(rs.getString(6));%>"/></td>
<td><input type="text" name="MaQuocGia" size="10%" value="<%out.print(rs.getString(7));%>"/></td>
<td><input type="text" name="NgayBatDau" size="10%" value="<%out.print(rs.getString(8));%>"/></td>
<td><input type="text" name="NgayKetThuc" size="10%" value="<%out.print(rs.getString(9));%>"/></td>
<td><input type="file" name="AnhDaiDien" size="10%" value="<%out.print(rs.getString(10));%>"/></td>
<td><input type="text" name="GhiChu" size="10%" value="<%out.print(rs.getString(11));%>"/></td>
<td><input type="text" name="MoTaPhim" size="10%" value="<%out.print(rs.getString(12));%>"/></td>
<td><a href="Xoa.jsp?MaPhim=<%=rs.getString(1)%>" onClick="return show_confirm()">Xoá</a></td>
<%} %>
</tr>
<tr>


<td colspan="7" align="right"><input type="button" value ="Thêm phim" onclick="javascript:window.location='Themphim.jsp';"></td>



<td colspan="8" align="left">
   <input type="submit" name="nutCapNhat" value ="Cập nhật" ></td>
   </tr>
      <%
      
        }

   else{
            	System.out.println(" vao toi day chua mi ");
            	 sql = "SELECT [MaPhim],[TenPhim],[MaDangPhim],[MaLoaiPhim] ,[DoDaiGio],[DoDaiPhut] ,[MaQuocGia],[NgayBatDau],[NgayKetThuc],[AnhDaiDien],[GhiChu],[MoTaPhim]FROM [Quanlybanvephim].[dbo].[Phim]";
                 rs = st.executeQuery(sql);
          while (rs.next()) {
         %>
         <tr class="ourCompany-list">
        <td><%out.println(rs.getString(1));%>
           <input type="hidden" name="MaPhim" size="20px" value="<%out.print(rs.getString(1));%>"/>
        </td>
        <td><input type="text" name="TenPhim" size="10px" value="<%out.print(rs.getString(2));%>"/></td>
        <td><input type="text" name="MaDangPhim" size="10px" value="<%out.print(rs.getString(3));%>"/></td>
        <td><input type="text" name="MaLoaiPhim" size="10px" value="<%out.print(rs.getString(4));%>"/></td>
        <td><input type="text" name="DoDaiGio" size="10px" value="<%out.print(rs.getString(5));%>"/></td>
        <td><input type="text" name="DoDaiPhut" size="10px" value="<%out.print(rs.getString(6));%>"/></td>
        <td><input type="text" name="MaQuocGia" size="10px" value="<%out.print(rs.getString(7));%>"/></td>
        <td><input type="text" name="NgayBatDau" size="10px" value="<%out.print(rs.getString(8));%>"/></td>
        <td><input type="text" name="NgayKetThuc" size="10px" value="<%out.print(rs.getString(9));%>"/></td>
        <td><input type="file" name="AnhDaiDien" size="10px" value="<%out.print(rs.getString(10));%>"/></td>
        <td><input type="text" name="GhiChu" size="10px" value="<%out.print(rs.getString(11));%>"/></td>
        <td><input type="text" name="MoTaPhim" size="10px" value="<%out.print(rs.getString(12));%>"/></td>
        <td><a href="Xoa.jsp?MaPhim=<%=rs.getString(1)%>" onClick="return show_confirm()">Xoá</a></td>
        <%} %>
        </tr>
        <tr>
   <%
   String[] maphimArray = request.getParameterValues("MaPhim");
   String[] tenphimArray = request.getParameterValues("TenPhim");
   String[] madangphimArray = request.getParameterValues("MaDangPhim");
   String[] maloaiphimArray = request.getParameterValues("MaLoaiPhim");
   String [] dodaigioArray = request.getParameterValues("DoDaiGio");
   String[] dodaiphutArray = request.getParameterValues("DoDaiPhut");
   String[] maqgArray = request.getParameterValues("MaQuocGia");
   String[]nbd = request.getParameterValues("NgayBatDau");
   String[] nkt = request.getParameterValues("NgayKetThuc");
   String[] anhdaidienArray = request.getParameterValues("AnhDaiDien");
   String[] ghichuArray = request.getParameterValues("GhiChu");
   String[] motaphimArray = request.getParameterValues("MoTaPhim");
    sql3 = "select convert(varchar(50),NgayBatDau,103)as nbd from Phim";
    st.executeQuery(sql3);
     sql2 = "select convert(varchar(50),NgayKetThuc,103)as nkt from Phim";
    st.executeQuery(sql2);
    
    tk=request.getParameter("nutCapNhat");
    if("Cáº­p nháº­t".equals(tk))
    {
       int ok = 0,gio=0,phut=0;
       for (int i=0 ;i<= maphimArray.length-1;i++)
       {
             System.out.println("Ma phim================"+maphimArray[i]);
          sql1 = "UPDATE [Quanlybanvephim].[dbo].[Phim]  SET [TenPhim] ='"+tenphimArray[i]+"',[MaDangPhim]='"+madangphimArray[i]+"',[MaLoaiPhim] ='"+maloaiphimArray[i]+"',[DoDaiGio] ="+Integer.parseInt(dodaigioArray[i])+" ,[DoDaiPhut] ="+Integer.parseInt(dodaiphutArray[i])+",[MaQuocGia] ='"+maqgArray[i]+"',[NgayBatDau]='"+nbd[i]+"',[NgayKetThuc]='"+nkt[i]+"',[GhiChu]='"+ghichuArray[i]+"',[MoTaPhim]='"+motaphimArray[i]+"'WHERE [MaPhim] = '"+maphimArray[i]+"'";
          System.out.println("sql========="+sql1);
         ok = st.executeUpdate(sql1);
         System.out.println(sql1);
         System.out.println("Da cap nhat dong so = " + (i + 1) + "ket qua la = " + 1);
       }
      
    }
       
   %>
        
        <td colspan="7" align="right"><input type="button" value ="Thêm phim" onclick="javascript:window.location='Themphim.jsp';">
       
       
        </td>
        <td colspan="8" align="left">
        
           <input type="submit" name="nutCapNhat" value ="Cập nhật"></td>
                  
          </tr>
        </table>
            
     <%
   
   } %>       
</tr>
</table>
<br>
<br></form>
</div>
</div>
<%@include file="FooterAdmin.jsp" %>

</body>
</html>

 
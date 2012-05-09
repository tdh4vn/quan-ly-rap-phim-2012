<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Xem phim tất cả</title>
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<%@page import="java.util.*"%>
</head>
<body>
<%@include file="Header.jsp"%>
<%@include file="MenuUser.jsp"%>
<div id="ourCompany-bg" align="center">
<form action="Xemphimtatca2.jsp" method="post"">
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
if (hang.next())
{
sohang = hang.getInt(1);
}

//ở đây biến phân trang dùng cho URL là [B]p[/B]
int p = 0;
String sob = request.getParameter("p");
if (sob != null ) {
if (sob.equals("0"))
{
p = 0;
}
else
{
p = Integer.parseInt(sob) - 1;

}
}

int p_one = 2;

//số record
p_one=p_one+p+1;
String sql,sql1,sql2,sql8;
int dem1,dem,dem2,dem3;
ResultSet rs8;
ResultSet rs9;
%>
<table border="0" width="70% ">
	<%
  
  String theloai = request.getParameter("theloai");
  String quocgia = request.getParameter("quocgia");
  String tenphim = request.getParameter("tenphim");
  int x = 1;
  if ("TÃ¬m kiáº¿m".equals(request.getParameter("bttimkiem"))) {
	  String sel ="SELECT MaPhim FROM (SELECT ROW_NUMBER() OVER (ORDER BY Phim.MaPhim DESC)AS Row, MaPhim FROM Phim)AS LogWithRowNumbers WHERE Row >= "+p+" AND Row < "+p_one+"";
	  rs8= st.executeQuery(sel);
	    
   sql8 ="select MaPhim,AnhDaiDien,MoTaPhim,TenPhim from Phim,LoaiPhim,QuocGia where ((Phim.MaLoaiPhim = LoaiPhim.MaLoaiPhim and Phim.MaQuocGia=QuocGia.MaQuocGia)and( Phim.MaQuocGia like '"+ quocgia + "' or Phim.MaLoaiPhim like '"+ theloai + "'or TenPhim like '"+ tenphim + "' ))";
   System.out.println("sql===================="+sql8);
   rs8 = st.executeQuery(sql8);
   while (rs8.next())
   { 
       %>
	<tr class="ourCompany-list">
		<td width=300 align="center"><a
			href="Chitietphim.jsp?mphim=<%=rs8.getString(1)%>" target="_blank">
		<img src="<%out.println(rs8.getString(2)); %>" width="300"
			height="450"></img> </a></td>
		<td colspan=3 align="left"><font face="Arial " color="black"
			size="5"> <%out.println(rs8.getString(4));%> </font> <br>
		<%out.println(rs8.getString(3));%> <br>
		<a href=" Datve.jsp">Đặt vé </a></td>
		<% }%>
		<td width=400><br>
		<br>
		<br>
		<fieldset><legend> <font face="Arial "
			color="black" size="5">Tìm kiếm </font></legend>
		<div align="center">
		<table>
			<tr class="ourCompany-list">
				<td align="left">Quốc gia:</td>
				<td><select name="quocgia" style="width: 150px; height: 18px;">
					<%
                           
                         sql2 = "SELECT [MaQuocGia],[TenQuocGia]FROM [Quanlybanvephim].[dbo].[QuocGia] ";
                             ResultSet rs2 = st.executeQuery(sql2);
                             ResultSetMetaData rsmd2 = rs2.getMetaData();
                             %>
					<option value="">Chọn</option>
					<%
                             dem2=rsmd2.getColumnCount();
                             while(rs2.next())
                                {
                                  for(int i=1; i<dem2;i++)
                               {%>
					<option value="<%=rs2.getString(1) %>"><%=rs2.getString(2) %></option>
					<%}
                            }%>
				</select></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Thể loại:</td>
				<td><select name="theloai" style="width: 150px; height: 18px;">
					<%
                           
                       sql1 = "SELECT [MaLoaiPhim],[TenLoaiPhim]FROM [Quanlybanvephim].[dbo].[LoaiPhim] ";
                             ResultSet rs = st.executeQuery(sql1);
                             ResultSetMetaData rsmd1 = rs.getMetaData();
                              dem1=rsmd1.getColumnCount();
                             %>
					<option value="">Chọn</option>
					<%
                             
                             while(rs.next())
                                {
                                  for(int i=1; i<dem1;i++)
                               {%>
					<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
					<%}
                            }%>
				</select></td>
			</tr>

			<tr class="ourCompany-list">
				<td align="left">Tên phim:</td>
				<td><input type="text" width=150 name="tenphim"></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="right">
				<center><input type="submit" name="bttimkiem"
					value="tim kiem"></center>
				</td>
			</tr>

		</table>
		</div>
		</fieldset>
		<br>
		<br>
		<br>

		<%} 
                
                
 else  { 
	 String sel ="SELECT MaPhim,[AnhDaiDien],[MoTaPhim],TenPhim FROM (SELECT ROW_NUMBER() OVER (ORDER BY Phim.MaPhim DESC)AS Row, MaPhim,[AnhDaiDien],[MoTaPhim],TenPhim FROM Phim)AS LogWithRowNumbers WHERE Row >= "+p+" AND Row < "+p_one+"";
	    System.out.println("figyfig================"+p_one);
	    System.out.println("fp================"+p);
	    pt= st.executeQuery(sel);
	    System.out.println("fp================"+sel);

	    while(pt.next())
	    {
	        %>
		</td>
	</tr>
	<tr class="ourCompany-list">
		<td width=300 align="center"><a
			href="Chitietphim.jsp?mphim=<%=pt.getString(1)%>" target="_blank">
		<img src="<%out.println(pt.getString(2)); %>" width="300" height="450"></img>
		</a></td>
		<td colspan=3 align="left"><font face="Arial " color="black"
			size="5"> <%out.println(pt.getString(4));%> </font> <br>
		<%out.println(pt.getString(3));%> <br>
		<a href=" Datve.jsp">Đặt vé </a></td>

		<%} %>
		<td width=400>

		<fieldset><legend> <font face="Arial "
			color="black" size="5">Tìm kiếm </font></legend>
		<div align="center">
		<table>
			<tr class="ourCompany-list">
				<td align="left">Quốc gia:</td>
				<td><select name="quocgia" style="width: 150px; height: 18px;">
					<%
                           
                         sql2 = "SELECT [MaQuocGia],[TenQuocGia]FROM [Quanlybanvephim].[dbo].[QuocGia] ";
                             ResultSet rs2 = st.executeQuery(sql2);
                             ResultSetMetaData rsmd2 = rs2.getMetaData();
                             %>
					<option value="">Chọn</option>
					<%
                             dem2=rsmd2.getColumnCount();
                             while(rs2.next())
                                {
                                  for(int i=1; i<dem2;i++)
                               {%>
					<option value="<%=rs2.getString(1) %>"><%=rs2.getString(2) %></option>
					<%}
                            }%>
				</select></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Thể loại:</td>
				<td><select name="theloai" style="width: 150px; height: 18px;">
					<%
                           
                       sql1 = "SELECT [MaLoaiPhim],[TenLoaiPhim]FROM [Quanlybanvephim].[dbo].[LoaiPhim] ";
                             ResultSet rs = st.executeQuery(sql1);
                             ResultSetMetaData rsmd1 = rs.getMetaData();
                              dem1=rsmd1.getColumnCount();
                             %>
					<option value="">Chọn</option>
					<%
                             
                             while(rs.next())
                                {
                                  for(int i=1; i<dem1;i++)
                               {%>
					<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
					<%}
                            }%>
				</select></td>
			</tr>

			<tr class="ourCompany-list">
				<td align="left">Tên phim:</td>
				<td><input type="text" width=150 name="tenphim"></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="right">
				<center><input type="submit" name="bttimkiem"
					value="Tìm kiếm"></center>
				</td>
			</tr>

		</table>
		</div>
		</fieldset>

		<%} %>
		<div align="right">
		<%
    int i=0;
    int n= sohang;
    int j=1; int m= p_one;
    for (i=0;i<n;i++)  
     {
       if (i%m==0)
         {  if (p >= 0 )
               {
                if   (  p+1== i ) 
                   {
                     out.print("<a href=?p="+ i + "><b>" + j +  "</b></a> ");
                   }    
               else
                 { 
                    out.print("<a href=?p="+ i + ">"+ j +"</a> ");
                  }
           }
     
     j++;
        }           
     }
    %>
		</div>
		</td>

	</tr>

</table>
<br>
<br>
<br>
<br>
</form>
</div>
<%@include file="Footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%

Connection connection = null;
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
<title>Quản lý ghế</title>
</head>
<body>




<%
 	String maphong = request.getParameter("MaPhong");
 	String sql2="SELECT [SoLuongDayGheToiDa],[SoLuongGheToiDaOMoiDay] FROM [Quanlybanvephim].[dbo].[Phong] where MaPhong='"+ maphong + "'";
 	ResultSet rs2 =st.executeQuery(sql2);
 	
 	while(rs2.next()){
 		int SoLuongDayGheToiDa=Integer.parseInt(rs2.getString(1));
 	 	int SoLuongGheToiDaOMoiDay=Integer.parseInt(rs2.getString(2));
 	 	System.out.println(SoLuongDayGheToiDa);
 	 	System.out.println(SoLuongGheToiDaOMoiDay);

 
 	char temp = 'A';
	char soSach='K';
	for(int i=1;i<=SoLuongDayGheToiDa;i++){	 
	 	for(int j=1;j<=SoLuongGheToiDaOMoiDay;j++){ 	
	 	
	 	 //String ghe=request.getParameter(Character.toString(temp)+Integer.toString(j)); 
	 	 //System.out.println("ghe thu "+ temp + j + ghe);
	 	// String MaLoaiGhe=ghe.charAt(1);
			if(temp<=soSach){
				String sql3="INSERT INTO [Quanlybanvephim].[dbo].[Ghe]([SoGhe],[MaPhong],[MaLoaiGhe],[MaTinhTrang])VALUES('"+temp + j+"','"+ maphong + "','T','E')";
			 	st.executeUpdate(sql3);
			}
			else
			{
				String sql3="INSERT INTO [Quanlybanvephim].[dbo].[Ghe]([SoGhe],[MaPhong],[MaLoaiGhe],[MaTinhTrang])VALUES('"+temp + j+"','"+ maphong + "','V','E')";
			 	st.executeUpdate(sql3);
			}
	 	} 	
 
   temp++;
   
   }
 
}
	
%>



</body>
</html>
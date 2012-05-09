<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Giao Dịch </title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script>
function chuyenManHinh(path)
{parent.parent.location = path;
    }
</script>
</head>

<body>
<div id="ourCompany-bg"><!--Our Company Part Starts -->
<div id="ourCompany-part1">
<form action="Giaodich.jsp" >
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
<table>
    <tr>
        <td>
        <fieldset><legend> <font face="Arial "
            color="black" size="5"> Xuất chiếu </font></legend> <%
String maPhim = request.getParameter("MaPhim");
System.out.print("xuat ra ma phim ne" +maPhim);
session.setAttribute ("maPhim3", maPhim);
System.out.print("Ten phim la cai chi ri, aaa ===" +session.getAttribute ("maPhim3"));

String tenPhim = request.getParameter("TenPhim");
System.out.println("xuat ra ten phim ne" +tenPhim);
session.setAttribute("tenphimAttribute" , tenPhim);
System.out.print("Ten phim la ===" +session.getAttribute("tenphimAttribute"));

ArrayList<Date> dateList=new ArrayList<Date>(); 
String sql1 = "Select distinct NgayChieu from LichChieu, XuatChieu where LichChieu.MaXuatChieu = XuatChieu.MaXuatChieu and XuatChieu.MaPhim = '"+maPhim+"' ";
ResultSet rs1 = st.executeQuery(sql1);
dateList.size();
while(rs1.next()){
    dateList.add(rs1.getDate(1));
    System.out.println(dateList.size());
    System.out.println("ngay thu ====="+dateList);
    
}
rs1.close();


%>

        <table width=100>

            <%
String sql2 = null;
for(int i=0;i<dateList.size();i++){ %>
            <tr>
                <td colspan=3><%=dateList.get(i)%></td>
            </tr>
            <% 
String ngayChieu2 = ""+dateList.get(i);
System.out.println ("ngay dien khung, ra di mi ====="+ngayChieu2);
session.setAttribute("ngayChieuAttribute" , ngayChieu2);
System.out.print("Ngay chieu la ===" +session.getAttribute("ngayChieuAttribute")); 
sql2 = "Select GioChieu, PhutChieu from  LichChieu, XuatChieu where  LichChieu.MaXuatChieu = XuatChieu.MaXuatChieu and XuatChieu.MaPhim = '"+maPhim+"' and LichChieu.NgayChieu = '"+dateList.get(i)+"' ";
ResultSet rs2=st.executeQuery(sql2);
 
while(rs2.next()){%>

            <tr class="ourCompany-list1">

                <td align=center><a href="Datve2.jsp?<%=maPhim%>&<%=ngayChieu2%>&<%=tenPhim%>&gioChieu=<%=rs2.getString(1)%>&phutChieu=<%=rs2.getString(2)%>">
                <font face=" Arial " color="333333"><%=rs2.getString(1)%>h<%=rs2.getString(2)%></font></a>
                </td>

            </tr>

            <%}

%>



            <%} %>
        </table>
        </fieldset>
        </td>
    </tr>
    <tr>
        <td><font color="#951509" face="Arial Narrow" size="3">Quý
        khách vui lòng click vào xuất chiếu để đặt vé</font></td>
    </tr>
</table>
</form>
</div>
</div>
</body>
</html>
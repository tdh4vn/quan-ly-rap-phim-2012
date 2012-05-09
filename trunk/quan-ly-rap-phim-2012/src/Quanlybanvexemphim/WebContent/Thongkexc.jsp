<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--@page import="javax.servlet.http.*"--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Conver.*"%>
<script src="datetimepicker_css.js"></script>
<script type="text/javascript">
	function cancelSubmit() {
	    document.UpdateScheduleForm.action = "ListSchedule.jsp";
		return true;
	}
	function updateSubmit() {
		var ONE_DAY = 1000 * 60 * 60 * 24;
		var currentDate = new Date;

		var expectedStartDate = document.getElementById("expectedStartDate");
		var dateAdvtoClient =  document.getElementById("dateAdvtoClient");
		var actualStartDate = document.getElementById("actualStartDate");
	
		var dayExpectedStartDate = expectedStartDate.value.substring(8,10);
		var monthExpectedStartDate = expectedStartDate.value.substring(5,7);
		var yearExpectedStartDate = expectedStartDate.value.substring(0,4);

		var dayActualStartDate = actualStartDate.value.substring(8,10);
		var monthActualStartDate = actualStartDate.value.substring(5,7);
		var yearActualStartDate = actualStartDate.value.substring(0,4);

		var formatExpectedStartDate = monthExpectedStartDate + "/" + dayExpectedStartDate + "/" + yearExpectedStartDate;
		
        var formarActualStartDate = monthActualStartDate + "/" + dayActualStartDate + "/" + yearActualStartDate;
    
       
        var parseExpectedStartDate = Date.parse(formatExpectedStartDate);
        var parseActualStartDate = Date.parse(formarActualStartDate);

        var convertExpectedStartDateToJavaDate = new Date(parseExpectedStartDate);
        var convertActualStartDate =  new Date(parseActualStartDate);

		var getTimeExpectedStartDateJavaDate = convertExpectedStartDateToJavaDate.getTime();
		var getTimeActualStartDate = convertActualStartDate.getTime();
		var getTimeCurrentDate = currentDate.getTime();

		var actualDateSubtractExpectedStartDate = getTimeActualStartDate - getTimeExpectedStartDateJavaDate;
		var actualDateSubtractCurrentDate = getTimeActualStartDate - getTimeCurrentDate;

		var resultOfActualDateSubtractExpectedStartDate = Math.round(actualDateSubtractExpectedStartDate/ONE_DAY);
		var resultOfActualDateSubtractCurrentDate = Math.round(actualDateSubtractCurrentDate/ONE_DAY);
		if(resultOfActualDateSubtractExpectedStartDate < 0 || resultOfActualDateSubtractCurrentDate>0 || resultOfActualDateSubtractExpectedStartDate=="" || resultOfActualDateSubtractExpectedStartDate==null){
			alert("Actual Start Date Invalid.");
			return false;
		}
		if(dateAdvtoClient.value == null || dateAdvtoClient.value==""){
			alert("Vendor Received Date must be entered.");
			return false;
		}else{
		document.UpdateScheduleForm.action = "updateSchedule.do";
		return true;
		}
	}
	function terminatedSubmit() {
		document.UpdateScheduleForm.action = "terminated.do";
		confirm("");
		return true;
	}
	function changeDate() {
		
		var contractNumber = "<%=request.getAttribute("contractNo")%>";
		document.UpdateScheduleForm.action = "infoSchedule.do?contractNumber="+contractNumber;
		document.UpdateScheduleForm.submit();
	}
	function changeActualDate(){
	    var ONE_DAY = 1000 * 60 * 60 * 24;

	    var vendorTurnaroundTime = document.getElementById("vendorTurnaroundTime");
		var stringActualStartDate = document.getElementById("actualStartDate");
		var stringActualEndDate = document.getElementById("actualEndDate");
		
		var dayActualEndDate = stringActualEndDate.value.substring(8,10); 
		var monthActualEndDate = stringActualEndDate.value.substring(5,7);
		var yearActualEndDate = stringActualEndDate.value.substring(0,4);
		
		var dayActualStartDate = stringActualStartDate.value.substring(8,10); 
		var monthActualStartDate = stringActualStartDate.value.substring(5,7);
		var yearActualStartDate = stringActualStartDate.value.substring(0,4);
		
		
		var formatActualEndDate = monthActualEndDate +"/"+ dayActualEndDate +"/"+ yearActualEndDate;
		var formatActualStartDate = monthActualStartDate +"/"+ dayActualStartDate +"/"+ yearActualStartDate;
		
		var parseActualEndDate = Date.parse(formatActualEndDate);
		var parseActualStartDate = Date.parse(formatActualStartDate);
		
		var convertActualEndDateToJavaDate = new Date(parseActualEndDate);
		var convertActualStartDateToJavaDate = new Date(parseActualStartDate);
		
		var getTimeActualEndJavaDate = convertActualEndDateToJavaDate.getTime();
		var getTimeActualStartJavaDate = convertActualStartDateToJavaDate.getTime();

		var count =Math.abs(getTimeActualEndJavaDate - getTimeActualStartJavaDate);
		
		vendorTurnaroundTime.value = Math.round(count/ONE_DAY);
	}
</script>
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
		connection = DriverManager.getConnection(data, userName,
				password);
		st = connection.createStatement();

	} catch (ClassNotFoundException e) {
		System.out.println("Class not found");
		e.printStackTrace();
	} catch (SQLException se) {
		System.out.println("SQL Error");
		se.printStackTrace();
	}
%>
<title>Thống kê xuất chiếu</title>
</head>

<body>
!--Header Background Part Starts -->
<%@include file="Header.jsp" %>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%@include file="MenuAdmin.jsp" %>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg">
    <!--Our Company Part Starts -->
    <div id="ourCompany-part" >
<form action="Thongkexc.jsp" method ="post">

<table align ="center">
<tr>
<td colspan = "10" align = "center"><h2 class="ourCompany-hdr">Thống kê xuất chiếu</h2>
</td>
</tr>
<tr>


<td colspan = "5">Tên phim:

<select name="tenphim" style="width: 130px; height: 18px; margin-left: 10px">    
                   <%
                   
   				
                   ArrayList<String> tenPhimArray = new ArrayList<String>();
                   ArrayList<String> maPhimArray = new ArrayList<String>();
                   
                   ArrayList<String> tuNgayArray = new ArrayList<String>();
                   ArrayList<String> denNgayArray = new ArrayList<String>();
                   ArrayList<String> namtuNgayArray = new ArrayList<String>();
                   
                   ArrayList<String> ngaydenNgayArray = new ArrayList<String>();
                   ArrayList<String> thangdenNgayArray = new ArrayList<String>();
                   ArrayList<String> namdenNgayArray = new ArrayList<String>();
                   
                   ResultSet rs1;
   				   String sql1 = null;
                   sql1 = "SELECT [Phim].[MaPhim],[Phim].[TenPhim]FROM [Quanlybanvephim].[dbo].[Phim]";
                   rs1 = st.executeQuery(sql1);
   				   while (rs1.next()) 
                            {
   					maPhimArray.add(rs1.getString(1));
                        	  
   					 %>
                              				        	
                                <option value=""></option>
                                <option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option><%} %>
                      
               </select>
</td>
<td colspan = "5" ><input type="submit" name="btnTimKiem"
							value="Tìm kiếm"></td>
</tr>
 <tr>
 
  <%
  							String maPhim = request.getParameter("tenphim");
                            System.out.println("ra di ma phim=====" +maPhim); 
  							if ("TÃ¬m kiáº¿m".equals(request.getParameter("btnTimKiem"))) {
              					System.out.println("tim kiem neh====="
              							+ request.getParameter("btnTimKiem")); 
                           String sql2 = null;
                          // for(int i=0;i<maPhimArray.size();i++)
                           sql2 = "SELECT day([Phim].[NgayBatDau]),month([Phim].[NgayBatDau]),year([Phim].[NgayBatDau]),day([Phim].[NgayKetThuc]),month([Phim].[NgayKetThuc]),year([Phim].[NgayKetThuc]), [Phim].[TenPhim]FROM [Quanlybanvephim].[dbo].[Phim]where [Phim].[MaPhim]='"+ maPhim
								+"' ";
                           System.out.println("ra di e=====" +sql2); 
							 ResultSet rs2=st.executeQuery(sql2);
       				        while (rs2.next()){
       				        
       				        tuNgayArray.add(rs2.getString(3)+"/"+rs2.getString(2)+"/"+rs2.getString(1));
       				        System.out.println("mang tu ngay dc in ra là: "+tuNgayArray.get(0));
       				  	    denNgayArray.add(rs2.getString(6)+"/"+rs2.getString(5)+"/"+rs2.getString(4));
       				        System.out.println("mang den ngay dc in ra là: "+denNgayArray.get(0));
       				       // ngaytuNgayArray.add(rs2.getString(1));	
         				   // thangtuNgayArray.add(rs2.getString(2));
         				   // namtuNgayArray.add(rs2.getString(3));
         					
         					// ngaydenNgayArray.add(rs2.getString(4));
         					// thangdenNgayArray.add(rs2.getString(5));
         					// namdenNgayArray.add(rs2.getString(6));
       				        
       				        %>

<td colspan = "5" ><%=rs2.getString(7)%></td>
</tr>
<tr>
<td colspan = "5" ><input type="hidden" name="txtTuNgay" value="<%=rs2.getString(3)%>/<%=rs2.getString(2)%>/<%=rs2.getString(1)%>">Ngày bắt đầu chiếu: <%=rs2.getString(2)%>/<%=rs2.getString(1)%>/<%=rs2.getString(3)%></td>
<td colspan = "5" ><input type="hidden" name="txtDenNgay" value="<%=rs2.getString(6)%>/<%=rs2.getString(5)%>/<%=rs2.getString(4)%>">Ngày kết thúc chiếu: <%=rs2.getString(5)%>/<%=rs2.getString(4)%>/<%=rs2.getString(6)%></td>    
      
       
        </tr>   <%} %>
        </table> 
  <%
				
						/*	 String tuNgayGT = tuNgayArray.get(0);
							 System.out.println("tu ngay ne=====" +tuNgayGT);
							String denNgayGT = request.getParameter("txtDenNgay");
							 System.out.println("den ngay ne=====" +denNgayGT);*/
						
							 
							 String tuNgay = tuNgayArray.get(0) + " 00:00";
							 System.out.println("tu ngay====" + tuNgay);
							 String denNgay = denNgayArray.get(0) + " 00:00";
							 System.out.println("den ngay====" + denNgay);
							
							ConvertDate cd = new ConvertDate();
							ArrayList<String> ngay = new ArrayList<String>();
							ngay = cd.getDatesInDuration(tuNgay, denNgay);
							//ngay = cd.getDatesInDuration("2012/01/01 00:00","2012/01/10 00:00");
							System.out.println(ngay);
							System.out.println(ngay.size());
					
							%>       
<table border =1 align = "center">
			<tr>
			<td >Ngày chiếu</td>
			<td >Số lượng xuất chiếu</td></tr>
	
			<%
							for (int k = 0; k < ngay.size(); k++) {
								
					%>
					<tr>

							<td ><font color="#47481A"><%=ngay.get(k)%></font></td>
				<%
				 String sql3 = null;
				 sql3 = "select count ([XuatChieu].[MaXuatChieu])from [XuatChieu],[LichChieu] where [XuatChieu].[MaXuatChieu]=[LichChieu].[MaXuatChieu]	and [XuatChieu].[MaPhim]= '"+maPhim+"'	and [LichChieu].[NgayChieu]= '"+ngay.get(k)+"' ";
                 System.out.println("ra di eeee=====" +sql3); 
				 ResultSet rs3=st.executeQuery(sql3);
		         while (rs3.next()){
						
				%>
							
							<td ><%=rs3.getString(1)%></td> 
							</tr>
							<%}}}%>
								</table>              
</form>
<br><br><br><br><br><br><br>
 </div>
    <!--Our Company Part Ends -->
</div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<%@include file="Footer.jsp" %>
<!--Footer Part Ends -->
</body>

</html>
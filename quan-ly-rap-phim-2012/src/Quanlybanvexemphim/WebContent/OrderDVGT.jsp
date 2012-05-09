<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dịch vụ giải trí</title>
</head>
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<script src="datetimepicker_css.js"></script>
<body>
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
String data = "jdbc:jtds:sqlserver://localhost:1433/QuanLyKhachSan";
String userName = "sa";
String passWord = "123";
String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
Statement st = null;
Class.forName(JDBC_Driver);
connection = DriverManager.getConnection(data, userName, passWord); 
st = connection.createStatement();
ArrayList<String> ar = new ArrayList<String>();

String sql1 = "select TenDichVu from DichVu where MaDichVu like 'DVG%'";
ResultSet rs1 = st.executeQuery(sql1);
while(rs1.next())
{
	ar.add(rs1.getString(1));
}
rs1.close();
ArrayList<String> ar8 = new ArrayList<String>();

String sql8 = "select MaDichVu from DichVu where MaDichVu like 'DVG%'";
ResultSet rs8 = st.executeQuery(sql8);
while(rs8.next())
{
	ar8.add(rs8.getString(1));
}
rs8.close();
ArrayList<String> ar1 = new ArrayList<String>();
String sql3 = "select TenTrangThai_DV from TrangThaiDichVu";
ResultSet rs3 = st.executeQuery(sql3);
while(rs3.next())
{
	ar1.add(rs3.getString(1));
}
rs3.close();
ArrayList<String> ar2 = new ArrayList<String>();
String sql4 = "select MaTrangThai_DV from TrangThaiDichVu";
ResultSet rs4 = st.executeQuery(sql4);
while(rs4.next())
{
	ar2.add(rs4.getString(1));
}
rs4.close();
%>
<%!
/*		public int KiemTraMaDDV(String mddv)
		{
		Connection connection = null;
		String data = "jdbc:jtds:sqlserver://localhost:1433/QuanLyKhachSan";
		String userName = "sa";
		String passWord = "123";
		String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
		Statement st = null;
		
			try
			{
				Class.forName(JDBC_Driver);
				connection = DriverManager.getConnection(data, userName, passWord); 
				st = connection.createStatement();
				String sql2 = "select MaDatDV from DatDichVu";
				ArrayList<String> ar1 = new ArrayList<String>();
				ResultSet rs2 = st.executeQuery(sql2);
				int mask =1;
				while(rs2.next())
				{
					ar1.add(rs2.getString(1));
				}
				rs2.close();
				for(int count =0; count < ar1.size(); count++ )
				{			
					System.out.println("ok");
					if(ar1.get(count) == mddv)
					{					
						mask = 0;
						break;
					}
				}
				System.out.println(mask);
				if(mask == 0)
				{
					
					return 0;
				}
				else
				{
					return 1;
				}
			}
			catch(ClassNotFoundException e)
			{
				e.printStackTrace();
				return 0;
			}
			catch(SQLException se)
			{
				se.printStackTrace();
				return 0;
			}
		finally
			{
			    if (connection != null) {
			        try {
			         connection.close();
			         return 0;
			        }
			        catch (Exception e) {
			         System.out.println("Khong dong duoc ket noi");
			         return 0;
			        }
			       }
			       if (st != null) {
			        try {
			        	
			         st.close();
			         return 0;
			        }
			        catch (Exception e) {
			         System.out.println("Khong dong duoc ket noi");
			         return 0;
			        }
			       }
			}
		}
	*/	
%>
<form action="OrderDVGT.jsp">
<table>
	<tr>
		<td style="font-weight: bold;">Mã đặt dịch vụ<span
			style="font-weight: bold; color: red;">*</span></td>

		<td><input type="text" name="txtMaDDV" value=""></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Mã phòng<span
			style="font-weight: bold; color: red;">*</span></td>

		<td><input type="text" name="txtMaP"></td>

	</tr>
	<tr>
		<td style="font-weight: bold;">Tên dịch vụ<span
			style="font-weight: bold; color: red;">*</span></td>
		<td><select name="TenDV">
			<%
				for(int i =0; i<ar.size(); i++)
				for(int j=0; j<ar8.size(); j++)
				{
					if(i==j)
					{
				%>

			<option value="<%=ar8.get(i) %>"><%=ar.get(i) %></option>
			<%} 
				}%>
		</select></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Số lượng<span
			style="font-weight: bold; color: red;">*</span></td>
		<td><input type="text" name="txtSL"></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Ngày đặt<span
			style="font-weight: bold; color: red;">*</span></td>
		<td><input type="text" name="txtNgayDat" id="txtNgayDat">
		<img src="images/lich.JPG"
			onclick="javascript:NewCssCal('txtNgayDat','MMDDYYYY')"></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Giờ bắt đầu<span
			style="font-weight: bold; color: red;">*</span></td>
		<td><input type="text" name="txtGBD"></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Giờ kết thúc</td>
		<td><input type="text" name="txtGKT"></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Trạng thái</td>
		<td>
		<%
		for(int i =0; i<ar1.size(); i++)
		for(int j =0; j<ar2.size(); j++)
		{
			if(i == j)
			{
		%> <input type="radio" name="tt" value="<%=ar2.get(j) %>"><%=ar1.get(i) %>
		<%}
		}
		%>
		</td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Ghi chú</td>
		<td><textarea name="txaGC"></textarea></td>
	</tr>
	<tr>
		<td align="right" colspan="2"><input type="reset" name="btnReset"
			value="Reset"> <input type="submit" name="btnSave"
			value="Save"></td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="color: blue;">
		<%
		if("Save".equals(request.getParameter("btnSave")))
		{
			String maDDV = request.getParameter("txtMaDDV");			
			System.out.println(maDDV);
			String maP = request.getParameter("txtMaP");
			System.out.println(maP);
			ArrayList<String> ar6 = new ArrayList<String>();
			String sql6 = "select top 1 MaKH from DatPhong where MaPhong = '"+request.getParameter("txtMaP")+"' and NgayKT IS NULL and MaTrangThai_GD = 'TTGD2'";
			ResultSet rs6 = st.executeQuery(sql6);
			while(rs6.next())
			{
				ar6.add(rs6.getString(1));
				System.out.println(rs6.getString(1));
			}
			rs6.close();
			for (int i =0; i<ar6.size(); i++)
			{
		
			String tdv = request.getParameter("TenDV");
			System.out.println(tdv);
			String sl = request.getParameter("txtSL");
			System.out.println(sl);
			//String gia = request.getParameter("txtGia");
			//System.out.println(gia);
			String nd = request.getParameter("txtNgayDat");
			System.out.println(nd);
			String gbd = request.getParameter("txtGBD");
			System.out.println(gbd);
			String gkt = request.getParameter("txtGKT");
			System.out.println(gkt);
			String trt = request.getParameter("tt");
			System.out.println(trt);
			String gc = request.getParameter("txaGC");
			System.out.println(gc);
			String sql7 = "select convert(varchar(30), NgayDat, 101) as nd from DatDichVu where MaDatDV ='"+maDDV+"'";
			ResultSet rs7 = st.executeQuery(sql7);
			while(rs7.next())
			{
				nd = rs7.getString(1);
			}
			
			String sql2 = "insert into DatDichVu(MaDatDV, MaKH, MaPhong, MaDichVu, SoLuong, NgayDat, GioBD, GioKT, Note, MaTrangThai_DV) values('"+maDDV+"', '"+ar6.get(i)+"', '"+maP+"', '"+tdv+"', "+sl+", '"+nd+"', '"+gbd+"', '"+gkt+"', '"+gc+"', '"+trt+"')";
			int count = st.executeUpdate(sql2);
			System.out.println(count);
			if(count>0)
			{%> Cập nhật thành công <%
			}
			}			
		}
		%>
		</td>
	</tr>
</table>
</form>
</body>
</html>
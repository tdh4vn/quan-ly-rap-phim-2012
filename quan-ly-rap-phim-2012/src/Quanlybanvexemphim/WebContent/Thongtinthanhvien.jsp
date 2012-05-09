<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Conver.*"%>
<title>Thông tin thành viên</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
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

<script>

  function Trim(sString) {
       while (sString.substring(0,1) == ' ') {
           sString = sString.substring(1, sString.length);
       }
       while (sString.substring(sString.length-1, sString.length) == ' ')
       {
           sString = sString.substring(0,sString.length-1);
       }
       return sString;
}

  function kiemTraDauVao(){
   
      var obj1Value = document.getElementById("hoTenID").value; 
      if (Trim(obj1Value) == "" || obj1Value == undefined){
    	  alert(" Bạn chưa nhập họ tên ! ");
          return false;
      } 

      var obj1Value2 = document.getElementById("emailID").value; 
      if (Trim(obj1Value2) == "" || obj1Value2 == undefined){
    	  alert("Bạn chưa nhập email !");
          return false;
       } 
      var obj1Value5 = document.getElementById("sdtID").value; 
      if (Trim(obj1Value5) == "" || obj1Value5 == undefined){
    	  alert("Bạn chưa nhập số điện thoại!");
          return false;
      } 

	  return true; //true co nghia la cac dieu kien deu thoa het
  }
  /**
   * DHTML phone number validation script. Courtesy of SmartWebby.com (http://www.smartwebby.com/dhtml/)
   */
  
  // Declaring required variables
  var digits = "0123456789";
  // non-digit characters which are allowed in phone numbers
  var phoneNumberDelimiters = "()- ";
  // characters which are allowed in international phone numbers
  // (a leading + is OK)
  var validWorldPhoneChars = phoneNumberDelimiters + "+";
  // Minimum no of digits in an international phone no.
  var minDigitsInIPhoneNumber = 10;
  
  function isInteger(s)
  {   var i;
      for (i = 0; i < s.length; i++)
      {   
          // Check that current character is number.
          var c = s.charAt(i);
          if (((c < "0") || (c > "9"))) return false;
      }
      // All characters are numbers.
      return true;
  }
  function trim(s)
  {   var i;
      var returnString = "";
      // Search through string's characters one by one.
      // If character is not a whitespace, append to returnString.
      for (i = 0; i < s.length; i++)
      {   
          // Check that current character isn't whitespace.
          var c = s.charAt(i);
          if (c != " ") returnString += c;
      }
      return returnString;
  }
  function stripCharsInBag(s, bag)
  {   var i;
      var returnString = "";
      // Search through string's characters one by one.
      // If character is not in bag, append to returnString.
      for (i = 0; i < s.length; i++)
      {   
          // Check that current character isn't whitespace.
          var c = s.charAt(i);
          if (bag.indexOf(c) == -1) returnString += c;
      }
      return returnString;
  }
  function checkInternationalPhone(strPhone){
	    var bracket=3;
	    strPhone=trim(strPhone);
	    if(strPhone.indexOf("+")>1) return false;
	    if(strPhone.indexOf("-")!=-1)bracket=bracket+1;
	    if(strPhone.indexOf("(")!=-1 && strPhone.indexOf("(")>bracket)return false;
	    var brchr=strPhone.indexOf("(");
	    if(strPhone.indexOf("(")!=-1 && strPhone.charAt(brchr+2)!=")")return false;
	    if(strPhone.indexOf("(")==-1 && strPhone.indexOf(")")!=-1)return false;
	    s=stripCharsInBag(strPhone,validWorldPhoneChars);
	    return (isInteger(s) && s.length >= minDigitsInIPhoneNumber);
	    }
	    
  function ValidateForm(){
      var Phone=document.form.sodienthoai
      
      if ((Phone.value==null)||(Phone.value=="")){
          alert("Bạn chưa nhập　số điện thoại!!!");
          Phone.focus()
          return false
      }
      if (checkInternationalPhone(Phone.value)==false){
          alert("Bạn nhập sai số điện thoại")
          Phone.value=""
          Phone.focus()
          return false
      }
      return true
  }
</script>
<script language="Javascript">

function emailcheck(str) {

var at="@";
var dot=".";
var lat=str.indexOf(at);
var lstr=str.length;
var ldot=str.indexOf(dot);
if (str.indexOf(at)==-1){
    alert("Bạn nhập sai địa chỉ Email.Xin vui lòng nhập lại!");
    return false;
}

if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
    alert("Bạn nhập sai địa chỉ Email.Xin vui lòng nhập lại!");
    return false;
}

if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
alert("Bạn nhập sai địa chỉ Email.Xin vui lòng nhập lại!");
return false;
}

if (str.indexOf(at,(lat+1))!=-1){
alert("Bạn nhập sai địa chỉ Email.Xin vui lòng nhập lại!");
return false;
}

if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
alert("Bạn nhập sai địa chỉ Email.Xin vui lòng nhập lại!");
return false;
}

if (str.indexOf(dot,(lat+2))==-1){
alert("Bạn nhập sai địa chỉ Email.Xin vui lòng nhập lại!");
return false;
}

if (str.indexOf(" ")!=-1){
alert("Bạn nhập sai địa chỉ Email.Xin vui lòng nhập lại!");
return false;
}
return true;
}

function ValidateEmail(){
var emailID=document.form.email
if ((emailID.value==null)||(emailID.value=="")){
alert("Bạn chưa nhập địa chỉ Email")
emailID.focus()
return false
}
if (emailcheck(emailID.value)==false){
emailID.value=""
emailID.focus()
return false
}
 
return true;
}
</script>
<body>
<%@include file="Header.jsp"%>
<% if(session.getAttribute("tenDangNhapTV")==null){%>
<%@include file="MenuUser.jsp"%>
<%}else{ %>
<%@include file="MenuUserDaDangNhap.jsp"%>
<%} %>
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
%>
<table width="100%">


	
	<tr>
		<td colspan="7" align=right>
		<fieldset><legend> <font face="Arial "
			color="black" size="5"> Thông tin thành viên </font></legend>
		<form action="Thongtinthanhvien.jsp" method="post" name="form"
			onsubmit="return ValidateEmail()">
		<table width=100%>

			<%
		
		String sql = "SELECT [TenDangNhapTV],[HoTen],[NgaySinh],[SoDienThoai],[Email],[DiaChi]FROM [Quanlybanvephim].[dbo].[ThanhVien] where TenDangNhapTV = '"+ session.getAttribute("tenDangNhapTV") + "'";
		System.out.println("sql: "+sql);
		ResultSet rs = st.executeQuery(sql); 
		
while (rs.next()) {
	%>
			<tr>
				<td colspan=4><label><font face=" Arial "
					color="#951509">
				<%out.println(rs.getString(1)); %>
				</font></label> <input type="hidden" name="tendangnhaptv"
					value="<%= rs.getString(1) %>" /></td>


			</tr>
			<tr class="ourCompany-list">
				<td align="left">Họ tên:<font color=red>*</font></td>
				<td align="left"><input type="text" size="30" name="hoten"
					id="hoTenID" value="<%= rs.getString(2) %>" /></td>


				<td align="left">Địa chỉ:</td>
				<td align="left"><input type="text" size="30" name="diachi"
					value="<%= rs.getString(6) %>" /></td>

			</tr>
			<tr class="ourCompany-list">
				<td align="left">Ngày sinh:</td>
				<td align="left"><input type="text" size="30"
					name="txtNgaySinh" id="idngaySinh" / value="<%= rs.getString(3) %>">
				<img src="images/lich.JPG"
					onclick="javascript:NewCssCal('idngaySinh','MMDDYYYY')"></td>
				<td align="left">Email:<font color=red>*</font></td>
				<td align="left"><input type="text" size="30" name="email"
					id="emailID" value="<%= rs.getString(5) %>" /></td>
			</tr>

			<tr class="ourCompany-list">
				<td align="left">Số điện thoại:<font color=red>*</font></td>
				<td align="left"><input type="text" size="30"
					name="sodienthoai" id="sdtID" value="<%= rs.getString(4) %>" /></td>
				<td></td>

				<td align="left"><a
					href="Doimatkhau.jsp?tendangnhaptv=<%=session.getAttribute("tenDangNhapTV")%>">
				Đổi mật khẩu </a></td>
			</tr>
			<tr class="ourCompany-list">
				<td colspan=4 align="left"><font color="red">*</font> <font
					color="#951509" face="Arial Narrow" size="3"> Thông tin bắt
				buộc phải điền. </font></td>
			</tr>
			<%}
rs.close();%>
		</table>
		<center><input type="submit" name="btcapnhat"
			value="Cập nhật" onclick=" return kiemTraDauVao();"
			onfocus="return ValidateForm()"></input></center>
		<%         String HTen = request.getParameter("hoten");
           String DChi = request.getParameter("diachi");
           String ngaySinh = request.getParameter("txtNgaySinh");
           String Email = request.getParameter("email");
           String SDThoai = request.getParameter("sodienthoai");
   
          
    %> <%! String tk; %> <%
            
           
            tk=request.getParameter("btcapnhat");
            if("Cáº­p nháº­t".equals(tk))
            {
             System.out.println("in ra di" + HTen);
             int ok = 0;
           
            { String sql1;
              sql1 = "UPDATE [Quanlybanvephim].[dbo].[ThanhVien]SET [HoTen] ='"+HTen+"',[DiaChi]='"+DChi+"',[NgaySinh] ='"+ngaySinh+"',[Email] ='"+Email+"'where TenDangNhapTV = '"+ session.getAttribute("tenDangNhapTV") + "'";
              System.out.print("sql========="+sql1);
              ok = st.executeUpdate(sql1);
              response.sendRedirect("Thongtinthanhvien.jsp");
            }
            }%>
		</form>
		</fieldset>
		</td>
	</tr>
	<tr>
		<td><br>
		<br>
		<br>
		</td>
	<tr>
		<td colspan=10>
		<fieldset><legend> <font face="Arial "
			color="black" size="5"> Thông tin vé đã đặt </font></legend>
		<table border=1 width=100%>
			<tr bgcolor="333333">
				<td align="center"><font color="#CBC387"> Tên phim </font></td>
				<td align="center"><font color="#CBC387"> Ngày chiếu </font></td>
				<td align="center"><font color="#CBC387">Xuất chiếu </font></td>
				<td align="center"><font color="#CBC387"> Số lượng vé
				thường </font></td>
				<td align="center"><font color="#CBC387"> Số lượng vé
				VIP </font></td>
				<td align="center"><font color="#CBC387">Mã xác nhận </font></td>
				<td align="center"></td>
			</tr>

			<%

        String sql2 = "Select TenPhim, NgayChieu, GioChieu, PhutChieu, SoLuongVeThuong, MaXacNhan, SoLuongVeVIP from Phim inner join DanhSachDatVeOnline on Phim.MaPhim = DanhSachDatVeOnline.MaPhim inner join XuatChieu on DanhSachDatVeOnline.MaXuatChieu = XuatChieu.MaXuatChieu inner join LichChieu on LichChieu.MaXuatChieu=XuatChieu.MaXuatChieu";
		System.out.println("sql2: "+sql2);
		ResultSet rs1 = st.executeQuery(sql2);
		if(rs1.next() == false)
		{
		%>
			<%
		}
		else
		{

while (rs1.next()) {
	%>
			<tr class="ourCompany-list">
				<td align="center">
				<%out.println(rs1.getString(1));%>
				</td>
				<td align="center">
				<%out.println(rs1.getString(2));%>
				</td>
				<td align="center">
				<%out.println(rs1.getString(3)+ 'h'+ rs1.getString(4));%>
				</td>
				<td align="center">
				<%out.println(rs1.getString(5)); %>
				</td>
				<td align="center">
				<% out.println(rs1.getString(7));%>
				</td>
				<td align="center">
				<% out.println(rs1.getString(6));%>
				</td>
				<td align="center"><a
					href="Huyve.jsp?MaXacNhan=<%=rs1.getString(6)%>"
					onClick="return show_confirm()"> Huỷ vé </a></td>
				<% } }%>
			</tr>

		</table>

		<center><input type="button" value="Đặt thêm vé" onclick="javascript:window.location='Datve.jsp';"></input></center>
		</fieldset>
		</td>
	</tr>
</table>
<br>
<br>

</div>
</div>
<%@include file="Footer.jsp"%>
</body>
<script>
    function show_confirm()
    {
       return confirm("Bạn có chắc chắn muốn hủy vé không ?");
    }
    </script>
</html>
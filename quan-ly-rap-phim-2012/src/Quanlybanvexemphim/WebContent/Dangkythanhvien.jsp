<%@page import="java.util.HashMap"%>
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
<title>Đăng ký thành viên</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function validateUsername(fld) {
    var error = "";
    var illegalChars = /\W/; // allow letters, numbers, and underscores

    if (fld.value == "") {
        fld.style.background = 'Yellow';
        error = "You didn't enter a username.\n";
    } else if ((fld.value.length < 5) || (fld.value.length > 15)) {
        fld.style.background = 'Yellow';
        error = "The username is the wrong length.\n";
    } else if (illegalChars.test(fld.value)) {
        fld.style.background = 'Yellow';
        error = "The username contains illegal characters.\n";
    } else {
        fld.style.background = 'White';
    }
    return error;
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
var emailID=document.form.txtEmail;
var ten= document.form.txthovaten;
if ((emailID.value==null)||(emailID.value=="")){
alert("Bạn chưa nhập địa chỉ Email");
emailID.focus();
return false;
}
if (emailcheck(emailID.value)==false){
emailID.value="";
emailID.focus();
return false;
}
 
return true;
}
</script>
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
<script language="Javascript">
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
        var Phone=document.form.txtPhone;
        
        if ((Phone.value==null)||(Phone.value=="")){
            alert("Bạn chưa nhập　số điện thoại!!!");
            Phone.focus();
            return false;
        }
        if (checkInternationalPhone(Phone.value)==false){
            alert("Bạn nhập sai số điện thoại");
            Phone.value="";
            Phone.focus();
            return false;
        }
        return true;
    }
</script>
<script type="text/javascript">
    function validatePassword() {
        var pass=document.form.matkhau;
        if (pass.value == "") {
        	  alert("Bạn chưa nhập　số mật khẩu!!!");
        	  pass.focus();
        	  return false;
        } else if ((pass.value.length < 6) || (pass.value.length > 32)) {
        	alert("Mật khẩu phải lớn hơn 6 ký tự!!");
        	pass.focus();
        	return false;
        } 
       return true;
    }
</script>
<script>
function Trim(sString) {
    while (sString.substring(0,1) == ' ') {
        sString = sString.substring(1, sString.length);
    }
    while (sString.substring(sString.length-1, sString.length) == ' ') {
        sString = sString.substring(0,sString.length-1);
    }
    return sString;
}

    function kiemTraDauVao(){
        var obj1Value = document.getElementById("hotenTxt").value; 
        if (Trim(obj1Value) == "" || obj1Value == undefined){
            alert(" Bạn chưa nhập họ tên ");
            return false;
        } 
        var obj1Value2 = document.getElementById("tendangnhapTxt").value; 
        if (Trim(obj1Value2) == "" || obj1Value2 == undefined){
            alert("Bạn chưa nhập tên đăng nhập");
            return false;
        } 
        var obj1Value3 = document.getElementById("matkhauTxt").value; 
        if (Trim(obj1Value3) == "" || obj1Value3 == undefined){
            alert("Bạn chưa nhập mật khẩu");
            return false;
        } 
        var obj1Value4 = document.getElementById("nhaplaimatkhauTxt").value; 
        if (Trim(obj1Value4) == "" || obj1Value4 == undefined ||obj1Value4 != obj1Value3){
            alert("Vui lòng nhập lại mật khẩu");
            return false;
        } 
        var obj1Value5 = document.getElementById("emailTxt").value; 
        if (Trim(obj1Value5) == "" || obj1Value5 == undefined){
            alert("Bạn chưa nhập địa chỉ email");
            return false;
        }  
        var obj1Value6 = document.getElementById("sdtTxt").value; 
        if (Trim(obj1Value6) == "" || obj1Value6 == undefined){
            alert("Bạn chưa nhập số điện thoại ");
            return false;
        } 
    
    	return true; //true co nghia la cac dieu kien deu thoa het
    }
</script>
<%@include file="Header.jsp"%>
<%@include file="MenuUser.jsp"%>
<body>
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
	if ("Loi".equals(request.getParameter("error"))) {
		out.write("Tên đã tồn tại!!!!");
	}
%>
<form method="post" name="form" action="Dangkythanhvien.jsp"
	onSubmit="return ValidateEmail()">
<table width="100%" height="500">
	<tr>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="3" align="center">
		<h2 class="ourCompany-hdr">Đăng ký thành viên</h2>
		</td>
	</tr>
	<tr>
		<td><br />
		</td>
		<td><br />
		</td>
	</tr>
	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Họ tên: <font color=red>*</font></td>
		<td align="left"><input type="text" size="30" name="hoten"
			id="hotenTxt" /></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Tên đăng nhập: <font color=red>*</font></td>
		<td align="left"><input type="text" size="30" name="tendangnhap"
			id="tendangnhapTxt" /></td>
	</tr>
	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Mật khẩu:<font color=red>*</font></td>
		<td align="left"><input type="password" size="30" name="matkhau"
			id="matkhauTxt" /></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Nhập lại mật khẩu:<font color=red>*</font></td>
		<td align="left"><input type="password" size="30"
			name="nhaplaimatkhau" id="nhaplaimatkhauTxt" /></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Email:<font color=red>*</font></td>
		<td align="left"><input type="text" size="30" name="txtEmail"
			id="emailTxt" /></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Số điện thoại: <font color=red>*</font></td>
		<td align="left"><input type="text" size="30" name="txtPhone"
			id="sdtTxt" /></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Ngày sinh:</td>
		<td align="left"><input type="text" size="30" name="txtNgaySinh"
			id="idngaySinh" /></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Giới tính:</td>
		<td align="left"><tt><input type="radio" name="gioitinh"
			value="nam" checked="checked" /> Nam <input type="radio"
			name="gioitinh" value="nữ" /> Nữ </tt></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td width=30% align="left">Địa chỉ:</td>
		<td align="left"><input type="text" size="30" name="diachi" /></td>
	</tr>

	<tr>
		<td colspan="3"></td>
	</tr>

	<tr>
		<td width=20%></td>
		<td width=30%></td>
		<td>
		<%
        	String HTen = request.getParameter("hoten");
        	System.out.println("HTen======" + HTen + "===========");
        	String TDNhap = request.getParameter("tendangnhap");
        	session.setAttribute("tendangnhapTV", TDNhap);
        	System.out.println("tdnnnnnnn   "
        			+ session.getAttribute("tendangnhapTV"));

        	String MKhau = request.getParameter("matkhau");
        	String EmailNV = request.getParameter("email");
        	String SDThoai = request.getParameter("sodienthoai");
        	String NSinh = request.getParameter("txtNgaySinh");
        	String GTinh = request.getParameter("gioitinh");
        	String DChi = request.getParameter("diachi");
        %> <input type="submit" name="themtv"
			onfocus="return ValidateForm()" onblur="return validatePassword()"
			onselect="validateUsername(this)" value="Thêm"
			onclick=" return kiemTraDauVao();" /> <%!public void Xulydangky(String HTen,String TDNhap,String MKhau,String EmailNV,String SDThoai, String NSinh,String GTinh , String DChi ) 
           {
 Connection connection = null;
    String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
    String userName = "sa";
    String password = "123";
    String JDBC_Driver =  "net.sourceforge.jtds.jdbc.Driver";
    Statement st = null;
       try {
            Class.forName(JDBC_Driver);
            connection = DriverManager.getConnection(data, userName, password);
            st = connection.createStatement();
            String sql = "insert into ThanhVien(HoTen,TenDangNhapTV,MatKhau,Email,SoDienThoai,NgaySinh,GioiTinh,DiaChi)values('"+HTen+"','"+TDNhap+"','"+MKhau+"','"+EmailNV+"','"+SDThoai+"','"+NSinh+"','"+GTinh+"','"+DChi+"')";
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
      }%> <%!String tk;%> <%
 	String sql = "select TenDangNhapTV from ThanhVien";
 	ResultSet rs3 = st.executeQuery(sql);
 	String Ten;
 	tk = request.getParameter("themtv");
 	System.out.println("them=========================" + tk);
    	while (rs3.next()) {
 		Ten = rs3.getString(1);
 		System.out.println("tên từ có sở dữ liệu===========" + Ten);
 		System.out.println("tên nhập vào text box=======" + TDNhap);
 		if ("ThÃªm".equals(tk)) {
 			if (Ten.equals(TDNhap)) {
                
 				response.sendRedirect("Dangkythanhvien.jsp?error=Loi");
 				System.out.println("Đã tồn tại!!!");
               
 			} else {
 				
 				Xulydangky(HTen, TDNhap, MKhau, EmailNV, SDThoai,
 						NSinh, GTinh, DChi);
 				System.out.println("Thêm thành công");
 			}
 		}
 	}
 	 
 	%>
		</td>
	</tr>
	<tr>
		<td></td>
		<td align="left"><font color="red">*</font> <font color="#951509"
			face="Arial Narrow" size="3"> Thông tin bắt buộc phải điền. </font></td>
	</tr>
</table>
</form>
</div>
</div>
</body>
<%@include file="Footer.jsp"%>
</html>
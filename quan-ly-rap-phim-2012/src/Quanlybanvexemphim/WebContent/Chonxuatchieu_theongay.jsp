<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Lịch chiếu</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<frameset rows="40%,60%">

	<frame src="menuChonxc2.jsp" />
	<frameset cols="35%,35%,30%">
		<frame name="ngaychieu" src="Ngaychieu_chonphim.jsp" />
		<frame name="tenphim" src="Chonphim_chonxc.jsp" />
		<frame name="xuatchieu" src="Chonxc.jsp" />
	</frameset>

</frameset>


</html>
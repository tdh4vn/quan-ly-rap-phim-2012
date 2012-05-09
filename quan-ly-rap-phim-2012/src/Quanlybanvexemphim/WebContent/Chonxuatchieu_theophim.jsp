<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Lịch chiếu theo phim</title>

</head>


<frameset rows="42%,58%">

	<frame src="menuChonxc.jsp" />

	<frameset cols="50%,50%">
		<frame name="tenphim" src="Tenphim_Chonxuatchieu2.jsp" />
		<frame name="xuatchieu" src="Xuatchieu_Chonxuatchieu2.jsp" />
	</frameset>

</frameset>

</html>
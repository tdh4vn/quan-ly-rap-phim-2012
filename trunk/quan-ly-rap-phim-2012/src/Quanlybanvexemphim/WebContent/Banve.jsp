<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Bán vé</title>

<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<frameset rows="42%,58%">

  <frame src="menuChonXuatChieu.jsp" />
  <frameset cols="35%,35%,30%">
     <frame name="ngaychieuAdmin" src="Banve_Chonngay.jsp" />
     <frame name="tenphimAdmin" src="Banve_Chonphim.jsp" />
     <frame name="xuatchieuAdmin" src="Banve_Chonxuatchieu.jsp" />
  </frameset>

</frameset>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>menu user</title>
<link href="menucss.css" rel="stylesheet" type="text/css" />

</head>
<script>
function chuyenManHinh(path)
{parent.parent.location = path;
	}
</script>
<body>
<div id="container">

<ul>
	<li><a href="Trangchu.jsp">Trang
	chủ</a></li>
	<li><a href="#">Phim</a>
	<ul>
		<li><a href="Phimdangchieu.jsp">Phim đang chiếu</a></li>
		<li><a href="Phimsapchieu.jsp">Phim sắp chiếu</a></li>
		
	</ul>
	</li>


	<li><a href="#">Lịch chiếu</a>
	<ul>
		<li><a href="Chonxuatchieu_theophim.jsp">Theo phim</a></li>
		<li><a href="Chonxuatchieu_theongay.jsp">Theo ngày</a></li>
		<li><a href="Lichchieutatca.jsp">Theo tất cả</a></li>
	</ul>
	</li>

	<li><a href="Sukien.jsp">Sự kiện</a></li>
	<li><a href="Thongtinthanhvien.jsp">Thành viên</a></li>
	<li><a href="Thacmac.jsp">FAQ</a></li>
	<li><a href="Dangnhapuser.jsp" class="signup" title="Đăng nhập"></a></li>
</ul>



</div>
<!--End #container-->




</body>
</html>
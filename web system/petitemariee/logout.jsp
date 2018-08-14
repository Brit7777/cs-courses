<%@ page language="java" 
    contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> Logout </title>
</head>
<body>
 <script type="text/javascript">

	var input = confirm('logout?');
	if (input == true){
		<%session.invalidate();%>
	alert("logout success!");
	}
	location.href="index.html";
</script>
</body>
</html>
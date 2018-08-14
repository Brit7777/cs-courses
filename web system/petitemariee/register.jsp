<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="test.db.DBconn" %>
<html>
<head><title>가입 처리</title></head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	String url = "jdbc:mysql://203.252.195.138:3306/petitemariee?useSSL=false";        
	String dbuser = "petitemariee";                                       
	String dbpass = "noanswer"; 
	
	String formId = request.getParameter("id");
	String formName = request.getParameter("name");
	String formPass = request.getParameter("password");
	String formEmail = request.getParameter("email");
	Date regDate = new Date();
	
	try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbuser,dbpass);
		
		String sql = "INSERT INTO member(id,name,password,email,registerDate) values(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, formId);
		pstmt.setString(2, formName);
		pstmt.setString(3, formPass);
		pstmt.setString(4, formEmail);
		pstmt.setDate(5, new java.sql.Date(regDate.getTime()));
		pstmt.executeUpdate();
		%>
		회원 가입 처리 완료 <br/>
		<table width="400" border="1">
			<tr><td>ID</td><td><%=formId %></td></tr>
			<tr><td>이름</td><td><%=formName %></td></tr>
			<tr><td>이메일</td><td><%=formEmail %></td></tr>
			<tr><td>가입일시</td><td><%=regDate %></td></tr>
		</table>
		<a href="index.html">홈으로 이동</a>
		<%		
	}catch(SQLException ex){
		out.println("에러: "+ex);		
	}finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}		
%>
</body>
</html>

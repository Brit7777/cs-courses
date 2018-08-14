<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*, java.net.URLEncoder, java.net.URLDecoder" %>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
<HEAD>
<TITLE> QnA </TITLE>
<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel=stylesheet href="listboard.css"/>
<link rel=stylesheet href="dropdown.css"/>
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>
</HEAD>
<BODY>

<% 
	Class.forName("com.mysql.jdbc.Driver");	
	//관리자 Login
	String url = "jdbc:mysql://203.252.195.138:3306/petitemariee?useSSL=false";
	String id = "petitemariee";
	String pwd ="noanswer";
	String password = null; //입력받는 패스워드

	int num = Integer.parseInt(request.getParameter("num"));
	String passw = request.getParameter("password");
	
	try{
				
		Connection conn = DriverManager.getConnection(url,id,pwd);
		String strSQL = "SELECT * FROM fboard WHERE num = ?";
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, num);
		ResultSet rs = null;
		rs = pstmt.executeQuery();
		
		 if(rs.next()){
			String userID = rs.getString("userID");
			String title = rs.getString("title");
			String contents = rs.getString("contents").trim();
			String writedate = rs.getString("writedate");
			int readcount = rs.getInt("readcount");
			password = rs.getString("password");
		 }
		 
		 if(password.equals(passw)) {
			 strSQL = "SELECT * FROM fboard WHERE num="+num;	
			 
%>
  			<script language=javascript>
   				location.href="modify.jsp?num=<%=num%>";
  			</script>

<%
		rs.close();
		pstmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("wrong password!Please try again.");
				location.href="javascript:history.back()";
			</script>
<%		
		 }
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%>
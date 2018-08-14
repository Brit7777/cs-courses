<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta charset="UTF-8"/>
	<title>Plan your wedding</title>
	<link rel=stylesheet href="etc.css"/>
	<link rel=stylesheet href="dropdown.css"/>


</head>
<body>
<!--Main Header-->
<header id="main_header">
	<nav id="main_menu"></nav>
	<ul id='menu'>
		<li><a href='index.html'>HOME</a></li>
		<li><a href='about.html'>ABOUT</a></li>
		<ul><li class="dropdown">
    		<a href="javascript:void(0)" class="dropbtn" onclick="myFunction()">CUSTOMIZE+</a>
    		<div class="dropdown-content" id="myDropdown">
     	 	 <a href="place.html">PLACE</a>
     	 	 <a href="etc.jsp">ETC.</a>
    		</div>
  		</li></ul>
		<li><a href='photos.html'>PHOTOS</a></li>
		<li><a href='listform.jsp'>Q&A</a></li>
		<li><a href="login.html"><img alt="Login Icon" src="login_icon.png" width="35" height="35"></a></li>
  	</ul>

	<script src="pm_1.jsp"></script>
	<script>
	/* When the user clicks on the button,
	toggle between hiding and showing the dropdown content */
	function myFunction() {
    	document.getElementById("myDropdown").classList.toggle("show");
	}

	// Close the dropdown if the user clicks outside of it
	window.onclick = function(e) {
  		if (!e.target.matches('.dropbtn')) {
    		var dropdowns = document.getElementsByClassName("dropdown-content");
    		for (var d = 0; d < dropdowns.length; d++) {
      			var openDropdown = dropdowns[d];
      			if (openDropdown.classList.contains('show')) {
        		openDropdown.classList.remove('show');
      			}
    		}
  		}
	}
	</script>
</header>
<section id="main_section">
<h1>Plan your wedding</h1>
<hr/>
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
	//Date regDate = new Date();
	
	try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbuser,dbpass);
		
		String sql = "INSERT INTO member(id,name,password,email,registerDate) values(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, formId);
		pstmt.setString(2, formName);
		pstmt.setString(3, formPass);
		pstmt.setString(4, formEmail);
		//pstmt.setDate(5, new java.sql.Date(regDate.getTime()));
		pstmt.executeUpdate();
		%>
<table>
<form action="mypage.jsp" method="post">
<tr><td>Honeymoon:<input type="text" name="honeymoon"></td><td>price<input type="text" name="honeymoonprice"></td> </tr>
<tr><td>wedding photo:<input type="text" name="photo"></td><td>price<input type="text" name="photoprice"></td></tr>
<tr><td>guest:<input type="text" name="guest"></td><td>price<input type="text" name="guestprice"> </td></tr>
<tr><td>Song : <input type="text" name="song"></td><td>price<input type="text" name="songprice"></td></tr>
<tr><td>budget:</td></tr>
<input type="submit" value="save" name="save">
<input type="reset" value="reset" name="reset">
</form>
</table>
<%		
	}catch(SQLException ex){
		out.println("����: "+ex);		
	}finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}		
%>
</section>

<!--Footer-->
<footer id="main_footer">
	<p>1600 Amphitheatre Parkway Mountain View, CA 64023 T. +1 650 238 2999<p>
    <p>짤 2016 Petite Mariee, Inc. All Rights Reserved.<p>
</footer>

</body>
</html>
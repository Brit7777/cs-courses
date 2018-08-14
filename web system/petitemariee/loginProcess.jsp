<%@ page language="java" 
    contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*" 
    session = "true" %>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> Login_Check </title>
</head>
<body>
 
    <h1> 로그인 체크 페이지 </h1>
    
    <%
    try {
        // 드라이버 로딩
        String driver = "oracle.jdbc.driver.OracleDriver";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = null;		
    	PreparedStatement pstmt = null;
        // 관리자 Login
      	String url = "jdbc:mysql://203.252.195.138:3306/petitemariee?useSSL=false";
        String id = "petitemariee";
        String pwd ="noanswer";
        
        // 연결
        conn = DriverManager.getConnection(url, id, pwd);
        
         // servlet
         
         // 전 페이지인 LOGIN.jsp input에 입력한 값들을 변수에 담는다
         String user_id= request.getParameter("id");
         String user_pw= request.getParameter("pw");
   
        // 내가 입려한 id와 pw 값이 DB안에 있는지 확인한다
        String sql = "SELECT * FROM member WHERE id='"+user_id+ "' AND password='"+user_pw+"'";
        pstmt=conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery(sql);
     
        // isLogin 은 로그인 확인 유무를 위한 변수
        Boolean isLogin = false;
        if(rs.next()) {
            // rs.next가 true 라면 = 정보가 있다
            isLogin = true;
        }
        
        // DB에 내가 적은 정보가 있다면
        if(isLogin) {
            // 지금 로그인할 id와 pw를 session에 저장하고
            session.setAttribute("user_id", user_id); 
            session.setAttribute("user_pw", user_pw);
            session.setAttribute("user_name",rs.getString(2));
            session.setMaxInactiveInterval(60*30);
            %>
            <script>
            var id = "<%=rs.getString(2)%>";
            alert(id + "  welcome!");
            location.href = "login_success.html"; </script> 
             <%

        } 
        else {// DB에 내가적은 정보가 없다면 경고창을 띄워준다
        	if (user_id == "")
        		%> <script> alert("insert ID"); history.go(-1); </script> <% 	
        	else if (user_pw == "") 
        	%> <script> alert("insert PASSWORD"); history.go(-1); </script>  <%
            else
            %> <script> alert("login failure"); history.go(-1); </script> <%            
        }
        
        
    } catch (SQLException ex){
		out.println("에러: "+ex);
    }
    %>
 
</body>
</html>
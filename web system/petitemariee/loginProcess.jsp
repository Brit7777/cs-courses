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
 
    <h1> �α��� üũ ������ </h1>
    
    <%
    try {
        // ����̹� �ε�
        String driver = "oracle.jdbc.driver.OracleDriver";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = null;		
    	PreparedStatement pstmt = null;
        // ������ Login
      	String url = "jdbc:mysql://203.252.195.138:3306/petitemariee?useSSL=false";
        String id = "petitemariee";
        String pwd ="noanswer";
        
        // ����
        conn = DriverManager.getConnection(url, id, pwd);
        
         // servlet
         
         // �� �������� LOGIN.jsp input�� �Է��� ������ ������ ��´�
         String user_id= request.getParameter("id");
         String user_pw= request.getParameter("pw");
   
        // ���� �Է��� id�� pw ���� DB�ȿ� �ִ��� Ȯ���Ѵ�
        String sql = "SELECT * FROM member WHERE id='"+user_id+ "' AND password='"+user_pw+"'";
        pstmt=conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery(sql);
     
        // isLogin �� �α��� Ȯ�� ������ ���� ����
        Boolean isLogin = false;
        if(rs.next()) {
            // rs.next�� true ��� = ������ �ִ�
            isLogin = true;
        }
        
        // DB�� ���� ���� ������ �ִٸ�
        if(isLogin) {
            // ���� �α����� id�� pw�� session�� �����ϰ�
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
        else {// DB�� �������� ������ ���ٸ� ���â�� ����ش�
        	if (user_id == "")
        		%> <script> alert("insert ID"); history.go(-1); </script> <% 	
        	else if (user_pw == "") 
        	%> <script> alert("insert PASSWORD"); history.go(-1); </script>  <%
            else
            %> <script> alert("login failure"); history.go(-1); </script> <%            
        }
        
        
    } catch (SQLException ex){
		out.println("����: "+ex);
    }
    %>
 
</body>
</html>
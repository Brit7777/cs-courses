<%@ page import = "java.sql.*, java.util.*" contentType = "text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
   request.setCharacterEncoding("euc-kr");

   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = null;      
// 관리자 Login
   String url = "jdbc:mysql://203.252.195.138:3306/petitemariee?useSSL=false";
   String id = "petitemariee";
   String pwd ="noanswer";
   
   String name = request.getParameter("name");
   String password = request.getParameter("password");
   String title = request.getParameter("title");
   String memo = request.getParameter("contents");
   int idx = Integer.parseInt(request.getParameter("num"));
   Calendar dateIn = Calendar.getInstance(); // 디폴트 타임존과 지정된 로케일을 사용해 달력을 리턴
   String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
   indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-"; //0~11의 리턴 값을 방지하기 위해 +1
   indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
   indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
   indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
   indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));
   
   try {
      int ref = 0;
      int indent = 0;
      int step = 0;

      conn = DriverManager.getConnection(url,id,pwd);
      Statement stmt = conn.createStatement();
      
      String sql = "SELECT REF, INDENT, STEP FROM fboard WHERE NUM=" + idx;
      ResultSet rs = stmt.executeQuery(sql);
      
      if(rs.next()) {
         ref = rs.getInt(8);
         indent = rs.getInt(9);
         step = rs.getInt(10);
      }
      
      sql = "UPDATE fboard SET STEP=STEP+1 where REF="+ref+" and STEP>" +step;
      stmt.executeUpdate(sql);
      
      sql = "INSERT INTO fboard(num, userID, title, contents, writedate, readcount,password,ref,indent,step)"+
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx+1);
      pstmt.setString(2,name);
      pstmt.setString(3, title);
      pstmt.setString(4, memo);
      pstmt.setString(5,indate);
      pstmt.setInt(8, ref);
      pstmt.setInt(9, indent+1);
      pstmt.setInt(10, step+1);
      
      
      
      pstmt.execute(); 
      rs.close();
      stmt.close();
      pstmt.close();
      conn.close();
      
   }catch(Exception e) {
      
   }
%>
  <script language=javascript>
   self.window.alert("sucessfully replied!");
   location.href="listboard.jsp";
  </script>
</body>
</html>
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
   a:link      {font-family:"";color:black;text-decoration:none;}
   a:visited   {font-family:"";color:black;text-decoration:none;}
   a:hover      {font-family:"";color:black;text-decoration:underline;}
-->
</style>
</HEAD>
<BODY>

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
            <a href="dress.html">DRESS</a>
             <a href="etc.html">ETC.</a>
             <a href="totalbudget.html">TOTAL BUDGET</a>
          </div>
        </li></ul>
      <li><a href='photos.html'>PHOTOS</a></li>
      <li><a href='listboard.jsp'>Q&A</a></li>
      <li><a href="login.jsp"><img alt="Login Icon" src="login_icon.png" width="45" height="45"></a></li>
     </ul>
   <script>
   /* When the user clicks on the button,
   toggle between hiding and showing the dropdown content */
   function myFunction() {
       document.getElementById("myDropdown").classList.toggle("show");
   }
   function Check(){
      if(Form.keyword.value.length<1){
         alert("fill in the search engine.");
         Form.keyword.focus(); //focus()함수로 keyword 텍스트 박스에 커서가 위치
         return false; //false 리턴으로 폼 값을 서버로 전송하지 않음
      }
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

<%
String num = request.getParameter("num"); 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;      
//관리자 Login
String url = "jdbc:mysql://203.252.195.138:3306/petitemariee?useSSL=false";
String id = "petitemariee";
String pwd ="noanswer";

//연결
conn = DriverManager.getConnection(url, id, pwd);
PreparedStatement pstmt = null;
ResultSet rs = null;
try { //PreparedStatement 클래스를 이용해 해당 SQL문 처리. 변수 num에 저장된 인수에 맞는 번호의 게시물을 출력
   String strSQL = "SELECT * FROM fboard WHERE num = ?";
   pstmt = conn.prepareStatement(strSQL);
   pstmt.setInt(1, Integer.parseInt(num));
   rs = pstmt.executeQuery();
   rs.next();
   String userID = rs.getString("userID");
   String title = rs.getString("title");
   String contents = rs.getString("contents").trim();
   String writedate = rs.getString("writedate");
   int readcount = rs.getInt("readcount");
%>
<!--Content-->
<center><font style="color:#FF6666; font-size:30px;"><b> QnA </b></font>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>
<TABLE border='0' width='600'>
   <TR>
          <TD align='left'>
            <font size='2'> writer :<%=userID %></font>
          </TD>
          
          <TD align=right>
            <font size='2'>written date: <%=writedate %>, views: <%=readcount %></font>
          </TD>
       </TR>
</TABLE>
<TABLE border='0' cellspacing=3 cellpadding=3 width='600'>
   <TR bgcolor='ivory'>
      <TD align='center'>
          <font size='3'><b><%=title %></font>
      </TD>
   </TR>
</TABLE>
<%
   String subject_con = new String (title.getBytes("euc-kr"), "utf-8");// euc-kr을 utf-8로 변환
   // 현재 URL 추출. URL에 쿼리문자열이 섞여서 Get방식으로 값이 넘어온 페이지라면 getRequestURL() 메소드는 쿼리문자열을 잘라버리고 출력 
   // 쿼리문자열 부분은 getRequestURL() 메소드로는 잡히지 않음.
   
%>

   
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
     <TR>
        <TD><hr size='1' noshade></TD>
     </TR>
</TABLE>

<TABLE border='0' width='600'>
   <TR>
      <TD align='left'>
         <a href="modify_password.jsp?num=<%=num %>">[edit]</a>
         <a href="delete.jsp?num=<%=num %>">[delete]</a>
      </TD>

      <TD align='right'>
         <a href="reply.jsp?num=<%=num%>">[reply]</a>
         <a href='write.jsp'>[write]</a>
         <a href='listboard.jsp'>[list]</a>
       </TD>
   </TR>
</TABLE>
<%

strSQL = "UPDATE fboard SET readcount=readcount+1 WHERE num = ?"; // 조회수 수정. num값이 같은 레코드의 readcount 필드 값을 1더해 저장
pstmt = conn.prepareStatement(strSQL); // 사용자들이 해당 num의 레코드에 접근할때마다 1씩 증가시킴으로 해당 게시물에 몇 번 접근했는지 알수 있음
pstmt.setInt(1, Integer.parseInt(num));
pstmt.executeUpdate();
}catch(SQLException e){
      out.print("SQL에러 " + e.toString());
}catch(Exception ex){
      out.print("JSP에러 " + ex.toString());
}finally{  // 예외에 상관없이 무조건 실행
   rs.close();
   pstmt.close();
   conn.close();
}
%>
<!--Footer-->
<footer id="main_footer">
   <p>1600 Amphitheatre Parkway Mountain View, CA 64023 T. +1 650 238 2999<p>
   <p>Â© 2016 Petite Mariee, Inc. All Rights Reserved.<p>
</footer>
</BODY>
</HTML>
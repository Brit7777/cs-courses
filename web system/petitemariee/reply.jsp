<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*, java.util.*, java.net.URLEncoder, java.net.URLDecoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>modify page</title>
    <meta charset="UTF-8"/>
   <link rel=stylesheet href="listboard.css"/>
   <link rel=stylesheet href="dropdown.css"/>

<!--문자의 인코딩을 나타내도록 브라우저를 동적으로 작동-->
<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
<!--
   a:link      {font-family:"";color:black;text-decoration:none;}
   a:visited   {font-family:"";color:black;text-decoration:none;}
   a:hover      {font-family:"";color:black;text-decoration:underline;}
-->
</style>
</HEAD>
<BODY>
 <%
  
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = null;      
   //관리자 Login
   String url = "jdbc:mysql://203.252.195.138:3306/petitemariee?useSSL=false";
   String id = "petitemariee";
   String pwd ="noanswer";

   String userID   = (String) session.getAttribute("user_id");
   //연결
   conn = DriverManager.getConnection(url, id, pwd);
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   try { //PreparedStatement 클래스를 이용해 해당 SQL문 처리. 변수 num에 저장된 인수에 맞는 번호의 게시물을 출력
      String strSQL = "SELECT * FROM fboard WHERE num = ?";
      pstmt = conn.prepareStatement(strSQL);
    int num = Integer.parseInt(request.getParameter("num"));
      pstmt.setInt(1, num);
      rs = pstmt.executeQuery();
    if(rs.next()){
       
      String title = rs.getString("title");
      String contents = rs.getString("contents").trim();
      String writedate = rs.getString("writedate");
      int readcount = rs.getInt("readcount");
      String password = rs.getString("password");
    }
   
 %>
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


   function Check() {
   if (Modify.title.value.length < 1) {//title 값 검사. 1보다 작을 경우, 값이 없으므로 alert() 실행
      alert("insert title");
      Modify.title.focus(); //java script 내장함수. 커서의 위치 설정 역할
      return false; //폼 값을 서버로 전송하지 않음
       }
   if (Modify.password.value.length < 1) {//title 값 검사. 1보다 작을 경우, 값이 없으므로 alert() 실행
      alert("insert password");
      Modify.password.focus(); //java script 내장함수. 커서의 위치 설정 역할
      return false; //폼 값을 서버로 전송하지 않음
       }
   if (Modify.contents.value.length < 1) {
      alert("insert content");
      Modify.contents.focus(); 
      return false;
       }
   Modify.submit(); //위의 모든 조건에 해당되지 않을 때 입력받은 값을 서버로 전송
   } 
  
   </script>
  
</header>

<!--Content-->
<div id="content">
<div id="content_box">
<center><font style="color:#FF6666; font-size:30px;"><b> Reply </b></font>                   
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>
<FORM Name='modify' Action='reply_ok.jsp?num=<%=num%>' Method='post' OnSubmit='return Check()'>
<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
   <TR>
      <TD width='150' bgcolor='ivory'>
         <font size='2'><center><b>title</b></center></font>
      </TD>
      <TD>
         <font size='2'>
         <input type="text" size='70' maxlength='50' name='title' value='<%=rs.getString("title")%>'></font>
      </TD>
   </TR>
   <TR>
      <TD width='150' bgcolor='ivory'>
         <font size='2'><center><b>writer</b></center></font>
      </TD>
      <TD>
         <font size='2'>
         <input type="text" size='70' maxlength='50' name='name' value='<%=userID%>'></font>
      </TD>
   </TR>
   <TR>
      <TD width='150' bgcolor='ivory'>
         <font size='2'><center><b>content</b></center></font>
      </TD>
         <TD>
             <font size='2'><textarea wrap='hard' cols='70' rows='15'  name='contents' ></textarea></font>
            </TD>
   </TR>
   <TR>
            <TD colspan='2'><hr size='1' noshade></TD>
   </TR>

   <TR>
      <TD align='center' colspan='2' width='100%'>
      <TABLE>
         <TR>
            <TD width='100' align='center'><input Type = 'Reset' Value = 'rewrite'></TD>
            <TD width='200' align='center'><input Type = 'Submit' Value = 'submit'></TD>
            <TD width='200' align='center'><input Type = 'Button' Value = 'list' OnClick="window.location='listboard.jsp'"></TD>
         </TR>
      </TABLE>
      </TD>
   </TR>
  </TABLE>
</FORM>
<%
   }finally{
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
</body> 
</html>
 


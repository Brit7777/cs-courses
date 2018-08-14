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

<!--臾몄���� �몄��⑹�� �����대��濡� 釉��쇱�곗��瑜� �����쇰� ����-->
<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
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
   Connection conn = null;		
   //愿�由ъ�� Login
   String url = "jdbc:mysql://203.252.195.138:3306/petitemariee?useSSL=false";
   String id = "petitemariee";
   String pwd ="noanswer";

   //�곌껐
   conn = DriverManager.getConnection(url, id, pwd);
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   try { //PreparedStatement �대���ㅻ�� �댁�⑺�� �대�� SQL臾� 泥�由�. 蹂��� num�� ���λ�� �몄���� 留��� 踰��몄�� 寃���臾쇱�� 異���
   	String strSQL = "SELECT * FROM fboard WHERE num = ?";
   	pstmt = conn.prepareStatement(strSQL);
    int num = Integer.parseInt(request.getParameter("num"));
   	pstmt.setInt(1, num);
   	rs = pstmt.executeQuery();
    if(rs.next()){
		String userID = rs.getString("userID");
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
			Form.keyword.focus(); //focus()�⑥��濡� keyword ���ㅽ�� 諛��ㅼ�� 而ㅼ��媛� ��移�
			return false; //false 由ы�댁�쇰� �� 媛��� ��踰�濡� ���≫��吏� ����
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
   if (Modify.title.value.length < 1) {//title 媛� 寃���. 1蹂대�� ���� 寃쎌��, 媛��� ���쇰��濡� alert() �ㅽ��
   	alert("insert title");
   	Modify.title.focus(); //java script �댁�ν�⑥��. 而ㅼ���� ��移� �ㅼ�� ����
   	return false; //�� 媛��� ��踰�濡� ���≫��吏� ����
       }
   if (Modify.password.value.length < 1) {//title 媛� 寃���. 1蹂대�� ���� 寃쎌��, 媛��� ���쇰��濡� alert() �ㅽ��
   	alert("insert password");
   	Modify.password.focus(); //java script �댁�ν�⑥��. 而ㅼ���� ��移� �ㅼ�� ����
   	return false; //�� 媛��� ��踰�濡� ���≫��吏� ����
       }
   if (Modify.contents.value.length < 1) {
   	alert("insert content");
   	Modify.contents.focus(); 
   	return false;
       }
   Modify.submit(); //���� 紐⑤�� 議곌굔�� �대�밸��吏� ���� �� ���λ��� 媛��� ��踰�濡� ����
   } 
  
   </script>
  
</header>

<!--Content-->
<div id="content">
<div id="content_box">
<center><font style="color:#FF6666; font-size:30px;"><b> QnA </b></font>                   
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>
<FORM Name='modify' Action='modifyProcess.jsp?num=<%=num%>' Method='post' OnSubmit='return Check()'>
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
			<font size='2'><center><b>content</b></center></font>
		</TD>
			<TD>
       		<font size='2'><textarea wrap='hard' cols='70' rows='15'  name='contents' value='<%=rs.getString("contents") %>'></textarea></font>
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
   <p>�짤 2016 Petite Mariee, Inc. All Rights Reserved.<p>
</footer>
</BODY>
</HTML>
</body> 
</html>
 



<%@ page language="java" import = "java.sql.*, java.util.*" contentType="text/html; charset=euc-kr" session = "true" %>
<% request.setCharacterEncoding("euc-kr"); %>

<html>
<head>

<title>QnA</title>
   <meta charset="UTF-8"/>
   <link rel=stylesheet href="listboard.css"/>
   <link rel=stylesheet href="dropdown.css"/>

<!--문자의 인코딩을 나타내도록 브라우저를 동적으로 작동-->
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
<!--Main Header-->

<header id="main_header">
   <nav id="main_menu"></nav>
   <ul id='menu'>
      <li><a href='homepage.html'>HOME</a></li>
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


<!--Content-->
<div id="content">
<div id="content_box">
<%
try {
	
	String userID = (String) session.getAttribute("user_id");// 사용자 ID 세션값 리턴
	if (userID == null){
		%> <script> alert("login please"); history.go(-1); </script> <% 
	}
	String key = request.getParameter("key"); //key 변수는 사용자가 검색하려는 검색조건
	String keyword = request.getParameter("keyword"); //keyword 변수는 사용자가 검색하려는 문자열
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){ 
		pageNum = "1"; // 전달받은 pageNum 값이 없을 때 변수에 1을 저장
	}
	int listSize = 10; // 한 페이지에 보이는 레코드의 개수를 10로 설정해 변수 lifeSize에 저장
	int currentPage = Integer.parseInt(pageNum); // 변수 pageNum에 저장된 값을 Int형으로 변환해 변수 currentPage에 저장
	int startRow = (currentPage - 1) * listSize + 1; // 한 페이지에 출력되는 시작 열을 계산해 변수 startRow에 저장
	int endRow = currentPage * listSize; // 한 페이지에 출력되는 마지막 열을 계산해 변수 endRow에 저장
	int lastRow = 0; // 변수 lastRow 선언과 초기화
	int i = 0;
	String strSQL = "";
	strSQL = new String(strSQL.getBytes("8859_1"), "euc-kr");

	Class.forName("com.mysql.jdbc.Driver"); // DBMS와 연결하기 위해 Class.forName()을 사용해 JDBC 로딩
	Connection conn = null;		
	// 관리자 Login
	String url = "jdbc:mysql://203.252.195.138:3306/petitemariee?useSSL=false";
	String id = "petitemariee";
	String pwd ="noanswer";

	// 연결
	conn = DriverManager.getConnection(url, id, pwd);
	Statement stmt = conn.createStatement(); //DB 작업을 위해 Connection클래스의 createStatement() 메소드 사용하여 Statement 클래스 생성
	ResultSet rs = null; //처리 결과 리턴 클래스의 rs 변수 초기화
	if (key==null||keyword==null){ //null값이면 전체 게시물 수 리턴
		strSQL = "SELECT count(*) FROM fboard order by num desc";
	}else{ //key와 keyword에 값이 저장돼 있다면 사용자가 조건을 입력해 해당 게시물을 검색
		strSQL = "SELECT count(*) FROM fboard WHERE " + key + "like '%" + keyword + "%'  order by num desc";
	} 
	rs = stmt.executeQuery(strSQL); // SELECT문 처리를 위해 executeQuery()메소드 이용
	rs.next(); //현재 행에서 다음 행으로 위치 이동. 이동 성공 시 true 리턴. 이동할 행이 없으면 false 리턴
	lastRow = rs.getInt(1); // 현재 행에 해당하는 값을 int 형태로 리턴
	rs.close(); //DB연결 해제
%>
<center><font style="color:#FF6666;font-size:50px;"><b> QnA </b></font></TD>
                                    
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>              
<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>      
	<TR style="color:#FFA07A;">      
		<TD><font size=2><center><b>number</b></center></font></TD>      
		<TD><font size=2><center><b>title</b></center></font></TD>      
		<TD><font size=2><center><b>writer</b></center></font></TD>      
		<TD><font size=2><center><b>written date</b></center></font></TD>      
		<TD><font size=2><center><b>views</b></center></font></TD>      
	</TR>   
<%/* lastRow 값이 0보다 클 때(테이블에 데이터가 하나 이상 저장돼 있을 때) i값을 한 페이지에 출력될 시작 열을 뜻하는 변수 startRow 값에서
마지막 열 endRow 값까지 num 값이 i와 일치하는 데이터 값을 리턴*/
	if(lastRow > 0) { 
		if (key==null || keyword==null){
		strSQL = "SELECT * FROM fboard WHERE num BETWEEN " + startRow + " and " + endRow + " order by num desc"; // 리스트 내림차순
		rs = stmt.executeQuery(strSQL);
		}else {
		strSQL = "SELECT * FROM fboard WHERE " + key + " like '%" + keyword + "%'  order by num desc"; // 리스트 내림차순
		rs = stmt.executeQuery(strSQL);
		}
		for (i = 0; i < listSize; i++){		
			while(rs.next()){
			int listnum = rs.getInt("num");
			String name = rs.getString("userID");
			String title = rs.getString("title");
			String writedate = rs.getString("writedate");
			int readcount = rs.getInt("readcount");
	%>
	<TR bgcolor='ededed'>     
		<TD align=center><font size=2 color='black'>
                                    <%=listnum %></font></TD>     
		<TD align=left>
			<a href="write_output.jsp?num=<%=listnum %>">
			<font size=2 color="black"><%=title %></font></a>
		</TD>
		<TD align=center>    
			<font size=2 color="black"><%=name %></font></a>     
		</TD>     
		<TD align=center><font size=2><%=writedate %></font>
		</TD>     
		<TD align=center><font size=2><%=readcount %></font>     
	</TR>  
<%     
			}
		}	
%>
</TABLE>        
<%
	rs.close();
	stmt.close();
	conn.close();
	}
	if(lastRow > 0) { // 시작페이지와 마지막 페이지 계산
		int setPage = 1; 
		int lastPage = 0;
		if(lastRow % listSize == 0)
			lastPage = lastRow / listSize;
		else
			lastPage = lastRow / listSize + 1;
	
		if(currentPage > 1) { //currentPage 값이 1보다 클 경우 이전 페이지로 이동 가능한 링크 버튼 [이전] 출력
%>
		<a href="listboard.jsp?pageNum=<%=currentPage-1%>">[before]</a>	
<%	
		}
		for(i=setPage;i<=lastPage;i++) {
			if(i== Integer.parseInt(pageNum)){
%>
			[<%=i%>]
<%
			}else{
%>
		<a href="listboard.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%
			}
		}
		if(lastPage > currentPage) { //lastPage 값이 currentPage 값보다 클 경우 [다음] 링크 버튼을 생성하고 다음 페이지로 이동 가능
%>
		<a href="listboard.jsp?pageNum=<%=currentPage+1%>">[next]</a>
<%
		}
	}
%>  
<table border='0' width='600' cellpadding='0' cellspacing='0'>
	<tr>
		<td><hr size ='1' noshade>
		</td>
	</tr>
</table>
<!--검색 키를 선택하는 드롭다운 리스트와 검색어를 입력받을 수 있는 텍스트 박스-->
<table border=0 width=600>
	<tr>
	<td align=center>
		<table border=0 cellpadding=0 cellspacing=0>
		<!--검색어 입력 후 버튼 클릭 시 post방식으로 값이 서버에 전송. 전송되기전에 Check()를 호출해 검색어를 입력할지 판단-->
		<form name='form' method='post' action='listboard.jsp' OnSubmit='return Check()'>
		<input type='hidden' name='search' value=1>
		<tr>
			<td align=right>
			<select name='key' style="background-color:FFFFCC;">
			<option value='title' selected><font size=2>title</font></option>
			<option value='contents'><font size=2>content</font></option>
			<option value='name'><font size=2>writer</font></option>
			</select>
			</td>
			<td align='left'>
				<input type='text' name='keyword' value='' size=20 maxlength=30>
				<input type='submit' value='search'>
				</td>
			</tr>
			</form>
			</table>
			</td>
			<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>                    
<TABLE border=0 width=600>
	<TR>
		<TD align=left><td align='left'><a href="homepage.html">[main]</a></td></TD>
		<TD align='right'><a href='write.jsp'>[write]</a></TD>
	</TR>
<%
	}catch(NullPointerException e){ // 회원이 아닌 경우 뜨는 화면
%>
<TR><TD align='center'><font size='2'>login.</font></td></tr>
<tr><td align='center'><a href="main.jsp">[login]</a></td></tr>
<%}%>
</TABLE>   
</div>
</div>

<!--Footer-->
<footer id="main_footer">
   <p>1600 Amphitheatre Parkway Mountain View, CA 64023 T. +1 650 238 2999<p>
   <p>Â© 2016 Petite Mariee, Inc. All Rights Reserved.<p>
</footer>              
</BODY>                     
</HTML>

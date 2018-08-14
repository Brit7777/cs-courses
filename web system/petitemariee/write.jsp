<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%request.setCharacterEncoding("euc-kr");%>
<HTML>
<HEAD>
<TITLE> QnA </TITLE>
	<meta charset="UTF-8"/>
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
   </script>
</header>

<!--Content-->
<SCRIPT language="JavaScript">
function Check() {
if (Write.title.value.length < 1) {//title 媛� 寃���. 1蹂대�� ���� 寃쎌��, 媛��� ���쇰��濡� alert() �ㅽ��
	alert("insert title");
	Write.write_title.focus(); //java script �댁�ν�⑥��. 而ㅼ���� ��移� �ㅼ�� ����
	return false; //�� 媛��� ��踰�濡� ���≫��吏� ����
    }
if (Write.password.value.length < 1) {//title 媛� 寃���. 1蹂대�� ���� 寃쎌��, 媛��� ���쇰��濡� alert() �ㅽ��
	alert("insert password");
	Write.write_password.focus(); //java script �댁�ν�⑥��. 而ㅼ���� ��移� �ㅼ�� ����
	return false; //�� 媛��� ��踰�濡� ���≫��吏� ����
    }
if (Write.contents.value.length < 1) {
	alert("insert content");
	Write.contents.focus(); 
	return false;
    }
Write.submit(); //���� 紐⑤�� 議곌굔�� �대�밸��吏� ���� �� ���λ��� 媛��� ��踰�濡� ����
}

</SCRIPT>

<center><font style="color:#FF6666; font-size:30px;" ><b> QnA </b></font>                   
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>
<FORM Name='Write' Action='write_input.jsp' Method='post' OnSubmit='return Check()'>
<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
	<TR>
		<TD width='150' bgcolor='ivory'>
			<font size='2'><center><b>title</b></center></font>
		</TD>
		<TD>
			<font size='2'>
			<input type="text" size='70' maxlength='50' name=title ></font>
		</TD>
	</TR>
	<TR>
		<TD width='150' bgcolor='ivory'>
			<font size='2'><center><b>password</b></center></font>
		</TD>
		<TD>
			<font size='2'>
			<input type="password" size='70' maxlength='50' name=password ></font>
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

<!--Footer-->
<footer id="main_footer">
   <p>1600 Amphitheatre Parkway Mountain View, CA 64023 T. +1 650 238 2999<p>
   <p>�짤 2016 Petite Mariee, Inc. All Rights Reserved.<p>
</footer>
</BODY>
</HTML>
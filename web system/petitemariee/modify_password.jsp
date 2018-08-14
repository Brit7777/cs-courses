<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>modify</title>
    <meta charset="UTF-8"/>
   <link rel=stylesheet href="delete.css"/>
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

   function modifyCheck()
     {
      if(Modify_password.password.value.length < 1 )
      {
       alert( "insert password" );
       Modify_password.password.focus();
       return false;
      }
      else
    	  Modify_password.submit();
     } 
  
   </script>
   <%
 	int num = Integer.parseInt(request.getParameter("num"));
 %>
</header>

<!--Content-->
<div id="content">
<div id="content_box">
<center>
<table>
<form name=modify method=post action="modifyConfirm.jsp?num=<%=num%>" OnSubmit='return modifyCheck()'>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr text-align:center;">
      <td width="5"></td>
      <td align="center" font style="color:#FF6666;font-size:50px;">Edit</td>
      <td width="5"></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">password</td>
      <td><input name="password" type="password" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type="submit" value="submit">
       <input type=button value="cancel"  OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 </center>
 
<!--Footer-->
<footer id="main_footer">
   <p>1600 Amphitheatre Parkway Mountain View, CA 64023 T. +1 650 238 2999<p>
   <p>�짤 2016 Petite Mariee, Inc. All Rights Reserved.<p>
</footer>              
</BODY>                     
</HTML>
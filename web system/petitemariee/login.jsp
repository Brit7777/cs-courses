<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Page</title>
   <meta charset="UTF-8"/>
   <link rel=stylesheet href="login.css"/>
   <link rel=stylesheet href="dropdown.css"/>
   <style>
   </style>

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
             <a href="etc.html">ETC.</a>
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
	<img src="membershiplogin.png" alt="Membership Image" height="20px" border="0">
	<span style="font-size:20px;font-weight:bold;color:#555555;">MEMBERSHIP LOGIN</span>
	<hr color="#E3E3E3">
	<div id="content_box">
		<div id="login_box">
		<form action="loginProcess.jsp" method="post" name="loginProcess"> 
			<span style="padding-left:75px;margin:10px;font-weight:bold;font-size:20px;color:#555555">Member Login</span>
			<table id="table1">
				<tr>
					<td><span style="color:#FFA07A;font-size:20px;float:right">ID </span></td>
					<td><input type="text" name="id"></td>
					<td rowspan="2"><input type="image" src="login_btn.png" alt="Submit" width="80"></td>
				</tr>
				<tr>
					<td><span style="color:#FFA07A;font-size:20px;">Password </span></td>
					<td><input type="password" name="pw"></td>
					<td></td>
				</tr>
			</table>
			<table id="table2">
				<tr>
					<td><span style="color:#848484;">NEW CUSTOMERS >> </span></td>
					<td><a href="registerForm.jsp"><img src="register.png" alt="Register Image" height="30" border="0"></a></td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</div>






<!--Footer-->
<footer id="main_footer">
   <p>1600 Amphitheatre Parkway Mountain View, CA 64023 T. +1 650 238 2999<p>
   <p>© 2016 Petite Mariee, Inc. All Rights Reserved.<p>
</footer>

</body>
</html>
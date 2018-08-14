<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>RegisterForm Page</title>
   <meta charset="UTF-8"/>
   <link rel=stylesheet href="registerForm.css"/>
   <link rel=stylesheet href="dropdown.css"/>
   <style>
    th, td {
      padding: 10px;
      text-align: left;
    }
    th{width:20%;}
   </style>


</head>
<body>

<form action="register.jsp" method="post">
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
      <li><a href='listform.jsp'>Q&A</a></li>
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
  <span style="font-size:20px;font-weight:bold;color:#555555;">REGISTER FORM</span>
  <div id="content_box">
    <div id="register_box">
    <form action="index.html" method="post">
    <table border="1" cellpadding="0" cellspacing="0" bordercolor="#B7B7B7" width="1190">
    <col width="150">
    <tr>
      <th bgcolor="#FFEFDB">ID</th>
      <td><input type="text" name="id" size="30"></td>
    </tr>
    <tr>
      <th bgcolor="#FFEFDB">Password</th>
      <td><input type="password" name="password" size="30"> (6-character minimum)</td>
    </tr>
    <tr>
      <th bgcolor="#FFEFDB">Name</th>
      <td colspan="3"><input type="text" name="name" size="30"></td>
    </tr>
    <tr>
      <th bgcolor="#FFEFDB">E-mail</th>
      <td colspan="3"><input type="text" name="email" size="40"></td>
    </tr>
    <tr>
      <td colspan="4" align="center"><input type="image" src="register.png" alt="Submit" width="100"></td>
    </tr>
    </table>
    </form>
    </div>
  </div>
</div>


<!--Footer-->
<footer id="main_footer">
   <p>1600 Amphitheatre Parkway Mountain View, CA 64023 T. +1 650 238 2999<p>
   <p>� 2016 Petite Mariee, Inc. All Rights Reserved.<p>
</footer>

</body>
</html>
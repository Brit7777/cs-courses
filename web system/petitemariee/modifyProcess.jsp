<%@ page import = "java.sql.*, java.util.*" contentType = "text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
int num = Integer.parseInt(request.getParameter("num"));
String title  = request.getParameter("title");
String contents  = request.getParameter("contents");
contents = contents.replaceAll("\r\n", "<br>");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;		
// 관리자 Login
String url = "jdbc:mysql://203.252.195.138:3306/petitemariee?useSSL=false";
String id = "petitemariee";
String pwd ="noanswer";

// 연결
conn = DriverManager.getConnection(url, id, pwd);
PreparedStatement pstmt = null;
// Calendar 클래서는 Date 오브젝과 각 날짜, 시간을 표시하는 정수필드 사이의 변환을 위한 추상 클래스 
// 년-월-일 시간:분:초 문자열이 변수 indate에 저장
Calendar dateIn = Calendar.getInstance(); // 디폴트 타임존과 지정된 로케일을 사용해 달력을 리턴
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-"; //0~11의 리턴 값을 방지하기 위해 +1
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

String strSQL = "SELECT * FROM fboard WHERE num=?"; // fboard 테이블의 num필드의 최대값 리턴
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, num);
ResultSet rs = pstmt.executeQuery();
rs.next();
String userID = rs.getString("userID");
String writedate = rs.getString("writedate");
int readcount = rs.getInt("readcount");
String password = rs.getString("password");
int ref = rs.getInt("ref");
int indent = rs.getInt("indent");
int step = rs.getInt("step");
num = rs.getInt(1);	

// 입력정보를 INSERT 문을 이용해 입력. 
strSQL ="REPLACE INTO fboard(num, userID, title, contents, writedate, readcount,password,ref,indent,step)";
strSQL = strSQL + "VALUES (?, ?, ?, ?, ?, ?,?, ?, ?,?)";
pstmt = conn.prepareStatement(strSQL); // PrepareStatement 클래스를 이용해 SQL문을 미리 만들어 ?로 된 곳에 해당하는 변수를 입력
pstmt.setInt(1, num); // SQL 문에 해당하는 변수를 사용해 대입
pstmt.setString(2, userID);
pstmt.setString(3, title);
pstmt.setString(4, contents);
pstmt.setString(5, indate);
pstmt.setInt(6, readcount);
pstmt.setString(7,password);
pstmt.setInt(8, ref);
pstmt.setInt(9, indent);
pstmt.setInt(10, step);
pstmt.executeUpdate();
// 관련 작업 DB 연결해제. 객체 리소스 해제
rs.close();               	
pstmt.close();
conn.close();
%>
<script>alert("successfully modified!")</script><%
response.sendRedirect("listboard.jsp"); 
%>
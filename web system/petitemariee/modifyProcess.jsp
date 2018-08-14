<%@ page import = "java.sql.*, java.util.*" contentType = "text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
int num = Integer.parseInt(request.getParameter("num"));
String title  = request.getParameter("title");
String contents  = request.getParameter("contents");
contents = contents.replaceAll("\r\n", "<br>");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;		
// ������ Login
String url = "jdbc:mysql://203.252.195.138:3306/petitemariee?useSSL=false";
String id = "petitemariee";
String pwd ="noanswer";

// ����
conn = DriverManager.getConnection(url, id, pwd);
PreparedStatement pstmt = null;
// Calendar Ŭ������ Date �������� �� ��¥, �ð��� ǥ���ϴ� �����ʵ� ������ ��ȯ�� ���� �߻� Ŭ���� 
// ��-��-�� �ð�:��:�� ���ڿ��� ���� indate�� ����
Calendar dateIn = Calendar.getInstance(); // ����Ʈ Ÿ������ ������ �������� ����� �޷��� ����
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-"; //0~11�� ���� ���� �����ϱ� ���� +1
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

String strSQL = "SELECT * FROM fboard WHERE num=?"; // fboard ���̺��� num�ʵ��� �ִ밪 ����
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

// �Է������� INSERT ���� �̿��� �Է�. 
strSQL ="REPLACE INTO fboard(num, userID, title, contents, writedate, readcount,password,ref,indent,step)";
strSQL = strSQL + "VALUES (?, ?, ?, ?, ?, ?,?, ?, ?,?)";
pstmt = conn.prepareStatement(strSQL); // PrepareStatement Ŭ������ �̿��� SQL���� �̸� ����� ?�� �� ���� �ش��ϴ� ������ �Է�
pstmt.setInt(1, num); // SQL ���� �ش��ϴ� ������ ����� ����
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
// ���� �۾� DB ��������. ��ü ���ҽ� ����
rs.close();               	
pstmt.close();
conn.close();
%>
<script>alert("successfully modified!")</script><%
response.sendRedirect("listboard.jsp"); 
%>
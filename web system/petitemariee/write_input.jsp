<%@ page import = "java.sql.*, java.util.*" contentType = "text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
String userID   = (String) session.getAttribute("user_id");
String title  = request.getParameter("title");
String password  = request.getParameter("password");
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

String strSQL = "SELECT Max(num) FROM fboard"; // fboard ���̺��� num�ʵ��� �ִ밪 ����
pstmt = conn.prepareStatement(strSQL);
ResultSet rs = pstmt.executeQuery();
int num = 1;

if (!rs.wasNull()){ //������ ���� ���� null���� �ƴ��� boolean������ ����
	rs.next(); // null ���� �ƴϸ� ���̺� �����Ͱ� ����� �ִٴ� �ǹ�
	num = rs.getInt(1)+1;	
} // num ���� ������ �� 1�� ���� ������ ����. ����ڰ� �Խù��� ����� �� ���� ������ ������ ����ǹǷ� num���� +1 �� ����
// �Է������� INSERT ���� �̿��� �Է�. 
strSQL ="INSERT INTO fboard(num, userID, title, contents, writedate, readcount,password,ref,indent,step)";
strSQL = strSQL + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
pstmt = conn.prepareStatement(strSQL); // PrepareStatement Ŭ������ �̿��� SQL���� �̸� ����� ?�� �� ���� �ش��ϴ� ������ �Է�
pstmt.setInt(1, num); // SQL ���� �ش��ϴ� ������ ����� ����
pstmt.setString(2, userID);
pstmt.setString(3, title);
pstmt.setString(4, contents);
pstmt.setString(5, indate);
pstmt.setInt(6, 0);
pstmt.setString(7, password);
pstmt.setInt(8,0);
pstmt.setInt(9,0);
pstmt.setInt(10,0);
pstmt.executeUpdate();
// ���� �۾� DB ��������. ��ü ���ҽ� ����
rs.close();
pstmt.close();                	
conn.close();
response.sendRedirect("listboard.jsp"); 
%>

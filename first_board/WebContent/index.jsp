<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.util.regex.Pattern"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� �����</title>
</head>

<%
	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		ResultSet rs = null;
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url,"GONG","852456");
		out.print("Oracle DB connection success");
		
		Statement stmt = con.createStatement();
		String sql = "select * from board1 order by idx desc";
		
		rs = stmt.executeQuery(sql);
	
%>
		

	


<body>

<h1>�Խñ� ����Ʈ</h1>
	<table>
		<tr>
			<th>��ȣ</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>��¥</th>
			<th>��ȸ��</th>
		</tr>
<% 		
	while(rs.next()){
		out.print("<tr>");
		out.print("<td>" + rs.getString(1) + "</td>");	
		out.print("<td><a href='content.jsp?idx="+ rs.getString(1) +"'>" + rs.getString(2) + "</td>");	
		out.print("<td>" + rs.getString(3) + "</td>");	
		out.print("<td>" + rs.getString(4) + "</td>");	
		out.print("<td>" + rs.getString(5) + "</td>");	
		out.print("</tr>");
	}	
	
%>
</table>
<a href="Write.jsp">�۾���</a>

<%
con.close();

	}catch (Exception e) {
	out.println("Oracle DB connection lost<hr>");
	out.println(e.getMessage());
	e.printStackTrace();
}

%>




</body>
</html>
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

	String idx = request.getParameter("idx");

	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		ResultSet rs = null;
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url,"GONG","852456");
		out.print("Oracle DB connection success");
		
		Statement stmt = con.createStatement();
		String sql = "select * from board1 where idx=" + idx;
		
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			
			
	
%>
		

	


<body>

<h1>�Խñ� ��ȸ</h1>
	<table border = "1">
		<tr>
			<th>��ȣ</th>
			<td><%=rs.getString("idx")%></td>
			<th>�ۼ���</th>
			<td><%=rs.getString("writer") %></td>
			<th>��¥</th>
			<td><%=rs.getString("regdate") %></td>
			<th>��ȸ��</th>
			<td><%=rs.getString("count") %></td>
		</tr>
		<tr>
			<th colspan="2">����</th>
			<td colspan="6"><%=rs.getString("title") %></td>
		
		</tr>
		<tr>
			<th colspan="2">����</th>
			<td colspan="6"><%= rs.getString("content") %></td>
		
		</tr>
		

</table>

<a href="delete.jsp?idx=<%=rs.getString("idx")%>">����</a>
<a href="insert.jsp">�������</a>



<%
		}
con.close();

	}catch (Exception e) {
	out.println("Oracle DB connection lost<hr>");
	out.println(e.getMessage());
	e.printStackTrace();
}

%>




</body>
</html>
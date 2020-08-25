<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.util.regex.Pattern"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 만들기</title>
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

<h1>게시글 조회</h1>
	<table border = "1">
		<tr>
			<th>번호</th>
			<td><%=rs.getString("idx")%></td>
			<th>작성자</th>
			<td><%=rs.getString("writer") %></td>
			<th>날짜</th>
			<td><%=rs.getString("regdate") %></td>
			<th>조회수</th>
			<td><%=rs.getString("count") %></td>
		</tr>
		<tr>
			<th colspan="2">제목</th>
			<td colspan="6"><%=rs.getString("title") %></td>
		
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="6"><%= rs.getString("content") %></td>
		
		</tr>
		

</table>

<a href="delete.jsp?idx=<%=rs.getString("idx")%>">삭제</a>
<a href="insert.jsp">목록으로</a>



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
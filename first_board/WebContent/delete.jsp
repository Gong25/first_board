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
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","GONG","852456");
		out.print("Oracle DB connection success");
		
		Statement stmt = con.createStatement();
		String sql = "delete from board1 where idx=" + idx;
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
		}
		con.close();

			}catch (Exception e) {
			out.println("Oracle DB connection lost<hr>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
			
	
%>
		
<script>
	alert("삭제되었습니다");
	location.href="redirect.jsp";

</script>
	
	
	


<body>


</body>
</html>
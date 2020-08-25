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
<body>
<%
	request.setCharacterEncoding("euc-kr");

	int idx = 1;
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String regdate = request.getParameter("regdate");
	int count = 10000;
	String content = request.getParameter("content");
	
	if(title == "" || writer == null){
		out.println("title�� null�Դϴ�");
	}
	if(writer == "" || writer == null){
		out.println("writer�� null�Դϴ�");
	}
	else if (!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$",writer)){
			out.print("�̸��� ������ �ƴմϴ�");
		}
	if(regdate == "" || regdate == null){
		out.println("regdate�� null�Դϴ�");
	}
	else if (!Pattern.matches("^[0-9]*$",regdate)){
		out.print("���������� �ƴմϴ�");
	}
	
	if (content == "" || content == null){
		out.print("content�� null�Դϴ�");
	}
	
	try{
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url,"GONG","852456");
		out.print("Oracle DB�� ���������� �����߽��ϴ�");
		Statement stmt = con.createStatement();
			String sql = "INSERT INTO BOARD1" +
						"(IDX,TITLE,WRITER,REGDATE,COUNT,CONTENT)"+
						"VALUES(board_seq.nextval,'"+title+"','"+writer+"',sysdate,"+count+",'"+content+"')";
		stmt.executeUpdate(sql);
		con.close();
	} catch (Exception e){
		out.print("Oracle DB���ӿ� ������ �ֽ��ϴ� <hr>");
		out.print(e.getMessage());
		e.printStackTrace();
	}
	finally {
		out.print("<script>location.href='index.jsp';</script>");
	}
	
	
	
%>







</body>
</html>
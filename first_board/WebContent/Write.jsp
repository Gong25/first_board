<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name = "form01" method = "post" action = "insert.jsp" onsubmit = "return formCheck()">
제목 &nbsp;&nbsp;&nbsp;: <input type="text" name="title" /><br><br>
작성자 : <input type="text" name="writer" /><br><br>
내용 &nbsp;&nbsp; : <textarea name="content" rows="4" cols="50"></textarea><br><br>


<input type="submit">

<script>
function formCheck(){
	var title = document.form01.title;
	var writer = document.form01.writer;
	var content = document.form01.content;
	
	
	if(title.value == null || title.value ==""){
		alert("제목을 입력하세요");
		title.focus();
		return false;
	}
	if(writer.value == null || writer.value ==""){
		alert("작성자를 입력하세요");
		writer.focus();
		return false;
	}
	if(content.value == null || content.value ==""){
		alert("내용을 입력하세요");
		content.focus();
		return false;
	}
	
	
	
}



</script>



</form>
</body>
</html>
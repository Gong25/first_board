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
���� &nbsp;&nbsp;&nbsp;: <input type="text" name="title" /><br><br>
�ۼ��� : <input type="text" name="writer" /><br><br>
���� &nbsp;&nbsp; : <textarea name="content" rows="4" cols="50"></textarea><br><br>


<input type="submit">

<script>
function formCheck(){
	var title = document.form01.title;
	var writer = document.form01.writer;
	var content = document.form01.content;
	
	
	if(title.value == null || title.value ==""){
		alert("������ �Է��ϼ���");
		title.focus();
		return false;
	}
	if(writer.value == null || writer.value ==""){
		alert("�ۼ��ڸ� �Է��ϼ���");
		writer.focus();
		return false;
	}
	if(content.value == null || content.value ==""){
		alert("������ �Է��ϼ���");
		content.focus();
		return false;
	}
	
	
	
}



</script>



</form>
</body>
</html>
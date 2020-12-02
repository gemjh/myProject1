<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제하기</title>
</head>
<body>
<form:form action="delete.do" commandName="commandVO">
	<form:hidden path="mus_rate"/>
	<h2>삭제하시겠습니까?</h2>
	<div class="align-center">
		<input type="submit" value="삭제">
		<input type="button" value="뒤로가기" onclick="history.go(-1)">
	</div>
</form:form>
</body>
</html>
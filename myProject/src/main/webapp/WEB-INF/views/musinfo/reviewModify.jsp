<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>

<form:form commandName="CommentsVO" action="modify.do" enctype="multipart/form-data">
	<form:hidden path="rev_num"></form:hidden>
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="content">내용</label>
				<form:textarea path="comment"/>
				<form:errors path="comment" cssClass="error-color"/>
			</li>
			
		</ul>
			<input type="submit" value="전송">
			<input type="button" value="뒤로가기" onclick="history.go(-1)">
			
	</form:form>					
</body>
</html>
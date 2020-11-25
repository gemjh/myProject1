<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>
<c:if test="${!empty member&& member.mem_num==board.mem_num}">	<!-- 로그인이 되어 있고 작성자 아이디와 로그인 아이디가 일치해야 수정/삭제 권한을 줌 -->
			<input type="button" value="수정" onclick="location.href='update.do?board_num=${board.board_num}'">
			<input type="button" value="삭제" id="delete_btn" onclick="location.href='delete.do?board_num=${board.board_num}'">
			
			
		</c:if>
</body>
</html>
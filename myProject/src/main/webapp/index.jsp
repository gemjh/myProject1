<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 페이지</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/main/main.do">메인페이지</a><br>
<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=100">뮤지컬페이지</a><br>
<a href="${pageContext.request.contextPath}/admin/adminMain.do">관리자페이지</a><br>
<a href="${pageContext.request.contextPath}/member/memberMain.do">회원페이지</a><br>
</html>   

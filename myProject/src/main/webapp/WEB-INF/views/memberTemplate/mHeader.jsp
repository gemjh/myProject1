<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<h2 class="align-center">회원 MyPage 페이지</h2>
<div class="align-right">
	<c:if test="${!empty user && !empty user.mem_imagename}">
	<img src="${pageContext.request.contextPath}/member/imageView.do" width="25" height="25" class="my-image">
	</c:if>
	<c:if test="${!empty user && empty user.mem_imagename}">
	<img src="${pageContext.request.contextPath}/webapp/resources/images/blank.gif" width="25" height="25" class="my-image">
	</c:if>
	<c:if test="${!empty user}">
	[<span>${user.email}</span>]<br>
	<a href="${pageContext.request.contextPath}/member/memberMain.do">마이페이지</a>
	<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
	</c:if>
	
	<!-- 
	
	뮤챠 로그인 안하고 직접 URL로 마이페이지 접속 가능한가?
	그거 확인하고 못하면 빼버리면됨 로그인여부체크.
	
	로그인 안한 경우 페이지에 접속 못하게하고싶은데..
	
	 -->
	<c:if test="${empty user}">
	<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
	<a href="${pageContext.request.contextPath}/member/join.do">회원가입</a>	
	</c:if>
	<a href="${pageContext.request.contextPath}/index.jsp">홈으로</a>
	<br>
	<!--
	
	로그인한 경우,
	${user.nickname} / ${user.expire_date}가져와서 표시해야함 
	 
	 -->
	<c:if test="${!empty user}">
		[${user.nickname}님의 이용권 만료일 : ${user.expire_date}]	
	</c:if>
</div>











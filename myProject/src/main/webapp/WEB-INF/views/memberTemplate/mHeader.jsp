<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<h2 class="align-center">회원 MyPage 페이지</h2>
<div class="align-right">

	<!-- 프로필 이미지 표시 -->
	<!-- 이미지가 있는 경우 -->
	<c:if test="${!empty user && !empty user.mem_imagename}">
		<img src="${pageContext.request.contextPath}/member/imageView.do" width="25px" height="25px" class="my-image">
	</c:if>
	<!-- 이미지가 없는 경우 -->
	<c:if test="${!empty user && empty user.mem_imagename}">
		<img src="${pageContext.request.contextPath}/resources/images/blank.gif" width="25px" height="25px" class="my-image">
	</c:if>
	<!-- auth값에 따라 다른 링크 만들어주기 0:관리자 1-2:회원 -->
	<!-- 관리자인 경우 -->
	<c:if test="${!empty user && user.auth == 0}">
		[관리자 계정으로 접속!]<br>
		<a href="${pageContext.request.contextPath}/admin/adminMain.do">관리 페이지</a>
		<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
	</c:if>
	
	<!-- 회원인경우 -->
	<c:if test="${!empty user && user.auth > 0 }">
		[${user.nickname}]님 접속 !<br>
		<a href="${pageContext.request.contextPath}/member/memberMain.do">마이페이지</a>
		<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
		<a href="${pageContext.request.contextPath}/index.jsp">홈으로</a><br>
			<!-- 이용권 결제한 경우 -->
			<c:if test="${!empty user.purchase_date}">
				[<span>${user.nickname}님의 이용권 만료일 : ${user.expire_date}</span>] 
			</c:if>

	</c:if>
	
	<!-- 로그인해야하는 경우 -->
	<c:if test="${empty user}">
	<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
	<a href="${pageContext.request.contextPath}/member/join.do">회원가입</a>	
	<a href="${pageContext.request.contextPath}/index.jsp">홈으로</a>
	</c:if>
	<br>
	
	
	<!-- 
	
	뮤챠 로그인 안하고 직접 URL로 마이페이지 접속 가능한가?
	그거 확인하고 못하면 빼버리면됨 로그인여부체크.
	
	로그인 안한 경우 페이지에 접속 못하게하고싶은데..
	
	 -->
	<!--
	
	로그인한 경우,
	${user.nickname} / ${user.expire_date}가져와서 표시해야함 
	 
	 -->

</div>











<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/header.css">

<div class="align-left">
	<ul id="main_nav">
		<li><a
			href="${pageContext.request.contextPath}/main/musMain.do"> 
			<img src="${pageContext.request.contextPath}/resources/css/admin/mucha.png" alt="mucha">
		</a></li>
		<li>
			<h3>장르별 카테고리</h3>
			<ul class="sub_nav">
				<li>
				<a href="${pageContext.request.contextPath}/admin/adminMain.do">라이선스</a></li>
				<li><a href="#">오리지널</a></li>
				<li><a href="#">창작</a></li>
				<li><a href="#">가족/어린이</a></li>
				<li><a href="#">퍼포먼스</a></li>
			</ul>
		</li>
		<li>
			<ul class="search">
				<li>
				<form action="adminMusicalList.do" id="search_form" method="get">	
				<input type="text" name="keyword" id="keyword">
				<input type="submit" value="찾기">
				</form>
				</li>
			</ul>
		</li>

	</ul>
</div>
<div class="align-center">

</div>
<div class="align-right">
	
		<!-- 프로필 이미지 표시 -->
	<!-- 이미지가 있는 경우(관리자는 해당x) -->
	<c:if test="${!empty user && user.auth > 0 }">
	<c:if test="${!empty user && !empty user.mem_imagename}">
		<img src="${pageContext.request.contextPath}/member/imageView.do" width="25" height="25" class="my-image">
	</c:if>
	<!-- 이미지가 없는 경우 -->
	<c:if test="${!empty user && empty user.mem_imagename}">
		<img src="${pageContext.request.contextPath}/resources/images/blank.gif" width="25" height="25" class="my-image">
	</c:if>
	</c:if>
	<!-- auth값에 따라 다른 링크 만들어주기 0:관리자 1-2:회원 -->
	<!-- 관리자인 경우 -->
	<c:if test="${!empty user && user.auth == 0}">
		[관리자 계정 "${user.nickname}" 접속]<br>
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

</div>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/header.css">
<c:if test="${!empty user && user.auth == 0}">
<ul>
	<li><h4>관리자 관리</h4></li>
	<li><a href="${pageContext.request.contextPath}/admin/adminManagerList.do">-전체 관리자 계정 보기</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/adminPlus.do">-관리자 계정 추가</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/adminMemberModify.do">-내 정보 수정</a></li>
	<li><h4>뮤지컬 관리</h4></li>
	<li><a href="${pageContext.request.contextPath}/admin/adminMusicalRegister.do">-뮤지컬 등록</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/adminMusicalList.do">-등록된 뮤지컬 관리</a></li>
	<li><h4>회원관리</h4></li>
	<li><a href="${pageContext.request.contextPath}/admin/adminMemberList.do">-회원 정보 보기</a></li>
	
	<li><h4><a href="${pageContext.request.contextPath}/admin/noticeList.do">공지사항 관리</a></h4></li>
</ul>
</c:if>
<c:if test="${!empty user && user.auth > 0 }">
<ul>
	<li><a href="${pageContext.request.contextPath}/member/modifyMember.do">회원정보 변경</a></li>
	<li><a href="${pageContext.request.contextPath}/member/changePassword.do">비밀번호 변경</a><li>
	<li><a href="${pageContext.request.contextPath}/member/modifyPrefer.do">선호장르 변경</a><li>
	<li><a href="${pageContext.request.contextPath}/member/myImage.do">프로필 이미지 변경</a></li>
	<li><a href="${pageContext.request.contextPath}/member/ticket.do">이용권 구매</a><li>
	<li><a href="${pageContext.request.contextPath}/member/deleteMember.do">회원 탈퇴</a><li>
	<li><a href="${pageContext.request.contextPath}/?????"></a>너의 문의내역</li>
	<li><a href="${pageContext.request.contextPath}/?????"></a>너의 찜 목록</li>
	<li><a href="${pageContext.request.contextPath}/?????"></a>너의 리뷰</li>
</ul>
</c:if>
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
				<input type="text" name="keyword" id="keyword" placeholder="제목, 배우로 검색해보세요.">
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
		<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="25" height="25" class="my-image">
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











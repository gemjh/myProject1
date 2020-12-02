<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
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
	<li><a href="${pageContext.request.contextPath}/member/myImage.do">프로필 이미지 변경</a></li>
	<li><a href="${pageContext.request.contextPath}/member/ticket.do">이용권 구매</a><li>
	<li><a href="${pageContext.request.contextPath}/member/deleteMember.do">회원 탈퇴</a><li>
	<li><a href="${pageContext.request.contextPath}/?????"></a>너의 문의내역</li>
	<li><a href="${pageContext.request.contextPath}/?????"></a>너의 찜 목록</li>
	<li><a href="${pageContext.request.contextPath}/?????"></a>너의 리뷰</li>
</ul>
</c:if>
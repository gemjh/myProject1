<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<ul>
	<li><h3>관리자 메뉴</h3></li>
	<li><h4>뮤지컬 관리</h4></li>
	<li><a href="${pageContext.request.contextPath}/admin/adminMusicalRegister.do">-뮤지컬 등록</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/adminMusicalList.do">-등록된 뮤지컬 관리</a></li>
	<li><h4>회원관리</h4></li>
	<li><a href="${pageContext.request.contextPath}/admin/adminMemberList.do">-회원 정보 보기</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/adminConsultList.do">-회원 문의 내역</a></li>
	<li><h4><a href="${pageContext.request.contextPath}/admin/list.do">공지사항 관리</a></h4></li>
</ul>
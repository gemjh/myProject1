<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<div class="page-main-style">
	<h2>관리자 정보 상세 보기</h2>
	<table>
		<tr>
			<th>관리자 번호</th>
			<td>${memberVO.mem_num}</td>
		</tr>
		<tr>
			<th>관리자 이메일</th>
			<td>${memberVO.email}</td>
		</tr>
		<tr>
			<th>관리자 닉네임</th>
			<td>${memberVO.nickname}</td>
		</tr>
		<tr>
			<th>관리자 전화번호</th>
			<td>${memberVO.phone}</td>
		</tr>
		<tr>
			<th>관리자 생년월일</th>
			<td>${memberVO.birth}</td>
		</tr>
		<tr>
			<th>관리자 등록일</th>
			<td>${memberVO.mem_regdate}</td>
		</tr>
	</table>
	<c:if test="${admin.mem_num=='100'}">
	<div class="align-center">
		<input type="button" value="삭제" onclick="location.href='adminDelete.do?mem_num=${memberVO.mem_num}'">
	</div>
	</c:if>
</div>
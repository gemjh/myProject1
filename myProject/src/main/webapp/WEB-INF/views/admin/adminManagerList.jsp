<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<style>
.button {
	border:0;
	outline:0;
	background-color: white;
	color: #black;
	
}
.button:hover {
	background-color: #d9534f;
	color: #fff;
}
</style>
<div class="page-main-style">
	<h2>관리자 목록</h2>
	<form action="adminManagerList.do" id="search_form" method="get">
	<ul class="search">
		<li>
			<select name="keyfield" id="keyfield">
				<option value="1">회원번호</option>
				<option value="2">닉네임</option>
				<option value="3">이메일</option>
				<option value="4">전체</option>
			</select>
			
		</li>
		<li>
			<input type="text" name="keyword" id="keyword">
		</li>
		<li>
			<input type="submit" value="찾기" class="button">
			<input type="button" value="목록" class="button"
						onclick="location.href='adminManagerList.do'">
		</li>
	</ul>
	</form>
	<div class="align-right">
		<c:if test="${!empty user}">
			<input type="button" value="관리자 추가" class="button" onclick="location.href='adminPlus.do'">
		</c:if>
	</div>
	<c:if test="${count==0}">
	<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
	<div>
	검색된 총 회원 수 : ${count}
	</div>
	<table>
		<tr>
			<th width="130">관리자 번호</th>
			<th>닉네임</th>
			<th>이메일 주소</th>
		</tr>
		<c:forEach var="member_detail" items="${list}">
		<tr>
			<td>${member_detail.mem_num}</td>
			<td><a href="adminManagerDetail.do?mem_num=${member_detail.mem_num}">${member_detail.nickname}</a></td>
			<td><a href="mailto:">${member_detail.email}</a></td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>
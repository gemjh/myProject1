<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<div class="page-main-style">
	<h2>회원 목록</h2>
	<form action="adminMemberList.do" id="search_form" method="get">
	<ul class="search">
		<li>
			<select name="keyfield" id="keyfield">
				<option value="mem_num">회원번호</option>
				<option value="nicknaame">닉네임</option>
				<option value="email">이메일</option>
				<option value="all">전체</option>
			</select>
		</li>
		<li>
			<input type="text" name="keyword" id="keyword">
		</li>
		<li>
			<input type="submit" value="찾기">
			<input type="button" value="목록"
						onclick="location.href='adminMemberList.do'">
		</li>
	</ul>
	</form>
	<c:if test="${count==0}">
	<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
	<table>
		<tr>
			<th width="130">회원 번호</th>
			<th>닉네임</th>
			<th>이메일 주소</th>
		</tr>
		<c:forEach var="member_detail" items="${list}">
		<tr>
			<td>${member_detail.mem_num}</td>
			<td><a href="adminMemberDetail.do?mem_num=${member_detail.mem_num}">${member_detail.nickname}</a></td>
			<td>${member_detail.email}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${paginHtml}</div>
	</c:if>
</div>
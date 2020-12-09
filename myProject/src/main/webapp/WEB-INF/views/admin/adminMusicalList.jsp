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
	<h2>등록된 뮤지컬 리스트</h2>
	<form action="adminMusicalList.do" id="search_form" method="get">
	<ul class="search">
		<li>
			<select name="keyfield" id="keyfield">
				<option value="1">뮤지컬 번호</option>
				<option value="2">뮤지컬 제목</option>
				<option value="3">뮤지컬 장르</option>
				<option value="4">전체</option>
			</select>
		</li>
		<li>
			<input type="text" name="keyword" id="keyword">
		</li>
		<li>
			<input type="submit" value="찾기" class="button">
			<input type="button" value="목록" class="button"
						onclick="location.href='adminMusicalList.do'">
		</li>
	</ul>
	</form>
	<c:if test="${count==0}">
	<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
	<div>
	검색된 총 뮤지컬 수 : ${count}
	</div>
	<table>
		<tr>
			<th width="130">뮤지컬 번호</th>
			<th width="400">뮤지컬 제목</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="musical" items="${list}">
		<tr>
			<td>${musical.mus_num}</td>
			<td><a href="adminMusicalDetail.do?mus_num=${musical.mus_num}">${musical.mus_name}</a></td>
			<td>${musical.mus_regdate}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>
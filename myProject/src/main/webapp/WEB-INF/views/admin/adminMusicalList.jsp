<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<div class="page-main-style">
	<h2>등록된 뮤지컬 리스트</h2>
	<form action="adminMusicalList.do" id="search_form" method="get">
	<ul class="search">
		<li>
			<select name="keyfield" id="keyfield">
				<option value="mus_num">뮤지컬 번호</option>
				<option value="mus_name">뮤지컬 제목</option>
				<option value="all">전체</option>
			</select>
		</li>
		<li>
			<input type="text" name="keyword" id="keyword">
		</li>
		<li>
			<input type="submit" value="찾기">
			<input type="button" value="목록"
						onclick="location.href='adminMusicalList.do'">
		</li>
	</ul>
	</form>
	<c:if test="${count==0}">
	<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
	<table>
		<tr>
			<th width="130">뮤지컬 번호</th>
			<th width="400">뮤지컬 제목</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="musical" items="${list}">
		<tr>
			<td>${musical.mus_num}</td>
			<td><a href="adminMusicalModify.do?mus_num=${musical.mus_num}">${musical.mus_name}</a></td>
			<td>${musical.mus_regdate}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${paginHtml}</div>
	</c:if>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-main-style">
	<h2>메인 목록</h2>
	<c:if test="${count == 0}">
		<div class="align-center">등록된 뮤지컬이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<table>
			<tr>
				<th width="200">뮤지컬 제목</th>
				<th width="200">포스터</th>
				<th>장르</th>
				<th>관람등급</th>
				<th width="400">주연배우</th>
				<th>재생시간</th>
				<th>영상 링크</th>
				<th>평점</th>
				<th>요약 정보</th>
				<th>상세 정보</th>
				<th>등록일</th>
			</tr>
			<c:forEach var="musMain" items="${list}">
				<tr>
					<td><a href="musMainDetail.do?mus_num=${musMain.mus_num}">${musMain.mus_name}</a></td>
					<td>${musMain.id}</td>
					<td>${board.modify_date}</td>
					<td>${board.hit}</td>
				</tr>			
			</c:forEach>
		</table>
		<div class="align-center">${pagingHtml}</div>
	</c:if>	
</div>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-main-style">
	<c:if test="${count == 0}">
		<div class="align-center">등록된 뮤지컬이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<table>
			<c:forEach var="musMain" items="${list}">
				<tr>
					<td><a href="musDetail.do?mus_num=${musMain.mus_num}">${musMain.mus_name}</a></td>
					<td><img src="postView.do?mus_num=${musMain.mus_num}" style="max-width:500px;"></td>
				</tr>			
			</c:forEach>
		</table>		
	</c:if>	
</div>  

<!-- <th>장르</th>
				<th>관람등급</th>
				<th width="400">주연배우</th>
				<th>재생시간</th>
				<th>영상 링크</th>
				<th>평점</th>
				<th>요약 정보</th>
				<th>상세 정보</th>
				<th>등록일</th>
				
				
				<td>${musMain.gen_num}</td>
					<td>${musMain.mus_age}</td>
					<td>${musMain.mus_actor}</td>
					<td>${musMain.mus_time}</td>
					<td>${musMain.mus_video}</td>
					<td>${musMain.mus_rate}</td>
					<td>${musMain.mus_summary}</td>
					<td>${musMain.mus_detail}</td>
					<td>${musMain.mus_regdate}</td>
				
				<div class="align-center">${pagingHtml}</div>
				
				 -->
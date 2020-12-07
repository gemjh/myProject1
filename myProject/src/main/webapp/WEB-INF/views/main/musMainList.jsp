<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="search">
	<c:if test="${count == 0}">
		<div class="align-center">등록된 뮤지컬이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<div class="search_contents_title">검색한 뮤지컬</div>
		<main class="search_first_contents-box search_contents-box">	       				
				<div class="search_type1-contents_contents">
					<c:forEach var="musMain" items="${list}">				
						<div class="search_type1-content-box">
							<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=${musMain.mus_num}">
								<img src="postView.do?mus_num=${musMain.mus_num}" style="max-width:200px;">
								<span class="search_type1-content_title">${musMain.mus_name}</span>
							</a>
						</div>	
					</c:forEach>
				</div>			
		</main>
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
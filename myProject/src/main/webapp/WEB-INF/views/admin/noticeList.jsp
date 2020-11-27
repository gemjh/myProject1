<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-main-style">
	<h2>공지사항</h2>
	<form action="noticeList.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="title">제목</option>
					<option value="nickname">작성자</option>
					<option value="email">이메일</option>
					<option value="all">전체</option>
				</select>
			</li>  
			<li>
				<input type="text" name="keyword" name="keyword">
			</li>
			<li>
				<input type="submit" value="찾기">
				<input type="button" value="목록" onclick="location.href='noticeList.do'">
			</li>
		</ul>
	</form>
	<div class="align-right">
		<c:if test="${!empty user}">
			<input type="button" value="글쓰기" onclick="location.href='noticeWrite.do'">
		</c:if>
	</div>
	<c:if test="${count == 0}">
		<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<table>
			<tr>
				<th>번호</th>
				<th width="400">제목</th>
				<th>작성자</th>
				<th>최근 수정일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="notice" items="${list}">
				<tr>
					<td>${notice.no_num}</td>
					<td><a href="noticeView.do?no_num=${notice.no_num}">${notice.no_title}</a></td>
					<td>${notice.mem_num}</td>
					<td>${notice.no_regdate}</td>
					<td>${notice.no_hit}</td>
				</tr>			
			</c:forEach>
		</table>
		<div class="align-center">${pagingHtml}</div>
	</c:if>	
</div>  
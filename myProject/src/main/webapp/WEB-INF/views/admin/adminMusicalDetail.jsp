<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="page-main-style">
	<h2>뮤지컬 정보 상세 보기</h2>
	<table>
		<tr>
			<th>뮤지컬 번호</th>
			<td>${adminMusicalVO.mus_num}</td>
		</tr>
		<tr>
			<th>장르</th>
			<td>${adminMusicalVO.gen_num}</td>
		</tr>
		<tr>
			<th>등급</th>
			<td>${adminMusicalVO.mus_age}</td>
		</tr>
		<tr>
			<th>뮤지컬 포스터</th>
			<td>${adminMusicalVO.mus_postname}</td>
		</tr>
		<tr>
			<th>요약 정보</th>
			<td>${adminMusicalVO.mus_summary}</td>
		</tr>
		<tr>
			<th>상세 정보</th>
			<td>${adminMusicalVO.mus_detail}</td>
		</tr>
		<tr>
			<th>출연 배우</th>
			<td>${adminMusicalVO.mus_actor}</td>
		</tr>
		<tr>
			<th>스트리밍 비디오 링크</th>
			<td>${adminMusicalVO.mus_video}</td>
		</tr>
		<tr>
			<th>재생 시간</th>
			<td>${adminMusicalVO.mus_time}</td>
		</tr>
	</table>
	<div class="align-center">
		<input type="button" value="수정" onclick="location.href='adminMusicalModify.do?mus_num=${adminMusicalVO.mus_num}'">
		<input type="button" value="삭제" onclick="location.href='adminMusicalDelete.do?mus_num=${adminMusicalVO.mus_num}'">
		<input type="button" value="목록" onclick="location.href='adminMusicalList.do'">
	</div>

</div>
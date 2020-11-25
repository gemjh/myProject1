<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="page-main-style">
	<h2>회원 정보 상세 보기</h2>
	<table>
		<tr>
			<th>회원 번호</th>
			<td>${memberVO.mem_num}</td>
		</tr>
		<tr>
			<th>회원 이메일</th>
			<td>${memberVO.email}</td>
		</tr>
		<tr>
			<th>회원 닉네임</th>
			<td>${memberVO.nickname}</td>
		</tr>
		<tr>
			<th>회원 전화번호</th>
			<td>${memberVO.phone}</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${memberVO.birth}</td>
		</tr>
		<tr>
			<th>회원가입일</th>
			<td>${memberVO.mem_regdate}</td>
		</tr>
		<tr>
			<th>이용권 구매 기간</th>
			<td></td>
		</tr>
	</table>
</div>
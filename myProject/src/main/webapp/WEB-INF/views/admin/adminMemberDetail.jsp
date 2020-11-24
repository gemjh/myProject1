<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="page-main-style">
	<h2>회원 정보 상세 보기</h2>
		<ul>
			<li>
				<label>회원 번호 :</label>
				 ${memberVO.mem_num}
			</li>
			<li>
				<label>회원 이메일 :</label>
				${memberVO.email}
			</li>
			<li>
				<label>회원 닉네임 :</label>
				${memberVO.nickname}
			</li>
			<li>
				<label>회원 전화번호 :</label>
				${memberVO.phone}
			</li>
			<li>
				<label>생년월일 :</label>
				${memberVO.birth}
			</li>
			<li>
				<label>회원가입일 :</label>
				${memberVO.mem_regdate}
			</li>
			<!-- 이용권 구입 넣을까 말까... -->
			<!-- 회원분류 값 넣기... -->
		</ul>
	
</div>
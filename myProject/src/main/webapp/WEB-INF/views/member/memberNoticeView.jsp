<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="page-main-style">
	<h2>${notice.no_title}</h2>
	<ul>
		<li>번호 : ${notice.no_num}</li>
		<li>작성자 : ${notice.mem_num}</li>
		<li>조회수 : ${notice.no_hit}</li>
		<li>작성일 : ${notice.no_regdate}</li>
	</ul>
	<hr size="1" width="100%">
	
	<p>
		${notice.no_content}
	</p>
	<hr size="1" width="100%">
	<div class="align-right">
		<input type="button" value="목록"
		       onclick="location.href='noticeList.do'">
	</div>
</div>








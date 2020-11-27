<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="page-main-style">
	<h2>공지사항 수정</h2>
	<form:form commandName="noticeVO" action="update.do">
	    <form:hidden path="no_num"/>                    
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="title">제목</label>
				<form:input path="title"/>
				<form:errors path="title" cssClass="error-color"/>
			</li>
			<li>
				<label for="content">내용</label>
				<form:textarea path="content"/>
				<form:errors path="content" cssClass="error-color"/>
			</li>
		</ul>	
		<div class="align-center">
			<input type="submit" value="작성">
			<input type="button" value="목록"
			       onclick="location.href='noticeList.do'">
		</div>
	</form:form>
</div>








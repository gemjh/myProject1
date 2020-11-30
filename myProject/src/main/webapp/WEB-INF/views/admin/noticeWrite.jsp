<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#notice_form').submit(function(event){
		var check = 0;
		var blank_pattern = /^\s+|\s+$/g;
		
		var no_title = $("#no_title").val();
		   if(no_title==''||no_title.replace(blank_pattern,'')==""){
		       alert("제목을 입력하세요.");
		       check = 1;
		       return false;
		   }
		 var no_content = $("#no_content").val();
		   if(no_content==''||no_content.replace(blank_pattern,'')==""){
		       alert("내용을 입력하세요.");
		       check = 1;
		       return false;
		   }
		   if(check == 1) return false;
	});


});
</script>
<div class="page-main-style">
	<h2>공지사항 작성</h2>
	<form:form commandName="noticeVO" action="noticeWrite.do" id="notice_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="no_title">제목</label>
				<form:input path="no_title"/>
				<form:errors path="no_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="no_content">내용</label>
				<form:textarea path="no_content"/>
				<form:errors path="no_content" cssClass="error-color"/>
			</li>
		</ul>	
		<div class="align-center">
			<input type="submit" value="작성">
			<input type="button" value="목록"
			       onclick="location.href='noticeList.do'">
		</div>
	</form:form>
</div>








<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js"></script>

<div class="page-main-style">
	<h2>공지사항 수정</h2>
	<form:form commandName="noticeVO" action="noticeUpdate.do">
	    <form:hidden path="no_num"/>                    
		<form:errors element="div" cssClass="error-color"/>
		<div>
			<div>
				<label class="no_title">제목</label>
			</div>
			<form:input path="no_title"/>
		</div>
		<hr>
          <div class="col_c" style="margin-bottom: 30px">
                <div class="input-group">                 
                  <form:textarea path="no_content" />
                  <script type="text/javascript">
					CKEDITOR.replace('no_content', {filebrowserUploadUrl:'/admin/imageUpload.do',height:600});
				</script>
                </div>
                <form:errors path="no_content" cssClass="error-color"/>
            </div> 	
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="목록"
			       onclick="location.href='noticeList.do'">
		</div>
	</form:form>
</div>








<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(
		function() {
			$("#no_title").focus();
			//제목 입력 체크
			$('#notice_form').submit(
				function(event) {
					var no_title = $("#no_title").val();
					var no_content = $("#no_content").val();
					if (no_title == '' || no_title.trim() == '') {
						alert("제목을 입력하세요.");
						$("#no_title").focus();
						return false;
					}
		//게시 종료일 입력 체크
		var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate()); 
		// 한자리수일 경우 0을 채워준다. 
		if(month.length == 1){ 
		  month = "0" + month; 
		} 
		if(day.length == 1){ 
		  day = "0" + day; 
		} 
	
		var getToday = year + month + day;
		if ($("#noticeDate").val() == '') {
			alert("게시물 공개 종료일을 선택하세요");
			return false;
			}
		var noticeDate=$("#noticeDate").val().split("-");
		var noticeYear=noticeDate[0];
		var noticeMonth=noticeDate[1];
		var noticeDay=noticeDate[2];
		noticeDate= noticeYear+noticeMonth+noticeDay;
		if (getToday >= noticeDate) {
			alert("게시물 공개 종료일은 내일 날짜부터 가능합니다.");
			return false;
			}
		});
	});
</script>
<div >
	<h2>공지사항 작성</h2>
	<form:form commandName="noticeVO" action="noticeWrite.do" id="notice_form">
		<form:errors element="div" cssClass="error-color"/>
		<div>
			<div>
				<label for="no_title">제목</label>
			</div>
			<form:input path="no_title"/>
		</div>
		<hr>
          <div class="col_c" style="margin-bottom: 30px">
                <div class="input-group">                 
                  <form:textarea path="no_content" />
                  <script type="text/javascript">
					CKEDITOR.replace('no_content', 
				{filebrowserUploadUrl:'${pageContext.request.contextPath}/admin/imageUpload.do',
				filebrowserImageUploadUrl : '${pageContext.request.contextPath}/admin/imageUpload.do',
						height:600});
				</script>
                </div>
                <form:errors path="no_content" cssClass="error-color"/>
            </div> 
         <hr>
         	<div>
         		<label for="noticeDate">게시물 공개 종료일</label>
         		<input type="date" id="noticeDate" name="noticeDate"/>
         	</div> 
         <br>
	  <div class="align-center">
			<input type="submit" value="작성">
			<input type="button" value="목록" onclick="location.href='noticeList.do'">
	  </div>
	</form:form>
</div>








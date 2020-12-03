<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/musinfo/style.css">
<link href="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/demo/stylesheets/labs.css" media="screen" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/demo/javascripts/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/jquery.raty.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/demo/javascripts/labs.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">

<form:form commandName="commentsVO" action="modify.do" enctype="multipart/form-data">
	<form:hidden path="rev_num"></form:hidden>
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="comment">내용</label>
				<div id="half"></div>
				<form:textarea path="comment"/>
				<form:errors path="comment" cssClass="error-color"/>
			</li>
			
		</ul>
			<input type="submit" value="전송">
			<input type="button" value="뒤로가기" onclick="history.go(-1)">
			
	</form:form>	
<script>			
 $.fn.raty.defaults.path = '${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images';
 $(function() {
 //현재 사용중인 별점주기 코드
   $('#half').raty({
   	half: true, 
   	click: function(score, evt) {
   	    alert(score+"점이었군요!");
   	    $('#rev_rate').val(score);
   	  },
   	  score: function() {
   		    return $(this).attr('data-score');
   		  },  

   	});

  	//별점 데이터 넘겨주기
    function getInputValue(){
		var rev_rate=$('#rev_rate').val();
	} 
 });
	</script>	
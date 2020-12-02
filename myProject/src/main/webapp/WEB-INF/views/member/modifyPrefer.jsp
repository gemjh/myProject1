<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="page-main-style">
	<h2>회원정보 변경</h2>
	<form:form action="modifyPrefer.do" commandName="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		 <div class="perfer_chk" id="prefer_chk">
		 <p>체크하면 분류에 따라 당신의 선호가 저장되어서 메인의 추천목록에서 선호장르를 띄워줌 ! </p>
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<br>
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<br>
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<br>
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<br>
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	
		 </div>

		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="홈으로"
			    onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>
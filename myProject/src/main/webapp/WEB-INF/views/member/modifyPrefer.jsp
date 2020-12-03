<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="page-main-style">
	<h2>회원정보 변경</h2>
	<form:form action="modifyPrefer.do" commandName="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		 <div class="perfer_chk" id="prefer_chk">
		 <p>체크하면 분류에 따라 당신의 선호가 저장되어서 메인의 추천목록에서 선호장르를 띄워줌 ! </p>
		 <div class="align-center">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100"><br>
		 	<input type="checkbox" id="prefer" name="prefer" value="1">&nbsp;&nbsp;&nbsp;
		 	<input type="checkbox" id="prefer" name="prefer" value="2">&nbsp;&nbsp;&nbsp;
		 	<input type="checkbox" id="prefer" name="prefer" value="3">&nbsp;&nbsp;&nbsp;
		 	<input type="checkbox" id="prefer" name="prefer" value="4">&nbsp;&nbsp;&nbsp;
		 	<input type="checkbox" id="prefer" name="prefer" value="5">&nbsp;&nbsp;&nbsp;
		 </div>
		 	<br><br><br>
		 	
		 
		 
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<br><br><br>
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<br><br><br>
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<br><br><br>
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<br><br><br>
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
			<br><br><br>		 	
		 </div>
	
		<div class="align-center">
			<input type="submit" value="변경하기">
			<input type="button" value="홈으로"
			    onclick="location.href='${pageContext.request.contextPath}/main/musMain.do'"> 
		</div>
	</form:form>
</div>
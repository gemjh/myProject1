<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 체크박스 이미지화...... 안됨 이건 안되는데 혹시나해서 일단 살려둠 -->

<!-- 

 <style>

form{
	width:80%;
}
input[type=checkbox] { display:none; }

input[type=checkbox] + label { 

display: inline-block; 

cursor: pointer; 

line-height: 22px; 

padding-left: 22px; 

background: url('"https://via.placeholder.com/0x0.png"') left/22px no-repeat; 

}

input[type=checkbox]:checked + label { 
background-image: url("https://via.placeholder.com/80x110.png"); 
}

</style>
 --><div class="page-main-style">
	<h2>회원정보 변경</h2>
	<form:form action="modifyPrefer.do" commandName="memberVO" >
		<form:errors element="div" cssClass="error-color"/>
		 <div class="perfer_chk" id="prefer_chk">
		 <p>체크하면 분류에 따라 당신의 선호가 저장되어서 메인의 추천목록에서 선호장르를 띄워줌 ! </p>
<%-- 
		 
		<!-- 체크박스 이미지화...... 안됨 이건 안되는데 혹시나해서 일단 살려둠 -->
		<input type="checkbox" id="prefer" value="1">
		<label for="prefer">
		<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		</label>
		
		<input type="checkbox" id="prefer" value="2">
		<label for="prefer">
		<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		</label>
		
		<input type="checkbox" id="prefer" value="3">
		<label for="prefer">
		<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		</label>
		
		<input type="checkbox" id="prefer4" value="4">s
		<label for="prefer4">
		<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		</label>
		
		<input type="checkbox" id="prefer5" value="5">
		<label for="prefer5">
		<img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="70" height="100">
		</label>

		 <br><br><br>
		 	 --%>
		 	<br><br>
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
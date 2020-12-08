<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var chk = 1;
	
	$('#modifyForm').submit(function(){
		if($('#nickname').val()==''){
			$('#message_nick').css('color','red').text('닉네임을 입력하세요');
			$('#nickname').focus();
			chk = 0;
			return false;
		}
		var regMsg = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
		if(!regMsg.test($('#nickname').val())){
			$('#message_nick').css('color','red').text('2~10글자로 입력하세요');
			$('#nickname').focus();
			chk = 0;
			return false;
		}
		
		if($('#phone').val()==''){
			$('#message_phone').css('color','red').text('휴대폰번호를 입력하세요');
			$('#phone').focus();
			chk = 0;
			return false;
		}
		
		
		//전화번호 유효성 체크
	 	var regP =  /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		if(!regP.test($('#phone').val())){
			$('#message_phone').css('color','red').text('숫자로만 입력해주세요');
			$('#phone').focus();
			return false; 
		}
		
		if(chk!=0){
			alert('회원정보가 변경되었습니다.');
		}
	});
	
});	
</script> 
<div class="page-main-style">
	<h2>회원정보 변경</h2>
	<form:form id="modifyForm" action="modifyMember.do" commandName="memberVO">
	<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="nickname">닉네임</label>
				<form:input path="nickname"/>
				<br>
				<span id="message_nick"></span>
				<form:errors path="nickname" cssClass="error-color"/>
			</li>
			<li>
				<label for="phone">연락처</label>
				<form:input path="phone"/>
				<br>	
				<span id="message_phone"></span>
				<form:errors path="phone" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="홈으로"
			    onclick="location.href='${pageContext.request.contextPath}/main/musMain.do'"> 
		</div>
	</form:form>
</div>
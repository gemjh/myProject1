<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
		//체크한 결제수단
		$('input[type="radio"]').click(function(){
			if($('input[type="radio"]:checked').val() == 'card'){
				alert('신용카드로 결제합니다. \n 진행하시겠습니까?');
			}else if($('input[type="radio"]:checked').val() == 'phone'){
				alert('스마트폰으로 결제합니다. \n 진행하시겠습니까? ');
			}else if($('input[type="radio"]:checked').val() == 'kakao'){
				alert('카카오페이로 결제합니다. \n 진행하시겠습니까?');
			}
		});
	});
	
</script>
<div class="page-main-style">
	<h2>이용권 구매</h2>
	<form:form action="ticket.do" commandName="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		
		결제수단 선택 <br>
		<div align="center">
			<input type="radio" id="card" name="radio" value="card">신용카드
			<input type="radio" id="phone" name="radio" value="phone">스마트폰
			<input type="radio" id="kakao" name="radio" value="kakao">카카오페이
		</div>
		<br>
		<div class="align-center">
			<input type="submit" value="결제 진행">
			<input type="button" value="홈으로"
			    onclick="location.href='${pageContext.request.contextPath}/member/memberMain.do'">
		</div>
	</form:form>
</div>
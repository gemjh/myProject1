<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){			
		//0->1 체크한것, 0->0체크안된것
		var checkId = 0;
		
		//이메일 중복 체크
		$('#confirmEmail').click(function(){
			if($('#email').val()==''){
				$('#message_email').css('color','red').text('이메일을 입력하세요');
				$('#email').focus();
				return;
			}
			
			//이메일 형식 체크
		 	var regMsg =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!regMsg.test($('#email').val())){
				$('#message_email').css('color','red').text('이메일 형식을 맞춰 입력해주세요');
				$('#email').focus();
				return;
			}
			
			$('#message_email').text();//메시지초기화
			$('#loading').show();//로딩이미지 노출	
			
			$.ajax({
				url:'confirmEmail.do',
				type:'post',
				data:{email:$('#email').val()},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(data){
					$('#loading').hide();//로딩 이미지 감추기
					
					if(data.result == 'emailNotFound'){
						$('#message_email').css('color','blue').text('등록가능Email');
						checkId = 1;
					}else if(data.result == 'emailDuplicated'){
						$('#message_email').css('color','red').text('중복된Email');
						$('#email').val('').focus();
						checkId = 0;
					}else{
						checkId = 0;
						alert('Email중복체크 오류');
					}					
				},
				error:function(){
					checkId = 0;
					$('#loading').hide();//로딩 이미지 감추기
					alert('네트워크 오류 발생');
				}
			});
		});
		
		//아이디 중복 안내 메세지 초기화 및 아이디 중복 값 초기화
		$('#register_form #email').keydown(function(){
			checkId = 0;
			$('#message_email').text('');
		});
		
		//submit이벤트 발생시 id 중복체크 여부 확인
		$('#register_form').submit(function(){
			
			
			
			if(checkId==0){
				$('#message_email').css('color','red').text('이메일 중복체크 필수')
				$('#email').focus();
				return false;
			}
			
			if($('#nickname').val() == ''){
				alert('닉네임를 입력하세요');
				$('#nickname').focus();
				return false;
			}
			
			if($('#password').val() == ''){
				alert('비밀번호를 입력하세요');
				$('#password').focus();
				return false;
			}
			if($('#confirm_password').val() == ''){
				alert('비밀번호를 입력하세요');
				$('#confirm_password').focus();
				return false;
			}
			if($('#password').val()!=$('#confirm_password').val()){
				alert('비밀번호와 비밀번호 확인 불일치');
				return false;
			}
				
 			if($('#birth').val() == ''){
				alert('생년월일을 입력하세요');
				$('#birth').focus();
				return false;
			}
			if($('#phone').val() == ''){
				alert('연락처를 입력하세요');
				$('#phone').focus();
				return false;
			}
				
			
			//전화번호형식체크
		 	var regP =  /^\d{3}-\d{3,4}-\d{4}$/;
			if(!regP.test($('#phone').val())){
				$('#message_phone').css('color','red').text('연락처 형식을 맞춰 입력해주세요');
				$('#phone').focus();
				return false; 
			}
			
			/////
			
			
		});
	});
	//체크박스 최대 2개 선택
	/* function count_chkbox(){
		num = document.getElementsByName("chk");
		chk_count = 0;
		chk_max = 2;
		for(i=0;i<num.length;i++){//배열의 갯수만큼 반복
			if(num[i].checked){//각 항목의 체크 확인
				chk_count++;//체크되면 값 1증가
			}
		}
		if(chk_count>chk_max){
			alert(chk_max + "개만 선택 가능합니다");
			return false;
		}
	} */
</script>
<style>
form{
	width:95%;
}
</style>
<div class="page-main-style">
	<h2>회원 가입</h2>
	<form:form id="register_form" action="join.do" commandName="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="email">이메일</label>
				<form:input path="email"/>
				<input type="button" id="confirmEmail" value="중복 확인">
 				<img src="${pageContext.request.contextPath}/resources/images/ajax-loader.GIF" 
				      width="16" height="16" style="display:none;" id="loading">
				<span id="message_email"></span>
				<form:errors path="email" cssClass="error-color"/>        
			</li>
			<li>
				<label for="nickname">닉네임</label>
				<form:input path="nickname"/>
			</li>
			<li>
				<label for="password">비밀번호</label>
				<form:password path="password"/>
			</li>
 			<li>
				<label for="confirm_password">비밀번호 확인</label>
				<input type="password" id="confirm_password">
			</li> 
			<li>
				<label for="birth">생년월일</label>
				<input type="date" name="birth" id="birth">
			</li>
			<li>
				<label for="phone">연락처</label>
				<form:input path="phone"/>
				<span id="message_phone"></span>
			</li>
		</ul>
		 
		 <div class="perfer_chk" id="prefer_chk">
		 <p>보고싶은 공연을 골라보세요. 가장 많이 선택된 장르(1~5)하나를 member_detail 'prefer'에 저장</p>
		 	<img src="${pageContext.request.contextPath}/resources/post/duet.jpeg" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/post/Cats.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/post/thosedays.png" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/post/dodo.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/post/fuerza.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<br><br><br>
		 	<img src="${pageContext.request.contextPath}/resources/post/gloomyday.png" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/post/lapungel.GIF" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/post/Gentleman's_guide.jpeg" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/post/infinityFlying.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<img src="${pageContext.request.contextPath}/resources/post/The Phantom Of The Opera.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<br><br><br>
		 	<img src="${pageContext.request.contextPath}/resources/post/redhat.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/post/circus.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<img src="${pageContext.request.contextPath}/resources/post/Jesus_Christ_Super_Star.jpg" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/post/fanletter.png" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/post/The Lion King.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<br><br><br>
		 	<img src="${pageContext.request.contextPath}/resources/post/Sweeney_Todd.jpg" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/post/sunemoone.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
		 	<img src="${pageContext.request.contextPath}/resources/post/Jekyll and Hyde.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/post/annie.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<img src="${pageContext.request.contextPath}/resources/post/6oclock.png" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<br><br><br>
		 	<img src="${pageContext.request.contextPath}/resources/post/chef.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="5">
		 	<img src="${pageContext.request.contextPath}/resources/post/shadow.png" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="3">
		 	<img src="${pageContext.request.contextPath}/resources/post/Notre Dame de Paris.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="2">
		 	<img src="${pageContext.request.contextPath}/resources/post/The_Man_of_La_Mancha.jpeg" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="1">
		 	<img src="${pageContext.request.contextPath}/resources/post/alcandy.gif" width="180" height="240">
		 	<input type="checkbox" id="prefer" name="prefer" value="4">
			<br><br><br>		 	
		 </div>

		<div class="align-center">
			<input type="submit" value="가입하기">
			<input type="button" value="홈으로"
			    onclick="location.href='${pageContext.request.contextPath}/main/musMain.do'"> 
		</div>
	</form:form>
</div>








<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="kr.spring.admin.vo.AdminMusicalVO" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var check = 0;
	$('#musical_form').submit(function(event){
		$('.actor_box').each(function(index,item){
			if($(this).val()==''){
				alert('배우 이름을 입력하세요!');
				$(this).focus();
				check = 1;
				return false;
			}
			check = 0;
		});
		if(check == 1) return false;
	});
	//옵션값 db 저장된 값으로 초기화 하기
	$("#gen_num").val(${adminMusicalVO.gen_num}).prop("selected", true);
	$("#mus_age").val(${adminMusicalVO.mus_age}).prop("selected", true);
});
function addBox (x) {
	 var actors = '<input type="text" name="mus_actor' + '" placeholder="배우이름입력" size="10" class="actor_box">';
   $('#mus_actor').append(actors);
 }
function deleteBox (x) {
	var actors = '<input type="text" name="mus_actor' + '" placeholder="배우이름입력" size="10" class="actor_box">';
   $('#mus_actor').empty();
   $('#mus_actor').append(actors);
 }
</script>
<div class="page-main-style">
	<h2>글수정</h2>
	<form:form commandName="adminMusicalVO" action="adminMusicalModify.do"
								enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<form:hidden path="mus_num"/>
		<ul>
			<li>
				<label for="mus_name">뮤지컬 제목</label>
				<form:input path="mus_name"/>
				<form:errors path="mus_name" cssClass="error-color"/>
			</li>
			<li>
			<label for="gen_num">뮤지컬 장르</label>
			<select name="gen_num" id="gen_num">
				<option value="1">라이선스</option>
				<option value="2">오리지널</option>
				<option value="3">창작</option>
				<option value="4">어린이/가족</option>
				<option value="5">퍼포먼스</option>
			</select>
			<li>
			<li>
			<label for="mus_age">뮤지컬 등급</label>
			<select name="mus_age" id="mus_age" >
				<option value="7">7</option>
				<option value="12">12</option>
				<option value="15">15</option>
				<option value="19">19</option>
			</select>
			</li>
			<li>
				<label for="upload">포스터</label>
				<input type="file" name="upload" id="upload"
											accept="image/gif,image/png,image/jpeg">
				<br>
				<c:if test="${!empty adminMusicalVO.mus_postname}">
				<span>(${adminMusicalVO.mus_postname})파일이 등록되어 있습니다.
				다시 업로드하면 기존 파일은 삭제됩니다.
				</span>
				</c:if>
			</li>
			<li>
				<label for="mus_summary">요약 정보</label>
				<form:textarea path="mus_summary"/>
				<form:errors path="mus_summary" cssClass="error-color"/>
			</li>
			<li>
				<label for="mus_detail">상세 정보</label>
				<form:textarea path="mus_detail"/>
				<form:errors path="mus_detail" cssClass="error-color"/>
			</li>
			<li>
				<label for="mus_actor">출연 배우</label>
				<input type="button" value="배우 추가" onclick="addBox(this.form)">
				<input type="button" value="초기화" onclick="deleteBox(this.form)"/>
				<div id="mus_actor">			
					<c:forTokens var="actor" items="${adminMusicalVO.mus_actor}" delims=",">
						  <input type="text" name="mus_actor" value="${actor}" size="10" class="actor_box">
					</c:forTokens>		
				</div>
			</li>
			<li>
				<label for="mus_video">스트리밍 비디오 링크</label>
				<form:textarea path="mus_video"/>
				<form:errors path="mus_video" cssClass="error-color"/>
			</li>
			<li>
				<label for="mus_time">뮤지컬 재생 시간</label>
				<input type = "number" name="mus_time" id="mus_time" value="${adminMusicalVO.mus_time}" min="0" max="999"/>
				<form:errors path="mus_time" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="목록" onclick="location.href='adminMusicalList.do'">
		</div>
	</form:form>
</div>
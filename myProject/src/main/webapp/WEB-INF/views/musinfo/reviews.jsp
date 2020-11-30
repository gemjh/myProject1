<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한줄평 전체보기</title>
<style>
div#contenst_contents_comment-container{
	overflow:auto;
}
</style>
</head>
<body>
<c:if test="${!empty member&& member.mem_num==commentsVO.mem_num}">	<!-- 로그인이 되어 있고 작성자 아이디와 로그인 아이디가 일치해야 수정/삭제 권한을 줌 -->
<input type="button" value="수정" onclick="location.href='modify.do?commentsVO_num=${contentsVO.mus_num}'">
<input type="button" value="삭제" id="delete_btn" onclick="location.href='delete.do?board_num=${contentsVO.mus_num}'">
</c:if>			

	<div class="contents_contents_comment-container">
		<div class="comment-nemo">
			<div class="comment_user">
				<span class="user_image">${member.mem_image }</span>
			</div>
			<div class="content_info_star">
				<div class="star_box star1" value="0.5"></div>
				<i class="far fa-star real-star1 real-star"></i>
				<div class="star_box star2" value="1"></div>
				<div class="star_box star3" value="1.5"></div>
				<i class="far fa-star real-star2 real-star"></i>
				<div class="star_box star4" value="2"></div>
				<div class="star_box star5" value="2.5"></div>
				<i class="far fa-star real-star3 real-star"></i>
				<div class="star_box star6" value="3"></div>
				<div class="star_box star7" value="3.5"></div>
				<i class="far fa-star real-star4 real-star"></i>
				<div class="star_box star8" value="4"></div>
				<div class="star_box star9" value="4.5"></div>
				<i class="far fa-star real-star5 real-star"></i>
				<div class="star_box star10" value="5"></div>
			</div>
			<div class="comment_comment">리뷰 </div>
			<div class="userId">by ${member.mem_name }</div>
		</div>
	</div>
    <script src="${pageContext.request.contextPath }/resources/js/index.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/star.js"></script>	
</body>
</html>
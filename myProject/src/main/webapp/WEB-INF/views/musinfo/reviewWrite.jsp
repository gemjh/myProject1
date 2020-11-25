<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한줄평 쓰기</title>
</head>
<body>
	<form:form action="insert.do" commandName="commentsVO">
		<ul>
			<li>
				<form:input path="writer"/>
				<form:errors path="writer" cssClass="error-color"/>
			</li>
			<li class="content_info_star">
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
			</li>
			<li>
				<label for="content"></label>
				<form:textarea path="content"/>
				<form:errors path="content" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="홈으로"
			       onclick="location.href='list.do'">
		</div>
	</form:form>
</body>
</html>
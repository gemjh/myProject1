<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="search">
		<div class="search_contents_title">뮤지컬</div>
		<main class="search_first_contents-box search_contents-box">	       				
				<div class="search_type1-contents_contents">
					<c:forEach var="musMain" items="${list}">				
						<div class="search_type1-content-box">
							<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=${musMain.mus_num}">
								<img src="postView.do?mus_num=${musMain.mus_num}" style="max-width:200px;">
							</a>
							<span class="search_type1-content_title">${musMain.mus_name}</span>
						</div>	
					</c:forEach>
				</div>			
		</main>
</div>


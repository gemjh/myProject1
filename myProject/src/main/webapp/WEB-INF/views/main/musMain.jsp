<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 메인 슬라이드 -->
<!-- ========================== swiper start=========================== -->

<!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/main2.jpg" alt=""></div>
      <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/main5.png" alt=""></div>
      <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/main6.png" alt=""></div>
      <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/main7.jpg" alt=""></div>
    </div>
    
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>  

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 1,
      spaceBetween: 0, /* 사진과 사진 사이의 간격 */
      loop: true,
	  
	  /* 자동 넘기기 */
	  autoplay: {
        delay: 2500,
        disableOnInteraction: false
      },
	  
	  pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>

<!-- ========================== swiper end =========================== -->





<c:if test="${empty user}">
	<%
		response.sendRedirect(request.getContextPath()+"/member/login.do");
	%>
</c:if>

<c:if test="${!empty user}">
	<c:if test="${count == 0}">
		<div class="align-center">등록된 뮤지컬이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<div class="contents">
			<div class="contents_title">새로 올라온 작품</div>
			<div class="type1-contents_contents">	
				<c:forEach var="musMain" items="${latestList}">
					<div class="type1-content-box">			
						<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=${musMain.mus_num}">
							<img src="postView.do?mus_num=${musMain.mus_num}" style="max-width: 200px;">
						</a>
						<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=${musMain.mus_num}">
							<span class="type1-content_title">${musMain.mus_name}</span>
						</a>
					</div>
				</c:forEach>
			</div>
			
			<div class="contents_title">뮤챠 최고 인기작</div>
			<div class="type1-contents_contents">	
			<c:forEach var="musMain" items="${popularList}">
				<div class="type1-content-box">			
						<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=${musMain.mus_num}">
							<img src="postView.do?mus_num=${musMain.mus_num}" style="max-width: 200px;">
						</a>
						<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=${musMain.mus_num}">
							<span class="type1-content_title">${musMain.mus_name}</span>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</c:if>
</c:if>
	
	

<!-- 선호작품 슬라이드 -->	
<%-- 
<c:if test="${!empty user}">
	<c:if test="${user.auth == 0}">
		<c:if test="${prefer == 0}">
		</c:if>
	</c:if>
	<c:if test="${user.auth!=0 && prefer > 0}">
		<ul class="contents">
			<li class="contents_title">${user.nickname}님이 선호하는 장르의 작품</li>
			<li class="type1-contents_contents" style="float:left">	
<!-- ========================== swiper start=========================== -->

<!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide">
      
      	<c:forEach var="musMain" items="${preferList}">
			<div class="type1-content-box">			
				<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=${musMain.mus_num}">
					<img src="postView.do?mus_num=${musMain.mus_num}" style="max-width: 200px;">
				</a>
				<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=${musMain.mus_num}">
					<span class="type1-content_title">${musMain.mus_name}</span>
				</a>
			</div>
		</c:forEach>
      
      </div>      
    </div>
    
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>  

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 5,
      spaceBetween: 0, /* 사진과 사진 사이의 간격 */
      loop: true,
      slidesPerGroup : 5,
	  
      loopFillGroupWithBlank : true,

      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>

<!-- ========================== swiper end =========================== -->

			</li>
		</ul>
	</c:if>	
</c:if>
	 --%>		
	
<c:if test="${!empty user}">
	<c:if test="${user.auth == 0}">
		<c:if test="${prefer == 0}">
		</c:if>
	</c:if>
	<c:if test="${user.auth!=0 && prefer > 0}">
		<div class="contents">
			<div class="contents_title">${user.nickname}님이 선호하는 장르의 작품</div>
			<div class="type1-contents_contents">	
			
			
			<c:forEach var="musMain" items="${preferList}">
				<div class="type1-content-box">			
					<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=${musMain.mus_num}">
						<img src="postView.do?mus_num=${musMain.mus_num}" style="max-width: 200px;">
					</a>
					<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=${musMain.mus_num}">
						<span class="type1-content_title">${musMain.mus_name}</span>
					</a>
				</div>
			</c:forEach>
			
			
			</div>
		</div>
	</c:if>	
</c:if>
				
				
<c:if test="${!empty user}">
	<c:if test="${user.auth == 0}">
		<c:if test="${pick_count == 0}">
		</c:if>		
	</c:if>
	<c:if test="${pick_count > 0}">
		<div class="contents">
			<div class="contents_title">${user.nickname}님이 찜한 작품 작품</div>
			<div class="type1-contents_contents">	
			<c:forEach var="musMain" items="${pickList}">
				<div class="type1-content-box">			
					<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=${musMain.mus_num}">
						<img src="postView.do?mus_num=${musMain.mus_num}" style="max-width: 200px;">
					</a>
					<a href="${pageContext.request.contextPath}/musinfo/musinfoDetail.do?mus_num=${musMain.mus_num}">
						<span class="type1-content_title">${musMain.mus_name}</span>
					</a>
				</div>
			</c:forEach>
			</div>
		</div>
	</c:if>	
</c:if>
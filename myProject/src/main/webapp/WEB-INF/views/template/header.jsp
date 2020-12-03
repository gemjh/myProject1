<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/header.css">
<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<a href="${pageContext.request.contextPath}/main/musMain.do"><img src="${pageContext.request.contextPath}/resources/css/admin/MUCHA.png" alt="mucha">
		</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
				   <li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">장르별 카테고리 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/admin/adminMain.do">라이선스</a></li>
							<li><a href="#">오리지널</a></li>
							<li><a href="#">창작</a></li>
							<li><a href="#">가족/어린이</a></li>
							<li><a href="#">퍼포먼스</a></li>
						</ul>
					</li>
					
					<!-- 프로필 이미지 표시 -->
					<!-- 이미지가 있는 경우(관리자는 해당x) -->
					<c:if test="${!empty user && user.auth > 0 }">
						<li>
					<c:if test="${!empty user && !empty user.mem_imagename}">
						<a href="#" style="cursor:default;" onclick="return false;"><img src="${pageContext.request.contextPath}/member/imageView.do" width="25" height="25" class="my-image"></a>
					</c:if>
					<!-- 이미지가 없는 경우 -->
					<c:if test="${!empty user && empty user.mem_imagename}">
						<a href="#" style="cursor:default;" onclick="return false;"><img src="${pageContext.request.contextPath}/resources/images/blank.GIF" width="25" height="25" class="my-image"></a>
					</c:if>
						</li>
					</c:if>
					
					<!-- auth값에 따라 다른 링크 만들어주기 0:관리자 1-2:회원 -->
					<!-- 관리자인 경우 -->
					<c:if test="${!empty user && user.auth == 0}">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">관리 페이지[${user.nickname}접속] <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/admin/adminManagerList.do">관리자 계정 보기/추가</a></li>
								<li><a href="${pageContext.request.contextPath}/admin/adminMemberModify.do">내 정보 수정</a></li>
								<li><a href="${pageContext.request.contextPath}/admin/adminMusicalRegister.do">뮤지컬 새로 등록</a></li>
								<li><a href="${pageContext.request.contextPath}/admin/adminMusicalList.do">등록된 뮤지컬</a></li>
								<li><a href="${pageContext.request.contextPath}/admin/adminMusicalReviews.do">등록된 뮤지컬 리뷰</a></li>
								<li><a href="${pageContext.request.contextPath}/admin/adminMemberList.do">회원 정보 보기</a></li>
		                        <li><a href="${pageContext.request.contextPath}/admin/noticeList.do">공지사항 관리</a></li>
							</ul>
					    </li>
						<li><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
					</c:if>
					
					<c:if test="${!empty user && user.auth > 0 }">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">My페이지[${user.nickname} 접속]<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/member/modifyMember.do">회원정보 변경</a></li>
								<li><a href="${pageContext.request.contextPath}/member/changePassword.do">비밀번호 변경</a><li>
								<li><a href="${pageContext.request.contextPath}/member/modifyPrefer.do">선호장르 변경</a><li>
								<li><a href="${pageContext.request.contextPath}/member/myImage.do">프로필 이미지 변경</a></li>
								<li><a href="${pageContext.request.contextPath}/member/ticket.do">이용권 구매</a><li>
								<li><a href="${pageContext.request.contextPath}/member/deleteMember.do">회원 탈퇴</a><li>
								<li><a href="#">너의 문의내역</a></li>
								<li><a href="#">너의 찜 목록</a></li>
								<li><a href="#">너의 리뷰</a></li>
							</ul>
					    </li>
					    <li><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
							<!-- 이용권 결제한 경우 -->
							<c:if test="${!empty user.purchase_date}">
								<span style="color:white;">[${user.nickname}님의 이용권 만료일 : ${user.expire_date}]</span>
							</c:if>
				        </li>
					</c:if>
					
					<!-- 로그인해야하는 경우 -->
					<c:if test="${empty user}">
					<li><a href="${pageContext.request.contextPath}/member/join.do">회원가입</a></li>
					<li><a class="btn" href="${pageContext.request.contextPath}/member/login.do">로그인</a></li>
					</c:if>
				</ul>
				<form class="navbar-form" role="search" action="adminMusicalList.do" id="search_form" method="get">
			      <div class="form-group">
			        <input type="text" class="form-control" name="keyword" id="keyword" placeholder="제목, 배우로 검색해보세요.">
			      </div>
			      <button type="submit" class="btn btn-danger">찾기</button>
			    </form>
			</div><!--/.nav-collapse -->
		</div>
	</div> 
	<!-- /.navbar -->





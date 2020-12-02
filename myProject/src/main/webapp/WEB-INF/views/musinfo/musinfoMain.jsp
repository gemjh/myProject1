<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/musinfo/style.css">
<style>
* {
    box-sizing: border-box;
    text-decoration: none;
}

html {
    width: 100%;
    height: 100%;
}

.main_style {
    width: 100%;
    height: 100vh;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 500;
}

.cursor {
    cursor: pointer;
}
      .contents_contents_column{
      		overflow:hidden;
      	}
      .contents_contents_column .contents_contents_summary.hidden{
         white-space:nowrap;
         word-wrap:normal;
         width:90%;
         overflow:hidden;
         text-overflow: ellipsis;
         float:left;
         
      }
      
      .btn-moreInfo{display:none;white-space:nowrap;float:right;}
      
      @media screen and (max-width: 533px){
         .contents_contents_column .contents_contents_summary.hidden{
            width:75%;
         }
      }
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function () {
    var colorbox = $('.contents_contents_column .contents_contents_summary');
    colorbox.each( function() {
       $( this ).outerHeight();
       if( $(this).outerHeight() > 21 ){
          $(this).addClass('hidden');
          var btnMoreCmt = $(this).siblings('.btn-moreInfo');
          btnMoreCmt.show();
          btnMoreCmt.on("click",function(){
             $(this).siblings('.contents_contents_summary').removeClass('hidden');
             $(this).remove();
          });
       }
    } );
 });
</script>
<!-- 메뉴바 밑에 콘텐츠 썸네일 -->
    <div class="thumbnail"></div>
    <!-- 여기까지 썸네일 -->
<div class="all_contents">
    <!-- 썸네일 밑에 겹쳐있는 콘텐츠 정보들입니다. -->
    <div class="content_info-box">
        <!-- 왼쪽 포스터입니다. -->
        <div class="left-column">
            <img src="imageView.do?mus_num=${contentsVO.mus_num }" style="max-width:500px;" alt="${contentsVO.mus_name }">
        </div>
        <!-- 여기까지 왼쪽 포스터 -->

        <!-- 포스터 오른쪽 정보들 입니다. -->
        <div class="right-column">
                    <div class="content_info"></div>
        
            <!-- 첫번째 줄 작품명 -->
            <div class="content_info">
                <span class="content_title">${contentsVO.mus_name }</span>
            </div>
            <!-- 첫번째 줄 작품명 끝 -->

            <!-- 두번째 줄 년도, 장르, 재생시간-->
            <div class="content_info">
                <span class="content_type">
                <c:if test="${contentsVO.gen_num==1 }">라이선스</c:if>
                <c:if test="${contentsVO.gen_num==2 }">오리지널</c:if>
                <c:if test="${contentsVO.gen_num==3 }">창작</c:if>
                <c:if test="${contentsVO.gen_num==4 }">어린이/가족</c:if>
                <c:if test="${contentsVO.gen_num==5 }">퍼포먼스</c:if>
                 · ${contentsVO.mus_time }분
                 </span>
            </div>
            <!-- 두번째 줄 년도, 장르, 나라 끝 -->

            <!-- 세번째 줄 평점 -->
            <div class="content_info">
                <span class="content_star">평점 </span>
            </div>
            <!-- 세번째 줄 평점 끝 -->

            <!-- 마지막 바로보기, 별점 평가하기, 찜하기 -->
            <div class="content_info">
                <!-- 바로보기 버튼 -->
                	<a href="${contentsVO.mus_video }">
                   	<span class="content_watch">►바로보기</span></a>
                <!-- 바로보기 버튼 끝 -->

                <!-- 별점 평가하기 -->
                	<a href="write.do">
                    <span class="js-leaveStar">★평가하기</span></a>
                <!-- 별점 평가하기 끝 -->
                
                <!-- 찜 -->
                	<a href="#"><span class="zzim">♥︎찜하기</span></a>
                <!-- 찜 끝 -->

            </div>
            <!-- 여기까지가 마지막 줄에 보고싶어요, 별점 평가하기 끝 -->

        </div>
        <!-- 여기까지 오른쪽 정보들 -->
    </div>
    <!-- 여기까지 영화 정보들 입니다 -->

    <!-- 여기서부터 메인 컨텐츠 박스입니다 -->
    <div class="contents_main-box">
        <div class="contents_middle-box">
            <div>
                <div class="contents_contents-box">
                    <!-- 첫번째(기본정보) 박스입니다 -->
                    <div class="contents_contents_column">
                        <div>
                            <span class="contents_contents_title">기본 정보</span>
                        </div>
                          
                        <span class="contents_contents_summary contents_info">
                            ${contentsVO.mus_detail }
                        </span>
                        <!-- 기본정보 더보기 링크 -->
                        <span class="btn-moreInfo" >더보기</span>
                        <!-- 더보기 링크 끝 --> 
                    </div>
                    <!-- 첫번째(기본정보) 끝입니다 -->

                    <!-- 두번째(출연/제작) 시작 -->
                    <div class="contents_contents_column">
                        <span class="contents_contents_title">출연</span>
                        <div class="contents_contents_container">
                            <div class="contents_contents_content">
                                <div class="contents_contents_profile">
                                    <div>
                                    	<span class="profile_name">
                                    	${contentsVO.mus_actor }
										</span>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 두번째(출연/제작) 끝 -->
                    
<!--                     세번째(하이라이트) 시작
                    <div class="contents_contents_column">
                        <div>
                            <span class="contents_contents_title">하이라이트</span>
                        </div>
                        <div class="contents_contents_highlight">
                            <input type="url" >
                        </div>
                    </div>
                    세번째(하이라이트) 끝 -->

                    <!-- 세번째(별점 그래프) 시작 -->
                    <div class="contents_contents_column">
                        <div>
                            <span class="contents_contents_title">별점 그래프</span>
                            <div>
                                <span class="star_average">평균 ★(별 개수의 합/전체 리뷰어 수???)</span>
                                <c:set var="starArray" value=">"></c:set>
                                
                                
                                <span class="star_people">(명)</span>
                            </div>
                        </div>
                        <div class="contents_contents_star-box">
                            <img src="img/star_graph.png" alt="별점 그래프" class="star-graph">
                        </div>
                    </div>
                    <!-- 세번째(별점 그래프) 끝 -->
                    
                    <!-- 네번째(코멘트) 시작 -->
			<div class="contents_contents_column">
				<div class="column_column">
					<div>
						<span class="contents_contents_title">한줄평</span> 
						<span class="contents_contents_title-number"></span>
					</div>

				</div>
				<div class="contents_contents_comment-container">
					<div class="comment-nemo">
						<div class="comment_user">
							<span class="comment_user-img">${member.mem_image }</span>
							<span class="user_name">${member.nickname }</span>
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
						<div class="comment_comment">${commentsVO.review }
						</div>
					</div>
				</div>
				<!-- 코멘트 더보기 링크 -->
				<a href="reviews.do"><span class="contents_contents_more">더보기</span>
				</a>
				<!-- 코멘트 더보기 링크 끝 -->
			</div>
			<!-- 네번째(코멘트) 끝 -->

			<!-- <div class="contents_contents_column">
                        <div>
                            <span class="contents_contents_title">이 작품이 담긴 컬렉션</span>
                            <span class="contents_contents_title-number">143</span>
                        </div>
                    </div>
                    <div class="contents_contents_column">
                        <span class="contents_contents_title">비슷한 작품</span>
                    </div> -->
                </div>
            </div>
            <div class="contents_side-box"></div>
        </div>
    </div>
    <!-- 여기까지 메인 컨텐츠 박스였습니다 -->
  </div>
    <script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/star.js"></script>
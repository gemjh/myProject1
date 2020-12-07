<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>

/* 콘텐츠 정보들 */
.content_info-box {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 25px 25px;
    border-bottom: 1px solid rgb(224, 224, 224);
}
/* 뮤지컬 제목 */
.content_title{
	font-size:25px;
	color:white;
}
/* 콘텐츠 정보들 중에 기본정보 윗부분 */
.content_info-box .left-column {
    display: flex;
    justify-content: center;
    align-items: center;
    border: 1px solid rgb(226, 220, 220);
    border-radius: 3px;
}

/* 콘텐츠 정보 중 오른쪽 부분 */
.right-column {
    width: 750px;
    height: 230px;
    margin-left: 22px;
}

/* 첫번째 줄 */
.content_info{
    font-size: 23px;
    margin-bottom: 25px;
    color: rgb(122, 122, 122);   
}

/* 마지막 줄 */
.content_info:last-child {
    display: flex;
}

/* 바로보기, 평가하기 */
.watch, .review, .join, .edit{
	background-color:#27272b;
	border:0;
	outline:0;
	margin-right:20px;
	color:rgb(122,122,122);
}
/* 포스터 아래 큰 제목 */
.contents_contents_title{
	font-size: 23px;
	margin: 15px auto;
}

/* 한줄평 디자인 */
.user_profile{
	position:absolute;
	margin: 0 0;
	width:100px;
	height:100px;
	
}
.star, .comment, .user_name{
	margin-left: 100px;
}

/* 한줄평 더보기 */
#moreReviews{
	margin-left:-5px;
	background-color:#27272b;
	color:rgb(122, 122, 122);
	border:0;
	outline:0;
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

      .btn-moreInfo{display:none;white-space:nowrap; color:rgb(122, 122, 122)}
      
      @media screen and (max-width: 533px){
         .contents_contents_column .contents_contents_summary.hidden{
            width:75%;
         }
      }

</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.watch').mouseover(function(){
		$('.watch').css('color','#fff');
	});
	$('.watch').mouseleave(function(){
		$('.watch').css('color','rgb(122,122,122)');
	});
	
	$('.review').mouseover(function(){
		$('.review').css('color','#fff');
	});
	$('.review').mouseleave(function(){
		$('.review').css('color','rgb(122,122,122)');
	});
	
	$('.join').mouseover(function(){
		$('.join').css('color','#fff');
	});
	$('.join').mouseleave(function(){
		$('.join').css('color','rgb(122,122,122)');
	});
	
	$('.edit').mouseover(function(){
		$('.edit').css('color','#fff');
	});
	$('.edit').mouseleave(function(){
		$('.edit').css('color','rgb(122,122,122)');
	});
})
</script>
<script>
//기본정보 더보기 누르면 상세정보 뜨기
$(document).ready(function () {
	var detail=$('.contents_contents_column .contents_contents_detail');
	detail.each(function(){		
		$(this).addClass('hidden');
	})
	
	var colorbox = $('.contents_contents_column .contents_contents_summary');
    colorbox.each( function() {
       $( this ).outerHeight();
          var btnMoreCmt = $(this).siblings('.btn-moreInfo');
          btnMoreCmt.show();
          btnMoreCmt.on("click",function(){
             $('.contents_contents_column .contents_contents_summary').remove();
        	 $(this).siblings('.contents_contents_summary').removeClass('hidden');
        	 $('.contents_contents_column .contents_contents_detail').removeClass('hidden');
             $(this).remove();
          });
    
    } );
    

    
 // 찜 버튼 클릭시(찜하기 또는 찜 취소하기)
    $("#like_img").click(function(event){    	
    	var music_num = ${contentsVO.mus_num};
		$.ajax({
			url: 'pick.do',
            type: 'post',
            dataType: 'json',
            data: {mus_num:music_num},
            cache:false,//캐쉬를 사용하지 않음
			timeout:30000,
            success: function (data) {
		        if(data.result == 'success'){
		        	getFav();
		        }else if(data.result == 'logout'){
		        	alert('로그인 해야 찜할 수 있습니다.');
		        }
            },
            error:function(){
            	alert('네트워크 오류');
            }
		});
		event.preventDefault();
    });
    
 	function getFav(){
 		var music_num = ${contentsVO.mus_num};
 		$.ajax({
			url: 'getFav.do',
            type: 'post',
            dataType: 'json',
            data: {mus_num:music_num},
            cache:false,//캐쉬를 사용하지 않음
			timeout:30000,
            success: function (data) {
            	 if(data.result == 'success'){
            		 if(data.count == 0){
            			 $("#like_img").find('img').attr('src','/Mucha/resources/images/like_no.png');
     		        }else if(data.count > 0){
     		        	$("#like_img").find('img').attr('src','/Mucha/resources/images/like_yes.png');
     		        }
 		        }else if(data.result == 'logout'){
 		        	$("#like_img").find('img').attr('src','/Mucha/resources/images/like_no.png');
 		        }
		       
            },
            error:function(){
            	alert('네트워크 오류');
            }
		});
 	}
 	getFav();
 });



</script>

<div class="all_contents">
    <!-- 썸네일 밑에 겹쳐있는 콘텐츠 정보들입니다. -->
    <div class="content_info-box">
        <!-- 왼쪽 포스터입니다. -->
        <div class="left-column">
            <img src="imageView.do?mus_num=${contentsVO.mus_num }" style="max-width:400px;" alt="${contentsVO.mus_name }">
        </div>
        <!-- 여기까지 왼쪽 포스터 -->

        <!-- 포스터 오른쪽 정보들 입니다. -->
        <div class="right-column">
        
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
                <span class="content_star">평점 ★${avg }(${num}명) </span>
            </div>
            <!-- 세번째 줄 평점 끝 -->

            <!-- 마지막 바로보기, 별점 평가하기, 찜하기 -->
            <div class="content_info">
                <!-- 바로보기 버튼 -->
                <c:if test="${user.auth==1}">
                      <input type="button" id="watch" class="watch" value="►바로보기" onclick="location.href='https://${contentsVO.mus_video }'">
                
                <!-- 바로보기 버튼 끝 -->

                <!-- 별점 평가하기 -->
                	<input type="button" id="review" class="review" value="★평가하기" onclick="location.href='write.do?mus_num=${contentsVO.mus_num}'">
                <!-- 별점 평가하기 끝 -->
                
                <!-- 찜 -->
                <a href="#" id="like_img"><img src="/Mucha/resources/images/like_no.png" width="30px"></a>
                <!-- 찜 끝 -->
                </c:if>
                
                <!-- 로그인하지 않은 경우 -->
                <c:if test="${user.auth==null}">
                	<input type="button" id="join" class="join" value="지금 바로 감상하세요" onclick="location.href='/Mucha/member/login.do'">
                </c:if>
                <!-- 이용권이 없는 경우 -->
                <c:if test="${user.auth==2 }">
                	<input type="button" id="join" class="join" value="지금 바로 감상하세요" onclick="location.href='/Mucha/member/ticket.do'">
                </c:if>
                <!-- 관리자인 경우 -->
                <c:if test="${user.auth==0 }">
                	<input type="button" id="edit" class="edit" value="정보 편집" onclick="location.href='Mucha/admin/adminMain.do'">
                </c:if>

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
                        <div class="contents_contents_title">기본 정보
                        </div>
                          
                        <span class="contents_contents_summary contents_info">
                            ${contentsVO.mus_summary }
                        </span><br>
                        <!-- 기본정보 더보기 링크 -->
                        <span class="btn-moreInfo">더보기</span>
                        <!-- 더보기 링크 끝 --> 
                        <!-- 상세정보 -->
                        <span class="contents_contents_detail contents_info">
                            ${contentsVO.mus_detail }
                        </span>
                    </div>
                    <!-- 첫번째(기본정보) 끝입니다 -->

                    <!-- 두번째(출연/제작) 시작 -->
                    <div class="contents_contents_column">
                        <div class="contents_contents_title">출연</div>
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
                    

                    
                    <!-- 세번째(코멘트) 시작 -->
			<div class="contents_contents_column">
				<div class="column_column">
					<div>
						<div class="contents_contents_title">한줄평</div> 
					</div>

				</div>
						<div class="comment_user">
						<c:forEach var="newest" items="${newest }">
						<ul class="newComments">
						<c:if test="${newest.mem_image !=null}">
							<li class="user_profile"><img src="${pageContext.request.contextPath}/member/imageView.do"></li>
							</c:if>
 							<li class="star">
 								<c:if test="${newest.rev_rate==1 }"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"></c:if>
 								<c:if test="${newest.rev_rate==1.5 }"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-half.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"></c:if>

 								<c:if test="${newest.rev_rate==2 }"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"></c:if>
 								<c:if test="${newest.rev_rate==2.5 }"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-half.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"></c:if>

 								<c:if test="${newest.rev_rate==3.0 }"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"></c:if>
 								<c:if test="${newest.rev_rate==3.5 }"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-half.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"></c:if>

 								<c:if test="${newest.rev_rate==4 }"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-off.png"></c:if>
 								<c:if test="${newest.rev_rate==4.5 }"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-half.png"></c:if>
 				
 								<c:if test="${newest.rev_rate==5.0 }"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"><img src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images/star-on.png"></c:if>
 							</li>
							<li class="comment">${newest.review }</li>
  	 						<li class="user_name">by ${newest.nickname }</li>
  						</ul>
						</c:forEach>
						</div>
				
				<!-- 코멘트 더보기 링크 -->
				<input type="button" id="moreReviews" name="moreReviews" value="더보기" onclick="location.href='reviews.do?mus_num=${contentsVO.mus_num}'">
				<!-- 코멘트 더보기 링크 끝 -->
			</div>
			<!-- 세번째(코멘트) 끝 -->

                </div>
            </div>
            <div class="contents_side-box"></div>
        </div>
    </div>
    <!-- 여기까지 메인 컨텐츠 박스였습니다 -->
  </div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
<style>
span{
	overflow:auto;
}
</style>
<link href="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/demo/stylesheets/labs.css" media="screen" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/demo/javascripts/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/jquery.raty.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/demo/javascripts/labs.js" type="text/javascript"></script>
 --%>
<div class="page-main-style">
	<h2>리뷰 보기</h2>
	<c:if test="${count==0 }">
		<div class="align-center">등록된 한줄평이 없습니다.</div>
	</c:if>
	<!-- 한줄평 -->
	<div>
		<iframe width="560" height="315"
			src="https://www.youtube.com/embed/XB8YTYHnWHQ"></iframe>
	</div>
	<c:if test="${count!=0 }">
		평균 평점 : 
		<table>
			<tr>
				<th>닉네임</th>
				<th>평점</th>
				<th>한줄평</th>
			</tr>
			<c:forEach var="list" items="${list}">
				<!-- 내가 쓴 리뷰 먼저 보기 -->
				<c:if test="${!empty user&& user.mem_num==list.mem_num}">
					<tr>
						<td>${list.nickname}</td>
						<td>${list.rev_rate}</td>
						<td>${list.review}<!-- 로그인이 되어 있고 작성자 아이디와 로그인 아이디가 일치해야 수정/삭제 권한을 줌 -->
							<input type="button" value="수정"
							onclick="location.href='modify.do?contentsVO_num=${list.mus_num}'">
							<input type="button" value="삭제" id="delete_btn"
							onclick="location.href='delete.do?mus_num=${list.mus_num}'">
						</td>
					</tr>
				</c:if>
				<c:if test="${user.mem_num!=list.mem_num}">
					<tr>
						<td>${list.nickname}</td>
						<td>${list.rev_rate}</td>
						<td>${list.review}</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</c:if>
</div>
<!-- 
 <script>
  $.fn.raty.defaults.path = '${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images';

  $(function() {
    $('#default').raty();

$('#score-callback').raty({
  score: function() {
    return $(this).attr('data-score');
  }
});
$('#readOnly').raty({ 
	readOnly: true
	});

$('#readOnly-callback').raty({
  readOnly: function() {
    return 'true becomes readOnly' == 'true becomes readOnly';
  }
});


/* $('#scoreName').raty({ scoreName: 'entity[score]' });

$('#number').raty({ number: 10 });

$('#number-callback').raty({
  number: function() {
    return $(this).attr('data-number');
  }
});

$('#numberMax').raty({
  numberMax : 5,
  number    : 100
}); */


/* $('#noRatedMsg').raty({
  readOnly   : true,
  noRatedMsg : "I'am readOnly and I haven't rated yet!"
});

$('#halfShow-true').raty({ score: 3.26 });

$('#halfShow-false').raty({
  halfShow : false,
  score    : 3.26
});

$('#round').raty({
  round : { down: .26, full: .6, up: .76 },
  score : 3.26
});

$('#half').raty({ half: true });

$('#starHalf').raty({
  half     : true,
  path     : null,
  starHalf : 'demo/images/star-half-mono.png',
  starOff  : 'lib/images/star-off.png',
  starOn   : 'lib/images/star-on.png'
});

$('#click').raty({
  click: function(score, evt) {
    alert('ID: ' + $(this).attr('id') + "\nscore: " + score + "\nevent: " + evt.type);
  }
});

$('#hints').raty({ hints: ['a', null, '', undefined, '*_*']});

$('#star-off-and-star-on').raty({
  path    : 'demo/images',
  starOff : 'off.png',
  starOn  : 'on.png'
});

$('#cancel').raty({ cancel: true });

$('#cancelHint').raty({
  cancel     : true,
  cancelHint : 'My cancel hint!'
});

$('#cancelPlace').raty({
  cancel      : true,
  cancelPlace : 'right'
});

$('#star-off-and-star-on').raty({
  path    : 'demo/images',
  starOff : 'off.png',
  starOn  : 'on.png'
});

$('#cancel-off-and-cancel-on').raty({
  cancel    : true,
  cancelOff : 'demo/images/cancel-custom-off.png',
  cancelOn  : 'demo/images/cancel-custom-on.png',
  path      : null,
  starOff   : 'lib/images/star-off.png',
  starOn    : 'lib/images/star-on.png'
});

$('#iconRange').raty({
  path      : null,
  starOff   : 'lib/images/star-off.png',
  iconRange : [
    { range: 1, on: 'demo/images/1.png', off: 'demo/images/0.png' },
    { range: 2, on: 'demo/images/2.png', off: 'demo/images/0.png' },
    { range: 3, on: 'demo/images/3.png', off: 'demo/images/0.png' },
    { range: 4, on: 'demo/images/4.png', off: 'demo/images/0.png' },
    { range: 5, on: 'demo/images/5.png', off: 'demo/images/0.png' }
  ]
});

$('#size').raty({
  path      : 'demo/images',
  cancel    : true,
  cancelOff : 'cancel-off-big.png',
  cancelOn  : 'cancel-on-big.png',
  half      : true,
  size      : 24,
  starHalf  : 'star-half-big.png',
  starOff   : 'star-off-big.png',
  starOn    : 'star-on-big.png'
});

$('#width').raty({ width: 150 });

$('#target-div').raty({
  cancel : true,
  target : '#target-div-hint'
});

$('#target-text').raty({
  cancel : true,
  target : '#target-text-hint'
});

$('#target-textarea').raty({
  cancel : true,
  target : '#target-textarea-hint'
});

$('#target-select').raty({
  cancel : true,
  target : '#target-select-hint'
});

$('#targetType').raty({
  cancel     : true,
  target     : '#targetType-hint',
  targetType : 'score'
});

$('#targetKeep').raty({
  cancel     : true,
  target     : '#targetKeep-hint',
  targetKeep : true
});

$('#targetText').raty({
  target     : '#targetText-hint',
  targetText : '--'
});

$('#targetFormat').raty({
  target       : '#targetFormat-hint',
  targetFormat : 'Rating: {score}'
});

$('#mouseover').raty({
  mouseover: function(score, evt) {
    alert('ID: ' + $(this).attr('id') + "\nscore: " + score + "\nevent: " + evt.type);
  }
});

$('#mouseout').raty({
  mouseout: function(score, evt) {
    alert('ID: ' + $(this).attr('id') + "\nscore: " + score + "\nevent: " + evt.type);
  }
});
 */
  });
</script> -->
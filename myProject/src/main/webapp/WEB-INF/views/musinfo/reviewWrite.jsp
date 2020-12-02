<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/demo/stylesheets/labs.css" media="screen" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/demo/javascripts/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/jquery.raty.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/musinfo/raty-master/demo/javascripts/labs.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">
<style>
.half{
	width:200px;
}
textarea{
}
h1{
	text-align:center;
}
</style>
<title>한줄평 쓰기</title>
</head>
<body>
<%-- <c:if test="${!empty user&& user.mem_num==commentsVO.mem_num}">	<!-- 로그인이 되어 있고 작성자 아이디와 로그인 아이디가 일치하면 수정으로 리다이렉트 -->
<%=	response.sendRedirect("reviewModify.do")
%>
</c:if> --%>
<h1>솔직한 감상평을 들려주세요!</h1>
	<form:form action="write.do" commandName="commentsVO" enctype="multipart/form-data" id="reviewForm" name="reviewForm">
	<form:hidden path="mus_num"/>
	<input type="hidden" name="rev_rate" id="rev_rate" value=""/>
	<label for=review></label>
		<div id="half" class="half"></div>
		<form:textarea path="review"/>
		<form:errors path="review" cssClass="error-color"/>

		<div class="align-center">
			<input type="submit" value="등록"> 
			<input type="button" value="홈으로"
			       onclick="location.href='main/musMain.do'">
		</div>
	</form:form>
</body>
 <script>
  $.fn.raty.defaults.path = '${pageContext.request.contextPath}/resources/css/musinfo/raty-master/lib/images';
  $(function() {
    $('#default').raty();
    
  //현재 사용중인 별점주기 코드
    $('#half').raty({
    	half: true, 
    	click: function(score, evt) {
    	    alert(score+"점이었군요!");
    	    $('#rev_rate').val(score);
    	  },
    	  score: function() {
    		    return $(this).attr('data-score');
    		  },  

    	});

   	//별점 데이터 넘겨주기
     function getInputValue(){
 		var rev_rate=$('#rev_rate').val();
 	}  
    /* 
$('#score').raty({ score: 3 });

$('#score-callback').raty({
  score: function() {
    return $(this).attr('data-score');
  }
});

$('#scoreName').raty({ scoreName: 'entity[score]' });

$('#number').raty({ number: 10 });

$('#number-callback').raty({
  number: function() {
    return $(this).attr('data-number');
  }
});

$('#numberMax').raty({
  numberMax : 5,
  number    : 100
});

$('#readOnly').raty({ readOnly: true, score: 3 });

$('#readOnly-callback').raty({
  readOnly: function() {
    return 'true becomes readOnly' == 'true becomes readOnly';
  }
});

$('#noRatedMsg').raty({
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
}); */


/* 
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
}); */

  });
</script>
</html>
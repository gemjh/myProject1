<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<script>
	var locked=0;
function show(star){
	if(locked) return;
	var i;
	var image;
	var el;
	var e=document.getElementById('startext');
	var stateMsg;
	
	for(i=1;i<=star;i++){
		image='image'+i;
		el=document.getElementById(image);
		el.src="image/star/star1.png";
	}
	
	switch(star){
	case 1:
		stateMsg="괜히봤어요";
		break;
	case 2:
		stateMsg="별로에요";
		break;
	case 3: 
		stateMsg="보통이에요";
		break;
	case 4:
		stateMsg="좋아요";
		break;
	case 5:
		stateMsg="멋져요!";
		break;
		default:stateMsg="";
	}
	e.innerHTML=stateMsg;
	}
}
	function noshow(star){
		if(locked) return;
		var i;
		var image;
		var el;
		var e=document.getElementById('startext');
		var stateMsg;
		
		for(i=1;i<=star;i++){
			image='image'+i;
			el=document.getElementById(image);
			el.src="image/star/star0.png";
		}
	}
	function lock(star){
		show(star);
		locked=1;
	}
	function mark(star){
		lock(star);
		alert("선택2"+star);
		document.cmtform.star.value=star;
	}
</script>
</head>
<body>
<span>
	<img id=image1 onmouseover=show(1) onclick=mark(1) onmouseout=noshow(1) src="image/star/star0.png">
	<img id=image2 onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2) src="image/star/star0.png">
	<img id=image3 onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3) src="image/star/star0.png">
	<img id=image4 onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4) src="image/star/star0.png">
	<img id=image5 onmouseover=show(5) onclick=mark(5) onmouseout=noshow(5) src="image/star/star0.png">
</span>

<input type="hidden" name="star">
<input type="submit" name="submit" value="클릭">

<span>${star }
<c:if test="${star==1 }">
	<img src="image/star/star_1.png">
</c:if>
<c:if test="${star==2 }">
	<img src="image/star/star_2.png">
</c:if><c:if test="${star==3 }">
	<img src="image/star/star_3.png">
</c:if><c:if test="${star==4 }">
	<img src="image/star/star_4.png">
</c:if><c:if test="${star==5 }">
	<img src="image/star/star_5.png">
</c:if>
</span>


</body>
</html>
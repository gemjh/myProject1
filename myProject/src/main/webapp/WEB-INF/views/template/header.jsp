<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.menu-box {
    position: fixed;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    padding: 12px 0px;
    border-bottom: 1px solid rgb(238, 238, 238);
    background-color: white;
    z-index: 4;
}

.menu {
    width: 87%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 15px;
}

.menu_movie, .menu_sign-up {
    color: rgb(77, 77, 77);
}

.menu_tv ,.menu_book ,.menu_login {
    color: rgb(150, 150, 150);
}

.menu_left ,.menu_right {
    display: flex;
    justify-content: center;
    align-items: center;
}

.menu_left span {
    margin-left: 25px;
}

.menu_right .menu_login {
    margin: 0px 25px
}

.menu_logo {
    width: 150px;
    height: 37px;
}

.menu_sign-up {
    border: 1px solid rgb(160, 160, 160);
    padding: 8px 11px;
    border-radius: 5px;
}

.menu_search-box {
    display: flex;
    width: 300px;
    height: 40px;
    background-color: #F5F5F7;
    align-items: center;
}

.menu_search-box i {
    color: #CBCBD1;
    padding: 0px 10px;
}

.menu_search {
    border: none;
    font-weight: 700;
    color: #929292;
    width: 250px;
    background-color: #F5F5F7;
}

.menu_search:focus {
    outline: none;
}
.pop_sign-up {
    position: fixed;
    top: 50%;
    left: 50%;
    width: 380px;
    height: 620px;
    background-color: white;
    transform: translate(-50%,-50%);
    border-radius: 5px;
    display: none;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    z-index: 100;
}

.overlay {
    display: none;
    position: fixed;
    width: 100%; height: 100%;
    left: 0; 
    top: 0;
    background-color: rgba(0,0,0, 0.55);
    overflow-x: hidden;
    z-index: 10;
}

.pop_logo {
    width: 115px;
    height: 70px;
    margin-top: 40px;
}

.pop_title {
    font-size: 17px;
}

.pop_input-box {
    width: 330px;
    height: 43px;
    border-radius: 3px;
    background-color: #F5F5F5;
    margin: 7px 0px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.pop_input-box input {
    width: 95%;
    height: 100%;
    border: none;
    background-color: #F5F5F5;
    font-size: 16px;
    outline: none;
    font-family: inherit;
}

.pop_btn {
    width: 330px;
    height: 43px;
    border-radius: 3px;
    background-color: #FF2F6E;
    display: flex;
    justify-content: center;
    align-items: center;
    border: none;
    outline: none;
    color: white;
    font-size: 16px;
    font-weight: 700;
    font-family: inherit;
}

.pop_already {
    color: rgb(109, 109, 109);
}

.pop_already a {
    color: #FF2F6E;
}

.pop_or {
    color: rgb(109, 109, 109);
}

.pop_line-box {
    display: flex;
    width: 330px;
    justify-content: space-between;
}

.pop_line {
    width: 142px;
    height: 1px;
    background-color: rgb(109, 109, 109);
    margin-top: -32px;
}

.pop_facebook {
    width: 330px;
    height: 43px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 45px;
    border-radius: 3px;
    border: none;
    outline: none;
    color: white;
    background-color: #3C5AA0;
    font-family: inherit;
    font-size: 17px;
    position: relative;
}

.pop_facebook i {
    position: absolute;
    left: 0;
    margin-left: 15px;
    font-size: 25px;
}
</style>
<div class="menu">
	<div class="menu_left">
		<a href="index.html"><img class="menu_logo" src="img/logo.png" /></a>
		<span class="menu_movie">영화</span> <span class="menu_tv">TV
			프로그램</span> <span class="menu_book">책</span>
	</div>
	<div class="menu_right">
		<div class="menu_search-box">
			<i class="fas fa-search"></i> <input class="menu_search" type="text"
				placeholder="작품 제목,배우,감독을 검색해보세요.">
		</div>
		<span class="menu_login">로그인</span> <span class="menu_sign-up"
			id="js-signUp">회원가입</span>
	</div>

	<!-- 여기는 회원가입 팝업창입니다 -->
	<div class="pop_sign-up">
		<img src="img/pop_logo.png" class="pop_logo"> <span
			class="pop_title">회원가입</span>
		<form action="">
			<div class="pop_input-box">
				<input type="text" placeholder="이름">
			</div>
			<div class="pop_input-box">
				<input type="text" placeholder="이메일">
			</div>
			<div class="pop_input-box">
				<input type="text" placeholder="비밀번호">
			</div>
		</form>
		<button class="pop_btn">회원가입</button>
		<div class="pop_already">
			<span>이미 가입하셨나요?&nbsp;</span> <a href=""> <span>로그인</span>
			</a>
		</div>
		<span class="pop_or">OR</span>
		<div class="pop_line-box">
			<div class="pop_line"></div>
			<div class="pop_line"></div>
		</div>
		<button class="pop_facebook">
			<i class="fab fa-facebook-square"></i> <span>Facebook 으로 로그인</span>
		</button>
	</div>
	<!-- 여기까지 회원가입 팝업창입니다 -->

	<!-- 팝업창 팝업 시 뒷 배경 어둡게 하는 효과를 위한 박스 -->
	<div class="overlay"></div>
	<!-- 박스는 하나로 끝 -->

</div>











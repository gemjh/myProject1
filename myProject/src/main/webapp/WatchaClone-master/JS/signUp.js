const emailHover = document.querySelector(".singUp_main-signUp_Email"),
  emailHover_icon = emailHover.querySelector("i");

function Hover_changeIconColor(){
    emailHover_icon.style.color="#FE2E64";
    emailHover_icon.style.weight="20px";
}

function open_Facebook(){
  window.open("https://ko-kr.facebook.com/login/","pop1","width=600,height=500");
}
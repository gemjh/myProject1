const layout1 = document.querySelector(".logIn_Watcha-member-input_layout1"),
    input_email = layout1.querySelector("input");

const layout2 = document.querySelector(".logIn_Watcha-member-input_layout2"),
    input_password = layout2.querySelector("input");
   
const fake_Button = document.querySelector(".fake_button");

const button = document.querySelector(".logIn_Watcha-member-button"),
    button_logIn = button.querySelector("button");

const inputFrame = document.querySelector(".logIn_Watcha-member-input");
const secterFrame = document.querySelector(".logIn_Watcha-member");

function click_input(){
    input_email.style.outline="none";
    input_password.style.outline="none";
    if(input_email.value!==null & input_password.value!==null){
        LogIn_button();
    }
}

function appearButton(){
    fake_Button.style.display="none";
    button_logIn.style.display="flex";
}

function open_Facebook(){
    window.open("https://ko-kr.facebook.com/login/","pop1","width=600,height=500");
  }
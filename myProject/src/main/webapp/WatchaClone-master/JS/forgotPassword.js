const form = document.querySelector(".forgotPassword_main-checkButton"),
    fakeButton = form.querySelector(".fake_checkButton"),
    button = form.querySelector("button");

function appeaerButton() {
    fakeButton.style.display="none";
    button.style.display="flex";
}
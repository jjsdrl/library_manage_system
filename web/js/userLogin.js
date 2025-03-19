const signInBtnLink = document.querySelector(".signInBtn_link");
const signUpBtnLink = document.querySelector(".signUpBtn_link");
const wrapper = document.querySelector(".wrapper");

signUpBtnLink.addEventListener('click',()=>{
    wrapper.classList.toggle("active")
})

signInBtnLink.addEventListener('click',()=>{
    wrapper.classList.toggle("active")
})

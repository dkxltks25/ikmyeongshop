

const login_button = ()=>{
    const id = document.getElementById('login_id');
    const password = document.getElementById('login_password');
    if(id.value === ""){
        alert("아이디가 빈칸입니다");
        return ;
    }
    if(password.value === ""){
        alert("패스워드가 빈칸입니다");
    }

    document.login.action = "loginProcess.jsp";
    document.login.submit();
}
const EventButton = () =>{
    const login_btn = document.getElementById('login_btn');
    login_btn.addEventListener('click',login_button);
}


EventButton();
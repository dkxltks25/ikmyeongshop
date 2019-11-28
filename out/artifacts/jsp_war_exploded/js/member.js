const CheckForm = () =>{
    const [id,pass,repass,name,email,phone,adress,adress1,adress2,adress3] = document.member_form;
    const Form = member_form;
    if(id.value == 0){
        alert("아이디가 빈칸입니다")
        history.back();
        return 0;
    }
    if(pass.value == 0){
        alert("비밀번호가 빈칸입니다");
        return 0;
    }
    if(repass.value == 0){
        alert("비밀번호 확인이 빈칸입니다");
        return 0;
    }
    if(name.value == 0){
        alert("이름이 빈칸입니다");
        return 0;
    }
    if(email.value == 0){
        alert("이메일이 빈칸입니다");
        return 0;
    }
    if(phone.value == 0){
        alert("전화번호가 빈칸입니다");
        return 0;
    }
    if(adress.value == 0){
        alert("주소가 빈칸입니다");
        return 0;
    }
    if(adress2.value == 0){
        alert("주소가 빈칸입니다");
        return 0;
    }
    if(adress3.value == 0){
        alert("주소가 빈칸입니다");
        return 0;
    }
    if(id.value >= 4 && id.value <=8){
        alert("아이디는 4자리이상 8자리 입니다");
        return 0;
    }
    if(pass.value >= 4 && pass.value <=8){
        alert("비밀번호는 4자리이상 8자리 입니다");
        return 0;
    }
    if(repass.value >= 4 && repass.value <=8){
        alert("비밀번호 확인 4자리이상 8자리 입니다");
        return 0;
    }
    if(name.value ==11 ){
        alert("전화번호의 형식이 맞지 않습니다");
        return 0;
    }

    Form.submit();

}
const FormTypeOn = () =>{
    const Form = document.member_form;
    const btn = document.getElementById("member_button");
    console.dir(Form);

    Form.method="POST"
    btn.addEventListener('click',CheckForm);
}

FormTypeOn();

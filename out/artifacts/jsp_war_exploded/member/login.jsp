
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel = "stylesheet" href = "../css/login.css">
</head>
<body>
<header>
    <%@ include file="../header.jsp"%>
</header>

<div class = "login__container">
    <div class="login_container_NowLocation">
        <em><a class = "login__container_link" href = "/" >HOME> </a> 로그인</em>
    </div>

    <div class = "login_container_box">
        <div class = "login_box_wrap">
            <div class ="login__container_menu">
                <h2>로그인</h2>
            </div>
            <div class = "login_box">
                <h3>회원 로그인</h3>
                <form name = "login">
                <div class = "login_box_input">
                    <input id = "login_id" type = "text" placeholder="아이디">
                    <input id = "login_password" type = "text" placeholder="패스워드">
                </div>
                <input class = "login_button" id = "login_btn" type = "button" value ="로그인">
                <div class = "login_id_save">
                    <input type="checkbox" >아이디 저장
                </div>
                <br>
                <div class = "login_sns_box">
                    <a class = "snsBox" href = "/">facebookLogin</a>
                    <a class = "snsBox" href = "/">naverlogin</a>
                </div>

                <div class = "login__box_button">
                    <input class = "login_member" type = "button" value = "회원가입">
                    <input class = "login_find" type = "button" value = "아이디찾기">
                    <input class = "login_find" type = "button" value = "비밀번호찾기 ">
                </form>
                </div>

            </div>
        </div>
    </div>
</div>

<footer>
    <%@ include file="../footer.jsp"%>
</footer>
<script src="../js/login.js"></script>
</body>
</html>

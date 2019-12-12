
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel = "stylesheet" href = "../css/login.css">
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
                    <input id = "login_id" name = "userId" type = "text" placeholder="아이디">
                    <input id = "login_password" name ="userPassword" type = "text" placeholder="패스워드">
                </div>
                <input class = "login_button" id = "login_btn" type = "button" value ="로그인">
                <div class = "login_id_save">
                    <input type="checkbox" >아이디 저장
                </div>
                <br>
                <div class = "login_sns_box">
                    <a id="kakao-login-btn"></a>
                    <a href="http://developers.kakao.com/logout"></a>
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
<script type='text/javascript'>

    //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('4798260abc21358405211bc570b393d3');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function(authObj) {
            // 로그인 성공시, API를 호출합니다.
            Kakao.API.request({
                url: '/v1/user/me',
                success: function(res) {
                    const kemail = JSON.stringify( res.kaccount_email);
                    const kid = JSON.stringify(res.id);
                    const kimagw = JSON.stringify(res.properties.profile_image);
                    const kname = JSON.stringify(res.properties.nickname);
                    const url =  "./loginProcess.jsp?kid="+kid;
                    location.href=url;
                },
                fail: function(error) {
                    alert(JSON.stringify(error));
                }
            });
        },
        fail: function(err) {
            alert(JSON.stringify(err));
        }
    });
    //]]>

</script>

<footer>
    <%@ include file="../footer.jsp"%>
</footer>
<script src="../js/login.js"></script>
</body>
</html>

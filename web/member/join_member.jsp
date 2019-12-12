
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel = "stylesheet" href="../css/join_member.css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<body>

    <%
        String location = request.getRequestURL().toString();

    %>
    <header>
        <jsp:include page="../header.jsp"/>
    </header>
    <div class = "join_member__container">
        <div class="join_member_container_NowLocation">
            <em><a class = "join_member__container_link" href = "/" >HOME> </a> 회원가입> 가입방법 선택</em>
        </div>

        <div class = "join_member_container_box">
            <div class = "join_member_box_wrap">
                <div class ="join_member__container_menu">
                    <h2>회원가입</h2>
                </div>

                <div class = "join_member_box">
                    <h3>회원 로그인</h3>
                    <div class="join_member_join">
                        <a href = join.jsp?memberFl=personal class = "snsBox">쇼핑몰 회원가입</a>
                    </div>
                    <div class = "join_member__box_button"></div>
                    <div class = "join_member_sns_box">
                        <a id="kakao-login-btn"></a>
                        <a href="http://developers.kakao.com/logout"></a>
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
                    success:  function(res){
                        const kemail = JSON.stringify( res.kaccount_email).replace(/"/gi, "");;
                        const kid = JSON.stringify(res.id).replace(/"/gi, "");
                        const kimagw = JSON.stringify(res.properties.profile_image);
                        const kname = JSON.stringify(res.properties.nickname).replace(/"/gi, "");

                        console.dir(res);
                        const url =  "./KakoMember.jsp?kemail=" +kemail + "&kid="+kid+ "&kname="+kname;
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
        <jsp:include page="../footer.jsp"/>
    </footer>
</body>
</html>

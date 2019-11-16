
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel = "stylesheet" href="../css/join_member.css">
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
                            <a class = "snsBox" href = "/">facebookjoin_member</a>
                            <a class = "snsBox" href = "/">naverjoin_member</a>
                        </div>

                </div>

            </div>
        </div>
    </div>
    <footer>
        <jsp:include page="../footer.jsp"/>
    </footer>
</body>
</html>

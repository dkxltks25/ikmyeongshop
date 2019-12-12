<%@ page import="Attention.AttentionDAO"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href = "../css/User.css"/>
    <link rel = "stylesheet" href = "http://l.bsks.ac.kr/~p201887082/php_login/assets/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <header>
        <jsp:include page="../header.jsp"/>
    </header>

    <div class = "User__container">
        <div class = "User__container_menu">
            <div class = "User__container_title">
                <h2>마이페이지</h2>
            </div>
            <ul class = "User__container_menu">
                <li>쇼핑정보
                    <ul class="sub_depth1">
                        <li><a href="#Attention">- 찜리스트</a></li>
                    </ul>
                </li>
                <li>고객센터
                    <ul class="sub_depth1">
                        <li><a href="#QnA">- 1:1문의</a></li>
                    </ul>
                </li>
                <li>회원정보
                    <ul class="sub_depth1">
                        <li><a href="#UserInfoChange">- 회원정보 변경</a></li>
                        <li><a href="#UserInfosecession">- 회원 탈퇴</a></li>
                        <li><a href="#Userdelivery">- 배송지 관리</a></li>

                    </ul>
                </li>
                <li>나의 상품문의
                    <ul class="sub_depth1">
                        <li><a href="#UserQnA">- 나의상품문의</a></li>
                    </ul>
                </li>
                <li>나의 상품후기
                    <ul class="sub_depth1">
                        <li><a href="#UserReview">- 나의상품후기</a></li>
                    </ul>
                </li>

            </ul>
        </div>
        <div class = "User__container_content">

        </div>
    </div>
    <footer>
        <jsp:include page = "../footer.jsp"/>
    </footer>
    <script src = "../js/UserSelect.js"></script>
</body>
</html>

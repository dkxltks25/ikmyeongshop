<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-23
  Time: 오후 4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel = "stylesheet" href = "../css/Service.css"/>
</head>
<body>
<header>
    <jsp:include page="../header.jsp"/>
</header>

<div class = "Service__container">
    <div class = "Service__container_menu">
        <div class="sub_menu_box">
            <h2>고객센터</h2>
            <ul class="sub_menu">
                <li><a href="./ServiceNotice.jsp">공지사항</a></li>
                <li><a href="./ServiceQnA.jsp" class="active">1:1문의하기</a></li>
                <li><a href="#FaQ">FAQ</a></li>
            </ul>
        </div>
    </div>
    <div class = "Service__container_content"></div>
</div>
<footer>
    <jsp:include page="../footer.jsp"/>
</footer>
<script src = "../js/Service.js"></script>

</body>
</html>

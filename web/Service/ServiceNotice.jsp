<%@ page import="Notice.NoticeDAO" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-23
  Time: 오후 4:55
  To change this template use File | Settings | File Templates.
--%>    <link rel = "stylesheet" href = "http://l.bsks.ac.kr/~p201887082/php_login/assets/bootstrap/css/bootstrap.min.css"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel = "stylesheet" href = "../css/Service.css"/>
    <%
        NoticeDAO noticeDAO = new NoticeDAO();
        ResultSet rs = noticeDAO.listNotice();
    %>
    <style>
        tr{
            cursor:pointer;
        }

    </style>
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
    <div class = "Service__container_content">
        <div class="col-12">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th scope="col">공지 번호</th>
                    <th scope="col">공지명</th>
                    <th scope="col">작성자</th>
                    <th scope="col">생성일</th>

                </tr>
                </thead>
                <tbody>
                    <%
                        while(rs.next()){
                    %>
                        <tr data-id = "<%=rs.getString("noticeId")%>">
                            <td><%=rs.getString("noticeId")%></td>
                            <td><%=rs.getString("noticeTitle")%></td>
                            <td><%=rs.getString("noticeWrite")%></td>
                            <td><%=rs.getString("createAt")%></td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

    </div>
</div>
<footer>
    <jsp:include page="../footer.jsp"/>
</footer>
<script src = "../js/Service.js"></script>
<script src="http://l.bsks.ac.kr/~p201887082/DiliManage/js/jq.js"></script>
</body>
</html>

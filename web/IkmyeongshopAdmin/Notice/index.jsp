<%@ page import="Notice.NoticeDAO" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-28
  Time: 오전 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">
    <link rel="shortcut icon" href="images/favicon.png">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel = "stylesheet" href = "http://l.bsks.ac.kr/~p201887082/php_login/assets/bootstrap/css/bootstrap.min.css"/>
    <link href="//cdn.muicss.com/mui-0.10.0/css/mui.min.css" rel="stylesheet" type="text/css" />
    <script src="//cdn.muicss.com/mui-0.10.0/js/mui.min.js"></script>
    <style>
        .mui-dropdown{
            position: fixed; right: 5%; bottom: 5%

        }
        .table{
            width:100%;
        }
    </style>
</head>
<%

    NoticeDAO notice = new NoticeDAO();
    ResultSet rs =notice.listNotice();

%>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

    <jsp:include page="../Drawer.jsp"/>
    <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content">
            <div class="demo-cards mdl-color--white mdl-shadow--3dp mdl-cell mdl-cell--12-col mdl-grid">
                <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp table">
                    <thead>
                    <tr>
                        <th class="mdl-data-table__cell--non-numeric">공지사항번호</th>
                        <th>공지 제목</th>
                        <th>작성자</th>
                        <th>현재 작성일</th>
                        <th>최초 작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                        <%
                            while(rs.next())
                            {
                        %>
                            <tr>
                                <td class="mdl-data-table__cell--non-numeric"><%=rs.getString("noticeId")%></td>
                                <td><%=rs.getString("noticetitle")%></td>
                                <td><%=rs.getString("noticewrite")%></td>
                                <td><%=rs.getString("createAt")%></td>
                                <td><%=rs.getString("updateAt")%></td>
                            </tr>
                        <%
                            }
                        %>



                    </tbody>
                </table>


            </div>
        </div>


    </main>

</div>

<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>

</body>
</html>

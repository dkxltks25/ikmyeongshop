<%--
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
    <link rel="stylesheet" href ="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.css"/>

    <style>
        .mdl-grid{
            display:flex;
            flex-direction: row;
            justify-content: space-around;
        }
        .mui-col-xs-6{
            width:500px;
            height:500px;
            margin:10px;
        }
    </style>
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

    <jsp:include page="Drawer.jsp"/>
    <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content">
            <div class="mui-row">
                <div class="mui-col-xs-6 mui-col-md-6 mdl-color--white mdl-shadow--3dp MainIndexCard">신규 사용자 유입률</div>
                <div class="mui-col-xs-6 mui-col-md-6 mdl-color--white mdl-shadow--3dp MainIndexCard">매출</div>
                <div class="mui-col-xs-6 mui-col-md-6 mdl-color--white mdl-shadow--3dp MainIndexCard">이번달 가장 잘 팔리는 상품</div>
                <div class="mui-col-xs-6 mui-col-md-6 mdl-color--white mdl-shadow--3dp MainIndexCard">조회수가 가장 많은 제품</div>
                <div class="mui-col-xs-6 mui-col-md-6 mdl-color--white mdl-shadow--3dp MainIndexCard">이번달 가장 장바구니에 많이 담은 상품</div>

            </div>

        </div>

    </main>

</div>

<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script src="js/Main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
<script src ="http://l.bsks.ac.kr/~p201887082/DiliManage/js/jq.js"></script>

</body>
</html>

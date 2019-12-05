<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-28
  Time: 오전 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Material Design Lite</title>
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">
    <link rel="shortcut icon" href="images/favicon.png">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

<jsp:include page="header.jsp"/>
<div class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
    <header class="demo-drawer-header">
        <img src="images/user.jpg" class="demo-avatar">
        <div class="demo-avatar-dropdown">
            <span>hello@example.com</span>
            <div class="mdl-layout-spacer"></div>
            <button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
                <i class="material-icons" role="presentation">arrow_drop_down</i>
                <span class="visuallyhidden">Accounts</span>
            </button>
            <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
                <li class="mdl-menu__item">hello@example.com</li>
                <li class="mdl-menu__item">info@example.com</li>
                <li class="mdl-menu__item"><i class="material-icons">add</i>Add another account...</li>
            </ul>
        </div>
    </header>
    <nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
        <a class="mdl-navigation__link" href="/IkmyeongshopAdmin"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">home</i>메인페이지</a>
        <a class="mdl-navigation__link" href="/IkmyeongshopAdmin/User"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">inbox</i>이용자</a>
        <a class="mdl-navigation__link" href="/IkmyeongshopAdmin/Product"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">add_shopping_cart</i>상품</a>
        <a class="mdl-navigation__link" href="/IkmyeongshopAdmin/Purchase"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">money</i>구매</a>
        <a class="mdl-navigation__link" href="/IkmyeongshopAdmin/QnA"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">call_made</i>문의</a>
        <a class="mdl-navigation__link" href="/IkmyeongshopAdmin/Notice"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">forum</i>공지사항</a>
        <div class="mdl-layout-spacer"></div>
        <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
    </nav>
</div>

<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>

</body>
</html>

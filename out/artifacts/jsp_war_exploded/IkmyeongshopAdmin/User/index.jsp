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

    <style>
        .mui-table{
            width:100%;
        }

    </style>
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
    <jsp:include page="../Drawer.jsp"/>
    <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content">
            <div class="demo-cards mdl-color--white mdl-shadow--2dp mdl-cell mdl-cell--12-col mdl-grid">
                <div class="col-12">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">사용자 선택</th>
                            <th scope="col">문의날짜</th>
                            <th scope="col">카테고리</th>
                            <th scope="col">제목</th>
                            <th scope="col">문의상태</th>
                            <th scope="col">기능</th>

                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="customCheck1" >
                                        <label class="custom-control-label" for="customCheck1">1</label>
                                    </div>
                                </td>
                                <td>사용자 테스트</td>
                                <td>사용자 테스트</td>
                                <td>사용자 테스트</td>
                                <td>사용자 테스트</td>
                                <td>
                                    <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="target1">
                                        <i class="material-icons">more_vert</i>
                                    </button>
                                    <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="target1">
                                        <li class="mdl-menu__item">상세정보</li>
                                        <li class="mdl-menu__item">사용자 삭제</li>
                                    </ul>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="customCheck2" >
                                        <label class="custom-control-label" for="customCheck2">1</label>
                                    </div>
                                </td>
                                <td>사용자 테스트</td>
                                <td>사용자 테스트</td>
                                <td>사용자 테스트</td>
                                <td>사용자 테스트</td>

                            </tr>
                            <tr>
                                <td>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="customCheck3" >
                                        <label class="custom-control-label" for="customCheck1">1</label>
                                    </div>
                                </td>
                                <td>사용자 테스트</td>
                                <td>사용자 테스트</td>
                                <td>사용자 테스트</td>
                                <td>사용자 테스트</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </table>
            </div>
        </div>
    </main>

</div>
<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>

</body>
</html>

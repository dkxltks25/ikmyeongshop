<%@ page import="USER.UserDAO" %>
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
        .mui__UserDetail{
            display:flex;
        }
        .mui__UserDetail_left{
            width:400px;
        }
        .mui__UserDetail_img{
            width:400px;
            height:400px;
        }
        .mui__UserDetail_info{
            width:50%;
        }
    </style>


</head>
<body>

<%
    String UserId = request.getParameter("UserId");
    UserDAO userDAO = new UserDAO();
    ResultSet rs = userDAO.SelectUser(UserId);
%>
<script>
    const UserId = "<%=UserId%>";
</script>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
    <jsp:include page="../Drawer.jsp"/>
    <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content">
            <div class="mui-container-lg  mdl-shadow--2dp mdl-cell mdl-cell--12-col mdl-grid mui__UserDetail">
                <div class = "mui__UserDetail_left">
                    <%
                        while(rs.next()){
                            %>
                    <%
                        String imgsrc = "";
                        if(rs.getString("userPassword")==null){
                            imgsrc = "KaKao.png";
                        }else{
                            imgsrc = "user.png";
                        }
                    %>

                    <div class = "mui__UserDetail_img">
                        <img style="height:100%" src = "../image/<%=imgsrc%>"/>

                    </div>
                </div>
                    <div class = "mui__UserDetail_info">
                        <table class="mui-table mui-table--bordered">
                        <tr class ="mui__UserInfoList">
                            <td>사용자 고유 아이디</td>
                            <td><%=rs.getString("UserNumber")%></td>
                        </tr>
                        <tr class = "mui__UserId">
                            <td>사용자 아이디</td>

                            <td><%=rs.getString("UserId")%></td>
                        </tr>
                        <tr class="mui__UserName">
                            <td>사용자 이름</td>
                            <td><%=rs.getString("userName")%></td>
                        </tr>
                        <tr class="mui__UserEmail">
                            <td>사용자 이메일</td>
                            <td><%=rs.getString("userEmail")%></td>
                        </tr>
                        <tr class="mui__UserPhone">
                            <td>사용자 전화번호</td>
                            <td><%=rs.getString("userPhone")%></td>
                        </tr>
                        <tr class="mui__UserAddress">
                            <td>사용자 주소</td>
                            <td> <%=rs.getString("userZipCode")%>
                            <br>
                            <%=rs.getString("UserAdress")%></td>
                        </tr>
                        <tr class ="mui__CreateAt">
                            <td>계정 생성일</td>
                           <td> <%=rs.getString("createAt")%></td>
                        </tr>

                        </table>
                    </div>
                    <%
                        }
                    %>
                <div class = "mui__UserDetail_right">

                    <ul class="mui-tabs__bar">
                        <li class = "UserDetail__SelectPanel mui--is-active"><a data-mui-toggle="tab" data-mui-controls="pane-events-1">구매목록</a></li>
                        <li class = "UserDetail__SelectPanel"><a data-mui-toggle="tab" data-mui-controls="pane-events-2">사용자 찜목록</a></li>
                        <li class = "UserDetail__SelectPanel"><a data-mui-toggle="tab" data-mui-controls="pane-events-3">사용자 쇼핑백 목록</a></li>
                        <li class = "UserDetail__SelectPanel"><a data-mui-toggle="tab" data-mui-controls="pane-events-4">사용자 리뷰목록</a></li>
                        <li class = "UserDetail__SelectPanel"><a data-mui-toggle="tab" data-mui-controls="pane-events-5">사용자 후기목록</a></li>
                    </ul>
                    <!--구매목록-->
                    <div class="mui-tabs__pane mui--is-active  " id="pane-events-1">
                        <table class="mui-table mui-table--bordered UserTable">
                            <thead>
                                <tr>
                                    <th>구매상품번호</th>
                                    <th>상품명</th>
                                    <th>구입가격</th>
                                    <th>구입수량</th>
                                    <th>구입일</th>
                                </tr>
                            </thead>

                        </table>
                    </div>
                    <div class="mui-tabs__pane " id="pane-events-2">
                        <table class="mui-table mui-table--bordered UserTable ">
                            <thead>
                            <tr>
                                <th>관심 상품 아이디</th>
                                <th>상품이름</th>
                                <th>상품가격</th>
                                <th>상품번호</th>
                                <th>상품재고</th>
                            </tr>
                            </thead>

                        </table>
                    </div>
                    <div class="mui-tabs__pane " id="pane-events-3">
                        <table class="mui-table mui-table--bordered  UserTable">
                            <thead>
                            <tr>
                                <th>쇼핑백 아이디</th>
                                <th>담은 상품수</th>
                                <th>상품이름</th>
                                <th>상품아이디</th>
                                <th>상품가격</th>


                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="mui-tabs__pane " id="pane-events-4">
                        <table class="mui-table mui-table--bordered UserTable">
                            <thead>
                            <th>리뷰번호</th>
                            <th>사용자아이디</th>
                            <th>평점</th>
                            <th>상품아이디</th>
                            <th>리뷰 제목</th>
                            </thead>

                        </table>
                    </div>
                    <div class="mui-tabs__pane " id="pane-events-5">Pane-31</div>
                </div>
             </div>
            </div>
    </main>
</div>


<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>



<script>
    // get toggle elements
    var toggleEls = document.querySelectorAll('[data-mui-controls^="pane-events-"]');

    function logFn(ev) {
        var s = '[' + ev.type + ']';
        s += ' paneId: ' + ev.paneId;
        s += ' relatedPaneId: ' + ev.relatedPaneId;
        console.log(s);
    }

    // attach event handlers
    for (var i=0; i < toggleEls.length; i++) {
        toggleEls[i].addEventListener('mui.tabs.showstart', logFn);
        toggleEls[i].addEventListener('mui.tabs.showend', logFn);
        toggleEls[i].addEventListener('mui.tabs.hidestart', logFn);
        toggleEls[i].addEventListener('mui.tabs.hideend', logFn);
    }
</script>
<script>

    var toggleEls = document.querySelectorAll('');
    console.log(toggleEls);
</script>
<script src = "../js/UserDetail.js"></script>
<script src ="http://l.bsks.ac.kr/~p201887082/DiliManage/js/jq.js"></script>
</body>
</html>

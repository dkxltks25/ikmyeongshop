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
            justify-content: space-between;
        }
        .mui__UserDetail_left{
            width:50%;
            float:left;
        }
        .mui__UserDetail_img{
            width:400px;
            height:400px;
        }
    </style>


</head>
<body>

<%
    String UserId = request.getParameter("UserId");
    UserDAO userDAO = new UserDAO();
    ResultSet rs = userDAO.SelectUser(UserId);


%>
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
                        <img style="height:100%"src = "../image/<%=imgsrc%>"/>

                    </div>
                    <div class = "mui__UserDetail_info">
                        <div class ="mui__UserNumber">
                            <%=rs.getString("UserNumber")%>
                        </div>
                        <div class = "mui__UserId">
                            <%=rs.getString("UserId")%>
                        </div>
                        <div class="mui__UserName">
                            <%=rs.getString("userName")%>
                        </div>
                        <div class="mui__UserEmail">
                            <%=rs.getString("userEmail")%>
                        </div>
                        <div class="mui__UserPhone">
                            <%=rs.getString("userPhone")%>
                        </div>
                        <div class="mui__UserAddress">
                            <%=rs.getString("userZipCode")%>
                            <br>
                            <%=rs.getString("UserAdress")%>
                        </div>
                        <div class ="mui__CreateAt">
                            <%=rs.getString("createAt")%>
                        </div>
                        <div class="mui__UpdateAt">
                            <%=rs.getString("updateAt")%>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
                <div class = "mui__UserDetail_right">

                    <ul class="mui-tabs__bar">
                        <li class="mui--is-active"><a data-mui-toggle="tab" data-mui-controls="pane-events-1">구매목록</a></li>
                        <li><a data-mui-toggle="tab" data-mui-controls="pane-events-2">사용자 찜목록</a></li>
                        <li><a data-mui-toggle="tab" data-mui-controls="pane-events-3">사용자 쇼핑백 목록</a></li>
                        <li><a data-mui-toggle="tab" data-mui-controls="pane-events-4">사용자 리뷰목록</a></li>
                        <li><a data-mui-toggle="tab" data-mui-controls="pane-events-5">사용자 후기목록</a></li>
                    </ul>
                    <!--구매목록-->
                    <div class="mui-tabs__pane mui--is-active" id="pane-events-1">
                        리스트보기/통계보기
                        <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-1">
                            <input type="checkbox" id="switch-1" class="mdl-switch__input" checked>





                            <span class="mdl-switch__label"></span>
                        </label>

                    </div>
                    <div class="mui-tabs__pane" id="pane-events-2">Pane-2</div>
                    <div class="mui-tabs__pane" id="pane-events-3">Pane-3</div>
                    <div class="mui-tabs__pane" id="pane-events-4">Pane-31</div>
                    <div class="mui-tabs__pane" id="pane-events-5">Pane-31</div>
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
</body>
</html>

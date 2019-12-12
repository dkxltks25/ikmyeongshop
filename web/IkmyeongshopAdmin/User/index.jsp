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
        .mui-table{
            width:100%;
        }
        .mui-tabs__pane{
            width:100%;
        }
        .custom_mui_card{
            display:flex;
            flex-wrap: wrap;
        }
        .custom_mui_card div {
            margin: 15px;
            transition: 0.3s;
        }


    </style>
</head>
<body>

<%
    UserDAO userDAO = new UserDAO();
    ResultSet rs = userDAO.AllUserSelect();

%>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
    <jsp:include page="../Drawer.jsp"/>
    <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content">
            <div class="mui-container-lg  mdl-shadow--2dp mdl-cell mdl-cell--12-col mdl-grid">
                <ul class="mui-tabs__bar">
                    <li class="mui--is-active"><a data-mui-toggle="tab" data-mui-controls="pane-events-1">리스트</a></li>
                    <li><a data-mui-toggle="tab" data-mui-controls="pane-events-2">카드</a></li>
                </ul>
                <div class="mui-tabs__pane mui--is-active" id="pane-events-1">
                    <div class="col-12">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">사용자 선택</th>
                                <th scope="col">사용자명</th>
                                <th scope="col">사용자 구분</th>
                                <th scope="col">사용자이메일</th>
                                <th scope="col">사용자 등록일자</th>
                                <th scope="col">기능</th>

                            </tr>
                            </thead>
                            <tbody>
                            <%
                                int Number = 0;
                                while(rs.next()){
                                    Number++;
                            %>
                            <tr>
                                <td>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="customCheck<%=Number%>" >
                                        <label class="custom-control-label" for="customCheck<%=Number%>"><%=rs.getString("UserNumber")%></label>
                                    </div>
                                </td>
                                <td><%=rs.getString("UserNAME")%></td>
                                <td><%if(rs.getString("UserPassword") == null) {out.println("카카오이용자");}else {out.println("일반이용자");}%></td>
                                <td><%=rs.getString("UserEmail")%></td>
                                <td><%=rs.getString("createAt")%></td>
                                <td>
                                    <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="target<%=Number%>">
                                        <i class="material-icons">more_vert</i>
                                    </button>
                                    <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="target<%=Number%>">
                                        <li class="mdl-menu__item mui_list_custom detailUser" data-id="<%=rs.getString("UserId")%>">상세정보</li>
                                        <li class="mdl-menu__item mui_list_custom" >사용자 삭제</li>
                                    </ul>
                                </td>

                            </tr>
                            <%
                                }
                                rs.beforeFirst();
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="mui-tabs__pane" id="pane-events-2">

                    <div class = "custom_mui_card">
                        <%
                            while (rs.next()){
                                String Url = "";
                                if(rs.getString("UserPassword") == null){
                                    Url="../image/KaKao.png";
                                }else{
                                    Url="../image/user.png";
                                }
                        %>
                    <div class="demo-card-square mdl-card mdl-shadow--2dp User__List" style="width:300px">
                        <div class="mdl-card__title mdl-card--expand" style="height:200px">
                            <img style="height:100%" src="<%=Url%>"/>
                        </div>
                        <div class="mdl-card__actions mdl-card--border">

                                이름:<%=rs.getString("UserName")%>
                                <br>
                                사용자ID:<%=rs.getString("UserId")%>
                                <br>
                                사용자Email:<%=rs.getString("UserEmail")%>
                        </div>
                        <div class="mdl-card__actions mdl-card--border">
                            <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="./UserDetail.jsp?UserId=<%=rs.getString("UserId")%>">
                                View detail
                            </a>
                        </div>
                    </div>
                        <%
                            }
                        %>

                </div>
                </div>
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

            </table>
            </div>
        </div>
    </main>

</div>
<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script src="../js/User.js"></script>
</body>
</html>

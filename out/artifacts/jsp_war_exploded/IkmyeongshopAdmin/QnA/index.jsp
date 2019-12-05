<%@ page import="Product.ProductDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="QnA.QnADAO" %><%--
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
        .mui-tabs__pane{
            width:100%;
        }
        .QnA_custom_table{
            width:100%;
        }
        .InputContentArea{
            transition: 0.3s;
        }
        .ViewContentArea{
            transition: 0.3s;
        }
    </style>
</head>
<body>

<%
    QnADAO qnADAO = new QnADAO();
    ResultSet rs = qnADAO.AdminSeeAllQnA("1");

%>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

    <jsp:include page="../Drawer.jsp"/>
    <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content Product_Card_Wrap">
           <div class="demo-cards mdl-color--white mdl-shadow--3dp mdl-cell mdl-cell--12-col mdl-grid">
               <ul class="mui-tabs__bar">
                   <li class="mui--is-active"><a data-mui-toggle="tab" data-mui-controls="pane-events-1">처리 되지 않은 문의</a></li>
                   <li><a data-mui-toggle="tab" data-mui-controls="pane-events-2">처리 한 문의</a></li>
               </ul>
               <div class="mui-tabs__pane mui--is-active" id="pane-events-1">
                   <table class="mui-table mui-table--bordered QnA_custom_table">
                       <thead>
                       <tr>
                           <th>문의번호</th>
                           <th>작성자아이디</th>
                           <th>문의제목</th>
                           <th>작성일</th>
                           <th>최초 작성일</th>

                           <th>기능</th>
                       </tr>
                       </thead>
                       <tbody>
                       <%
                           int Number = 0;
                           while(rs.next()){
                               Number++;
                       %>
                           <tr id = "QnANumber<%=rs.getString("QnAId")%>">
                               <td><%=rs.getString("QnAId")%></td>
                               <td><%=rs.getString("UserId")%></td>
                               <td><%=rs.getString("QnAtitle")%></td>
                               <td><%=rs.getString("createAt")%></td>
                               <td><%=rs.getString("updateAt")%></td>
                               <td>
                                   <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="target<%=Number%>">
                                       <i class="material-icons">more_vert</i>
                                   </button>
                                   <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect" for="target<%=Number%>">
                                       <li class="mdl-menu__item list_customButton_Content" data-id="<%=rs.getString("QnAId")%>">내용보기</li>
                                       <li class="mdl-menu__item list_customButton_Write " data-id="<%=rs.getString("QnAId")%>">답글달기</li>
                                   </ul>
                               </td>
                           </tr>

                       <%
                           }
                       %>

                       </tbody>
                   </table>
                </div>
               <div class="mui-tabs__pane mui--is-active" id="pane-events-2">

               </div>
        </div>
    </main>

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

<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script src="../js/QnA.js"></script>
<script src ="http://l.bsks.ac.kr/~p201887082/DiliManage/js/jq.js"></script>
</body>
</html>

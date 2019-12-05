<%@ page import="Product.ProductDAO" %>
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
        .floatingBottomButton{
            position: fixed; right: 5%; bottom: 5%
        }
        .Product_Card_Wrap{
        }
        .card{
            margin:2px;
        }
        .floatingProductBottomButton{
          position:relative;
            right:5%;
            bottom:5%;
        }
    </style>
</head>
<body>

<%
    ProductDAO proDAO = new ProductDAO();
    ResultSet rs = proDAO.AdminList();
%>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

    <jsp:include page="../Drawer.jsp"/>
    <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content Product_Card_Wrap">
            <div class="demo-cards mdl-color--white mdl-shadow--3dp mdl-cell mdl-cell--12-col mdl-grid">
                <%
                    int Number = 0;
                    while(rs.next()){
                        Number++;
                %>
                <div class="card" style="width: 18rem;">
                    <img src="../../image/Thumbnail/<%=rs.getString("ProductId")%>.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%=rs.getString("ProductName")%></h5>
                        <p class="card-text">원가:<%=rs.getString("ProductPrice")%>
                            <br>
                            상품할인률:<%=rs.getString("ProductDisCount")%>%
                            <br>
                            조회수:<%=rs.getString("PRODUCTVIEWCOUNT")%>
                            <br>
                            판매량:곧 추가
                            </p>

                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon floatingProductBottomButton" id="target<%=Number%>">
                            <i class="material-icons">more_vert</i>
                        </button>
                        <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="target<%=Number%>">
                            <li class="mdl-menu__item ListViewDetail" data-id=<%=rs.getString("ProductId")%>>상세정보</li>
                            <li class="mdl-menu__item">상품 삭제</li>
                        </ul>
                    </div>
                </div>
                <%
                    }
                %>
                <div class="card" style="width: 18rem;">
                    <img src="../../image/Thumbnail/1.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div> <div class="card" style="width: 18rem;">
                <img src="../../image/Thumbnail/1.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div> <div class="card" style="width: 18rem;">
                <img src="../../image/Thumbnail/1.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div> <div class="card" style="width: 18rem;">
                <img src="../../image/Thumbnail/1.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div> <div class="card" style="width: 18rem;">
                <img src="../../image/Thumbnail/1.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div> <div class="card" style="width: 18rem;">
                <img src="../../image/Thumbnail/1.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div> <div class="card" style="width: 18rem;">
                <img src="../../image/Thumbnail/1.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
            </div>
        </div>
        <div class="mui-dropdown mui-dropdown--up floatingBottomButton">
            <button class="mui-btn mui-btn--fab" data-mui-toggle="dropdown">+</button>
            <ul class="mui-dropdown__menu">
                <li><a href="./RegistProduct.jsp">상품추가하기</a></li>
                <li><a href="#">상품삭제하기</a></li>
                <li><a href="#">상품수정하기</a></li>
            </ul>
        </div>

    </main>

</div>

<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script src = "../js/Product.js"></script>
</body>
</html>

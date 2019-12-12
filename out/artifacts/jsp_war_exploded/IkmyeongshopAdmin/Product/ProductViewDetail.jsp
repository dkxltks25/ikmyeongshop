<%@ page import="USER.UserDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Product.ProductDAO" %><%--
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
    <link rel="stylesheet" href ="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.css"/>


    <style>
        .ProductViewDetail__Container{
            width:100%;
        }
        .ProductViewDetail__Container_Product{
            width:100%;
            display:flex;
            justify-content: space-around;
        }
        .ProductViewDetail_image{
            width:460px;
        }
        .ProductViewDetail_image img{
            width:100%;
        }
        .ProductViewDetail__info{
            width:90%;
        }
    </style>


</head>
<body>

<%
    String ProductId = request.getParameter("ProductId");
    ProductDAO proDAO = new ProductDAO();
    ResultSet rs = proDAO.SelectProduct(ProductId);
%>
<script>
    const ProductId = "<%=ProductId%>";
</script>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
    <jsp:include page="../Drawer.jsp"/>
    <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content">
            <div class="mui-container-lg  mdl-shadow--2dp mdl-cell mdl-cell--12-col mdl-grid mui__UserDetail">
                <%
                    if(rs.next()){
                %>
                    <div class = "ProductViewDetail__Container">
                        <div class="ProductViewDetail__Container_Product">
                            <div class = "ProductViewDetail_image">
                                <img src = "../../image/Thumbnail/<%=ProductId%>.jpg"/>
                            </div>
                            <div class = "ProductViewDetail__info">
                                <table class="mui-table mui-table--bordered">
                                    <tbody>
                                    <tr>
                                        <td>상품번호</td>
                                        <td><%=rs.getString("ProductId")%></td>
                                    </tr>
                                    <tr>
                                        <td>상품이름</td>
                                        <td><%=rs.getString("ProductName")%></td>
                                    </tr>
                                    <tr>
                                        <td>상품종류</td>
                                        <td><%=rs.getString("ProductClass")%></td>
                                    </tr>
                                    <tr>
                                        <td>상품가격</td>
                                        <td><%=rs.getString("ProductPrice")%></td>
                                    </tr>
                                    <tr>
                                        <td>상품 잔량</td>
                                        <td><%=rs.getString("ProductCount")%></td>
                                    </tr>
                                    <tr>
                                        <td>상품할인률</td>
                                        <td><%=rs.getString("ProductPrice")%></td>
                                    </tr>
                                    <tr>
                                        <td>상품 등록일</td>
                                        <td><%=rs.getString("createAt")%></td>
                                    </tr>
                                    <tr>
                                        <td>상품 수정일</td>
                                        <td><%=rs.getString("updateAt")%></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                <%
                    }
                %>
                <div class = "mui__UserDetail_right">

                    <ul class="mui-tabs__bar">
                        <li class="List_Product mui--is-active "><a data-mui-toggle="tab" data-mui-controls="pane-events-1">구매자 명단</a></li>
                        <li class ="List_Product"><a data-mui-toggle="tab" data-mui-controls="pane-events-2">관심 상품 등록 사용자</a></li>
                        <li class ="List_Product"><a data-mui-toggle="tab" data-mui-controls="pane-events-3">쇼핑백에 넣은 사용자</a></li>
                        <li class ="List_Product"><a data-mui-toggle="tab" data-mui-controls="pane-events-4">리뷰 남긴 사용자</a></li>
                        <li class ="List_Product"><a data-mui-toggle="tab" data-mui-controls="pane-events-5">문의 넣은 사용자</a></li>
                    </ul>
                    <!--구매목록-->
                    <div class="mui-tabs__pane mui--is-active" id="pane-events-1">
                        <div class = "ProductViewDetail__toggleBar">
                            <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-1">
                                <input type="checkbox" id="switch-1" class="mdl-switch__input ProductViewDetail__toggle" checked>
                                <span class="mdl-switch__label"></span>
                            </label>
                        </div>
                        <div>
                            <table class="mui-table mui-table--bordered EachListTable">
                            </table>
                        </div>

                    </div>
                    <div class="mui-tabs__pane" id="pane-events-2">
                        <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-2">
                            <input type="checkbox" id="switch-2" class="mdl-switch__input ProductViewDetail__toggle" checked>
                            <span class="mdl-switch__label"></span>
                        </label>
                        <div>
                            <table class="mui-table mui-table--bordered EachListTable">
                            </table>
                        </div>
                    </div>
                    <div class="mui-tabs__pane" id="pane-events-3">

                        <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-3">
                            <input type="checkbox" id="switch-3" class="mdl-switch__input ProductViewDetail__toggle" checked>
                            <span class="mdl-switch__label"></span>
                        </label>

                        <div>
                            <table class="mui-table mui-table--bordered EachListTable">
                            </table>
                        </div>
                    </div>
                    <div class="mui-tabs__pane" id="pane-events-4">
                        <div class = "ProductViewDetail__toggleBar">
                            <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-4">
                                <input type="checkbox" id="switch-4" class="mdl-switch__input ProductViewDetail__toggle" checked>
                                <span class="mdl-switch__label"></span>

                            </label>
                            <input class="mdl-slider mdl-js-slider" type="range" min="0" max="2" value="0" tabindex="0">
                            <div >
                                <table class="mui-table mui-table--bordered EachListTable">
                                </table>
                            </div>
                        </div>

                    </div>
                    <div class="mui-tabs__pane" id="pane-events-5">Pane-31</div>
                </div>
            </div>
            </div>
        </div>
    </main>
</div>


<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script src="../js/ProductDetail.js"></script>
<script src ="http://l.bsks.ac.kr/~p201887082/DiliManage/js/jq.js"></script>



</body>
</html>

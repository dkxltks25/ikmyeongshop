<%@ page import="Product.ProductDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Product.ProductDAO"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
    <title>Title</title>
<style>
    .container{
        padding: 20px 0px 20px 10px;
    }
    .ShoppingBag__container_text{
        padding:20px 0px 20px 10px;
        border-bottom:1px solid black;
    }
    .container h4 {
        margin: 2rem 0rem 1rem;
    }
    .ShoppingBag_row{
        padding:20px 0px 20px 10px;
    }
    td, th {
        vertical-align: middle;
        }

    .ShoppingBag__Sum_wrap{
        margin: 30px 0 0 0;
        padding: 50px 40px 50px 40px;
        border: 2px solid #d6d6d6;
    }
    .ShoppingBag__Sum_wrap div{
        float:right;
        width:12%;
        margin-right:30px;
    }
    .ShoppingBag__SelectButton_wrap{
        width:100%;
        padding:20px 10px 20px 10px;
    }
    .ShoppingBag__SelectButton_wrap button{
        margin-left:20px;
    }
    .ShoppingBag__SelectButton{
        min-width: 190px;
        height: 55px;
        padding: 0 20px 0 20px;
        color: #3e3d3c;
        font-weight: bold;
        font-size: 14px;
        border: 1px solid #cccccc;
        background: #fff;
        cursor: pointer;
        float:right;
        border: 1px solid #404040;
        color: #404040;

    }
    .ShoppingBag__AllButton{
        min-width: 190px;
        height: 55px;
        padding: 0 20px 0 20px;
        color: #ffffff;
        font-size: 14px;
        border: 1px solid #ab3e55;
        background: #ab3e55;
        cursor: pointer;
        font-weight: bold;
        background: #404040;
        border: 1px solid #404040;
        float:right;
    }
</style>
    <link rel = "stylesheet" href = "http://l.bsks.ac.kr/~p201887082/php_login/assets/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <header>
        <jsp:include page="../header.jsp"/>
    </header>
        <!--
          Session이 없는 유저는 그냥 테이블만 출력한다.
          Session이 있는 유저는 유저명과 제품명 제품카운터를 받아온다 .
          InsertShoppingBag함수에는 유저명,유저본호 아이템 카운트를 받는다.
        -->
    <div class="container">
        <div class = "location">
        </div>
        <div class = "ShoppingBag__container_text">
            <h2>장바구니</h2>
        </div>
        <div class="row ShoppingBag_row">
            <div class="col-12">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">
                        </th>
                        <th scope="col">상품정보</th>
                        <th scope="col">수량</th>
                        <th scope="col">상품금액</th>
                        <th scope="col">합계금액</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ResultSet rs;
                        String ProductNumber = request.getParameter("ProductNumber");
                        String ItemCount = request.getParameter("ItemCount");
                        String Session_User = (String)session.getAttribute("user_id") == null ? "" : (String)session.getAttribute("user_id");
                        ProductDAO productDAO = new ProductDAO();
                        if(Session_User.equals("") || ProductNumber == null || ItemCount == null){
                             rs =  productDAO.Shopinglist(Session_User);
                        }
                        else{
                            productDAO.InsertShoppingBag(Session_User,ProductNumber,ItemCount);
                             rs = productDAO.Shopinglist(Session_User);
                        }
                        try {
                            int SelectId = 0;
                            while(rs.next()){
                                int SumPrice = Integer.parseInt(rs.getString("productPrice")) * Integer.parseInt(rs.getString("ShoppingBagCount"));
                                SelectId++;
                                %>
                                    <tr>
                                        <td>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input ProductSelected" id="customCheck<%=SelectId%>" data-id=<%=rs.getString("ShoppingBagId")%>>
                                                <label class="custom-control-label " for="customCheck<%=SelectId%>"><%=rs.getString("ShoppingBagId")%></label>
                                            </div>
                                        </td>
                                        <td>
                                            <%=rs.getString("ProductName")%>
                                        </td>
                                        <td id = "Count<%=SelectId%>"><%=rs.getString("ShoppingBagCount")%></td>
                                        <td id = "Price<%=SelectId%>"><%=rs.getString("productPrice")%></td>
                                        <td><%=SumPrice%></td>
                                    </tr>
                                <%
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    %>
                    </tbody>
                </table>
                <div class = "ShoppingBag__Sum_wrap">
                    <div class = "ShoppingBag__Select">
                        총 <span id = "SelectNumber">0</span> 개의 상품 금액<br>
                            <span id = "SelectPrice">0</span>원
                    </div>
                    <div class = "ShoppingBag__Arrive">
                        배송비<br>
                        2,500원
                    </div>
                    <div class = "ShoppingBag__All">
                        합계
                        <span id ="SelectAllPrice"></span>
                    </div>
                </div>
                <div class="ShoppingBag__SelectButton_wrap">
                    <button class = "ShoppingBag__SelectButton">
                        선택 상품 주문
                    </button>
                    <button class ="ShoppingBag__AllButton">
                        전체 상품 주문
                    </button>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <jsp:include page="../footer.jsp"/>
    </footer>
    <script src = "../js/shoppingBag.js"></script>
</body>
</html>

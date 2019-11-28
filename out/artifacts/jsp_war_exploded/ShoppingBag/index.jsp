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
    .table-image {
    td, th {
        vertical-align: middle;
        }
    }
    .ShoppingBag__Sum_wrap{
        margin: 30px 0 0 0;
        padding: 50px 40px 50px 40px;
        border: 2px solid #d6d6d6;
    }
    .ShoppingBag__Sum_wrap div{
        float:right;
        margin-right:30px;
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
                            if(rs.next()){
                                int SumPrice = Integer.parseInt(rs.getString("productPrice")) * Integer.parseInt(rs.getString("ShoppingBagCount"));
                                %>
                                    <tr>
                                        <td>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="customCheck1" >
                                                <label class="custom-control-label" for="customCheck1"><%=rs.getString("ShoppingBagId")%></label>
                                            </div>
                                        </td>
                                        <td><%=rs.getString("ProductName")%></td>
                                        <td><%=rs.getString("ShoppingBagCount")%></td>
                                        <td><%=rs.getString("productPrice")%></td>
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
                        총 <span id = "SelectNumber"></span> 개의 상품 금액<br>
                            <span id = "SelectPrice"></span>원
                    </div>
                    <div class = "ShoppingBag__Arrive">

                   asd </div>
                    <div class = "ShoppingBag__All">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <jsp:include page="../footer.jsp"/>
    </footer>
</body>
</html>

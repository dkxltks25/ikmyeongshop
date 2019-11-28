<%@ page import="Product.ProductDAO"%>
<%@ page import="java.sql.ResultSet" %><
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="product" class="Product.Product" scope="page" />
<html>
<head>
    <link rel = "stylesheet" href = "../css/ProductView.css"/>
    <link rel = "stylesheet" href = "http://l.bsks.ac.kr/~p201887082/DiliManage/css/bootstrap.css"/>
    <%
        String ProductNumber = request.getParameter("ProductNumber");
        session.setAttribute("ProductNumber",ProductNumber);
        String price="";
        ProductDAO productDAO = new ProductDAO();
        ResultSet rs = productDAO.SelectProduct(ProductNumber);
        if(rs.next()){
            out.println(rs.getString("ProductId"));
            out.println(rs.getString("ProductName"));
            out.println(rs.getString("ProductClass"));
            out.println(rs.getString("ProductCount"));
            out.println(rs.getString("ProductDiscount"));
            out.println(rs.getString("ProductPrice"));
            price = rs.getString("ProductPrice");

            out.println(rs.getString("CreateAt"));
            out.println(rs.getString("UpdateAt"));

        }

    %>
    <title>Title</title>
    <script>
        let price = "<%=price%>";
        let productNumber = "<%=ProductNumber%>";
    </script>
</head>
<body>
    <header>
        <jsp:include page="../header.jsp"/>
    </header>

    <div class = "product_view_container">
        <div class = "product_view_container_top">
            <div class = "product_view_location">
                <em class = "product_view_href">
                    <a href = "#" class = "local_home">HOME</a>
                </em>
            </div>

            <div class = "product_view_wrap">
                <div class = "product_view_img">
                    <img src ="../image/Thumbnail/<%=ProductNumber%>.jpg"/>
                </div>
                <div class = "product_view_option">
                    <h3>말랑말랑 고명이 인형</h3>
                    <div class = "product_view_options">
                        <div class = "product_view_option_line">
                            <div class = "first_info">판매가</div>
                            <div class = "second_info">
                                <strong>
                                    <%=price%>원
                                </strong>
                            </div>
                        </div>

                        <div class = "product_view_option_line">
                            <div class = "first_info">구매제한</div>
                            <div class = "second_info">
                                <strong>
                                    최소 1개
                                </strong>
                            </div>
                        </div>

                        <div class = "product_view_option_line">
                            <div class = "first_info">구매혜택</div>
                            <div class = "second_info">
                                <strong>
                                    적립 마일리지:+125원
                                </strong>
                            </div>
                        </div>

                        <div class = "product_view_option_line">
                            <div class = "first_info">배송비</div>
                            <div class = "second_info">
                                <strong>
                                    2500원 / 주문시결제
                                </strong>
                            </div>
                        </div>

                        <div class = "product_view_option_line">
                            <div class = "first_info">상품번호</div>
                            <div class = "second_info">
                                <strong>
                                    1
                                </strong>
                            </div>
                        </div>

                        <div class = "product_view_option_line">
                            <div class = "first_info">상품재고</div>
                            <div class = "second_info">
                                <strong>
                                    96개
                                </strong>
                            </div>
                        </div>

                        <div class = "product_view_price_line">
                            <div class = "product_view_price_name">
                                <strong>
                                    말랑말랑 고명이 인형
                                </strong>
                            </div>

                            <div class = "product_view_price_updw">
                                <div class = "">
                                    <input value = "1" id = "product_view_price_count" class = "product_view_price_count" type = "text" >
                                    <Button class = "product_view_price_btn">△</Button>
                                    <Button class = "product_view_price_btn">▽</Button>
                                </div>
                            </div>
                            <div class = "product_view_price">
                                <div class = "">
                                    <strong id = "product_price"><%=price%></strong>
                                </div>
                            </div>
                        </div>
                        <div class = "full_price_wrap">
                            <div class = "full_price">
                                <strong>총 상품금액</strong>
                                <strong id = "product_full_price" class ="full_price_left"><%=price%></strong>
                            </div>
                        </div>
                        <div class = "sum_price_wrap">
                            <div class = "sum_price">
                                <strong>총 합계금액:</strong>&nbsp&nbsp&nbsp
                                <strong id = "product_sum_price"class ="full_price_left"><%=price%></strong>
                            </div>
                        </div>
                        <div class = "Product_purchase_wrap">
                            <div class = "Product_purchase_bucket">
                                <Button id = "MoveShoppingBag">장바구니</Button>
                            </div>
                            <div class = "Product_purchase_on">
                                <Button id = "MovePurchase">바로구매</Button>
                            </div>
                            <div class = "Product_purchase_attention">
                                <Button id = "MoveAttention">관심상품</Button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class = "product_view_container_bottom">

            <div class = "product_view_bottom_view">

                <div class = "product_view_list">
                    <span class = "product_view_list_item"><a href = "#info">상품상세정보</a></span>
                    <span class = "product_view_list_item"><a href = "#arrive">배송안내</a></span>
                    <span class = "product_view_list_item"><a href = "#change">교환 및 반품안내</a></span>
                    <span class = "product_view_list_item"><a href = "#review">상품후기</a></span>
                    <span class = "product_view_list_item"><a href = "#QnA">상품문의</a></span>

                </div>
                <div class = "item_view">

                </div>

            </div>

        </div>
    </div>
    <footer>
        <jsp:include page="../footer.jsp"/>

    </footer>
    <script src = "../js/ProductView.js"></script>

</body>
</html>

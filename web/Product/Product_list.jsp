
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Product.ProductDAO"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.xml.transform.Result" %>
<jsp:useBean id="product" class="Product.Product" scope="page" />
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/product_list.css"/>
</head>
<body>
    <%

        ProductDAO productDAO = new ProductDAO();
        String Product_Class = request.getParameter("ProductClass");
        ResultSet rs = productDAO.list();
        if(rs.next()){
            out.println(rs.getString("ProductId"));
            out.println(rs.getString("ProductName"));
            out.println(rs.getString("ProductClass"));
            out.println(rs.getString("ProductCount"));
            out.println(rs.getString("ProductDiscount"));
            out.println(rs.getString("ProductPrice"));
            out.println(rs.getString("CreateAt"));
            out.println(rs.getString("UpdateAt"));

        }

    %>
    <script>
        let jsp_value = "<%=Product_Class%>";
    </script>
<header>
    <jsp:include page="../header.jsp"/>
</header>
    <div class="product_list_container">
        <div class="product_list_location">
            <span><a href = "#">Home</a></span> >
            <select class = "product_list_productClass" id = "selectBox">
                <option value="00000001">DOLL</option>
                <option value="00000002">DOLL2</option>
                <option value="00000003">DOLL</option>
                <option value="00000004">DOLL</option>
                <option value="00000005">DOLL</option>
                <option value="00000005">DOLL</option>
                <option value="00000005">DOLL</option>
            </select>
        </div>
        <div class = "product_list_title">
            <h2>DOLL</h2>
        </div>
        <div class = "product_list_wrap">
            <span class = "product_list_Count">상품 <strong>1</strong>개</span>
            <div class = "product_list_form">
                <div class = "product_list_form_sort">
                    <div class = "product_list_form_sort_left">
                        <span  class = "product_list_form_sort_item">추천순</span>
                        <span  class = "product_list_form_sort_item">추천순</span>
                        <span  class = "product_list_form_sort_item">추천순</span>
                        <span  class = "product_list_form_sort_item">추천순</span>
                        <span  class = "product_list_form_sort_item">추천순</span>
                    </div>
                </div>
            </div>
        </div>

        <div class = "product_list_item">
            <div class = "itemBox">
                <div class = "item_count">
                    <div class = "photoBox">
                        <a href = "ProductView.jsp?ProductNumber=1">
                            <img src ="../image/Thumbnail/1.jpg"/>
                        </a>
                    </div>
                    <div class = "textBox">
                        <a href = "#">
                            <strong>익명이 인형</strong>
                        </a>
                    </div>
                    <div class = "priceBox">
                        <strong>150000</strong>
                    </div>
                </div>
            </div>
            <div class = "itemBox">
                <div class = "item_count">
                    <div class = "photoBox">
                        <a href = "#">
                            <img src ="../image/Thumbnail/1.jpg"/>
                        </a>
                    </div>
                    <div class = "textBox">
                        <a href = "#">
                            <strong>익명이 인형</strong>
                        </a>
                    </div>
                    <div class = "priceBox">
                        <strong>150000</strong>
                    </div>
                </div>
            </div>
            <div class = "itemBox">
                <div class = "item_count">
                    <div class = "photoBox">
                        <a href = "#">
                            <img src ="../image/Thumbnail/1.jpg"/>
                        </a>
                    </div>
                    <div class = "textBox">
                        <a href = "#">
                            <strong>익명이 인형</strong>
                        </a>
                    </div>
                    <div class = "priceBox">
                        <strong>150000</strong>
                    </div>
                </div>
            </div>
            <div class = "itemBox">
                <div class = "item_count">
                    <div class = "photoBox">
                        <a href = "#">
                            <img src ="../image/Thumbnail/1.jpg"/>
                        </a>
                    </div>
                    <div class = "textBox">
                        <a href = "#">
                            <strong>익명이 인형</strong>
                        </a>
                    </div>
                    <div class = "priceBox">
                        <strong>150000</strong>
                    </div>
                </div>
            </div>
            <div class = "itemBox">
                <div class = "item_count">
                    <div class = "photoBox">
                        <a href = "#">
                            <img src ="../image/Thumbnail/1.jpg"/>
                        </a>
                    </div>
                    <div class = "textBox">
                        <a href = "#">
                            <strong>익명이 인형</strong>
                        </a>
                    </div>
                    <div class = "priceBox">
                        <strong>150000</strong>
                    </div>
                </div>
            </div>
            <div class = "itemBox">
                <div class = "item_count">
                    <div class = "photoBox">
                        <a href = "#">
                            <img src ="../image/Thumbnail/1.jpg"/>
                        </a>
                    </div>
                    <div class = "textBox">
                        <a href = "#">
                            <strong>익명이 인형</strong>
                        </a>
                    </div>
                    <div class = "priceBox">
                        <strong>150000</strong>
                    </div>
                </div>
            </div>
        </div>
        <div class = "product_list_button">
            <button class = "nextButton" >1</button>
            <button class = "nextButton" >1</button>
            <button class = "nextButton" >1</button>
        </div>
    </div>
<footer>
    <jsp:include page="../footer.jsp"/>
</footer>
    <script src="../js/product_list.js"></script>

</body>
</html>

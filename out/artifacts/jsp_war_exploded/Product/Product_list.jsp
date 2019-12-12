
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Product.ProductDAO"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.xml.transform.Result" %>
<%@ page import="java.sql.ResultSetMetaData" %>
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
        String Product_option = request.getParameter("ProductOption");

        if(Product_Class == null){
            Product_Class = "00000001";
        }
        if(Product_option == null){
            Product_option = "1";
        }
        ResultSet rs = productDAO.list(Product_Class,Product_option);

        rs.last();
        int row = rs.getRow();
        rs.beforeFirst();
    %>
    <script>
        let jsp_value = "<%=Product_Class%>";
        let jsp_option = "<%=Product_option%>";
    </script>
<header>
    <jsp:include page="../header.jsp"/>
</header>
    <div class="product_list_container">
        <div class="product_list_location">
            <span><a href = "#">Home</a></span>
            <select class = "product_list_productClass" id = "selectBox">
                <option value="00000001">DOLL</option>
                <option value="00000002">FIGURE & TOY</option>
                <option value="00000003">FANCY</option>
                <option value="00000004">ACCESSORY</option>
                <option value="00000005">LIVING</option>
                <option value="00000006">KITCHEN & BATHROOM</option>
                <option value="00000007">MOBILE</option>
            </select>
        </div>
        <div class = "product_list_title">
            <h2>DOLL</h2>
        </div>
        <div class = "product_list_wrap">
            <span class = "product_list_Count">상품 <strong><%=row%></strong>개</span>
            <div class = "product_list_form">
                <div class = "product_list_form_sort">
                    <div class = "product_list_form_sort_left">
                        <span  class = "product_list_form_sort_item">추천순</span>
                        <span  class = "product_list_form_sort_item">판매인기순</span>
                        <span  class = "product_list_form_sort_item">낮은가격순</span>
                        <span  class = "product_list_form_sort_item">높은가격순</span>
                        <span  class = "product_list_form_sort_item">상품평순</span>
                        <span  class = "product_list_form_sort_item">등록일순</span>
                    </div>
                </div>
            </div>
        </div>
        <div class = "product_list_item">
        <%
        while(rs.next())
        {
            %>

            <div class = "itemBox">
                <div class = "item_count">
                    <div class = "photoBox">
                            <a href = "ProductView.jsp?ProductNumber=<%=rs.getString("PRODUCTID")%>">
                                <img src ="../image/Thumbnail/<%=rs.getString("PRODUCTID")%>.jpg"/>
                        </a>
                    </div>
                    <div class = "textBox">
                        <a href = "ProductView.jsp?ProductNumber=<%=rs.getString("PRODUCTID")%>">
                            <strong><%=rs.getString("PRODUCTNAME")%></strong>
                        </a>
                    </div>
                    <div class = "priceBox">
                        <strong><%=rs.getString("PRODUCTPRICE")%></strong>
                    </div>
                </div>
            </div>

    <%
    }
    %>
        </div>

    </div>

    <footer>
    <jsp:include page="../footer.jsp"/>
</footer>
    <script src="../js/product_list.js"></script>

</body>
</html>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="Product.ProductDAO" %>
<%@ page import="sun.rmi.server.InactiveGroupException" %>
<%@ page import="USER.UserDAO" %>
<%@ page import="org.w3c.dom.UserDataHandler" %>
<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-12-05
  Time: 오후 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href ="../css/Purchase.css"/>
</head>
<body>
    <%
        String UserId = (String) session.getAttribute("user_id");

        String TEST = request.getParameter("ProductId[]");
        String[] date = TEST.split(",");
        ProductDAO productDAO = new ProductDAO();
        ResultSet rs = productDAO.ShoppingUserList(date,UserId);
        if(UserId == null){
            response.sendRedirect("../member/login.jsp");
        }
        UserDAO userDAO = new UserDAO();
        ResultSet rs1 = userDAO.SelectUser(UserId);
    %>
    <script>
        const UserId = "<%=UserId%>";
        const ProductId = [];
        const PurchasePrice = [];
        const PurchaseCount = [];
    </script>
    <header>
        <jsp:include page="../header.jsp"/>
    </header>
    <div class = "Purchase__container">

        <form id = "PurchaseForm" method="POST" action = "./PurchaseAction.jsp">
            <div class = "Purchase__container_header">
                <h2>주문 작성/결제</h2>
            </div>
            <div class = "Purchase__container_Info_wrap">
                <div class="Purchase__container_Info">
                    <h3>주문상세내역</h3>
                </div>
                <div class="Purchase__container_table">
                    <table>
                        <colgroup>
                            <col style="width:57%">
                            <col style="width:10%">
                            <col style="width:13%">
                            <col style="width:10%">
                            <col style="width:10%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>상품 옵션정보</th>
                            <th>수량</th>
                            <th>상품금액</th>
                            <th>합계금액</th>
                            <th>배송비</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            while(rs.next()){
                        %>
                        <script>
                           ProductId.push("<%=rs.getString("ProductId")%>");
                           PurchaseCount.push("<%=rs.getString("ShoppingBagCount")%>")

                        </script>
                        <tr>
                            <td class = "ProductFirstLine">
                                <div class = "ProductImgWrap">
                                    <span>
                                        <img src ="../image/Thumbnail/<%=rs.getString("ProductId")%>.jpg"/>
                                    </span>

                                </div>
                                <div class = "ProductNameWrap">
                                    <em><%=rs.getString("ProductName")%></em>
                                </div>
                            </td>
                            <td>
                                <%=rs.getString("ShoppingBagCount")%>
                            </td>
                            <td>
                                <%=rs.getString("ProductPrice")%>원
                            </td>
                            <td>
                                <%
                                    int Price = Integer.parseInt(rs.getString("ProductPrice")) * Integer.parseInt(rs.getString("ShoppingBagCount"))+2500;
                                %>
                                <%=Price%>원
                                <script>
                                    PurchasePrice.push("<%=Price%>")
                                </script>
                            </td>
                            <td>
                                2500원
                            </td>
                        </tr>
                        <script>


                        </script>
                        <%
                            }
                        %>
                        </tbody>
                    </table>

                </div>
            </div>

            <div class = "Purchase__container_User_info_wrap">
                <div class = "Purchase__container_User_info">
                    <div class = "Purchase__container_User_title">
                        <h4>주문자 정보</h4>
                    </div>
                    <div class = "Purchase__container_User_table">
                        <%
                            if(rs1.next()){
                        %>
                        <table>
                            <colgroup>
                                <col style="width:15%;">
                                <col style="width:85%;">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>
                                    주문하시는분
                                </th>
                                <td>
                                    <input type="text" name = "UserId" value=<%=rs1.getString("UserId")%> required />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    휴대폰번호
                                </th>
                                <td>
                                    <input type="text" value ="<%=rs1.getString("UserPhone")%>" required />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    이메일
                                </th>
                                <td>
                                    <input type="email" value=<%=rs1.getString("UserEmail")%> required />
                                </td>
                            </tr>
                            </tbody>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
            <div class = "Purchase__container_delivery_info_wrap">
                <div class = "Purchase__container_delivery_header">
                    <h2>결제정보</h2>
                </div>
                <div class = "Purchase__container_delivery_info">
                    <table>
                        <colgroup>
                            <col style="width:15%;">
                            <col style="width:85%;">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>
                                배송지 확인
                            </th>
                            <td>
                                <input type="radio" class = "SelectType"name = "SelectType" value ="1"/>최근배송지
                                <input type="radio" class = "SelectType"name = "SelectType" value ="2" checked/>직접입력
                                <input type="radio" class = "SelectType"name = "SelectType" value ="3"/>주문자 정보와 동일
                            </td>
                        </tr>
                        <tr>
                            <th>
                                받으실 분
                            </th>
                            <td>
                                <input class = "deliveryForm" name = "PurchaseRecipient" type="text" required />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                받으실 장소
                            </th>
                            <td>
                                <input class = "deliveryForm" name = "PurchaseZipCode" type="text" required ><br>
                                <input class = "deliveryForm" name = "PurchaseAddress" type="text" required />
                                <input class = "deliveryForm" name = "PurchaseFullAddress" type="text" required />

                            </td>
                        </tr>
                        <tr>
                            <th>
                                휴대폰 번호
                            </th>
                            <td>
                                <input class = "deliveryForm" name = "PurchasePhone" type="text" required />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                남길실 말씀
                            </th>
                            <td>
                                <input  type="text" name = "PurchaseMemo" required />
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class = "Purchase__container_pay_wrap">

            </div>
            <div class = "Purchase__SubmitButton_wrap">
                <input type ="submit" value="결제하기" class = "Purchase__SubmitButton"/>
            </div>
        </form>
    </div>
    <footer>
        <jsp:include page="../footer.jsp"/>
    </footer>
</body>

<script src = "../js/Purchase.js"></script>
<script src = "http://l.bsks.ac.kr/~p201887082/DiliManage/js/jq.js"></script>
</html>

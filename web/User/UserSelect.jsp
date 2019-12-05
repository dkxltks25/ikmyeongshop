<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-23
  Time: 오후 3:41
  To change this template use File | Settings | File Templates.
--%><%@ page import="Attention.AttentionDAO"%>
<%@ page import="QnA.QnADAO"%>
<%@ page import="ProductQ.ProductQDAO"%>
<%@ page import="Review.ReviewDAO"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
    <%
        AttentionDAO attentionDAO = new AttentionDAO();
        QnADAO QnADAO = new QnADAO();
        ReviewDAO ReviewDAO = new ReviewDAO();
        ProductQDAO ProductQDAO = new ProductQDAO();
        String Session_User = (String)session.getAttribute("user_id") == null ? "" : (String)session.getAttribute("user_id");
        String ProductId = request.getParameter("ProductId") == null ? "" : request.getParameter("ProductId");
        ResultSet rs,rs1,rs2,rs3;
        if(Session_User.equals("") || ProductId.equals("")){
            out.println("2");
        }
        else{
            int Check = attentionDAO.SelectAttention(Session_User,ProductId);
            if(Check == 0){
                attentionDAO.InsertAttention(Session_User,ProductId);
            }
        }
        out.println(Session_User);
        rs = attentionDAO.AttentionList(Session_User);
        rs1 = QnADAO.UserQnA(Session_User);
        rs2= ProductQDAO.UserProductQ(Session_User);
        rs3= ReviewDAO.UserReview(Session_User);
    %>

    <div class = "User__Attention">
        <div class = "User__Attention_wrap">
            <h4>찜리스트</h4>
            <div class="col-12">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">
                        </th>
                        <th scope="col">상품정보</th>
                        <th scope="col">수량</th>
                        <th scope="col">상품금액</th>
                        <th scope="col">선택</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        while(rs.next()){
                            %>
                            <tr>

                                <td>
                                    <%=rs.getString("AttentionId")%>
                                </td>
                                <td>
                                    <img style = "height:96px;float:left;"src="../image/Thumbnail/<%=rs.getString("ProductId")%>.jpg"/>
                                    <%=rs.getString("productName")%></td>
                                <td><%=rs.getString("ProductCount")%></td>
                                <td><%=rs.getString("Productprice")%></td>
                                <td>
                                    <button class="UserSelect__button">장바구니</button><br>
                                    <button class="Userdelete__button">삭제하기</button>
                                </td>
                            </tr>
                            <%
                            out.print(rs.getString("AttentionId"));
                            out.print(rs.getString("productName"));
                            out.print(rs.getString("productPrice"));
                            out.print(rs.getString("ProductId"));
                        }
                    %>
                    </tbody>
                </table>
        </div>
    </div>
    </div>
    <div class = "User__QnA">
        <h4>1대1문의</h4>
        <button class = "QnA__OpenButton">1:1문의하기 </button>
        <div class="col-12">
            <table class="table table-bordered">
                <thead>
                <tr>

                    <th scope="col">문의날짜</th>
                    <th scope="col">카테고리</th>
                    <th scope="col">제목</th>
                    <th scope="col">문의상태</th>
                </tr>
                </thead>
                <tbody>
                <%
                    while(rs1.next()){
                %>
                <tr>
                    <td><%=rs1.getString("createAt")%></td>
                    <td><%=rs1.getString("QnAClass")%></td>
                    <td><%=rs1.getString("QnAtitle")%></td>
                    <td><%=rs1.getString("QnAState")%></td>

                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <div class = "User__UserInfoChange">
    </div>
    <div class = "User__UserInfosecession">
    </div>
    <div class = "User__Userdelivery">
    </div>
    <div class = "User__UserQnA">
        <h4>1대1문의</h4>
        <div class="col-12">
            <table class="table table-bordered">
                <thead>
                <tr>

                    <th scope="col">문의날짜</th>
                    <th scope="col">카테고리</th>
                    <th scope="col">제목</th>
                    <th scope="col">문의상태</th>
                </tr>
                </thead>
                <tbody>
                <%
                    while(rs2.next()){
                %>
                <tr>
                    <td><%=rs2.getString("createAt")%></td>
                    <td><%=rs2.getString("ProductQCategori")%></td>
                    <td><%=rs2.getString("ProductQtitle")%></td>
                    <td><%=rs2.getString("ProductQState")%></td>

                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <div class = "User__UserReview">
        <h4>1대1문의</h4>
        <div class="col-12">
            <table class="table table-bordered">
                <thead>
                <tr>

                    <th scope="col">문의날짜</th>
                    <th scope="col">카테고리</th>
                    <th scope="col">제목</th>
                    <th scope="col">문의상태</th>
                </tr>
                </thead>
                <tbody>
                <%
                    while(rs3.next()){
                %>
                <tr>
                    <td><%=rs3.getString("reviewId")%></td>
                    <td><%=rs3.getString("reviewtitle")%></td>
                    <td><%=rs3.getString("createAt")%></td>
                    <td><%=rs3.getString("UserId")%></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

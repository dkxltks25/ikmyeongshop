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
        }
        else{
            int Check = attentionDAO.SelectAttention(Session_User,ProductId);
            if(Check == 0){
                attentionDAO.InsertAttention(Session_User,ProductId);
            }
        }
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
                        <th scope="col">상품금액</th>
                        <th scope="col">선택</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int cnt = 0;
                        while(rs.next()){
                            cnt++;
                            %>
                            <tr>

                                <td>
                                    <%=rs.getString("AttentionId")%>
                                </td>
                                <td>
                                    <img style = "height:96px;float:left;"src="../image/Thumbnail/<%=rs.getString("ProductId")%>.jpg"/>
                                    <%=rs.getString("productName")%></td>
                                <td><%=rs.getString("Productprice")%></td>
                                <td>
                                    <button class="UserSelect__button" data-id="<%=rs.getString("ProductId")%>" >장바구니</button><br>
                                    <button class="Userdelete__button" data-id="<%=rs.getString("AttentionId")%>" >삭제하기</button>
                                </td>
                            </tr>
                            <%
                        }

                    %>
                    <%
                        if(cnt == 0){
                            %>
                            <tr>
                                <td colspan="4">등록된 찜리스트가 없습니다</td>
                            </tr>
                    <%
                        }
                        cnt = 0;
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
                        cnt++;
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
                <%
                    if(cnt == 0){
                %>
                <tr>
                    <td colspan="4">등록된 문의가 없습니다</td>
                </tr>
                <%
                    }
                    cnt = 0;
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
        <h4>상품문의</h4>
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
                        cnt++;
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
                <%
                    if(cnt == 0){
                %>
                <tr>
                    <td colspan="4">등록된 문의가 없습니다</td>
                </tr>
                <%
                    }
                    cnt = 0;
                %>
                </tbody>
            </table>
        </div>
    </div>
    <div class = "User__UserReview">
        <h4>상품리뷰</h4>
        <div class="col-12">
            <table class="table table-bordered">
                <thead>
                <tr>

                    <th scope="col">상품리뷰 번호 </th>
                    <th scope="col">리뷰 상품</th>
                    <th scope="col">리뷰 작성일</th>
                    <th scope="col">상품리뷰 조회수</th>
                </tr>
                </thead>
                <tbody>
                <%
                    while(rs3.next()){
                        cnt++;
                %>
                <tr>
                    <td><%=rs3.getString("reviewId")%></td>
                    <td><%=rs3.getString("ProductId")%></td>
                    <td><%=rs3.getString("createAt")%></td>
                    <td><%=rs3.getString("reviewCount")%></td>
                </tr>
                <%
                    }
                %>
                <%
                    if(cnt == 0){
                %>
                <tr>
                    <td colspan="4">등록된 상품리뷰가 없습니다</td>
                </tr>
                <%
                    }
                    cnt = 0;
                %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

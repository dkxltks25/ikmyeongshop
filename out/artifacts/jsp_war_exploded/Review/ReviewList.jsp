<%@ page import="Review.ReviewDAO" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-25
  Time: 오후 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel ="stylesheet" href="../css/ReviewList.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
<head>
    <title>Title</title>
</head>

<%
    ReviewDAO reviewDAO = new ReviewDAO();
    ResultSet rs = reviewDAO.AllReview();
%>
<body>
<header>
    <jsp:include page="../header.jsp"/>

</header>
<div class = "ReviewList__Container">
    <div class = "ReviewList__HeadText">
        <h3>상품후기</h3>
        <Button class="ReviewList__WriteButton">글쓰기</Button>
    </div>
    <div class = "ReviewList__Board">

        <%
            while(rs.next()){
        %>
        <div class ="ReviewList_ItemBox">
            <div class = "ReviewList_ItemBox_img_wrap">
                <a href = "./ViewReview.jsp?id=<%=rs.getString("reviewId")%>">
                <img src = "../image/Thumbnail/<%=rs.getString("ProductId")%>.jpg"/>
                </a>
            </div>
            <div class = "ReviewList__ItemBox_text_wrap">
                <div class="ReviewList__RatingArea">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                </div>
                <div class = "ReviewList__titleArea">
                    <span><%=rs.getString("reviewTitle")%></span>
                </div>
                <div class = "ReviewList__UserName">
                    <span id = "UserName"><%=rs.getString("USERID")%></span>
                    <span id = "ReviewCreateAt"><%=rs.getString("createAt")%></span>
                </div>
                <div class = "ReviewList__ViewCount">
                    <%=rs.getString("reviewCount")%>
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
</div>
</body>
</html>

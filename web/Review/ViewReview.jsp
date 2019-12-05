<%@ page import="java.util.ArrayList" %>
<%@ page import="Review.ReviewDAO" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-12-04
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href ="../css/ViewReview.css"/>
<html>
<head>
    <title>Title</title>
    <%

        String ReviewNumber = request.getParameter("id");
        ResultSet rs = null;
        if(ReviewNumber == null){
            out.println("잘못된 경로의 접근 입니다");
        }else {
            ReviewDAO reviewDAO = new ReviewDAO();
            ArrayList<String> ReviewList = (ArrayList) session.getAttribute("ReviewList");
            if (ReviewList == null) {
                ReviewList = new ArrayList<String>();
                ReviewList.add(ReviewNumber);
                session.setAttribute("ReviewList", ReviewList);
            } else {
                int i;
                int check = 0;
                for (i = 0; i < ReviewList.size(); i++) {
                    if (ReviewList.get(i).equals(ReviewNumber)) {
                        check = 1;
                    }
                }
                if (check == 0) {
                    ReviewList.add(ReviewNumber);
                    reviewDAO.UpdateReviewCount(ReviewNumber);
                    session.setAttribute("ReviewList", ReviewList);
                }

            }
            rs =  reviewDAO.ViewReview(ReviewNumber);
        }
    %>

</head>
<body>
    <header>
        <jsp:include page="../header.jsp"/>
    </header>

    <div class = "ViewReview__Container">
        <%
            if(rs != null){
            while(rs.next()){
        %>
        <div class = "ViewReview__title">
            <h1>상품후기</h1>
        </div>
        <div class = "ViewReview__Content_Wrap">
            <div class = "ViewReview__Content_title">
                <span><%=rs.getString("reviewtitle")%></span>
            </div>
            <div class = "ViewReview__UserInfo">
                <span><%=rs.getString("UserId")%></span> | <%=rs.getString("createAt")%>
            </div>
            <div class ="ViewReview__Content">
                <%=rs.getString("reviewcontent")%>
                <br>
            </div>
        </div>
        <%
            }
            }
        %>
    </div>
    <footer>
        <jsp:include page = "../footer.jsp"/>
    </footer>
</body>
</html>

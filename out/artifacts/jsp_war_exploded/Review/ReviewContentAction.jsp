<%@ page import="Review.ReviewDAO" %>
<%@ page import="java.sql.ResultSet" %><%
    String id = request.getParameter("id");
    ReviewDAO reviewDAO = new ReviewDAO();
    ResultSet rs;
    rs = reviewDAO.SelectReview(id);
    if(rs.next()){
        out.println(rs.getString("reviewContent"));
    }
%>

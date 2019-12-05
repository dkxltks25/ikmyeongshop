<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import="Review.ReviewDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="netscape.javascript.JSObject" %>
<%
    String State = request.getParameter("State");
    String ProductId = request.getParameter("ProductId");
    String Day = request.getParameter("day");
    ReviewDAO reviewDAO = new ReviewDAO();
    JSONArray jArray = new JSONArray();

    if(State.equals("ReviewList")){
        ResultSet rs = reviewDAO.ReviewUserInfo(ProductId);
        String [] UserList;
        int i = 0;
        while(rs.next()){
            JSONArray arrayObj=new JSONArray();
            arrayObj.add(rs.getString("userid"));
            arrayObj.add(rs.getString("userpassword"));
            arrayObj.add(rs.getString("useremail"));
            arrayObj.add(rs.getString("userphone"));
            arrayObj.add(rs.getString("username"));
            arrayObj.add(rs.getString("userZipcode"));
            arrayObj.add(rs.getString("userAdress"));
            arrayObj.add(rs.getString("createAt"));
            arrayObj.add(rs.getString("updateAT"));
            jArray.add(arrayObj);
        }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }
    if(State.equals("ReviewGraph")){
        ResultSet rs = reviewDAO.GraphUserReview(Day,ProductId);
        int i = 0;
        while(rs.next()){
            JSONArray arrayObj=new JSONArray();
            arrayObj.add(rs.getString(1));
            arrayObj.add(rs.getString(2));
            jArray.add(arrayObj);
            i=i+1;
        }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }



%>


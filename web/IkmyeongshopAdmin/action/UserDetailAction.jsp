<%@page import="org.json.simple.JSONArray"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="Purchase.PurchaseDAO" %>
<%@ page import="Attention.AttentionDAO" %>
<%@ page import="Product.ProductDAO" %>
<%@ page import="Review.ReviewDAO" %>
<%
    String State = request.getParameter("state");
    String UserId = request.getParameter("id");
    ResultSet rs = null;
    PurchaseDAO purchaseDAO = new PurchaseDAO();
    //유저 리스트
    JSONArray jArray = new JSONArray();
    if(State.equals("PurchaseList")){
       rs =  purchaseDAO.SelectUserPurrchaseGraph(UserId);
       while(rs.next()){
           JSONArray jObejct = new JSONArray();
           jObejct.add(rs.getString(1));
           jObejct.add(rs.getString(2));
           jObejct.add(rs.getString(3));
           jObejct.add(rs.getString(4));
           jObejct.add(rs.getString(5));
           jArray.add(jObejct);
       }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }
    if(State.equals("AttentionList")){
        AttentionDAO attentionDAO = new AttentionDAO();
        rs = attentionDAO.AttentionList(UserId);
        while(rs.next()){
            JSONArray jObejct = new JSONArray();
            jObejct.add(rs.getString(1));
            jObejct.add(rs.getString(2));
            jObejct.add(rs.getString(3));
            jObejct.add(rs.getString(4));
            jObejct.add(rs.getString(5));
            jArray.add(jObejct);
        }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }
    if(State.equals("ShoppingBagList")){
        ProductDAO productDAO = new ProductDAO();
        rs = productDAO.Shopinglist(UserId);
        while(rs.next()){
            JSONArray jObejct = new JSONArray();
            jObejct.add(rs.getString(1));
            jObejct.add(rs.getString(2));
            jObejct.add(rs.getString(3));
            jObejct.add(rs.getString(4));
            jArray.add(jObejct);
        }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }
    if(State.equals("ReviewList")){
        ReviewDAO reviewDAO = new ReviewDAO();
        rs = reviewDAO.UserReview(UserId);
        while(rs.next()){
            JSONArray jObejct = new JSONArray();
            jObejct.add(rs.getString(1));
            jObejct.add(rs.getString(2));
            jObejct.add(rs.getString(3));
            jObejct.add(rs.getString(4));
            jObejct.add(rs.getString(5));
            jArray.add(jObejct);
        }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }
%>
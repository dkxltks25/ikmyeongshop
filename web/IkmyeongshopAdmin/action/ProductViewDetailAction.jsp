<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import="Review.ReviewDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="netscape.javascript.JSObject" %>
<%@ page import="Purchase.PurchaseDAO" %>
<%@ page import="Attention.AttentionDAO" %>
<%@ page import="Product.ProductDAO" %>
<%
    String State = request.getParameter("state");
    String ProductId = request.getParameter("id");
    String Day = request.getParameter("day");
    JSONArray jArray = new JSONArray();
    ResultSet rs = null;
    if(State.equals("PurchaseList")){
        PurchaseDAO purchaseDAO =new PurchaseDAO();
        rs = purchaseDAO.ProductPurchaseList(ProductId);
        while(rs.next()){
            JSONArray jObject = new JSONArray();
            jObject.add(rs.getString("PurchaseId"));
            jObject.add(rs.getString("UserId"));
            jObject.add(rs.getString("PurchaseProductCount"));
            jObject.add(rs.getString("PurchaseProductPrice"));
            jObject.add(rs.getString("UserName"));
            jObject.add(rs.getString("createAt"));
            jArray.add(jObject);
        }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }
    if(State.equals("AttentionList")) {
        AttentionDAO attentionDAO = new AttentionDAO();
        rs = attentionDAO.ProductAttentionList(ProductId);
        while(rs.next()){
            JSONArray jObject = new JSONArray();
            jObject.add(rs.getString(1));
            jObject.add(rs.getString(2));
            jObject.add(rs.getString(3));
            jObject.add(rs.getString(4));
            jArray.add(jObject);
        }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }
    if(State.equals("ShoppingBagList")){
        ProductDAO productDAO = new ProductDAO();
        rs = productDAO.ProductShoppingBagList(ProductId);
        while(rs.next()){
            JSONArray jObject = new JSONArray();
            jObject.add(rs.getString(1));
            jObject.add(rs.getString(2));
            jObject.add(rs.getString(3));
            jObject.add(rs.getString(4));
            jArray.add(jObject);
        }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }
    if(State.equals("ReviewList")){
        ReviewDAO reviewDAO = new ReviewDAO();
        rs =reviewDAO.ProductReviewList(ProductId);
        while(rs.next()){
            JSONArray jObject = new JSONArray();
            jObject.add(rs.getString(1));
            jObject.add(rs.getString(2));
            jObject.add(rs.getString(3));
            jObject.add(rs.getString(4));
            jArray.add(jObject);
        }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }


%>


<%@ page import="Attention.AttentionDAO" %>
<%@ page import="Product.ProductDAO" %>
<%@ page import="Attention.Attention" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-12-05
  Time: 오전 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String State = request.getParameter("state");

    String dataId = request.getParameter("dataId");
    AttentionDAO attentionDAO = new AttentionDAO();
    String UserId = (String) session.getAttribute("user_id") == null ? "" : (String) session.getAttribute("user_id");
    if(State == null){
        //관심상품담기
        String ProductId = request.getParameter("ProductNumber");
        if(attentionDAO.CheckAttention(UserId,ProductId) == 1) {
            if (!UserId.equals("")) {
                attentionDAO.InsertAttention(UserId, ProductId);
            }
        }
        response.sendRedirect("../User/");
    }
    else if(State.equals("Delete")){
        //상품 삭제
        attentionDAO.deleteAttention(dataId);
        response.sendRedirect("../User/");

    }
    else if(State.equals("Select")){
        //장바구니 담기
        ProductDAO productDAO = new Product.ProductDAO();
        productDAO.InsertShoppingBag(UserId,dataId,"1");
        response.sendRedirect("../ShoppingBag/");
    }

%>
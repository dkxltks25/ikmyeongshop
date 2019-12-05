<%@ page import="Attention.AttentionDAO" %>
<%@ page import="Product.Product" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-12-05
  Time: 오전 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String UserId = (String)session.getAttribute("user_id") == null ? "" : (String)session.getAttribute("user_id");
    String ProductId = request.getParameter("ProductNumber");
    if(!UserId.equals("")){
        AttentionDAO attentionDAO = new AttentionDAO();
        attentionDAO.InsertAttention(UserId,ProductId);
    }
    response.sendRedirect("../User/");

%>
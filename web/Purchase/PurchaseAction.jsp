<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="Purchase.PurchaseDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="USER.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
    String State = request.getParameter("Type");
    JSONArray jArray = new JSONArray();
    ResultSet rs = null;
    if("CheckList".equals(State)){
        String UserId = request.getParameter("User");
        PurchaseDAO purchaseDAO = new PurchaseDAO();
        rs = purchaseDAO.LastPurchaseInfo(UserId);
        if(rs.next()){
            jArray.add(rs.getString("PurchaseRecipient"));
            jArray.add(rs.getString("PurchaseZipCode"));
            jArray.add(rs.getString("PurchaseAddress"));
            jArray.add(rs.getString("PurchaseFullAddress"));
            jArray.add(rs.getString("PurchasePhone"));

            response.setContentType("application/json");
            out.println(jArray.toString());
        }
        else{
            out.println("null");
        }
    }
    else if("MyInfo".equals(State)) {
        String UserId = request.getParameter("User");
        UserDAO userDAO = new UserDAO();
        rs = userDAO.SelectUser(UserId);
        if(rs.next()){
            jArray.add(rs.getString("UserName"));
            jArray.add(rs.getString("UserZipCode"));
            jArray.add(rs.getString("UserAdress"));
            jArray.add(rs.getString("UserAdress1"));
            jArray.add(rs.getString("UserPhone"));

            response.setContentType("application/json");
            out.println(jArray.toString());
        }
    }
    else{
        PrintWriter script = response.getWriter();

        String UserId = request.getParameter("UserId");
        String[] ProductId = request.getParameter("ProductId").split(",");
        String[] PurchaseProductCount = request.getParameter("PurchaseProductCount").split(",");
        String[] PurchaseProductPrice = request.getParameter("PurchaseProductPrice").split(",");


        String PurchaseZipCode = request.getParameter("PurchaseZipCode");
        String PurchaseAddress = request.getParameter("PurchaseAddress");
        String PurchaseFullAddress = request.getParameter("PurchaseFullAddress");
        String PurchaseRecipient = request.getParameter("PurchaseRecipient");
        String PurchasePhone = request.getParameter("PurchasePhone");
        String PurchaseMemo = request.getParameter("PurchaseMemo");
        PurchaseDAO purchaseDAO = new PurchaseDAO();
        int result = purchaseDAO.InsertPurchaseData(ProductId, UserId, PurchaseProductCount, PurchaseProductPrice, PurchaseZipCode, PurchaseAddress, PurchaseFullAddress, PurchaseRecipient, PurchasePhone, PurchaseMemo);
        if(result != -1){
            script.println("<script>");
            script.println("alert('등록되었습니다.')");
            script.println("location.href='../User/';");
            script.println("</script>");
        }
        else{
            script.println("<script>");
            script.println("alert('등록실패.')");
            script.println("history.back()");
            script.println("</script>");
        }
    }


%>

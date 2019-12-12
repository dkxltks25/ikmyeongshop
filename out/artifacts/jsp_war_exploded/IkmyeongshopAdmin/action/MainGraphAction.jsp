<%@ page import="USER.UserDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="Purchase.PurchaseDAO" %>
<%@ page import="Product.ProductDAO" %>

<%

   String  State  = request.getParameter("State");
   String  day= request.getParameter("day");
    ResultSet rs = null;
    JSONArray jArray = new JSONArray();
    if(State.equals("newUser")){
       UserDAO userDAO = new UserDAO();
       rs = userDAO.NewUserGraph(day);
       while(rs.next()){
           JSONArray arrayObj=new JSONArray();
            arrayObj.add(rs.getString(1));
            arrayObj.add(rs.getString(2));
           jArray.add(arrayObj);
       }
        response.setContentType("application/json");
        out.println(jArray.toString());
   }
    if(State.equals("Sales")){
        PurchaseDAO purchaseDAO = new PurchaseDAO();
        rs = purchaseDAO.ThisMonthSalesGraph(day);
        while(rs.next()){
            JSONArray arrayObj = new JSONArray();
            arrayObj.add(rs.getString(1));
            arrayObj.add(rs.getString(2));
            jArray.add(arrayObj);
        }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }
    if(State.equals("Best")){
        PurchaseDAO purchaseDAO = new PurchaseDAO();
        rs = purchaseDAO.ThisMonthBestSeller(day);
        while(rs.next()){
            JSONArray arrayObj = new JSONArray();
            arrayObj.add(rs.getString(1));
            arrayObj.add(rs.getString(2));
            jArray.add(arrayObj);
        }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }
    if(State.equals("View")){
        ProductDAO productDAO = new ProductDAO();
        rs = productDAO.LookinginterestedGraph();
        while(rs.next()){
            JSONArray arrayObj = new JSONArray();
            arrayObj.add(rs.getString(1));
            arrayObj.add(rs.getString(2));
            jArray.add(arrayObj);
        }
        response.setContentType("application/json");
        out.println(jArray.toString());
    }
%>
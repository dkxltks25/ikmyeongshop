<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-18
  Time: 오후 6:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="USER.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.SQLException" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="USER.User" scope="page" />

<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        PrintWriter script = response.getWriter();
        String id = request.getParameter("userId");
        String password= request.getParameter("userPassword");
        String name = request.getParameter("userName");
        String phone = request.getParameter("userPhone");
        out.println(phone);
        String email = request.getParameter("userEmail");
        String zipcode = request.getParameter("userZipCode");
        String adress = request.getParameter("userAddress1");
        String adress1= request.getParameter("userAddress2");

        UserDAO userDAO = new UserDAO();
        try {

            int result = userDAO.join(id,password,name,phone,email,zipcode,adress);
            if(result == 1){
                script.println("<script>");
                script.println("alert('회원가입 완료')");
                script.println("location.href='http://localhost:8080/member/login.jsp'");
                script.println("</script>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


    %>
</body>
</html>

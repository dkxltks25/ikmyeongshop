<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-18
  Time: 오후 8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="USER.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="USER.User" scope="page" />
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userId"/>
<%

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%

        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUserId(),user.getUserPassword());
        if(result == 1){
            session.setAttribute("user_id",user.getUserId());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인성공')");
            out.println("세션값:"+(String)session.getAttribute("user_id"));
            script.println("window.location.href='../index.jsp';");
            script.println("</script>");
        }
        else{
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인실패')");
            script.println("window.history.back()");
            script.println("</script>");
        }
    %>
</body>
</html>

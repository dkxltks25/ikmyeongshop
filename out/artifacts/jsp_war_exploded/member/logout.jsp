<%@ page import="java.io.PrintWriter" %>
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-19
  Time: 오전 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        session.setAttribute("user_id","");
    %>
    <script>
        alert('로그아웃');
        window.location.href="http://localhost:8080/index.jsp";
    </script>
</body>
</html>

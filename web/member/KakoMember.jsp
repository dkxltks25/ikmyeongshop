<%@ page import="USER.UserDAO" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-29
  Time: 오후 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        UserDAO userDAO = new UserDAO();
        PrintWriter script = response.getWriter();
        String kemail = request.getParameter("kemail");
        String kid = request.getParameter("kid");
        String kname = request.getParameter("kname");

        if(userDAO.KakaoJoin(kid,kemail,kname) == 1){
            script.println("<script>");
            script.println("alert('회원가입 성공')");
            script.println("location.href='../member/login.jsp'");
            script.println("history.back(-1)");
            script.println("</script>");
        }else{
            script.println("<script>");
            script.println("alert('회원가입실패')");
            script.println("history.back(-1)");
            script.println("</script>");

        }
    %>
</body>
</html>

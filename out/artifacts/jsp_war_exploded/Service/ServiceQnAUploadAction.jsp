<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-28
  Time: 오전 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="QnA.QnADAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

    <%
        PrintWriter script = response.getWriter();
        String QNA = request.getRealPath("/image/Temp");
        try {

            MultipartRequest multi = null;
            int maxSize = 1024 * 1024 * 10; //파일 사이즈 제한
            QnADAO qnaDAO = new QnADAO();
            multi = new MultipartRequest(request, QNA, maxSize, "utf-8", new DefaultFileRenamePolicy());
            String QnA_SELECT = multi.getParameter("QnA_SELECT");
            String QnATitle = multi.getParameter("QnATitle");
            String QnAContent = multi.getParameter("QnAContent");

            String Session_User = (String) session.getAttribute("user_id") == null ? "" : (String) session.getAttribute("user_id");

            File QnAImg = multi.getFile("fileArea");
            out.println(QnAImg);
        }catch (Exception e){
            out.println(e.toString());
            e.printStackTrace();
        }
    %>

</body>
</html>

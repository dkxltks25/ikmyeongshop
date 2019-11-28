<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-28
  Time: 오전 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
    <%
        String id = "";
        String subject = "";
        String fileName1 = "";
        String fileName2 = "";
        String orgfileName1 = "";
        String orgfileName2 = "";
        try {
            MultipartRequest multi = new MultipartRequest(
                    request,"../image/ServiceQnA", // 파일을 저장할 디렉토리 지정
                    10 * 1024, // 첨부파일 최대 용량 설정(bite) / 10KB / 용량 초과 시 예외 발생
                    "utf-8", // 인코딩 방식 지정
                    new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
            );

            id = multi.getParameter("id"); // form의 name="id"인 값을 구함
            subject = multi.getParameter("subject"); // form의 name="subject"인 값을 구함



            fileName1 = multi.getFilesystemName("file1"); // name=file1의 업로드된 시스템 파일명을 구함(중복된 파일이 있으면, 중복 처리 후 파일 이름)
            orgfileName1 = multi.getOriginalFileName("file1"); // name=file1의 업로드된 원본파일 이름을 구함(중복 처리 전 이름)

            fileName2 = multi.getFilesystemName("file2");
            orgfileName2 = multi.getOriginalFileName("file2");

        } catch (Exception e) {
            e.getStackTrace();
        } // 업로드 종료
    %>

</body>
</html>

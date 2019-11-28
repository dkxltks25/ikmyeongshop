<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-28
  Time: 오후 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String Thumbnail = request.getRealPath("/image/Thumbnail");
        String Background = request.getRealPath("/image/Background");
        out.println("절대경로 : " + Thumbnail +"<br/>");

        int maxSize =1024 *1024 *10; //파일 사이즈 제한
        String name = "";
        String originalName1 = "";
        long fileSize =0;
        String fileType = "";
        String fileName1 = "";
        MultipartRequest multi = null;
        try {

            multi = new MultipartRequest(request, Thumbnail, maxSize, "utf-8", new DefaultFileRenamePolicy());

            // 전송한 전체 파일이름들을 가져옴
            Enumeration files = multi.getFileNames();
            while(files.hasMoreElements()){
                String file1 = (String)files.nextElement();// 파일 input에 지정한 이름을 가져옴

                File file = multi.getFile(file1);
                file.renameTo(new File("2"));
                out.println(file);
                // 그 파일 객체의 크기를 알아냄
                fileSize = file.length();

            }
        }catch(Exception e){
            e.printStackTrace();
        }
    %>


</head>
<body>

</body>
</html>

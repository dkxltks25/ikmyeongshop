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
<%@ page import="Product.ProductDAO"%>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>

    <%
        ProductDAO productDAO = new ProductDAO();



        String Thumbnail = request.getRealPath("/image/Thumbnail");
        String Background = request.getRealPath("/image/Background");
        String Temp = request.getRealPath("/image/Temp");
        MultipartRequest multi = null;
        int maxSize =1024 *1024 *10; //파일 사이즈 제한

        try {
            PrintWriter script = response.getWriter();

            multi = new MultipartRequest(request, Temp, maxSize, "utf-8", new DefaultFileRenamePolicy());
            String ProductName = multi.getParameter("ProductName");
            String ProductClass = multi.getParameter("ProductClass");
            String ProductCount = multi.getParameter("ProductCount");
            String ProductDiscount = multi.getParameter("ProductDiscount");
            String ProductPrice = multi.getParameter("ProductPrice");
            //파일 찾기

            if(productDAO.InsertProduct(ProductName,ProductClass,ProductCount,ProductDiscount,ProductPrice) == 1){
                File ThumbnailImg = multi.getFile("ProductTubmnail");
                File BackgroundImg = multi.getFile("ProductBackground");
                int fileNumber = productDAO.ReturnProductName();
                if(fileNumber == 0 || fileNumber == -1){
                    script.println("<script>");
                    script.println("history.back()");
                    script.println("</script>");
                }else {
                    //파일 새로 생성
                    File PrevThumbnailImg = new File(Thumbnail + "/" + fileNumber+".jpg");
                    File PrevBackgroundImg = new File(Background + "/" + fileNumber+".jpg");

                    //파일 등록
                    ThumbnailImg.renameTo(PrevThumbnailImg);
                    BackgroundImg.renameTo(PrevBackgroundImg);
                    //파일 삭제
                    ThumbnailImg.delete();
                    BackgroundImg.delete();
                    script.println("<script>");
                    script.println("if(confirm('상품이 등록완료, 관리자 페이지로 이동하시겠습니까?(거절시 관리자 페이지로 이동'))");
                    script.println("location.href='../Product/RegistProduct.jsp'");
                    script.println("else{");
                    script.println("location.href='../Product/';}");
                    script.println("</script>");
                }
            }else{
                script.println("<script>");
                script.println("history.back()");
                script.println("</script>");

            }
        }catch(Exception e){
            e.printStackTrace();
            out.println(e.toString());
        }
        //상품 입력

    %>
</head>
<body>

</body>
</html>

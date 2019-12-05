<%@ page import="java.util.Enumeration" %>
<%@ page import="Review.ReviewDAO" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-12-02
  Time: 오후 6:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ReviewDAO reviewDAO = new ReviewDAO();
    String UserId = (String)session.getAttribute("user_id") == null ? "" : (String)session.getAttribute("user_id");
    out.println(UserId);
    String ProductId = (String)session.getAttribute("ProductNumber");
    String Review = request.getRealPath("/image/Review");
    MultipartRequest multi = null;
    int maxSize =1024 *1024 *10; //파일 사이즈 제한
    out.println(ProductId);

    String Temp = request.getRealPath("/image/Temp");
    try{
        PrintWriter script = response.getWriter();
        multi = new MultipartRequest(request, Temp, maxSize, "utf-8", new DefaultFileRenamePolicy());
        String ReiviewGrade = multi.getParameter("ReiviewGrade");
        String ReviewTitle = multi.getParameter("ReviewTitle");
        String ReviewContent = multi.getParameter("ReviewContent");
        File fileArea = multi.getFile("fileArea");
                // String UserId, String ProductId,String ProductGrade, String Reviewtitle, String ReviewContent
        if(reviewDAO.InsertReview(UserId,ProductId,ReiviewGrade,ReviewTitle,ReviewContent)== 1){
            int fileNumber = reviewDAO.ReturnReviewNumber();
            File prevQnAFile = new File(Review + "/" + fileNumber +".jpg");
            fileArea.renameTo(prevQnAFile);
            script.println("<script>");
            script.println("window.close()");
            script.println("</script>");
        }else{
        }

    }catch(Exception e){
        e.printStackTrace();
        out.println(e.toString());
    }


%>
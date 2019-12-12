<%@ page import="Notice.NoticeDAO" %>
<%@ page import="java.sql.ResultSet" %><%
    String id = request.getParameter("id");
    NoticeDAO noticeDAO = new NoticeDAO();
    ResultSet rs = null;
    rs = noticeDAO.SelectNotice(id);
    if(rs.next()){
        out.println(rs.getString("noticecontent"));
    }
%>
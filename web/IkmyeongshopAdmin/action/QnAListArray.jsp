<%@ page import="java.util.Enumeration" %>
<%@ page import="QnA.QnADAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
        String Id = request.getParameter("id");
        QnADAO qnaDAO = new QnADAO();
        ResultSet rs = qnaDAO.SelectNumberQnA(Id);
        while(rs.next()){
        out.println(rs.getString("QnAContent"));
}
%>


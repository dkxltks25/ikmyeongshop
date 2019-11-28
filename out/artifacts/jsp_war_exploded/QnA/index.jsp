<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-25
  Time: 오후 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel = "stylesheet" href = "../css/QnA.css"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class = "QnA__Container">
        <div class = "QnA__Cotaniner_title">
            <h2>1:1문의</h2>
        </div>
        <div class = "QnA__Container__Content">
            <div class = "QnA__Container__table_wrap">
                <table class = "QnA__Container__table">
                    <form name ="QnA__form">
                        <colgroup>
                            <col style="width:15%">
                            <col style="width:85%">
                        </colgroup>
                        <tr class = "QnA__Container_table_tr">
                            <th class = "QnA__Container_table_th">말머리</th>
                            <td class = "QnA__Container_table_td">
                                <Select id ="QnA__Container_Select" name = "QnA_SELECT">
                                    <option value = "1">회원정보관리</option>
                                </Select>
                            </td>
                        </tr>
                        <tr class = "QnA__Container_table_tr">
                            <th class = "QnA__Container_table_th">작성자</th>
                            <td class = "QnA__Container_table_td">
                                TEST
                            </td>
                        </tr>
                        <tr class = "QnA__Container_table_tr">
                            <th class = "QnA__Container_table_th">제목</th>
                            <td class = "QnA__Container_table_td">
                                <input type = "text" name="QnATitle" class = "QnA__Container_Text">
                            </td>
                        </tr>
                        <tr class = "QnA__Container_table_tr">
                            <th class = "QnA__Container_table_th">본문</th>
                            <td class = "QnA__Container_table_td">
                                <input type = "text" name="QnATitle" class = "QnA__Container_ContentBox">
                                (<span id="textCount">0</span>/255)
                            </td>
                        </tr>
                        <tr class = "QnA__Container_table_tr">
                            <th class = "QnA__Container_table_th">첨부파일</th>
                            <td class = "QnA__Container_table_td">
                                <input type="text" name="fileArea" id="QnA_Container_file">
                                <input type = "button" value="찾아보기">
                            </td>
                        </tr>
                    </form>
                </table>>
            </div>
            <div class ="QnA__Container_button">
                <input type="button" id = "QnA_Save" value = "저장">
            </div>
        </div>
    </div>
<script src = "../js/QnA.js"></script>
</body>
</html>

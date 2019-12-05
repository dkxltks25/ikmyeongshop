<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-23
  Time: 오후 4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel = "stylesheet" href = "../css/Service.css"/>
    <link rel = "stylesheet" href = "../css/ServiceQnA.css"/>

</head>
<body>
<header>
    <jsp:include page="../header.jsp"/>
</header>

<div class = "Service__container">
    <div class = "Service__container_menu">
        <div class="sub_menu_box">
            <h2>고객센터</h2>
            <ul class="sub_menu">
                <li><a href="./ServiceNotice.jsp">공지사항</a></li>
                <li><a href="./ServiceQnA.jsp" class="active">1:1문의하기</a></li>
                <li><a href="#FaQ">FAQ</a></li>
            </ul>
        </div>
    </div>
    <div class = "Service__container_content">
    <div class = "ServiceQnA__Container">
        <div class = "ServiceQnA__Cotaniner_title">
            <h2>1:1문의</h2>
        </div>
        <div class = "ServiceQnA__Container__Content">
            <form type="post" action = "ServiceQnAUploadAction.jsp" name ="ServiceQnA__form" enctype="multipart/form-data">
            <div class = "ServiceQnA__Container__table_wrap">
                <table class = "ServiceQnA__Container__table">
                        <colgroup>
                            <col style="width:15%">
                            <col style="width:85%">
                        </colgroup>
                    <tr class = "ServiceQnA__Container_table_tr">
                            <th class = "ServiceQnA__Container_table_th">말머리</th>
                            <td class = "ServiceQnA__Container_table_td">
                                <Select id ="ServiceQnA__Container_Select" name = "QnA_SELECT">
                                    <option value = "1">회원정보관리</option>
                                </Select>
                            </td>
                        </tr>
                        <tr class = "ServiceQnA__Container_table_tr">
                            <th class = "ServiceQnA__Container_table_th">작성자</th>
                            <td class = "ServiceQnA__Container_table_td">
                                사용자테스트
                            </td>
                        </tr>
                        <tr class = "ServiceQnA__Container_table_tr">
                            <th class = "ServiceQnA__Container_table_th">제목</th>
                            <td class = "ServiceQnA__Container_table_td">
                                <input type = "text" name="QnATitle" class = "ServiceQnA__Container_Text">
                            </td>
                        </tr>
                        <tr class = "ServiceQnA__Container_table_tr">
                            <th class = "ServiceQnA__Container_table_th">본문</th>
                            <td class = "ServiceQnA__Container_table_td">
                                <input type = "text" name="QnAContent" class = "ServiceQnA__Container_ContentBox">
                                (<span id="textCount">0</span>/255)
                            </td>
                        </tr>
                        <tr class = "ServiceQnA__Container_table_tr">
                            <th class = "ServiceQnA__Container_table_th">첨부파일</th>
                            <td class = "ServiceQnA__Container_table_td">
                                <input type="file" name="fileArea" id="QnA_Container_file">
                                <input type = "button" value="찾아보기">
                            </td>
                        </tr>

                </table>
            </div>
            <div class ="ServiceQnA__Container_button">
                <input type="submit" id = "QnA_Save" value = "저장">
            </div>
            </form>

        </div>

    </div>
    </div>
</div>
<footer>
    <jsp:include page="../footer.jsp"/>
</footer>
<script src = "../js/ServiceQnA.js"></script>

</body>
</html>

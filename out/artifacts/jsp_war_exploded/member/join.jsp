
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel = "stylesheet" href = "../css/join.css">
    <link rel = "stylesheet" href = "http://l.bsks.ac.kr/~p201887082/DiliManage/css/bootstrap.css">
</head>
<body>
    <header>
        <jsp:include page="../header.jsp"/>
    </header>
    <div class = "join_container">
        <div class = "join_container_location">
            <em class = "join_container_location_text">
                <a href ="#" class = "local_home">HOME</a>>회원가입 > 정보입력
            </em>
        </div>

        <div class = "join_container_sub">
            <h2>회원가입</h2>
        </div>

        <div class = "join_container_form_wrap">
            <form name = "member_form" action ="member_process.jsp">
                <div class = "join_member_wrap">
                    <div class = "join_member_text">
                        <span>기본정보</span>
                    </div>
                    <div class = "join__info_sec">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <colgroup>
                                <col width="25%">
                                <col width="75%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>아이디</span>
                                    </th>
                                    <td class = "table_td">
                                        <div>
                                            <input type = "text" id = "memberId" name = "" mainlength = "4" maxlength="8" required>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <input type="button" id="member_button" class = "member_button" value ="회원가입">
            </form>
        </div>
    </div>

    <footer>
        <jsp:include page="../footer.jsp"/>
    </footer>

    <script src = "../js/member.js"></script>

</body>
</html>

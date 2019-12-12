<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src = "http://l.bsks.ac.kr/~p201887082/DiliManage/js/jq.js"></script>
    <title>Document</title>
    <style>
        .member_container{
            width:1200px;
            margin:0px auto;
        }
        .member_containerform_wrap{
            width: 743px;
            margin: 0 auto;
            border: none;
        }
        .member_containerform_basicInfo_input{
            border-top: 1px solid #999999;
        }
        .member_containerform_basicInfo_input table{
            width: 100%;
        }

        th{
            text-align: left;
            border-bottom: 1px solid #dcdcdc;
            background: #fbfbfb;
            padding: 10px 25px;
        }
        td{
            padding: 15px 0 15px 15px;
            border-bottom: 1px solid #dcdcdc;
        }
        input[type="text"], input[type="password"],input[type="email"]{
            height: 31px;
            padding: 0 5px;
            color: #333333;
            border: 1px solid #d6d6d6;
            line-height: 31px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        input[type="text"], input[type="password"],input[type="email"] {
            padding: 0 10px;
            outline: none;
            font-size: 12px;
        }
        table input[type="text"],input[type="email"]{
            width: 380px;
        }
        .JoinBtn{
            width: 150px;
            height: 45px;
            margin: 0;
            color: #ffffff;
            font-size: 14px;
            border: 1px solid #ab3e55;
            background: #ab3e55;
            cursor: pointer;
            font-weight: bold;
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="../header.jsp"/>
</header>
<div class = "member_container">
    <div class = "member_containerform_wrap">
        <form method="POST" action = "member_process.jsp">
            <div class = "member_containerform_basicInfo">
                <h3>기본정보</h3>
                <div class = "member_containerform_basicInfo_input">
                    <table border="0" cellpading="0" cellspacing="0">
                        <colgroup>
                            <col width="25%">
                            <col width="75%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>
                                <span>아이디</span>
                            </th>
                            <td>
                                <div>
                                    <input  name ="userId" type= "text" required minlength="4" maxlength="8">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>비밀번호</span>
                            </th>
                            <td>
                                <div>
                                    <input name ="userPassword"  type= "password" minlength="4" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>비밀번호 확인</span>
                            </th>
                            <td>
                                <div>
                                    <input type= "password" minlength="4" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>이름</span>
                            </th>
                            <td>
                                <div>
                                    <input name ="userName"  type= "text" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>이메일</span>
                            </th>
                            <td>
                                <div>
                                    <input  name ="userEmail" type= "email" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>전화번호</span>
                            </th>
                            <td>
                                <div>
                                    <input name ="userPhone"  type= "text" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>주소</span>
                            </th>
                            <td>
                                <input  name ="userZipCode" type="text" name="currentPage" required> <br><br>
                                <input  name ="userAddress1" type="text" name="currentPage" required> <br><br>
                                <input  name ="userAddress2" type="text" name="currentPage" required>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <input type = "submit" class = "JoinBtn" value = "회원가입">
        </form>
    </div>
</div>
<footer>
    <jsp:include page="../footer.jsp"/>
</footer>
</body>
</html>
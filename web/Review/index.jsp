<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-25
  Time: 오후 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel = "stylesheet" href = "../css/Review.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String ProductNumber = (String) session.getAttribute("ProductNumber");
%>
<div class = "Review__Container">
    <div class = "Review__Cotaniner_title">
        <h2>상품후기</h2>
    </div>
    <div class = "Review__Container__Content">
        <div class = "Review__Container_Top">
            <div class = "Review__Container_Top_img_Wrap">
                <img src = "../image/Thumbnail/<%=ProductNumber%>.jpg">
            </div>
        </div>
        <form method="post" enctype="multipart/form-data" name ="Review__form" action = "./ReviewAction.jsp">
        <div class = "Review__Container__table_wrap">
            <table class = "Review__Container__table">
                    <colgroup>
                        <col style="width:15%">
                        <col style="width:85%">
                    </colgroup>

                    <tr class = "Review__Container_table_tr">
                        <th class = "Review__Container_table_th">작성자</th>
                        <td class = "Review__Container_table_td">
                            <input name = "ReviewWriter" type = "text" minlength="4" >
                        </td>
                    </tr>
                    <tr class = "Review__Container_table_tr">
                        <th class = "Review__Container_table_th" >평점</th>
                        <td class = "Review__Container_table_td start_origin">
                            <div class = "Review__Container_start">
                                <input type = "radio"  name = "ReiviewGrade" value = "5"/>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                            </div>
                            <div class = "Review__Container_start">
                                <input type = "radio"  name = "ReiviewGrade" value = "4"/>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star "></span>
                            </div>
                            <div class = "Review__Container_start">
                                <input type = "radio"  name = "ReiviewGrade" value = "3"/>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star "></span>
                                <span class="fa fa-star "></span>
                            </div>
                            <div class = "Review__Container_start">
                                <input type = "radio"  name = "ReiviewGrade" value = "2"/>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star "></span>
                                <span class="fa fa-star "></span>
                                <span class="fa fa-star "></span>
                            </div>
                            <div class = "Review__Container_start">
                                <input type = "radio"  name = "ReiviewGrade" value = "1"/>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star "></span>
                                <span class="fa fa-star "></span>
                                <span class="fa fa-star "></span>
                                <span class="fa fa-star "></span>
                            </div>
                        </td>
                    </tr>
                    <tr class = "Review__Container_table_tr">
                        <th class = "Review__Container_table_th" >제목</th>
                        <td class = "Review__Container_table_td">
                            <input type = "text" name="ReviewTitle" class = "Review__Container_Text" minlength="4" maxlength="20">
                        </td>
                    </tr>
                    <tr class = "Review__Container_table_tr">
                        <th class = "Review__Container_table_th">본문</th>
                        <td class = "Review__Container_table_td" >
                            <textarea type = "text" name="ReviewContent" cols="40" rows="5" minlength="0" maxlength="255" class = "Review__Container_ContentBox"></textarea>
                            (<span id="textCount">0</span>/255)
                        </td>
                    </tr>
                    <tr class = "Review__Container_table_tr">
                        <th class = "Review__Container_table_th">첨부파일</th>
                        <td class = "Review__Container_table_td">
                            <input name ="fileArea" type = "file" value="찾아보기">
                        </td>
                    </tr>
            </table>
        </div>
        <div class ="Review__Container_button">
            <input type="submit" id = "Review_Save" value = "저장">
        </div>
        </form>

    </div>
</div>
<script src = "../js/Review.js"></script>
</body>
</html>

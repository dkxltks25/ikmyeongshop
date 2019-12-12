<%@ page import="javax.swing.plaf.basic.BasicDesktopIconUI" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String Session_User = (String)session.getAttribute("user_id") == null ? "" : (String)session.getAttribute("user_id");
%>
<html>

<head>
    <title>Title</title>
</head>

<link rel="stylesheet" href = "../css/header.css">
<body>
    <div class = "header__wrap">
        <div class = "header_top_menu">
            <div class = "header_top_sns">
                <img src = "https://www.ikmyeongshop.com/data/skin/front/designbook_moderntim/img/dimg/top_btn_sns1.png">
                <img src = "https://www.ikmyeongshop.com/data/skin/front/designbook_moderntim/img/dimg/top_btn_sns2.png">
            </div>
            <div class = "header_top_user">
                <%
                    if(Session_User.equals("")){
                            //로그인 안한 경우
                        %>
                            <a href = "/member/login.jsp" class = "header_user_link">로그인 </a>
                            <a href = "/member/join_member.jsp" class = "header_user_link">회원가입</a>
                        <%
                    }else{
                        //로그인 한 경우
                        %>
                            <a href = "/member/logout.jsp" class = "header_user_link">로그아웃 </a>
                        <%
                    }
                %>
                <a href = "/ShoppingBag/" class = "header_user_link">장바구니</a>
                <a href = "/User" class = "header_user_link">마이페이지</a>
                <a href = "/Service" class = "header_user_link">고객센터 </a>
                <a href = "/" class = "header_user_link">검색</a>
            </div>
        </div>
        <div class = "header_top_image">
            <div class = "header_top_image_wrap">
                <img src = "https://www.ikmyeongshop.com/data/skin/front/designbook_moderntim/img/banner/74f80b80d91166d881806c53c264bed4_39102.png">
            </div>
            <div class = "header_top_image_wrap">
                <img src = "https://www.ikmyeongshop.com/data/skin/front/designbook_moderntim/img/banner/6260dc7f41d8c5391f10547b2a653d42_54901.png">
            </div>
            <div class = "header_top_image_wrap">
                <img src = "https://www.ikmyeongshop.com/data/skin/front/designbook_moderntim/img/banner/4c7dc40ebefb674cfacc56e33e69f2c9_19134.png">
            </div>
        </div>
    </div>
    <div class = "header_bottom_menu">
        <div class = "header_bottom_list">
            <div class = "header_bottom_icon">
            </div>
            <span class = "header_bottom_list_item"><a href = "/Product/Product_list.jsp?ProductClass=00000001">Doll</a></span>
            <span class = "header_bottom_list_item"><a href = "/Product/Product_list.jsp?ProductClass=00000002">FIGURE & TOY</a></span>
            <span class = "header_bottom_list_item"><a href = "/Product/Product_list.jsp?ProductClass=00000003">FANCY</a></span>
            <span class = "header_bottom_list_item"><a href = "/Product/Product_list.jsp?ProductClass=00000004">ACCESSORY</a></span>
            <span class = "header_bottom_list_item"><a href = "/Product/Product_list.jsp?ProductClass=00000005">LIVING</a></span>
            <span class = "header_bottom_list_item"><a href = "/Product/Product_list.jsp?ProductClass=00000006">KITCHEN & BATHROOM</a></span>
            <span class = "header_bottom_list_item"><a href = "/Product/Product_list.jsp?ProductClass=00000007">MOBILE</a></span>
        </div>
    </div>
    <script>
        const Link = document.getElementsByClassName("header_user_link")[3];
        const Session = "<%=Session_User%>";
        console.dir(Link);
        if(Session === ""){

            Link.addEventListener('click',()=>{
                Link.href="http://localhost:8080/member/login.jsp";
            })
        }
    </script>
</body>
</html>

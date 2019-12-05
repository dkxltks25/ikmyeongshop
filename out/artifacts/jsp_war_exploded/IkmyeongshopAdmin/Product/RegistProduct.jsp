<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-11-28
  Time: 오전 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/styles.css">

    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel = "stylesheet" href = "http://l.bsks.ac.kr/~p201887082/php_login/assets/bootstrap/css/bootstrap.min.css"
    <script src = "http://l.bsks.ac.kr/~p201887082/DiliManage/js/jq.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="//cdn.muicss.com/mui-0.10.0/css/mui.min.css" rel="stylesheet" type="text/css" />
    <script src="//cdn.muicss.com/mui-0.10.0/js/mui.min.js"></script>
    <style>
        .mui-dropdown{
            position: fixed; right: 5%; bottom: 5%
        }
    </style>
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

    <jsp:include page="../Drawer.jsp"/>
    <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content">
            <div class="demo-cards mdl-color--white mdl-shadow--3dp mdl-cell mdl-cell--12-col mdl-grid">
                <form method="POST" id = "RegisterProductForm" class="mui-form" style ="width:100%;padding:20px 10px 20px 10px" enctype="multipart/form-data">
                    <legend>Title</legend>
                    <div class="mui-textfield mui-textfield--float-label">
                        <input type="text" name="ProductName" required minlength="4">
                        <label>상품명</label>
                    </div>
                    <div class="mui-select">
                        <select name="ProductClass">
                             <option value ="00000001">DOLL</option>
                             <option value ="00000002">FIGURE & TOY</option>
                             <option value ="00000003" >FANCY</option>
                             <option value ="00000004">ACCESSORY</option>
                             <option value ="00000005">LIVING</option>
                             <option value ="00000006">KITCHEN & BATHROOM</option>
                             <option value ="00000007">MOBILE</option>
                        </select>
                        <label>상품종류</label>
                    </div>
                    <div class="mui-textfield mui-textfield--float-label">
                        <input type="text" id = "ProductCount" name="ProductCount" required>
                        <label>상품수량</label>
                    </div>
                    <div class="mui-textfield mui-textfield--float-label" required >
                        <input type="text" id ="ProductPrice" name="ProductPrice" required>
                        <label>상품가격</label>
                    </div>
                    <div class="mui-textfield mui-textfield--float-label">
                        <input type="number" name="ProductDiscount" maxlength="3" required>
                        <label>상품할인(0~100 까지만 입력해주세요)</label>
                    </div>
                        <input type="file" id = "ProductTubmnail" name="ProductTubmnail"/>
                        <input type="file" id = "ProductBackground" name="ProductBackground"/>

                    <button style = "float:right;" id = "btn" type="submit" class="mui-btn mui-btn--raised">Submit</button>
                </form>

            </div>
        </div>


    </main>

</div>

<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>

<script>

    window.onload = ()=>{
        const RegisterForm = document.getElementById("RegisterProductForm");
        const ProductCount = document.querySelector("#ProductCount");
        const ProductPrice = document.querySelector("#ProductPrice");
        const ProductTubmnail = document.getElementById("ProductTubmnail");
        const ProductBackground = document.getElementById("ProductBackground");
        const btn = document.getElementById("btn");
        RegisterForm.action="../action/RegisterProductAction.jsp"
        RegisterForm.addEventListener("submit",()=>{
            alert(1);
        });

    };
</script>
</body>
</html>

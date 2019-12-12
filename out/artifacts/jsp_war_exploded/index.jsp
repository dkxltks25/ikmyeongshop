<%@ page import="Purchase.PurchaseDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String userNumber = (String)session.getAttribute("user_id");
%>
<html>
<head>
  <title>$Title$</title>
  <style>

    .index__center{
      position: relative;
      overflow: hidden;
      width: 100%;
      height: 844px;
    }
    .index__center_image_wrap{
      position: absolute;
      top: 0px;
      left: 0px;
      z-index: 50;
      opacity: 0.7;
      display: block;
      border: 0 none;
      vertical-align: top;
      visibility: visible;
    }
    .index__container{
      width: 1200px;
      position: relative;
      margin: 0 auto;
      border-top: none;
    }
    .index__container_BestSeller{
      position: relative;
      overflow: hidden;
      margin: 100px 0 0;
      display:flex;
      justify-content: space-around;
    }
    .index__container_ProductBox{
      width:272px;
      padding:0 19px 37px;
    }
    .index__container_Product_text{
      display: block;
      padding: 10px 0 10px;
      margin: 0 0 10px;
      border-bottom: 1px solid #e1e1e1;
      color: #000000;
      font-size: 16px;
      font-weight: 300;
      line-height: 1.3;
      white-space: normal;
      letter-spacing: -0.5px;
      text-align: center;
    }
    .index__container_Product_money{
      padding: 0;
      color: #000000;
      font-size: 19px;
      font-weight: bold;
      letter-spacing: -0.5px;
      text-align:center;
    }

  </style>
</head>
<body>


  <header>
    <jsp:include page="header.jsp"/>
  </header>

  <div class = "index__center">
    <div class = "index__center_image_wrap">
      <img class = "index__center_image"src = "https://www.ikmyeongshop.com/data/skin/front/designbook_moderntim/img/banner/75fb76ff06056cdb9b13ba1ec7a61191_85617.jpg">
    </div>
  </div>
  <div class = "index__container">
    <h2 style="text-align: center">BEST SELLER</h2>
    <div class = "index__container_BestSeller">

      <div class = "index__container_ProductBox">
        <div class = "index__container_Product_image_wrap">
          <img src = "https://www.ikmyeongshop.com/data/goods/19/06/25/1000000042/1000000042_main_080.jpg" class = "index__container_Product_image">
        </div>
        <div class = "index__container_Product_text_wrap">
          <strong class = "index__container_Product_text">익명이 에어팟케이스</strong>
          <br>
          <strong class = "index__container_Product_money">120000</strong>
        </div>
      </div>
      <div class = "index__container_ProductBox">
        <div class = "index__container_Product_image_wrap">
          <img src = "https://www.ikmyeongshop.com/data/goods/19/06/25/1000000042/1000000042_main_080.jpg" class = "index__container_Product_image">
        </div>
        <div class = "index__container_Product_text_wrap">
          <strong class = "index__container_Product_text">익명이 에어팟케이스</strong>
          <br>
          <strong class = "index__container_Product_money">120000</strong>
        </div>
      </div>
      <div class = "index__container_ProductBox">
        <div class = "index__container_Product_image_wrap">
          <img src = "https://www.ikmyeongshop.com/data/goods/19/06/25/1000000042/1000000042_main_080.jpg" class = "index__container_Product_image">
        </div>
        <div class = "index__container_Product_text_wrap">
          <strong class = "index__container_Product_text">익명이 에어팟케이스</strong>
          <br>
          <strong class = "index__container_Product_money">120000</strong>
        </div>
      </div>
      <div class = "index__container_ProductBox">
        <div class = "index__container_Product_image_wrap">
          <img src = "https://www.ikmyeongshop.com/data/goods/19/06/25/1000000042/1000000042_main_080.jpg" class = "index__container_Product_image">
        </div>
        <div class = "index__container_Product_text_wrap">
          <strong class = "index__container_Product_text">익명이 에어팟케이스</strong>
          <br>
          <strong class = "index__container_Product_money">120000</strong>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <jsp:include page="footer.jsp"/>
  </footer>
</body>
</html>

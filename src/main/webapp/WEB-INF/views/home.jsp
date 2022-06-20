<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<html>
<style>

.slider {
	max-width: 1903px;
    height: 350px;
    margin: 0 auto;
    position: relative;
    z-index: 1;
    overflow: hidden;
}
.slider input[type=radio]{
    display: none;
}
ul.imgs{
    padding: 0;
    margin: 0;
}
ul.imgs li{
    position: absolute;
    opacity: 0;
    list-style: none;
    padding: 0;
    margin: 0;
    transition-delay: 0.9s;
}
.bullets{
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: 20px;
    z-index: 2;
}
.bullets label{
    display: inline-block;
    border-radius: 50%;
    background-color: rgba(0,0,0,0.55);
    width: 20px;
    height: 20px;
    cursor: pointer;
}
.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
    background-color: #fff;
}

.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
    opacity: 1;
    transition: 1s;
    z-index: 1;
}
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
    opacity: 1;
    transition: 1s;
    z-index: 1;
}
.main_wrap {
    max-width: 1200px;
    margin: 0 auto;
}
.main_wrap {
    max-width: 1200px;
    margin: 0 auto;
}
.main_best.main_section {
    margin-top: 62px;
    margin-bottom: 36px;
}
.main_section_title {
    position: relative;
    font-size: 0;
    margin-bottom: 60px;
}
.main_section_title > h2 {
	display: block;
    margin-left: 0.05em;
    text-align: center;
    color: #222;
    font-size: 29px;
    font-weight: 600;
    letter-spacing: -2.04px;
    border-bottom: 1px solid #eee;
    padding-bottom: 21px;
}
.main_section_title > a > span {
    display: inline-block;
    padding-right: 18px;
    position: relative;
}



.main_section_title > a {
    display: block;
    position: absolute;
    right: -7px;
    bottom: 3px;
    font-size: 15px;
    font-weight: 400;
    letter-spacing: -0.025em;
    color: #888;
    -webkit-transition: color 400ms;
    transition: color 400ms;
}
.body-main .product_type_gallery {
    margin: 0;
    padding: 0;
    border: none;
}
.product_list {
    margin: 0 -12px;
}
.product_type_gallery .product_item:nth-child(4n+1) {
    clear: none;
}
.product_type_gallery .product_item {
    width: 20%;
    margin-bottom: 24px;
}
.product_item {
    float: left;
    padding: 0 12px;
}
.product_item_inner {
    width: 100%;
    position: relative;
}
.product_type_gallery .product_item_inner {
    border: 1px solid #ddd;
}
.product_link {
    display: block;
    height: 100%;
    position: relative;
    z-index: 1;
}
a {
    color: #ed5c22;
    text-decoration: none;
}
.product_type_gallery .product_thumbnail {
    height: 223px;
}
.product_thumbnail {
    position: relative;
}
.product_thumbnail_group {
    position: relative;
}
.product_thumbnail_hover {
    position: absolute;
    left: 0;
    top: 0;
    opacity: 0;
    -webkit-transition: opacity 1s cubic-bezier(0.23, 1, 0.38, 1);
    transition: opacity 1s cubic-bezier(0.23, 1, 0.38, 1);
    -webkit-transition-delay: 0ms;
    transition-delay: 0ms;
}
.product_thumbnail img {
    width: 100%;
    height: auto;
    vertical-align: middle;
}
.product_type_gallery .product_data {
    /* height: 126px; */
    padding: 19px 28px;
}
.product_data {
    display: block;
}
.product_data_name {
    display: block;
    margin-bottom: 7px;
    font-size: 0;
}
.main_section:last-child {
    margin-bottom: 0;
}
.main_banner_box {
    border: 1px solid #ddd;
    margin-bottom: 80px;
    margin-top: 65px;
}
.main_banner_box > li:nth-child(1) {
    background-image: url(${app}/resources/images/main-banner-ktx.png);
    background-position: center 53px;
    background-size: 54px 47px;
}
.main_banner_box > li {
    float: left;
    width: 33.33%;
    padding: 114px 10px 46px;
    text-align: center;
    background: #f8f8f8 no-repeat center 50px;
    border-right: 1px solid #ddd;
}
.main_banner_box > li:nth-child(2) {
    background-image: url(${app}/resources/images/main-banner-delivery.svg);
}
.main_banner_box > li:nth-child(3) {
    background-image: url(${app}/resources/images/main-banner-support.svg);
}
.main_banner_box > li:last-child {
    border-right: none;
}

.main_banner_box:after {
    content: '';
    display: table;
    clear: both;
}
.main_section:after {
    content: '';
    display: table;
    clear: both;
}
*::before, *::after {
    box-sizing: border-box;
}
::selection {
    background: rgba(255, 164, 128, .35);
    color: #666;
}
.product_type_gallery .product_item_inner:after {
    content: '';
    display: block;
    position: absolute;
    top: -2px;
    bottom: -2px;
    left: -2px;
    right: -2px;
    border: 1px solid #ed5c22;
    opacity: 0;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-transition: all 300ms;
    transition: all 300ms;
}
.product_list:after {
    content: '';
    display: table;
    clear: both;
}
.product_type_gallery .product_item_inner:hover:after {border-width: 2px;opacity: 1;}

.product_data_name > span {
    display: inline-block;
    vertical-align: middle;
    max-width: 100%;
    font-size: 18px;
    line-height: 1.3;
    font-weight: 500;
    color: #222;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal;
}
.product_item.prod_high .product_data_name > span {
    max-width: -webkit-calc(100% - 48px);
    max-width: calc(100% - 48px);
}
.main_section_title > a:hover {color: #ed5c22;}

.testt.product_thumbnail {
    padding: 20px;
    background-color: #f8f8f8;
}
.bx-viewport {
    height: 489px !important;
}
.bx-wrapper .bx-controls-direction a {

    margin-top: -100px !important;

}



</style>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script>
    $(document).ready(function () {
            $('.bxslider').bxSlider({ // 클래스명 주의!
                auto: true, // 자동으로 애니메이션 시작
                speed: 500,  // 애니메이션 속도
                pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
                mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
                autoControls: false, // 시작 및 중지버튼 보여짐
                pager: true, // 페이지 표시 보여짐
                captions: true, // 이미지 위에 텍스트를 넣을 수 있음
        		maxSlides : 1,
        		minSlides : 1,
        		adaptiveHeight:true
            });
     });
</script>

<body>
<main class="cmain main" role="main" id="mainContents">
<!-- 슬라이더  start-->
		<div class="slider">
		    <ul class="bxslider">		      
		        <li><a href="#"><img src="${app}/resources/images/main5.png"></a></li>
		        <li><a href="#"><img src="${app}/resources/images/main6.png"></a></li>
		        <li><a href="#"><img src="${app}/resources/images/main7.png" style="max-height: 100%;"></a></li>
		    </ul>
		</div><div id="content">
    <div class="main_container">
        <div class="main_wrap">
            <div class="main_set main_section" style="margin-top: 62px;">
                <div class="js-main-wrap-14-">
                    <div class="main_section_title">
                        <h2>Hmall 베스트</h2>
                        <a href="${app}/p/productlist?category=A2211" class="main_more_btn"><span>더보기 〉 </span></a>
                    </div><!-- .main_section_title -->
                    <div class="main_product_wrap goods-content14">
                        <div class="product_type_gallery">
                            <ul class="product_list">
                            	<c:forEach items="${productlist}" var="productlist">
                                <li class="product_item ">
                      <!-- foreach hmall 베스트 돌리기 -->
	                                    <div class="product_item_inner">
	                                        <a class="product_link" href="${app}/p/${productlist.prd_board_id}">
	                                            <div class="testt product_thumbnail">
	                                                <div class="product_thumbnail_group">
	                                                    <div class="product_thumbnail_base"><img
	                                                            width="280" height="280" alt="${productlist.prd_nm}" 
	                                                            class="middle gd_image_lazy"
	                                                            src="${productlist.prd_image}?RS=300x300&amp;AR=0"
	                                                            style="display: inline;"></div>
	                                                    <div class="product_thumbnail_hover"><img
	                                                            width="280" height="280" alt="${productlist.prd_nm}"
	                                                            class="middle gd_image_lazy"
	                                                            src="${productlist.prd_image}?RS=300x300&amp;AR=0"
	                                                            style="display: inline;"></div>
	                                                </div><!-- .product_thumbnail_group -->
	                                            </div><!-- .product_thumbnail -->
	                                            <div class="product_data">
	                                                <strong class="product_data_name">
	                                                    <span>${productlist.prd_nm}</span>
	                                                </strong>
	                                            </div><!-- .product_data -->
	                                        </a><!-- .product_link -->
	                                        <!-- .product_action_choice -->
	                                    </div><!-- .product_item_inner -->
	                                </li><!-- .product_item -->
                                </c:forEach> 
                      <!-- foreach hmall 베스트 end -->
                            </ul>
                        </div><!-- .product_type_gallery -->
                    </div><!-- .main_product_wrap -->
                </div>
            </div>
            
            <div class="main_set main_section" style="margin-top: 62px;">
                <div class="js-main-wrap-14-">
                    <div class="main_section_title">
                        <h2>대여 상품 베스트</h2>
                        <a href="${app}/rental/main" class="main_more_btn"><span>더보기 〉</span></a>
                    </div><!-- .main_section_title -->
                    <div class="main_product_wrap goods-content14">
                        <div class="product_type_gallery">
                            <ul class="product_list">
                    <!-- foreach 대여 돌리기 -->
                    			<c:forEach items="${rentalproductlist}" var="rentalproductlist">
                                <li class="product_item ">
                                    <div class="product_item_inner">
                                        <a class="product_link" href="${app}/rental/${rentalproductlist.prd_id}">
                                            <div class="testt product_thumbnail">
                                                <div class="product_thumbnail_group">
                                                    <div class="product_thumbnail_base"><img
                                                            data-original="${rentalproductlist.prd_image}"
                                                            width="280" height="280" alt="${rentalproductlist.prd_nm}" 
                                                            class="middle gd_image_lazy"
                                                            src="${rentalproductlist.prd_image}"
                                                            style="display: inline;"></div>
                                                    <div class="product_thumbnail_hover"><img
                                                            width="280" height="280" alt="${rentalproductlist.prd_nm}" 
                                                            class="middle gd_image_lazy"
                                                            src="${rentalproductlist.prd_image}"
                                                            style="display: inline;"></div>
                                                </div><!-- .product_thumbnail_group -->
                                            </div><!-- .product_thumbnail -->
                                            <div class="product_data">
                                                <strong class="product_data_name">
                                                    <span>${rentalproductlist.prd_nm}</span>
                                                </strong>
                                            </div><!-- .product_data -->
                                        </a><!-- .product_link -->
                                        <!-- .product_action_choice -->
                                    </div><!-- .product_item_inner -->
                                </li><!-- .product_item -->
                                </c:forEach>
                 <!-- foreach 대여 end  -->
                            </ul>
                        </div><!-- .product_type_gallery -->
                    </div><!-- .main_product_wrap -->
                </div>
            </div>
        </div>
        <<!-- foreach 대여 끝-->
        <!-- .main_wrap2 -->
        <div class="main_wrap">
            <div class="main_banner main_section">
                <ul class="main_banner_box">
                    <li>
                        <b>회원가입 시 대여 서비스 이용가능</b>
                        <p>비싼 옷들을 값싸게 대여해보세요.</p>
                    </li>
                    <li>
                        <b>3만원 이상 무료배송</b>
                        <p>3만원 이상 무제한 무료배송 합니다.</p>
                    </li>
                    <li>
                        <b>등급별 회원 혜택</b>
                        <p>회원등급별 쿠폰을 드리는 회원제도</p>
                    </li>
                </ul><!-- .main_banner_box -->
            </div><!-- .main_banner -->
        </div><!-- .main_wrap -->
    </div>
</div>
		
<!-- 슬라이더  end-->
</main>
</body>
</html>
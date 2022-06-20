<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>

<head>
<link rel="shortcut icon" type="image/x-icon" href="${app}/resources/images/favicon.png">
<title>상품 상세</title>


<!-- Main Contents css = Contents css부분은 각페이지마다 다르게 해당되는 css가 호출 됨(폴더 구조별)  -->
<script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
<script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
<script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
<script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
<script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- 공통 Slide 플러그인 -->
<link rel="stylesheet" type="text/css"
	href="//image.hmall.com/p/css/pd/product.css">
<script type="text/javascript"
	src="//image.hmall.com/p/js/co/jquery.form.js"></script>
<script type="text/javascript"
	src="//image.hmall.com/p/js/pd/product.js"></script>
<script type="text/javascript" src="${app}/resources/js/commonFunction.js"></script>   
	
</head>

<style>
.adam_product_container {
	width: 100%;
    min-height: calc(100vh - 369px);
   	background: #7c7c7c;
}

.adam_product_contents {
	position: relative;
    width: 1081px;
    margin: 0 auto;
	background: #afafaf;
}
</style>

<body>

	<tiles:insertAttribute name="header" />
	<div class="container">
		<div class='contents'>
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	<tiles:insertAttribute name="footer" />

</body>
</html>
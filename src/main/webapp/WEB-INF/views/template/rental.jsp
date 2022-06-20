<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>

<head>
<link rel="shortcut icon" type="image/x-icon" href="${app}/resources/images/favicon.png">
<title>대여</title>


<!-- Main Contents css = Contents css부분은 각페이지마다 다르게 해당되는 css가 호출 됨(폴더 구조별)  -->

<script type="text/javascript" src="//image.hmall.com/p/js/co/jquery.form.js"></script>
<script type="text/javascript" src="//image.hmall.com/p/js/pd/product.js"></script>
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css">
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css">

<!-- UI/UX Style -->
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- 공통 css -->
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- 공통 Layout css -->
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- 공통 Popup css -->
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
<style>
.hidden {display:none !important;}
</style>
<script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
<script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
<script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
<script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
<script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- 공통 Slide 플러그인 -->
<script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI에 사용하는 기본 js  -->
<script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
<script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->

<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/od/order.css">
</head>


<body>

	<tiles:insertAttribute name="header" />
	
	<main class="cmain bgcmain" role="main" id="mainContents">
		<div class="container">
			<div class="cbody">
				<div class='contents'>
					<tiles:insertAttribute name="body" />
				</div>
			</div>
		</div>
	</main>
	
	<tiles:insertAttribute name="footer" />

</body>
</html>
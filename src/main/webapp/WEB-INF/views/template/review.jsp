<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>

<head>
<link rel="shortcut icon" type="image/x-icon" href="${app}/resources/images/favicon.png">
<title>리뷰</title>

<!-- Main Contents css = Contents css부분은 각페이지마다 다르게 해당되는 css가 호출 됨(폴더 구조별)  -->
<link rel="stylesheet" type="text/css"
	href="//image.hmall.com/p/css/pd/product.css">
<script type="text/javascript"
	src="//image.hmall.com/p/js/co/jquery.form.js"></script>
<script type="text/javascript"
	src="//image.hmall.com/p/js/pd/product.js"></script>

	
</head>

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
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html>

<head>

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="//image.hmall.com/p/img/co/favicon/favicon.ico">
<title>현대홈쇼핑 - 현대Hmall</title> 


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" id="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>

<style>
.content {
	/*color for checking area of this css of menu*/
	/*if component of content has white background, so it will be hided*/
	/*background-color: #EAEAEA;*/
}

.menu {
	margin: 0% 0% 0% 20%;
	float: left;
}

.page_content {
	margin: 5% 10%;
}
</style>

<body>

		<tiles:insertAttribute name="header" />

		<div class="content">

			<div class="menu">
				<tiles:insertAttribute name="side" />
			</div>
			
			<div class="page_content">
				<tiles:insertAttribute name="body" />
			</div>

		</div>

		<tiles:insertAttribute name="footer" />

</body>
</html>
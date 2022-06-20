<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<link rel="shortcut icon" type="image/x-icon" href="${app}/resources/images/favicon.png">
		<title>고객센터</title>
	</head>

	<body>
		<tiles:insertAttribute name="header" />
		<main class="cmain customer" id="mainContents" role="main">
			<div class="container" >
				<tiles:insertAttribute name="leftsidebar" />
				<tiles:insertAttribute name="body" />
			</div>
		</main>
		<tiles:insertAttribute name="footer" />
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<html>
  <head>
   <link rel="shortcut icon" type="image/x-icon" href="${app}/resources/images/favicon.png">
   <title>회원가입</title>
	<link rel="stylesheet" type="text/css" href="${app}/resources/css/screen.ui.css">
	<script type="text/javascript" src="${app}/resources/js/init.js"></script>
	<script type="text/javascript" src="${app}/resources/js/validation.js"></script>
  </head>
  <body>
  
          <tiles:insertAttribute name="header" />
 
          <tiles:insertAttribute name="body" />

          <tiles:insertAttribute name="footer" />

  </body>
</html>
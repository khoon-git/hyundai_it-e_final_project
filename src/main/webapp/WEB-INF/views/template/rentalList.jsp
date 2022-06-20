<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />

<html>
  <head>
<link rel="shortcut icon" type="image/x-icon" href="${app}/resources/images/favicon.png">
	<title>대여 / 기획전</title>
  </head>
  <body>
  
          <tiles:insertAttribute name="header" />
 
          <tiles:insertAttribute name="body" />

          <tiles:insertAttribute name="footer" />

  </body>
</html>
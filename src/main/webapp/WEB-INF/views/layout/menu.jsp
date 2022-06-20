<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<!-- style of button link ;  https://www.w3schools.com/css/tryit.asp?filename=trycss_buttons_border-->
<style>
.button {
  background-color: white;
  border: none;
  color: white;
  /*padding: 15px 32px;*/
  text-align: center;
  text-decoration: none;
  display: inline-block;
  
  margin: 4px 2px;
  cursor: pointer;
}
.button4 {
  background-color: white;
  color: black;
  /*border: 2px solid black;*/
  font-size: 8px;
}
.button5 {
  background-color: white;
  color: black;
  /*border: 2px solid black;*/
  font-size: 20px;
}
</style>

<body>
	<div class="menu">
		<h2>Subjects</h2>

		<c:forEach items="${boardlist}" var="dto">
			<!-- button method -->
			<button class="button button5" onclick="location.href='../../${ dto.board_subject }/1/';">${ dto.board_subject.toUpperCase() }</button>
			<!-- a tag  method -->
			<!-- 
			<a href="../../${ dto.board_subject }/1/"> 
			<c:out value="${ dto.board_subject.toUpperCase() }" /></a>
			 -->
			<br>
		</c:forEach>
		<br>
		<br>
		<button class="button button4" onclick="location.href='../../boardlist';">Back</button>
	</div>
</body>
</html>
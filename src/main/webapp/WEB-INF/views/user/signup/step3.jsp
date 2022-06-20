<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="contents" class="subPage" style="padding-top: 60px;">
		<div id="sign">
			<article class="sign_up">
			
			<!-- pageTitle -->
				<div class="pageTitle">
					<div class="layout1">
						<h2 class="tit">회원가입 완료</h2>
						<p class="desc">Hmall 회원이 되신 것을 환영합니다!</p>
					</div>
				</div>
				<!--// pageTitle -->
				
			<!-- step -->
				<div class="wrap_sign_step">
					<ol class="clear">
						<li class="step2 on">
							<div class="num">1</div>
							<p class="txt">약관동의</p>
						</li>
						<li class="step3 on">
							<div class="num">2</div>
							<p class="txt">정보입력</p>
						</li>
						<li class="step4 on">
							<div class="num">3</div>
							<p class="txt">가입완료</p>
						</li>
					</ol>
				</div>
			<!--// step -->
		
			<div class="sign_up">
				<div class="pageTitle">
					<div class="layout1">
						<p class="desc">Hmall과 함께 365일즐거운 쇼핑을 즐겨보세요.</p>
					</div>
				</div>
				<div class="wrap_sign_step">
					<div class="btn_area btn_ac">
						<a class="btn_typeB2" href="${app}/login" style="color:snow; margin-bottom:80px;"><span>로그인 하기</span></a>
					</div>
				</div>
			</div>
			
			</article>
		</div>
	</div>
</body>
</html>
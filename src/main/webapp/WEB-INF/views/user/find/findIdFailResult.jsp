<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${app}/resources/css/login.css">
<script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
<script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
<script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
<script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
<script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- 공통 Slide 플러그인 -->
<script src="//image.hmall.com/p/js/co/common.js"></script><!-- UI에 사용하는 기본 js  -->
<script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI에 사용하는 기본 js  -->
<script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
<script src="//image.hmall.com/p/js/co/commonFunction.js"></script><!-- as-is common.js 상속  -->
<script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->

</head>
<body>

<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
        <div class="container">
            <div class="cbody gird-full">
                <div class="contents w520">
                    <div class="inner-box">
                        <!--tit-wrap-->
                        <dl class="tit-wrap">
                            <dt class="title24">아이디 찾기</dt>
                        </dl>
                        <!--//tit-wrap-->
                        <!--아코디언-->
                        <form id = "findIdForm" name="findIdForm" method="post" action="${app}/findIdNameEmail" >
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <div class="accparent">
                                <!--등록된 이메일로 찾기--> 
                                <h3 class="selected">
                                        <span><span class="bgcircle"><i class="icon user-email"></i></span>등록된 이메일로 찾기</span>
                                </h3>
                                <div class="accordion-panel user-find-id-email selected" role="user-find-id-email" aria-label="등록된 이메일로 찾기">
                                    <!--inputbox fail일 경우 class="failed" 붙여줘야함-->
                                    <p style="text-align:center;">
                                    	입력하신 정보에 해당하는 회원 정보가 없습니다. <br />
                                    	아직 쇼핑몰 회원이 아니시면 먼저 회원가입을 해주세요.
                                    </p>
                                </div>

                            </div>
                        </form>
                        <!--//아코디언-->

                        <!--아코디언 footer-->
                        <div class="acc-footinfo">
                            <p class="text-msg">아이디/패스워드 찾기가 안될 경우,</p>
                            <p class="text-msg">고객센터 <a href="tel:1600-0000" class="tel">1600-0000</a>으로 문의하시기 바랍니다.</p>
                            <div class="linkwrap">
                                <span class="txt">비밀번호를 찾으시나요?</span>
                                <a href="./findPwd" class="alink"><span>비밀번호 찾기</span></a>
                            </div>
                        </div>
                        <!--//아코디언 footer-->
                    </div>
                    <!--inner-box-->
                </div>
            </div>
        </div>
        <!-- //.container -->
    </main>
</body>
</html>
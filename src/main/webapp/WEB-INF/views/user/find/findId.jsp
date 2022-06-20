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

<script>
        jQuery(function($) {
            //enter 클릭시 submit 방지
            $(window).keydown(function(event){
                if(event.keyCode == 13){
                    event.preventDefault();
                    return false;
                }
            });

            $("input[name='emailName']").blur(function() {
                checkName();
            });

            $("input[name='email']").blur(function() {
            	checkEmail();
            });

        });
        
        function checkName() {
        	var emailName = $("input[name='emailName']").val();
            var alertSpan = $("#alertEmail span");
            $("#divEmailName").addClass('failed');
            var v_num  = 0;
            var v_spe  = 0;
            var pattern1 = /\s{2,}/g; //2021.07.23 KJH 공백 1개만 허용

            if (isEmpty(emailName)) {
                isValidEmailName = false;
                $("#alertEmail").show();
                alertSpan.text("이름을 입력해 주세요.");
                return;
            } else if (pattern1.test(emailName)){
            	isValidEmailName = false;
                $("#alertEmail").show();
                alertSpan.text("공백은 연속해서 입력할 수 없습니다.");
                return;
            } else if (emailName[0] == " " || emailName[0] == "\t") {
            	isValidEmailName = false;
	            $("#alertEmail").show();
	            alertSpan.text("이름은 공백으로 시작할 수 없습니다.").show();
	            return;
            } else if (emailName[emailName.length-1] == " " || emailName[emailName.length-1] == "\t") {
            	isValidEmailName = false;
	            $("#alertEmail").show();
	            alertSpan.text("이름은 공백으로 끝날 수 없습니다.").show();
	            return;
	        } else {
                    isValidEmailName = true;
                    $("#divEmailName").removeClass('failed');
                    $("#alertEmail").hide();
            }
        }
        
        function checkEmail() {
            var divChk      = $("#divEmailId");
            var alertSpan = $("#alertEmail span");
            var email = $("input[name='email']").val();
            if(email == "" || email == null)
            	email = $("#email").val();
            var pattern = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zsA-Z_-]+){1,2}$/;
            divChk.addClass('failed');
            if (isEmpty(email)) {
                isValidEmail = false;
                alertSpan.text("이메일을 입력해 주세요.");
                // divChk.addClass('_active');
            } else {

                if ( fGetByteLength(document.getElementById("email")) > 30 ) {
                    isValidEmail = false;
                    alertSpan.text("E-Mail을 30자리 이하로 입력해 주세요.");
                    //alert("E-Mail을 30자리 이하로 입력해 주세요");
                    //$("#email").focus();
                    //return false;
                }


                if(!pattern.test(email)){
                    if(!chkStrEmail(email)) { // 공백 체크
                        isValidEmail = false;
                        alertSpan.text("이메일에 공백은 지원하지 않습니다. 다시 입력해주세요.").show();
                        //return;
                    } else {
                        isValidEmail = false;
                        alertSpan.text("이메일 형식이 틀렸습니다. 다시 확인하고 입력해 주세요.").show();
                        //return;
                    }
                } else {
                    if(!chkStrEmail(email)) { // 공백 체크
                        isValidEmail = false;
                        alertSpan.text("이메일에 공백은 지원하지 않습니다. 다시 입력해주세요.").show();
                        //return;
                    }
                    /*
                    if(!chkDomain(email)) { // 도메인 체크
                        isValidEmail = false;
                        alertSpan.text("지원하지 않는 형식의 도메인입니다. 도메인을 다시 확인해주세요.").show();
                        //return;
                    }
                    */
                    
                    else {
                    	isValidEmail = true;
                    }
                }               
                
            }
            // 이메일 유효성 체크
            if (!isValidEmail) {
                $("#alertEmail").show();
                return;
            }
            else
            {
                isValidEmail = true;
                divChk.removeClass('failed');
                $("#alertEmail").hide();
            }
        }
        
        /**
         * 입력 필드에 입력된 문자의 바이트 수를 리턴한다.
         * 단, 한글은 2바이트이다.
         */
        function fGetByteLength(input) {
            var byteLength = 0;
            for (var inx = 0; inx < input.value.length; inx++) {
                var oneChar = escape(input.value.charAt(inx));
                if ( oneChar.length == 1 ) {
                    byteLength ++;
                } else if (oneChar.indexOf("%u") != -1) {
                    byteLength += 2;
                } else if (oneChar.indexOf("%") != -1) {
                    byteLength += oneChar.length/3;
                }
            }
            return byteLength;
        }
        
      //이메일 공백 체크
        function chkStrEmail(chkString) {
            esc = new Array(" ");

            if(chkString != null)
            {
                for (i = 0; i < chkString.length ; i++)
                {
                    for ( j = 0 ; j < esc.length; j++)
                    {
                        if( esc[j] == chkString.charAt(i))
                        {
                            alert("이메일에 공백은 지원하지 않습니다. 다시 입력해주세요.");
                            return false;
                        }
                    }
                }
            }
            return true;
        }
   
	
    </script>
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
                        <form id = "findIdForm" name="findIdForm" method="post" action="${app}/findIdNameEmail" >
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <div class="accparent">
                                <!--등록된 이메일로 찾기--> 
                                <h3 class="selected">
                                        <span><span class="bgcircle"><i class="icon user-email"></i></span>등록된 이메일로 찾기</span>
                                </h3>
                                <div class="accordion-panel user-find-id-email selected" role="user-find-id-email" aria-label="등록된 이메일로 찾기">
                                    <!--inputbox fail일 경우 class="failed" 붙여줘야함-->
                                    <div class="inputbox" id="divEmailName">
                                        <label class="inplabel">
                                            <input type="text" id="emailName" name="emailName" placeholder="이름">
                                        </label>
                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                    </div>
                                    <div class="inputbox" id="divEmailId">
                                        <label class="inplabel"><input type="text" id="email" name="email" placeholder="이메일"></label>
                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                    </div>
                                    <!-- fail일 경우 메세지 출력 alertEmailName alertEmail 합침-->
                                    <p class="failed-msg" id="alertEmail" style="display:none;">
                                        <i class="icon error"></i>
                                        <span>이메일을 입력해주세요.</span>
                                    </p>
                                    <button class="btn btn-linered medium" type="submit"><span>확 인</span></button>
                                </div>

                            </div>
                        </form>

                        <!--footer-->
                        <div class="acc-footinfo">
                            <p class="text-msg">아이디 찾기가 안될 경우,</p>
                            <p class="text-msg">고객센터 <a href="tel:1600-0000" class="tel">1600-0000</a>으로 문의하시기 바랍니다.</p>
                            
                        </div>
                        <!--//footer-->
                    </div>
                    <!--inner-box-->
                </div>
            </div>
        </div>
        <!-- //.container -->
    </main>
</body>
</html>
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
	
    $("input[name='Id']").blur(function() {
        checkId();
    });

  
    $("input[name='email']").blur(function() {
    	console.log($("input[name='email']").val());
    	checkEmail();
    });
    
	
    $("input[name='pno']").blur(function() {
        checkPno();
    });
    
    $("#findPwdBtn").click(function() {
    	console.log($("input[name='email']").val());
		findPwd();
	});
    
  //휴대폰 번호 "-" 자동 추가 함수
	$(document).on("keyup", "#pno", function() { 
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	});
    
});

function checkId() {
	var id = $("input[name='Id']").val();
    var alertSpan = $("#alert span");
    $("#divId").addClass('failed');
    var v_num  = 0;
    var v_spe  = 0;
    var pattern1 = /\s{2,}/g; //2021.07.23 KJH 공백 1개만 허용

    if (isEmpty(id)) {
        isValidId = false;
        $("#alertEmail").show();
        alertSpan.text("아이디를 입력해 주세요.");
        return;
    } else if (pattern1.test(id)){
    	isValidId = false;
        $("#alert").show();
        alertSpan.text("공백은 연속해서 입력할 수 없습니다.");
        return;
    } else if (id[0] == " " || id[0] == "\t") {
    	isValidId = false;
        $("#alert").show();
        alertSpan.text("아이디를 공백으로 시작할 수 없습니다.").show();
        return;
    } else if (id[id.length-1] == " " || id[id.length-1] == "\t") {
    	isValidId = false;
        $("#alert").show();
        alertSpan.text("아이디를 공백으로 끝날 수 없습니다.").show();
        return;
    } else {
    	isValidId = true;
        $("#divId").removeClass('failed');
        $("#alert").hide();
    }
}

function checkPno() {
	var pno = $("input[name='pno']").val();
    var alertSpan = $("#alert span");
    $("#divPno").addClass('failed');
    var v_num  = 0;
    var v_spe  = 0;
    var pattern1 = /\s{2,}/g; //2021.07.23 KJH 공백 1개만 허용

    if (isEmpty(pno)) {
        isValidPno = false;
        $("#alert").show();
        alertSpan.text("전화번호를 입력해 주세요.");
        return;
    } else if (pattern1.test(pno)){
    	isValidPno = false;
        $("#alert").show();
        alertSpan.text("공백은 연속해서 입력할 수 없습니다.");
        return;
    } else if (pno[0] == " " || pno[0] == "\t") {
    	isValidPno = false;
        $("#alert").show();
        alertSpan.text("전화번호를 공백으로 시작할 수 없습니다.").show();
        return;
    } else if (pno[pno.length-1] == " " || pno[pno.length-1] == "\t") {
    	isValidPno = false;
        $("#alert").show();
        alertSpan.text("전화번호를 공백으로 끝날 수 없습니다.").show();
        return;
    } else {
    	isValidPno = true;
        $("#divPno").removeClass('failed');
        $("#alert").hide();
    }
}
function checkEmail() {
    var divChk      = $("#divEmail");
    var alertSpan = $("#alert span");
    var email = $("input[name='email']").val();
    if(email == "" || email == null)
    	email = $("#email").val();
    var pattern = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zsA-Z_-]+){1,2}$/;
    divChk.addClass('failed');
    if (isEmpty(email)) {
        isValidEmail = false;
        alertSpan.text("이메일을 입력해 주세요.");
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
                return;
            } else {
                isValidEmail = false;
                alertSpan.text("이메일 형식이 틀렸습니다. 다시 확인하고 입력해 주세요.").show();
                return;
            }
        } else {
            if(!chkStrEmail(email)) { // 공백 체크
                isValidEmail = false;
                alertSpan.text("이메일에 공백은 지원하지 않습니다. 다시 입력해주세요.").show();
                return;
            }
           
            else {
            	isValidEmail = true;
            }
        }               
        
    }
    // 이메일 유효성 체크
    if (!isValidEmail) {
        $("#alert").show();
        return;
    }
    else
    {
        isValidEmail = true;
        divChk.removeClass('failed');
        $("#alert").hide();
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

/**
* 로그인 
*/

function findPwd(){
	$.ajax({
		url : "./findPwd",
		type :  "POST",
		dataType : "json",
		data : {
			id : $("input[name='Id']").val(),
			email : $("input[name='email']").val(),
			pno : $("input[name='pno']").val()
		},
		beforeSend : function(xhr)
		{
			//이거 안하면 403 error
			//데이터를 전송하기 전에 헤더에 csrf값을 설정한다
			var $token = $("#token");
			xhr.setRequestHeader($token.data("token-name"), $token.val());
		},
		success : function(response){
			if(response == "1"){
				// 정상 처리 된 경우	
				window.location.href = "/modifyPwd";
			} else {
				alert("해당하는 회원정보가 없습니다.");
			}
		},
		error : function(a,b,c){
			console.log(a,b,c);
		}
		
	})
}
</script>
</head>
<body>
<main class="cmain main" role="main" id="mainContents">
<input type="hidden" id="token" data-token-name="${_csrf.headerName}" placeholder="Password" value="${_csrf.token}">
       <div class="container">
           <div class="cbody gird-full">
               <div class="contents w520">
                   <div class="inner-box">
                       <!--tit-wrap-->
                       <dl class="tit-wrap">
                                   <dt class="title24">비밀번호 찾기</dt>
                                   <dd>본인확인 후 비밀번호를 다시 설정할 수 있습니다.</dd>
                       </dl>
					<!-- main box -->
						
                        <div class="accparent" id = "firstMain">
                            <div class="accordion-panel selected" aria-label="아이디 또는 이메일 아이디 입력">
                                <!--inputbox fail일 경우 class="failed" 붙여줘야함-->
                                <div class="inputbox" id="divId">
                                    <label class="inplabel"><input type="text" id="Id" name="Id" placeholder="아이디 입력"  maxlength=30></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
								<div class="inputbox" id="divEmail">
                                        <label class="inplabel"><input type="text" id="email" name="email" placeholder="이메일 입력"></label>
                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
								<div class="inputbox" id="divPno">
                                        <label class="inplabel"><input type="text" id="pno" name="pno" placeholder="핸드폰 입력"></label>
                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <!-- fail일 경우 메세지 출력 alertEmailName alertEmail 합침-->
                                    <p class="failed-msg" id="alert" style="display:none;">
                                        <i class="icon error"></i>
                                        <span></span>
                                    </p>
                                <button class="btn btn-default medium" id="findPwdBtn" type="submit"><span>확 인</span></button>
                            </div>
                        </div>
                       <!-- //main box -->
                       
                       <!-- footer -->
                       <div class="acc-footinfo">
                           <p class="text-msg">아이디/패스워드 찾기가 안될 경우,</p>
                           <p class="text-msg">고객센터 <a href="tel:1600-0000" class="tel">1600-0000</a>으로 문의해주세요.</p>
                           <div class="linkwrap">
                               <span class="txt">아이디를 찾으시나요?</span>
                               <a href="./findIdNameEmail" class="alink"><span>아이디 찾기</span></a>
                           </div>
                       </div>
                       <!-- //footer -->
                   </div>
                   <!--inner-box-->
               </div>
           </div>
       </div>
       <!-- //.container -->
   </main>
</body>
</html>
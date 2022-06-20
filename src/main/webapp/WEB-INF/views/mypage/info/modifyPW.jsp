<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
<script type="text/javascript" src="${app}/resources/js/init.js"></script>
<script type="text/javascript" src="${app}/resources/js/validation.js"></script>
<script>
let opwCheck = false;
let npwCheck = false;

jQuery(function($) {
    //enter 클릭시 submit 방지
    $(window).keydown(function(event){
        if(event.keyCode == 13){
            event.preventDefault();
            return false;
        }
    });
    

    $("#oldpw").blur(function() {
    	var datas = { 'userid' : $("input[name=userid]").val(),
    			'oldpw' : $("#oldpw").val() };
    	console.table(datas);
    	$.ajax({
    		url : '${app}/mypage/chkPW',
    		type :  "POST",
    		contentType : "application/json",
    		data : JSON.stringify(datas),
    		beforeSend : function(xhr) {
    			xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
    		},
    		success : function() {
    			$("#divOldPw").removeClass("failed");
        		$("#alert").hide();
        		opwCheck = true;
    		},
    		error : function(error) {
    			$("#divOldPw").addClass("failed");
    			if (error == 'noString')
        			$("#alert").text("기존 비밀번호를 입력해주세요.").show();
    			else
    				$("#alert").text("비밀번호가 일치하지 않습니다.").show();
    			opwCheck = false;
    		}
    	})
    });
    
    /* 패스워드 검사 (일치검사까지 한번에 함) */
    $("#newpw, #newpwchk").blur(function(){
    	hdgm.validation.preparePasswordValidation($("input[name=userid]").val(), $("#newpw").val(), $("#newpwchk").val());
    	if(!hdgm.validation.isValidPasswordJustOnefield()) {

    		$("#alert").text(hdgm.validation.getMessage()).show();
    		if(!hdgm.validation.getValidFlag())
    		{
    			$("#divNewPw").addClass("failed");
    			npwCheck = false;
    			return ;
    		}
    	} else {
    		$("#divNewPw").removeClass("failed");
    		$("#alert").hide();
    	}
    	
    	if(hdgm.validation.isValidPasswordJustOnefield() && hdgm.validation.getNewPassword() != hdgm.validation.getConfirmPassword()){
			$("#divNewPwChk").addClass("failed");
    		$("#alert").text("동일한 값을 입력해주시기 바랍니다.").show();
    		npwCheck = false;
    		return ;
    	} else if(hdgm.validation.isValidPasswordJustOnefield() && hdgm.validation.getNewPassword() == hdgm.validation.getConfirmPassword()){
    		$("#divNewPwChk").removeClass("failed");
    		$("#alert").hide();
    		npwCheck = true;
    	}
    });
    
    $("#chgPwdBtn").click(function() {
    	if (opwCheck && npwCheck)
    		chgPwd();
	});
    
});

function checkNewPwSame() {
	var newpw = $("input[name='newpw']").val();
	var newpwchk = $("input[name='newpwchk']").val();

    var alertSpan = $("#alert span");
    $("#divNewPwChk").addClass('failed');
    var v_num  = 0;
    var v_spe  = 0;
    var pattern1 = /\s{2,}/g; //2021.07.23 KJH 공백 1개만 허용

    if (isEmpty(newpwchk)) {
    	isValidNewPW = false;
        $("#alert").show();
        alertSpan.text("새로운 비밀번호를 한 번 더 입력해주세요.");
        return;
    } else if (newpw != newpwchk) {
    	isValidNewPW = false;
        $("#alert").show();
        alertSpan.text("새로운 비밀번호와 동일하게 입력해주세요.").show();
        return;
    } else {
    	isValidNewPW = true;
        $("#divNewPwChk").removeClass('failed');
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


/**
* 로그인 
*/

function chgPwd() {
	$.ajax({
		url : "${app}/mypage/chngPW",
		type :  "POST",
		contentType : "application/json",
		data : JSON.stringify({
			'userid' : $("input[name=userid]").val(),
			'oldpw' : $("#oldpw").val(),
			'newpw' : $("#newpw").val()
		}),
		beforeSend : function(xhr)
		{
			xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
		},
		success : function(response){
			alert('비밀번호가 성공적으로 변경되었습니다.');
			$("#logoutForm").submit();
		},
		error : function(error){
			alert('비밀번호 변경에 실패하였습니다.');
			location.reload();
		}
		
	})
}

//비밀번호 체크
function validPwChk() {
	if($("input[name=userid]").length > 0) {
		hdgm.validation.preparePasswordValidation($("input[name=userid]").val(), $("#newpw").val(), $("#newpwchk").val());
		if(!hdgm.validation.isValidPasswordJustOnefield()) {
	
			$("#pwdCheckMsg1").text(hdgm.validation.getMessage()).show();
			
			if( !hdgm.validation.getValidFlag())
			{
				if(bCheck)
				{
					$("#newpw").focus();
					$("#newpw").addClass("failed");
				}
				bCheck = false;
			}
		} 
		
		if( hdgm.validation.getNewPassword() != hdgm.validation.getConfirmPassword()){
			$("#pwdCheckMsg2").text("동일한 값을 입력해주시기 바랍니다.").show();
			
			if(bCheck)
			{
				$("#newpwchk").focus();
				$("#newpwchk").addClass("failed");
			}
			bCheck = false;
		}
	}
}

</script>
</head>
<body>
               <div class="contents w520">
                   <div class="inner-box">
                       <!--tit-wrap-->
                       <dl class="tit-wrap">
                                   <dt class="title24">비밀번호 변경</dt>
                                   <dd>기존 비밀번호와 변경할 비밀번호를 입력해주세요.</dd>
                       </dl>
					<!-- main box -->
						
                        <div class="accparent" id = "firstMain">
                        <sec:authentication property="principal" var="prc"/>
                        <input type="hidden" name="userid" value="${prc.username}">
                            <div class="accordion-panel selected" aria-label="비밀번호 변경 입력란">
                                <%--inputbox fail일 경우 class="failed" 붙여줘야함--%>
                                <div class="inputbox" id="divOldPw">
                                    <label class="inplabel"><input type="password" id="oldpw" name="oldpw" placeholder="기존 비밀번호"  maxlength=30></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
								<div class="inputbox" id="divNewPw">
                                        <label class="inplabel"><input type="password" id="newpw" name="newpw" placeholder="새 비밀번호"></label>
                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
								<div class="inputbox" id="divNewPwChk">
                                        <label class="inplabel"><input type="password" id="newpwchk" name="newpwchk" placeholder="새 비밀번호 확인"></label>
                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <%-- fail일 경우 메세지 출력 alertEmailName alertEmail 합침--%>
                                    <p class="failed-msg" id="alert" style="display:none;">
                                        <i class="icon error"></i>
                                        <span></span>
                                    </p>
                                <button class="btn btn-default medium" id="chgPwdBtn" type="submit"><span>확 인</span></button>
                            </div>
                        </div>
                       <!-- //main box -->
                   </div>
                   <!--inner-box-->
               </div>
           </div>
       </div>
       <!-- //.container -->
   </main>
</body>
</html>
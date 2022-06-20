<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
jQuery(function($) {
	
	var msg = '${msg}';
    if(msg === '비밀번호를 다시 확인해 주세요.') {
        alert("비밀번호를 다시 확인해 주세요.");
    }
    
	$(".mypage-order-wrap").attr("class", "mypage-info-wrap");

    $("input[name='pwd']").focus();

    $("form[name='checkPasswordForm']").submit(function() {
        var pwd = $("input[name='pwd']").val();

        if (isEmpty(pwd)) {
        	$("div#divPassword").addClass("failed");
        	$("i#alterPasswordIcon").addClass("error");
        	$("span#alterPassword").text("비밀번호를 입력해 주세요.").show();
            //alert("비밀번호를 입력해 주세요.");
            $("input[name='pwd']").focus();
            return false;
        }
    });
    
    
});

function checkPassword() {
    $("form[name='checkPasswordForm']").submit();
}

function naverReLogin(){
    var returnURL = "/p/mpd/changeMemberInfoForm.do";
    var redirect_uri ='https://www.hmall.com';

    var gnbLoginYn = "Y";
    redirect_uri += '/p/cob/naverLoginChk.do?formType=myPageSnsChk&gnbLoginYn=' + gnbLoginYn + '&returnUrl=' + returnURL;

    var url = "/p/cob/naverLogin.do?redirect_uri=" + encodeURIComponent(redirect_uri);
    var popName = "NaverLogin";
    var popOption = "height=760, width=795, fullscreen=no, location=no, scrollbars=no, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no, top=0, left=0, status=no";        
    window.open(url, popName, popOption);
}

function kakaoReLogin(){
    var returnURL = "/p/mpd/changeMemberInfoForm.do";
    var redirect_uri ='https://www.hmall.com';

    var gnbLoginYn = "Y";
    redirect_uri += '/p/kakaoLoginChk.do';

    var url = "/p/cob/kakaoLogin.do?redirect_uri=" + encodeURIComponent(redirect_uri)+ "&return_url="+encodeURIComponent(returnURL)+"&gnbLoginYn="+ gnbLoginYn+"&formType=myPageSnsChk";
    var popName = "kakaoLogin";
    var popOption = "height=660, width=795, fullscreen=no, location=no, scrollbars=no, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no, top=0, left=0, status=no";
    window.open(url, popName, popOption);

}    
</script>
</head>
	                        <h3 class="title22">비밀번호 재확인</h3>
	                        <div class="border-gray-box">
	                            <div class="confirm-box">
	                                <p class="ctypo17">고객님의 소중한 개인정보를 보호하기 위해 <br>비밀번호를 다시 한번 확인합니다.</p>
	                                <div class="bg-gray-box center">
                                        
                                            
                                            
	                                            
		                                                <sec:authentication property="principal" var="prc"/>
		                                                <c:set value="${prc.username}" var="userid" />
			                                            <p class="title22">${fn:substring(userid,0,4)}
			                                            	<c:forEach begin="5" end="${fn:length(userid)}" step="1">
													        *
													    	</c:forEach>
			                                            </p>
		                                            
		                                            
	                                            
                                            
                                        
	                                </div>
	
	                                <div class="form-wrap">
	                                	<form name="checkPasswordForm" method="post" action="./prevModify">
	                                		<sec:csrfInput />
		                                    <div class="inputbox" id="divPassword"><!-- 실패시 class="failed" 추가 -->
		                                        <label class="inplabel icon-lock"><input type="password" id="pwd1063" name="pwd" maxlength="30" value="" placeholder="비밀번호 (6자리 이상)"></label>
		                                        <button class="btn ico-clearabled" ><i class="icon"></i><span class="hiding">지우기</span></button>
		                                    </div>		                                    
		                                    <input type="hidden" name="formType" id="formType"/>
		                                    <input type="hidden" name="snsType" id="snsType"/>
		                                    
		                                    <p class="failed-msg"> <!-- 실패시 노출 -->
		                                        <i class="icon" id="alterPasswordIcon"></i>
		                                        <span id="alterPassword"></span>
		                                    </p>
	                                    </form>
	                                </div>
	
	                                <div class="btngroup">
	                                    <button class="btn btn-default medium" onclick="checkPassword();"><span>확인</span></button>
	                                </div>
	
					                
                	                
                	                
	                            </div> <!-- //.confirm-box -->
	                        </div> <!-- //.border-gray-box -->
	                    </div> <!-- //.mypage-info-wrap -->
	                </div> <!-- //.contents -->    
	            </div>
	        </div> <!-- //.container -->
	    </main> <!-- //.cmain -->
</html>
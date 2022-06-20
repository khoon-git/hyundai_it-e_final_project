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

</script>
</head>
<body>
				<sec:authentication property="principal" var="principal_user" />
			   	<c:if test="${principal_user != 'anonymousUser' }">
			    	<sec:authentication property="principal.user.user_id" var="principal_user_id" />
			   	</c:if>
			   <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	           <div class="mypage-info-wrap"> 
	               <h3 class="title22">회원탈퇴</h3>
	               <div class="bg-gray-box">
	                   <p class="ctypo15">그동안 현대Hmall을 이용해주셔서 감사합니다. 현대Hmall을 이용하시면서 불만족스러웠던 점을 지적해주시면 <br><span class="color-ff5340">서비스 개선</span>에 참고하겠습니다.</p>
	               </div>
	
	               <p class="ctypo17 bold">회원탈퇴 확인사항</p>
	               <p class="ctypo15">현대Hmall 회원탈퇴 시 확인하셔야 할 사항을 반드시 체크하시기 바랍니다.</p>
	               <div class="border-gray-box">
	                   <ol class="num-list">
	                       <li>
	                           <span class="tit">재가입하셔도 개인정보가 복원되지 않습니다.</span>
	                           <span class="txt">현대Hmall에 가지고 계신 적립금, 쿠폰 등의 혜택이 모두 삭제되며 재가입하여도 복원되지 않습니다.</span>
	                       </li>
	                       <li>
	                           <span class="tit">아이디를 재사용할 수 없습니다.</span>
	                           <span class="txt">기존에 사용하셨던 아이디는 재가입 시 사용할 수 없습니다.</span>
	                       </li>
	                       <li>
	                           <span class="tit">일부 정보는 법정 보유기간동안 보유됩니다.</span>
	                           <span class="txt">전자상거래 등에서의 소비자보호에 관한 법률 등 관련법령의 규정에 의하여 일부 정보는 일정 기간동안 보유합니다. 자세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.</span>
	                       </li>
	                   </ol>
	               </div>
	
	               <p class="ctypo17 bold">회원 설문조사</p>
	               <p class="ctypo15">현대Hmall을 이용하시면서 어떤 점이 불편하셨나요? <span class="color-ff5340">(1개 항목만 선택해 주세요.)</span></p>
	               <div class="border-gray-box">
	                   <div class="radio-list">
	                       <label class="radlabel sm">
	                           <input type="radio" id="questionnaire1" name="rad1" checked="" value="상품 다양성/가격/품질 불만">
	                           <i class="icon"></i>
	                           <span>상품 다양성/가격/품질 불만</span>
	                       </label>
	                       <label class="radlabel sm">
	                           <input type="radio" id="questionnaire2" name="rad1" value="시스템 에러/속도 등 불만">
	                           <i class="icon"></i>
	                           <span>시스템 에러/속도 등 불만</span>
	                       </label>
	                       <label class="radlabel sm">
	                           <input type="radio" id="questionnaire3" name="rad1" value="상품 선택, 주문 등 사용이 어려움">
	                           <i class="icon"></i>
	                           <span>상품 선택, 주문 등 사용이 어려움</span>
	                       </label>
	                       <label class="radlabel sm">
	                           <input type="radio" id="questionnaire4" name="rad1" value="개인정보 유출 우려">
	                           <i class="icon"></i>
	                           <span>개인정보 유출 우려</span>
	                       </label>
	                       <label class="radlabel sm">
	                           <input type="radio" id="questionnaire5" name="rad1" value="회원 특혜/쇼핑 혜택 부족">
	                           <i class="icon"></i>
	                           <span>회원 특혜/쇼핑 혜택 부족</span>
	                       </label>
	                       <label class="radlabel sm">
	                           <input type="radio" id="questionnaire6" name="rad1" value="현대Hmall을 자주 사용하지 않음">
	                           <i class="icon"></i>
	                           <span>현대Hmall을 자주 사용하지 않음</span>
	                       </label>
	                       <label class="radlabel sm">
	                           <input type="radio" id="questionnaire7" name="rad1" value="주문취소/반품/교환/AS 불만">
	                           <i class="icon"></i>
	                           <span>주문취소/반품/교환/AS 불만</span>
	                       </label>
	                       <label class="radlabel sm">
	                           <input type="radio" id="questionnaire8" name="rad1" value="배송서비스 불만">
	                           <i class="icon"></i>
	                           <span>배송서비스 불만</span>
	                       </label>
	                   </div>
	                   <div class="textareabox">
	                       <label class="txtlabel">
	                           <textarea id="leaveUserRsnMemo" cols="48" rows="7" placeholder="위의 항목 이외에 기타 불만사항이나 의견이 있으시면 기재 해주세요." aria-placeholder="위의 항목 이외에 기타 불만사항이나 의견이 있으시면 기재 해주세요."></textarea>
	                       </label>
	                       <span class="txtcount"><em id="textByte">0</em><b>1000</b></span>
	                   </div>
	                   <ul class="dotlist">
	                       <li>진행 중인 주문, 교환, 반품, A/S가 있을 시 탈퇴가 불가능합니다. 해당사항 진행 완료 후 탈퇴를 하실 수 있습니다.</li>
	                   </ul>
	               </div>
	
	               <div class="btngroup w_510">
	                   <button class="btn btn-linelgray medium" onclick="goMypage();"><span>취소</span></button>
	                   <button class="btn btn-default medium" onclick="leaveUser();"><span>회원탈퇴</span></button>
	               </div>
	           </div>

           </div>
       </div>
       <!-- //.container -->
   </main>
</body>

<script type="text/javascript">
	
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	jQuery(function($) {
		
		// 취소사유 1000글자 제한
	    $("#leaveUserRsnMemo").keyup(function(){
	        limitBytes("leaveUserRsnMemo", 1000);
	        var cnt = fGetByteLength($("#leaveUserRsnMemo").get(0));
	
	        $("#textByte").text(cnt);
	    });
	
	});
	
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
	
	
	function leaveUser() {
		var isDelete = confirm("회원 탈퇴하시겠습니까?");
    	if (isDelete == false) {
    		return ;
    	}
		
		$.ajax({
			type:"post",
			url:"${app}/mypage/leaveUser",
			data : JSON.stringify({
				"user_id" : '${principal_user_id}',
				"leaveUserRsn" : $('input[name=rad1]:checked').val(),
		        "leaveUserRsnMemo" : $("#leaveUserRsnMemo").val()
			}),
			contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				alert("회원탈퇴가 완료되었습니다.");
				location.href = '${app}';
			},
			error : function(error) {
				alert(error.responseText);
			}
			
		});
		
		
	}
	
	function goMypage() {
		location.href = "./mymain";
	}
</script>

</html>
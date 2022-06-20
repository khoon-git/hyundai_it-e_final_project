<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 스프링 시큐리티 관련 태그 라이브러리 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/mp/mypage.css">
<script type="text/javascript">
$(".saveCnclConfirm").hide();
function multiDlvItemMinus(obj) {
    
	var input = $(obj).next().next().find("input[name='partCnclCnts']");
    var cnclQty = Number($(input).val());
    isChkSaveCnclQty = false;
    $(".saveCnclConfirm").hide();
    if(cnclQty == 0) {
        return;
    }

    $(input).val(cnclQty - 1);
    
    var parentTrObj = $(obj).parents("li");
    
    var index = parentTrObj.index();
    var chk = $("input:checkbox[name=ordChk]", parentTrObj);
    var cnclcnt = $("input[name=partCnclCnts]", parentTrObj).val(); 
    var rmndQty = $("input[name=rmndQtys]", parentTrObj).val();
    
    if (Number(cnclcnt) > 0) {
        chk.prop("checked",true);
        $("#ordInfoTbody li.textform").show();
        if(Number(cnclcnt) > Number(rmndQty)){
            alert("취소 수량(" + rmndQty + "개)을 초과하였습니다.");
            $("input[name=partCnclCnts]", parentTrObj).val(rmndQty);
            $("input[name=partCnclCnts]", parentTrObj).focus();
        }
    } else {
        chk.prop("checked",false);
        
        var chkCnt = 0;
        $("input[name=ordChk]").each(function(index) {
            if ( $("input[name=ordChk]").eq(index).prop('checked') ) {
                chkCnt++;
            }
        });
        
        if(chkCnt == 0) {
        	$("#ordInfoTbody li.textform").hide();
        	$(".reason-area").hide();
        }
    }
    
}

function multiDlvItemPlus(obj, limitCnt) {
    
	/*  var input = "";
    if(count==0){
        input = $(obj).siblings("input[name='partCnclCnts']").val(0);
        count++;
    }  */
    
    var input = $(obj).prev().find("input[name='partCnclCnts']");
    var cnclQty = Number($(input).val());
    isChkSaveCnclQty = false;
    $(".saveCnclConfirm").hide();
    if(cnclQty >= limitCnt) {
        alert("취소 수량(" + limitCnt + "개)을 초과하였습니다.");
        return;
    }

    $(input).val(cnclQty + 1);//수량증가        
    
    var parentTrObj = $(obj).parents("li");
    var index = parentTrObj.index();
    var chk = $("input:checkbox[name=ordChk]", parentTrObj);
    var cnclcnt = $("input[name=partCnclCnts]", parentTrObj).val(); 
    var rmndQty = $("input[name=rmndQtys]", parentTrObj).val();
    
    if (Number(cnclcnt) > 0) {
        chk.prop("checked",true);
        $("#ordInfoTbody li.textform").show();
        $(".reason-area").show();
        if(Number(cnclcnt) > Number(rmndQty)){
            alert("취소 수량(" + rmndQty + "개)을 초과하였습니다.");
            $("input[name=partCnclCnts]", parentTrObj).val(rmndQty);
            $("input[name=partCnclCnts]", parentTrObj).focus();
        }
    } else {
        chk.prop("checked",false);
        
        var chkCnt = 0;
        $("input[name=ordChk]").each(function(index) {
            if ( $("input[name=ordChk]").eq(index).prop('checked') ) {
                chkCnt++;
            }
        });
        
        if(chkCnt == 0) $("#ordInfoTbody li.textform").hide();
    }
    
}

function onkeydownOnlyNumInput(evnt) {
    var code = (window.event) ? event.keyCode : evnt.which;

    if(!((code >=48 && code <= 57) || (code >= 96 && code <= 105) || (code == 46) || (code == 8) || (code == 9))) {
        nAllow(evnt);
    }
}

function removeZero(obj){
    $(".saveCnclConfirm").hide();
    var number = $(obj).val();
    number = Number(number);
    $(obj).val(number);
}

function chkconfirm(){
    $(".saveCnclConfirm").hide();
}

$(document).ready(function () {
	$("#cancelconfirm").click(function() {
		if ($("#orderCancelCheck").val() === '') {
			alert("취소 사유를 선택해주세요.");
			return;
		} else {
			$(".saveCnclConfirm").show();
		}
		
		var cancelCount = $("input[name=partCnclCnts]").val(); // 취소 갯수
		console.log(cancelCount);
		var orderedCount = $("input[name=ordQty]").val(); // 주문 갯수
		console.log(orderedCount);
		var totalPrice = $("input[name=totalPrice]").val(); // 전체 주문 결제 금액
		console.log(totalPrice);

		var discountPrice = $("input[name=disPrice]").val(); // 전체 주문 할인 금액(쿠폰 할인 금액)
		console.log(discountPrice);

		var pmtPrice = $("input[name=pmtPrice]").val(); // 전체 주문 결제 금액
		console.log(pmtPrice);

		var resvDiscPrice = $("input[name=resvDiscPrice]").val(); // 전체 주문 포인트 사용 금액
		console.log(resvDiscPrice);

		var balDiscPrice = $("input[name=balDiscPrice]").val(); // 전체 주문 예치금 사용 금액
		console.log(balDiscPrice);
		
		var prdPrice = '${odDTO.prd_price}'; // 상품 1개당 가격 
		console.log(prdPrice);
		
		var cpnDiscPrice = '${oDTO.coupon_discount_amount}' // 전체 주문 쿠폰 할인 금액
		var oneProdPercentPrice = prdPrice / totalPrice; // 전체 주문 결제 금액 대비 상품 1개당 %
		var cancelCountProdPercentPrice = oneProdPercentPrice * cancelCount; // 전체 주문 결제 금액 대비 취소할 금액 %
		var returnCash = pmtPrice * cancelCountProdPercentPrice; // 환불할 현금
		var returnPoint = resvDiscPrice * cancelCountProdPercentPrice; // 환불할 포인트
		var returnCpn = cpnDiscPrice * cancelCountProdPercentPrice; // 환불할 쿠폰금액(실제 환불 X)
		var returnBal = balDiscPrice * cancelCountProdPercentPrice; // 환불할 예치금 금액
		var returnPrice = (totalPrice - discountPrice) * cancelCountProdPercentPrice; // 취소예정금액
		
		// 동적 tag생성
		$("#orgStlmAmt").html(AddComma(totalPrice - discountPrice)); // 결제금액 정보 -> 결제금액
		if (discountPrice != 0) { // 할인금액(쿠폰 사용금액)이 있을 경우
			$("#orgDisc").show();
			$("#orgDisc").children('dd').find('strong').html('- ' + AddComma(discountPrice)); // 결제금액 정보 -> 쿠폰/할인	
		}
		
		var originOnePrice = Math.floor(totalPrice / orderedCount); <%-- 개당 원 주문 금액 --%>
		if ('${oDTO.pay_method}' == 'card') {
			$("#pchsMthd").children('dt').html("카드");
		} else if ('${oDTO.pay_method}' == 'vbank') {
			$("#pchsMthd").children('dt').html("현금");
		}
		$("#pchsMthd").children('dd').find('strong').html(AddComma(pmtPrice));

		if (resvDiscPrice != 0) {
			$("#pchsPoint").show();
			$("#pchsPoint").children('dd').find('strong').html(AddComma(resvDiscPrice));
		}
		if (balDiscPrice != 0) {
			$("#pchsBal").show();
			$("#pchsBal").children('dd').find('strong').html(AddComma(balDiscPrice));
		}
		$("#schdCnclAmt").html(AddComma(Math.floor(returnPrice))); <%-- 취소예정금액 --%>
		$("#stlmOrdAmt").html(AddComma(Math.floor(returnPrice))); <%-- 주문금액 --%>
		<%-- var lestPayment = prdPrice * orderedCount - discount - pmtAmount; --%>
		$("#rmndStlmAmt").html(AddComma(totalPrice - discountPrice - Math.floor(returnPrice))); <%-- 잔여 결제 금액 --%>
		/* originOnePrice * cancelCount */
		$("#stlmRepyPossAmt").html(AddComma(totalPrice - prdPrice * cancelCount)); <%-- 잔여 결제 금액 -> 주문금액 --%>
		$("#stlmRepyDiscAmt").html('(-) ' + AddComma(Math.floor(discountPrice / orderedCount * (orderedCount - cancelCount)))); <%-- 잔여 결제 금액 -> 쿠폰/할인 --%>//

		// 환불금액 정보
		// 취소금액
		$("#dtlCnclAmt").html(AddComma(Math.floor(returnPrice)));
		
		$("#dtlOrgOrdAmt").html(AddComma(Math.floor(originOnePrice * cancelCount))); <%-- 취소금액 -> 원 주문금액 --%>
		// 쿠폰/할인
		if (cpnDiscPrice != 0) {
			$("#dtlCpDcAmt").html('(-) ' + AddComma(Math.floor(returnCpn)));
		}
		
		// 환불 예정 금액
		$("#dtlRepySchdAmt").html(AddComma(Math.floor(returnPrice)));
	
		//결제수단별 환불 금액
		if ('${oDTO.pay_method}' == 'card') {
			$("#stlmPayWayGbcd_0").html("카드");
		} else if ('${oDTO.pay_method}' == 'vbank') {
			$("#stlmPayWayGbcd_0").html("현금");
		}
		$("#stlmRtpAmt_0").html(AddComma(Math.floor(returnCash)));
		
		if (resvDiscPrice != 0) { // 포인트 결제 내역이 있을 경우
			$("#rfndPt").show();
			$("#stlmRtpAmt_1").html(AddComma(Math.floor(returnPoint)));
		}
		
		if (balDiscPrice != 0) { // 예치금 결제 내역이 있을 경우
			$("#rfndBal").show();
			$("#stlmRtpAmt_2").html(AddComma(Math.floor(returnBal)));
		}
		
		// hidden tag 값 변경
		$('input[name=updtTotal]').val(totalPrice - prdPrice * cancelCount);
		$('input[name=updtDis]').val(discountPrice - Math.floor(returnCpn));
		$('input[name=updtPmt]').val($('input[name=updtTotal]').val() - $('input[name=updtDis]').val());
		$('input[name=updtRDA]').val(resvDiscPrice - Math.floor(returnPoint));
		$('input[name=updtCDA]').val(cpnDiscPrice - Math.floor(returnCpn));		
		$('input[name=updtPC]').val(orderedCount - cancelCount);
		$("input[name=updtBDA]").val(balDiscPrice - Math.floor(returnBal));
		if ($('input[name=updtPC]').val() == 0) {
			$('input[name=updtFlag]').val('CSTEP');
		} else {
			$('input[name=updtFlag]').val('');
		}
	});
	
/* 	 $("#insertOrdCncl").click(function() {
	 }); */
});

function AddComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

function insertOrdCncl() {
	if (!document.getElementById('lblOrdCnclOrg').children[0].checked) {
		alert('취소 및 환불 규정에 동의해주세요.');
		return;
	}
	
	var updtTotal = document.getElementsByName('updtTotal')[0].value;
	console.log("updtTotal : " + updtTotal);
	var updtDis = document.getElementsByName('updtDis')[0].value;
	var updtPmt = document.getElementsByName('updtPmt')[0].value;
	var updtRDA = document.getElementsByName('updtRDA')[0].value;
	var updtCDA = document.getElementsByName('updtCDA')[0].value;
	var updtPC = document.getElementsByName('updtPC')[0].value;
	var updtFlag = document.getElementsByName('updtFlag')[0].value;
	var orderId = '${orderNo}';
	var oDetailId = '${orderDetailNo}';
	var updtBDA = document.getElementsByName('updtBDA')[0].value;
	console.warn(oDetailId);
	var datas = { "updtTotal":updtTotal, "updtDis":updtDis, "updtPmt":updtPmt,
					"updtRDA":updtRDA, "updtCDA":updtCDA,
					"updtPC":updtPC, "updtFlag":updtFlag,
					"orderId":orderId, "oDetailId":${orderDetailNo}, "updtBDA" : updtBDA };
	console.table(datas);
	//온클릭시 호출
	$.ajax({
		type:"POST",  
        url:'${app}/mypage/oc',
        contentType:'application/json',
        data:JSON.stringify(datas),
        beforeSend:function(xhr){
        	xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
        },
        success:function(){
	        alert('주문 취소가 정상적으로 처리되었습니다.');
	        window.location.href = '${app}/mypage/mymain';
        },
        error:function(e){  
	        console.log(e.responseText);
	        alert('주문 취소가 실패하였습니다.');
	        location.reload();
        }
	});
}
</script>
</head>
                        <h3 class="title22">주문취소 <span class="num">${orderNo}</span></h3>
                        <div class="order-list">
                            <ul id="ordInfoTbody">
                                <li>
                                    <label class="chklabel">
                                        <input type="checkbox" name="allChk">
                                        <i class="icon"></i>
                                        <span>전체선택 <em class="num">1<!--1--></em></span>
                                    </label>
                                </li>
		                                <li class="chk-form"  class='topAsisClass' >
		                                
	                                        <input type="hidden" name="ordItemNm" value="${odDTO.prd_nm}" />
	                                        <input type="hidden" name="ordQty" value="${odDTO.prd_count}" />
	                                        <input type="hidden" name="totalPrice" value="${oDTO.total_amount}" />
	                                        <input type="hidden" name="disPrice" value="${oDTO.discount_amount}" />
	                                        <input type="hidden" name="pmtPrice" value="${oDTO.pmt_amount}" />
	                                        <input type="hidden" name="resvDiscPrice" value="${oDTO.reserve_discount_amount}" />
	                                        <input type="hidden" name="balDiscPrice" value="${oDTO.balance_discount_amount}" />
	                                        <input type="hidden" name="updtTotal" value="" />
	                                        <input type="hidden" name="updtDis" value="" />
	                                        <input type="hidden" name="updtPmt" value="" />
	                                        <input type="hidden" name="updtRDA" value="" />
	                                        <input type="hidden" name="updtCDA" value="" />
	                                        <input type="hidden" name="updtPC" value="" />
	                                        <input type="hidden" name="updtFlag" value="" />
	                                        <input type="hidden" name="updtBDA" value="" />
	                                        <input type="hidden" name="ordPtcSeq" value="1" />
	                                        
	                                        
	                                        
	                                        
	                                        <input type="hidden" name="rmndQty" value="1" />
	                                        <input type="hidden" name="sellUprc" value="2500" />
	                                        <input type="hidden" name="frstDcRate" value="0" />
	                                        <input type="hidden" name="rtpDlvCost" value="6000" />
	                                        <input type="hidden" name="lastAplyAmt" value="3000" />
	                                        <input type="hidden" name="addDlvCost" value="0" />
	                                        <input type="hidden" name="minStlmAmt" value="10000" />
	                                        <input type="hidden" name="slitmCd" value="2126575418" />
	                                        <input type="hidden" name="venCd" value="000210" />
	                                        <input type="hidden" name="venAdrSeq" value="17" />
	                                        <input type="hidden" name="gubunCd" value="A" />
	                                        <input type="hidden" name="basktGrpDivRnm" value="EMT" />
	                                        
	                                        
	                                        <!-- 재계산에 필요 파라미터세팅 -->
	                                        <input type="hidden" name="ordNos" value="20220526293164" />
	                                        <input type="hidden" name="ordPtcSeqs" value="1" />
	                                        <input type="hidden" name="slitmCds" value="2126575418" />
	                                        <input type="hidden" name="dlvcPayGbcds" value="10" />
	                                        <input type="hidden" name="dcAmts" value="0" />
	                                        <input type="hidden" name="payedYns" value="1" />
	                                        <input type="hidden" name="prpyDlvCosts" value="3000" />
	                                        <input type="hidden" name="minStlmAmts" value="10000" />
	                                        <input type="hidden" name="sellUprcs" value="2500" />
	                                        <input type="hidden" name="rmndQtys" value="${odDTO.prd_count}" />
	                                        <input type="hidden" name="acptQtys" value="1" />
	                                        <input type="hidden" name="partCnclYns" value="Y" />
	                                        <input type="hidden" name="imdtCnclPossYns" value="Y" />
	                                        <input type="hidden" name="gubunCds" value="A" />
	                                        <input type="hidden" name="venCds" value="000210" />
	                                        <input type="hidden" name="venAdrSeqs" value="0001" />
	                                        <input type="hidden" name="payedDlvCosts" value="3000" />
	                                        <input type="hidden" name="basktGrpDivRnms" value="EMT" />
	                                        <input type="hidden" name="lastOrdStatGbcdNm" value="결제완료" />
	                                        
	                                        <input type="hidden" name="ordGbcds" value="01" />
	                                        
	                                        <input type="hidden" name="ordItemNm" value="${odDTO.prd_nm}" />
	                                        
	                                        <input type="hidden" name="prpyDlvCost" value="3000" />
	                                        <input type="hidden" name="dlvCost" value="3000" />
	                                        <input type="hidden" name="addIrgnCost" value="0" />                     
		                                    <label class="chklabel"><!-- 체크박스 -------------------------- -->          
	                                                     <input type="checkbox" name="ordChk" id="ordChk" checked ="checked">          
			                                    <i class="icon"></i><span class="hiding">선택</span>
		                                    </label>
		                                    <a href="${app}/p/${odDTO.prd_board_id}" target="_blank">
		                                        <span class="img"><img src="${odDTO.upload_path}" alt="${odDTO.prd_nm}" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')"/></span>
		                                        <div class="box">
		                                            <span class="tit">${odDTO.prd_nm}</span>
		                                            <div class="info">
		                                                <ul>
		                                                    <li></li>
		                                                    <li>${odDTO.prd_count}개</li>
		                                                    <!-- >li></li -->
		                                                </ul>
		                                            </div>
		                                            <span class="price">
			                                            <strong>
			                                            	<fmt:formatNumber value="${odDTO.prd_price}" pattern="#,###"/>
	                                                    </strong>원
	                                                </span>
		                                        </div>
		                                    </a>
											 <!-- 상품품절 아닌 제품이 하나라도 존재했을때 체크 -->
		                                    <div class="count">
		                                        <span class="txt">취소수량</span>
		                                            <button type="button" class="btn btn-minus" aria-label="수량 감소" onclick="multiDlvItemMinus(this);return false;"><i class="icon btn-prev"></i><span class="hiding">감소</span></button>
		                                        <span id="maxRmndQty" style="display:none">1</span>
		                                        <div class="inputbox">
			                                        <label class="inplabel">
					                                	<input type="number" name="partCnclCnts" value="${odDTO.prd_count}" title="수량" onkeydown="onkeydownOnlyNumInput(event)" onchange="removeZero(this);" maxlength="4">
			                                        </label>
		                                        </div>
		                                            <button type="button" class="btn btn-plus" aria-label="수량 증가" onclick="multiDlvItemPlus(this, ${odDTO.prd_count});return false;"><i class="icon btn-next"></i><span class="hiding">증가</span></button>
		                                    </div>
		                                </li>
                        </div> <!-- //.order-list -->
		                        <!-- [12/17]_수정(위키 402 내용 - 취소,반품,교환 사유 부분 위치 조절로 마크업 구조 변경) -->
		                        <div class="reason-area"  >
		                            <h3 class="title22">취소사유</h3>
		                            <div class="textform">  
			                                <div class="custom-selectbox sm" data-modules-selectbox>
			                                    <select id="orderCancelCheck" onchange="chkconfirm();">
			                                        <option value=''>취소 사유를 선택해 주세요</option>
			                                        <option value='PC'>가격불만</option>
			                                        <option value='SP'>유사상품 구입</option>
			                                        <option value='IB'>충동구매</option>
			                                        <option value='UK'>상담원, 직원 불친절</option>
			                                    </select>
			                                </div>
		                                <div class="textareabox">
		                                    <label class="txtlabel">
		                                        <textarea id="viewPartCnclRsnDtls" cols="48" rows="7" placeholder="상세 사유를 입력해주세요" aria-placeholder="상세 사유를 입력해주세요"></textarea>
		                                    </label>
		                                </div>
		                                <!-- as-is, 기획에 없는 내용. 주석처리
		                                <div class="formarea">
		                                    <span class="ctypo17 bold">사용여부</span>
		                                    <label class="radlabel sm">
		                                        <input type="radio" name="rad1" checked>
		                                        <i class="icon"></i>
		                                        <span>사용전</span>
		                                    </label>
		                                    <label class="radlabel sm">
		                                        <input type="radio" name="rad1">
		                                        <i class="icon"></i>
		                                        <span>사용후</span>
		                                    </label>
		                                </div>
		                                 -->
		                                <input type="hidden" name="statusAddIrgnCost" value="0"/>
		                                <div class="confirm-area">
		                                    <span class="txt">취소할 상품의 수량을 확인하신 후 버튼을 눌러주세요.</span>
		                                    <button type="button" id="cancelconfirm" class="btn btn-default small30"><span>취소 정보반영</span></button>
		                                </div>
		                            </div>
		                        </div>
						<div class="saveCnclConfirm" style="display:none">
	                        <h3 class="title22">결제금액 정보</h3>
	                        <div class="pay-info-box type-toggle"> 
	                            <h3><button type="button" data-modules-collapse="" class="accordion-trigger" aria-expanded="false"><span>자세히보기</span><i class="icon updown"></i></button></h3>
	                            <div class="accordion-panel" role="region" aria-label="결제금액/취소예정금액/잔여결제금액">
	                                <ul>
	                                    <li>
	                                        <dl class="between top">
	                                            <dt>결제금액</dt>
	                                            <dd><strong id="orgStlmAmt"></strong>원</dd>
	                                        </dl>
	                                        <dl class="between">
	                                            <dt>원 주문금액</dt>
	                                            <input type="hidden" name="frstOrdAmt" id="frstOrdAmt" value="2500">
	                                            <dd><strong><fmt:formatNumber value="${odDTO.prd_price * odDTO.prd_count}" pattern="#,###"/></strong>원</dd>
	                                        </dl>
											<dl class="between" id="orgDisc" style="display: none">
							                 	<dt>쿠폰/할인</dt>
						                    	<dd><strong></strong>원</dd>
						                    </dl>
		                                        <div class="btm">
			                                        <dl class="between" id="pchsMthd">
										                <dt>카드</dt>
										                <dd><strong></strong>원</dd>
										            </dl>
			                                        <dl class="between" id="pchsPoint" style="display: none">
											            <dt>H.Point</dt>
											            <dd><strong></strong>P</dd>
											        </dl>
											        <dl class="between" id="pchsBal" style="display: none">
											            <dt>예치금</dt>
											            <dd><strong></strong>원</dd>
											        </dl>
		                                        </div>
	                                    </li>
	                                    <li>
	                                        <span class="minus-icon"><i class="icon"></i></span>
	                                        <dl class="between top">
	                                            <dt>취소예정금액</dt>
	                                            <dd><strong id="schdCnclAmt">0</strong>원</dd>
	                                        </dl>
	                                        <dl class="between">
	                                            <dt>주문금액</dt>
	                                            <dd><strong id="stlmOrdAmt">0</strong>원</dd>
	                                        </dl>
	                                    </li>
	                                    <li>
	                                        <span class="result-icon"><i class="icon"></i></span>
	                                        <dl class="between top">
	                                            <dt>잔여 결제 금액</dt>
	                                            <dd class="result"><strong id="rmndStlmAmt">5,500</strong>원</dd>
	                                        </dl>
	                                        <dl class="between" id="dtlAddIrgnDlvcAmtTr2">
	                                            <dt>주문금액</dt>
	                                            <dd><strong id="stlmRepyPossAmt">2,500</strong>원</dd>
	                                        </dl>
	                                        <dl class="between" id="dtlAddIrgnDlvcAmtTr3">
	                                            <dt>쿠폰/할인</dt>
	                                            <dd><strong id="stlmRepyDiscAmt">2,500</strong>원</dd>
	                                        </dl>
	                                    </li>
	                                </ul>
	                            </div>
	                        </div>
	
	                        <h3 class="title22">환불금액 정보
	                            <p class="ctypo15">환불금액보다 차감금액이 큰 경우에는 추가비용 결제를 하셔야 주문취소가 접수됩니다.</p>
	                        </h3>
	                        <div class="pay-info-box type-toggle"> 
	                            <h3><button type="button" data-modules-collapse="" class="accordion-trigger" aria-expanded="false"><span>자세히보기</span><i class="icon updown"></i></button></h3>
	                            <div class="accordion-panel" role="region" aria-label="결제금액/차감금액/환불예정금액">
	                                <ul>
	                                    <li>
	                                        <dl class="between top">
	                                            <dt>취소금액</dt>
	                                            <dd><strong id="dtlCnclAmt">0</strong>원</dd>
	                                        </dl>
	                                        <dl class="between">
	                                            <dt>원 주문금액</dt>
	                                            <dd><strong id="dtlOrgOrdAmt">0</strong>원</dd>
	                                        </dl>
	                                        <dl class="between" id="dtlCpDcAmtTr">
	                                            <dt>쿠폰/할인</dt>
	                                            <dd><strong id="dtlCpDcAmt">- 0</strong>원</dd>
	                                        </dl>
	                                    </li>
	                                    <li>
	                                        <span class="minus-icon"><i class="icon"></i></span>
	                                        <dl class="between top">
	                                            <dt>차감금액</dt>
	                                            <dd><strong id="dtlCalcAmt">0</strong>원</dd>
	                                        </dl>
	                                    </li>
	                                    <li>
	                                        <span class="result-icon"><i class="icon"></i></span>
	                                        <dl class="between top">
	                                            <dt>환불 예정 금액</dt>
	                                            <dd class="result"><strong id="dtlRepySchdAmt">0</strong>원</dd>
	                                        </dl>
			                                
				                                
	                                        <dl class="between" name="paywayTr">
	                                            <dt id="stlmPayWayGbcd_0">카드</dt>
	                                            <dd><strong id="stlmRtpAmt_0" name="stlmRtpAmt">0</strong><span id="stlmRtpWon_0">원</span></dd>
	                                        </dl>
                                        
                                       
		                                
	                                        <dl class="between" name="paywayTr" id="rfndPt" style="display: none">
	                                            <dt id="stlmPayWayGbcd_1">H.Point</dt>
	                                            <dd><strong id="stlmRtpAmt_1" name="stlmRtpAmt">0</strong><span id="stlmRtpWon_1">P</span></dd>
	                                        </dl>
	                                        
	                                        <dl class="between" name="paywayTr" id="rfndBal" style="display: none">
	                                            <dt id="stlmPayWayGbcd_2">예치금</dt>
	                                            <dd><strong id="stlmRtpAmt_2" name="stlmRtpAmt">0</strong><span id="stlmRtpWon_2">원</span></dd>
	                                        </dl>
	                                    </li>
	                                </ul>
	                            </div>
	                        </div>
	                        <div class="guide-box">
	                            <h4 class="ctypo18">주문 취소 안내</h4>
	                            <ul class="dotlist">
	                                <li>장바구니 주문 부분 취소 시 추가 배송비가 발생할 수 있습니다.</li>
	                                <li>특정 상품(식품, 주문제작)의 경우에는 고객센터(1600-0009)나 1:1상담신청을 통해 접수해 주시기 바랍니다.</li>
	                                <li>부분취소가 되지 않는 결제수단(지류상품권 등)으로 결제하신 경우에는 전체 금액 취소 후 재결제됩니다.</li>
	                            </ul>
	                        </div>
	
	                        <label class="chklabel mt_20" id="lblOrdCnclOrg">
	                            <input type="checkbox" name="agreeYn">
	                            <i class="icon"></i>
	                            <span class="ctypo14">위 내용을 확인하였습니다.</span>
	                        </label>
	
	                        <div class="btngroup w_510" id="ordCnclOrg">
	                            <button type="button" class="btn btn-linelgray medium" onclick="backCncl();"><span>취소</span></button>
	                            <button type="button" class="btn btn-default medium" name="submit_btn" onclick="insertOrdCncl();return false;"><span>취소 신청</span></button>
	                        </div>
	                        <div class="guide-box">
	                            <h4 class="ctypo18">꼭 읽어보세요! Notice</h4>
	                            <ul class="dotlist">
	                                <li>환불은 결제하셨던 결제 수단으로 환불됩니다.</li>
	                                <li>일부결제수단은 직접 주문취소가 불가하며, 고객센터(1600-0000) 혹은 Hmall 1:1상담신청을 통해 환불 가능합니다.</li>
	                                <li>부분취소가 되지 않는 결제수단(지류상품권 등)으로 결제하신 경우에는 전체 금액 취소 후 재결제됩니다.</li>
	                                <li>신용카드 결제 후 부분취소 시 카드사 매입취소까지 1~2주 이상 소요될 수 있습니다. 관련 문의는 각 카드사로 문의 바랍니다.</li>
	                            </ul>
	                        </div>
						</div> <!-- //.saveCnclConfirm -->
                    </div> <!--  //.mypage-order-wrap -->
	                <!-- </form> -->
                </div> <!-- //.contents -->
                
            </div> <!-- //.gird-l2x -->
        </div> <!-- //.container -->
    </main> <!-- //.cmain -->
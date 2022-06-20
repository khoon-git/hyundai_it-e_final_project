<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- cbody -->

<c:set var="app" value="${pageContext.request.contextPath}" />

<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	

<div class="cbody">
	<div class="contents">
		<div class="csection">
			<div class="cart-area">
			
				<!-- cart-head -->
				<div class="cart-head">
					<div class="cart-top">
						<div class="cart-all">
							<strong>장바구니</strong> <span>
							</span>
						</div>
						<ol class="cart-list-num">
							<li class="active"><!-- active일 경우 style 변경 --><strong>01</strong> <span>장바구니</span></li>
							<li><strong>02</strong> <span>주문서작성</span></li>
							<li><strong>03</strong> <span>주문완료</span></li>
						</ol>
					</div>
					<div class="cart-bottom">
                         <div class="btngroup">
                         <div style="float: right;">
                             <button type="button" class="btn btn-cart-del" onclick="deleteBasktAll();"><i class="icon cart-del"></i><span>장바구니 비우기</span></button>
                         </div>
                         </div>
                    </div>
				</div>
				<!-- //.cart-head -->
				
				<!-- cart-body -->
				<div class="cart-body">
				<input type="hidden" class="cur_cnt_cart" value="0">
				
					<div class="nodata" style="display:none;">
						<span class="bgcircle"><i class="icon nodata-type7"></i></span>
						<p>
							<span>장바구니에 담긴 상품이 없습니다.</span>
						</p>
					</div>
				
					<!-- 일반상품 -->
					<div class="shipping-listwrap" aria-label="일반상품" style="display:none;">

						<!-- cart-check -->
						<div class="cart-check">
							<div class="checkbox">
								<div class="all_check_input_div">
									<label class="chklabel"> <input type="checkbox"
										class="all_check_input input_size_20" id="cbx_chkAll">
										<i class="icon"></i><span>전체</span>
									</label>
								</div>
							</div>
							<button type="button" class="btn btn-linelgray sm" onclick="deleteAllBasktCore(this)"><span>선택삭제</span></button>
						</div>
						<!-- //.cart-check -->
						<div class="shipping-list" id="gen">
							<!-- 초기화 -->

							<table>
								<thead>
									<tr>
										<td></td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${cartList}" var="cart">
										<tr>
											<td class="td_width_1 cart_info_td">
												<div class="cart-check">
													<div class="checkbox">
														<label class="chklabel">
														<input type="checkbox" class="individual_cart_checkbox input_size_20" value='${cart.prd_cart_id }' name="chk">
															<i class="icon"></i><span>${cart.prd_nm }</span>
														</label>
													</div>
													<button type="button" class="btn btn-cart-del" onclick="deleteBasktCore('${cart.prd_cart_id }','0');">
														<i class="icon cart-del"></i><span class="hiding">삭제</span>
													</button>
												</div> 

												<input type="hidden" class="individual_prd_board_id" value="${cart.prd_board_id }">
												<input type="hidden" class="individual_prd_id" value="${cart.prd_id }">
												<input type="hidden" class="individual_cart_amount" value="${cart.cart_amount }">
												<input type="hidden" class="individual_totalPrice_input" value="${cart.prd_price * cart.cart_amount}">
												
												
												<div class="pdwrap pdlist ml">



													<div class="pdlist-wrap">
														<div class="pditem">
															<figure class="pdthumb">
																<!-- 장바구니에서 사진 클릭 시 다시 상품상세로 이동하는 부분 -->
																<a href="${app }/p/${cart.prd_board_id }">
																	<div class="thumb">
																		<img src="${cart.prd_image }"
																			onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=120x120&amp;AR=0')">
																	</div>
																</a>

																<figcaption>
																	<a href="#">
																		<div class="pdprice">
																			<ins class="normal" aria-label="정상가">
																				<em><fmt:formatNumber value="${cart.prd_price}" pattern="###,###,###" /><b>원</b></em>
																			</ins>

																		</div>
																		<div class="benefits">
																			<span class="option">옵션1: <em>${cart.option1 }</em></span>
																			<span class="option">옵션2: <em>${cart.option2 }</em></span>
																		</div>

																		<div class="pdoption" aria-label="옵션/수량">
																			<span class="count">수량: <em>${cart.cart_amount }</em></span>
																			<span class="count">재고량: <em>${cart.amount }</em></span>
																		</div>

																	</a>
																</figcaption>
															</figure>
														</div>
														<!-- //.pditem -->

														<!-- btngroup: 수량 변경 -->
														<div class="btngroup">
															<div class="prop-change selected">
																<div class="optgroup">
																	<div class="quantity" id="uitm">

																		<div class="count">
																			<button type="button" class="btn btn-minus"
																				aria-label="수량 감소"
																				onclick="minusOrdQtyCore(this, '0')">
																				<i class="icon"></i> <span class="hiding">감소</span>
																			</button>
																			<div class="inputbox">
																				<label class="inplabel">
																				<input type="number" name="ordQty" maxlength="2" value="${cart.cart_amount }" title="입력하세요">
																				<!-- 상품별 재고량 -->
																				<input type="hidden" name="leftQty" value="${cart.amount}">
																				</label>
																			</div>
																			<button type="button" class="btn btn-plus"
																				aria-label="수량 증가"
																				onclick="plusOrdQtyCore(this, '99')">
																				<i class="icon"></i> <span class="hiding">증가</span>
																			</button>
																		</div>

																		<button type="button"
																			class="btn btn-linelgray small30"
																			onclick="changeBasktItemCore(this,'${cart.prd_cart_id }');">
																			<span>변경적용</span>
																		</button>

																	</div>
																</div>
																
															</div>
														</div>

														<div class="btngroup">
															<button type="button" class="btn btn-default" onclick="buyProductCore(this,'${cart.prd_board_id }','${cart.prd_id }');" >
																<span>바로구매</span>
															</button>
														</div>
													</div>
												</div>
											</td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
							<!-- //.shipping-list -->
						</div>
						<!-- //.shipping-listwrap  일반상품 -->
					</div>
					<!-- //.cart-body -->
			</div>
			<!-- //.cart-area -->
		</div>
		<!-- //.csection -->

		<!-- 상품리스트에 하나라도 체크되면 활성화됨 -->
				<div class="sticky-ui-wrapper util-option-sticky">
				<div class="sticky-placeholder"></div>
				<div class="util-option sticky" data-modules-sticky="padding:-40;breakPoint:.container;className:util-option-sticky;" style="">
					<div class="sticky-inner">
						<div class="result">
						<p class="sel-tit">선택한 상품<span>
							</span>
						</p>
						<p>
							<strong>상품금액</strong>
							<ins>
								<em id="totalPrice"></em><b>원</b>
							</ins>
						</p>
						<!-- <p class="sale"><strong>할인</strong><ins><em class="off">0</em><b>원</b></ins></p>-->
						<p class="ship-fee">
							<strong>배송비</strong>
							<ins>
								<em id="selDlvAmt">0</em><b>원</b>
							</ins>
						</p>
						<!-- 선택한 상품이 없을 경우 em에 class="off" 붙여주세요.  -->
					</div>

					<div class="total-price">
						<a href="javascript:;" class="btn-total"><span>총 주문 금액</span></a>
						<ins>
							<em id="selOrdAmt">0</em><b>원</b>
						</ins>
					</div>
					<div class="btngroup">
						<button type="button" class="btn btn-default" onclick="buyProductAllCore(this);">
							<span>전체바로구매</span>
						</button>
					</div>

				</div>
			</div>
		</div>
</div>

	<!-- //.util-option -->

</div>
<!-- //.contents -->
</div>
<!-- //.cbody -->

<!-- cfoot -->
<div class="cfoot">
	<div class="contents">
		<div class="cart-info">
			<h3 class="major-headings">장바구니 이용안내</h3>
			<div class="cart-infocnt" role="region" aria-label="장바구니 이용안내">
				<h4 class="subheadings">장바구니 보관 안내</h4>
				<ul class="dotlist">
					<li>장바구니에 담긴 상품은 1달 동안 보관됩니다. 더 오래 보관 하시려면 "찜"에 저장해 주시기 바랍니다.</li>
					<li>장바구니에 보관 된 상품이라 해도, 가격이나 혜택이 변동 될 수 있으니 주문하시기 전에 다시 한번
						확인하시기 바랍니다.</li>
					<li>상품에 따라 반품이나 교환 시 별도로 배송비가 청구되는 경우가 있습니다.</li>
				</ul>
				<h4 class="subheadings">무이자 할부 이용 안내</h4>
				<ul class="dotlist">
					<li>상품상세 페이지나 장바구니에 기재된 무이자할부 개월수는 해당상품을 단독 구매할 경우 적용되는 조건입니다.</li>
					<li>여러종류의 상품을 함께 구매 할 경우, 보다 낮은 개월 수 의 무이자 할부가 적용됩니다.</li>
					<li>무이자할부 대상이 아닌 상품을 함께 구매 할 경우, 무이자 할부가 적용되지 않습니다.</li>
					<li>일부 특가상품은 무이자 할부 대상에서 제외되며 또한 각 상품별로 무이자 할부 개월수가 상이하오니, 최종
						결제 페이지에서 무이자 할부 개월수를 다시 한번 확인하시기 바랍니다.</li>
					<li>상품별로 무이자할부 혜택을 받고 싶으시다면, 개별 주문 부탁드립니다.</li>
				</ul>
			</div>
			<!-- //.cart-infocnt -->

		</div>
		<!-- //.cart-info -->
	</div>
</div>
<!-- //.cfoot -->

	
<script>

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function() {
	// 장바구니 없을 때 안내 사진은 보이지 않도록 설정
	$(".nodata").hide();
	
	var total = $("input[name=chk]").length;
	if(total>0){
		$(".all_check_input").prop("checked", true);
	} else{
		$(".all_check_input").prop("checked", false);
	}
	$(".individual_cart_checkbox").prop("checked", true);
	
	$(".cur_cnt_cart").val(total);
	console.log($(".cur_cnt_cart").val());
	
	if(total==0){
		$(".nodata").show();
		$(".shipping-listwrap").hide();
	} else{
		//$(".nodata").hide();
		$(".shipping-listwrap").show();		
	}
	
	
	setTotalInfo();	

	/* 체크박스 전체 선택 */
	$("#cbx_chkAll").on("click", function(){
		
		/* 체크박스 체크/해제 */
		if($("#cbx_chkAll").is(":checked")){
			$("input[name=chk]").prop("checked", true);
		} else{
			$("input[name=chk]").prop("checked", false);
		}
		
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		setTotalInfo($(".cart_info_td"));	
		
	});
	
	/* 체크여부에따른 종합 정보 변화 */
	$(".individual_cart_checkbox").on("change", function(){
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		setTotalInfo($(".cart_info_td"));

		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if(total != checked){
			$(".all_check_input").prop("checked", false);
		} else{
			$(".all_check_input").prop("checked", true); 
		}
	});
	

	
});
</script>

<script type="text/javascript">
/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	
	let totalPrice = 0;				// 총 가격
	//let totalCount = 0;				// 총 갯수
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			// 총 갯수 필요 시 추가
			//totalCount += parseInt($(element).find(".individual_bookCount_input").val());
		}
	});
	
	
	/* 배송비 결정 */
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
	/* 최종 가격 */
	finalTotalPrice = totalPrice + deliveryPrice;
	
	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 배송비
	$(".delivery_price").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
	
	/* 값 삽입 */
	// 총 가격
	$(".result #totalPrice").text(numberWithCommas(totalPrice));
	// 총 갯수
	//$(".totalCount_span").text(totalCount);
	// 배송비
	$(".result .ship-fee #selDlvAmt").text(numberWithCommas(deliveryPrice));	
	// 최종 가격(총 가격 + 배송비)
	$(".total-price #selOrdAmt").text(numberWithCommas(finalTotalPrice));
}
</script>

<script>
/*
 * 장바구니 삭제 함수, 장바구니 삭제 또는 선택 삭제에서 공통 호출된다.
 */
function deleteBasktCore(prd_cart_id,flag) {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	
	if(flag=='0'){
		var result = confirm("해당 상품을 장바구니에서 취소하시겠습니까?");
		
		if(result == true){
				$.ajax({
					url : "${app}/deletePrdCartId",
					method : "POST",
					
					data : {
						prd_cart_id : prd_cart_id
					},
					
					dataType : "json",
					beforeSend : function(xhr) { xhr.setRequestHeader(header, token); },
					success : function(data) {
						if (data.delete_PrdCartId_Success == "True") {
							location.reload();
						}
					}
				})
		}
				
	} else {
				$.ajax({
					url : "${app}/deletePrdCartId",
					method : "POST",
					
					data : {
						prd_cart_id : prd_cart_id
					},
					
					dataType : "json",
					beforeSend : function(xhr) { xhr.setRequestHeader(header, token); },
					success : function(data) {
						if (data.delete_PrdCartId_Success == "True") {
							location.reload();
						}
					}
				})
		
	}

}
/*
 * 장바구니 비우기 함수
 */
function deleteAllBasktCore(prd_cart_id) {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	var result = confirm("선택 상품을 장바구니에서 취소하시겠습니까?");
	
	if(result == true){
	  	$("input:checkbox[name=chk]:checked").each(function() {
	  	  //checkBoxArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	  	  //console.log(checkBoxArr);
	  	  deleteBasktCore($(this).val(),'1');
	  	})
	  	location.reload();
	  		
	}
}
/*
 * 선택 삭제 함수
 */
function deleteBasktAll() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	
  	$("input:checkbox[name=chk]").each(function() {
	  deleteBasktCore($(this).val(),'1');
	})
	
	location.reload();
	
}

function changeBasktItemCore(obj,prd_cart_id) {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	var parentObj = $(obj).closest("td");
	var target_childObj = $(parentObj).find("input[name=ordQty]");
	var target_childObj2 = $(parentObj).find("input[name=leftQty]");
	
	var change_amount = Number($(target_childObj).val());
	var target_leftQty = Number($(target_childObj2).val());

	
	if(change_amount>target_leftQty){
		alert('재고량보다 많이 주문할 수 없습니다!');
		return
	}
	
	$.ajax({
		url : "${app}/updatePrdCartQty",
		method : "POST",
		
		data : {
			prd_cart_id : prd_cart_id,
			cart_amount : change_amount
		},
		
		dataType : "json",
		beforeSend : function(xhr) { xhr.setRequestHeader(header, token); },
		success : function(data) {
			if (data.update_PrdCartQty_Success == "True") {
				location.reload();
			}
		}
	})
	
}


</script>

<script>

	/*
	 * 수량 input 변경
	 */
    function changeOrdQtyCore(obj, limitCnt) {
        var targetObj = $(obj).closest(".inplabel");
        var ordQty = $(obj).val();
        var orgSlitmCd = "";
        var sellPrc = $("input[name='sellPrc']").val();
        
        // 추후 전체 재고량 고려한 안내문 기능 염두
        // var totalQty = fn_calTotalQty(0, orgSlitmCd, parentObj);

        // if (totalQty > limitCnt) {
        //     var cnt = limitCnt - (totalQty - ordQty);
        //     $(obj).val(cnt);
        //     alert("본상품은 " + limitCnt + "개 이상 주문할 수 없습니다.");
        //     ordQty = cnt;
        // }

        calcSellPrcCore(obj);
    }

    /*
	 * 속성 수량 더하기
	 */
    function plusOrdQtyCore(obj, limitCnt) {

		var childObj = $(obj).closest("td");
		var target_childObj = $(childObj).find("input[name=ordQty]");
		
		var val_target_childObj = Number($(target_childObj).val());
	
		
		$(target_childObj).val(val_target_childObj + 1);

    }

    /*
	 * 속성 수량  빼기
	 */
    function minusOrdQtyCore(obj, limitCnt) {
    	
		var childObj = $(obj).closest("td");
		var target_childObj = $(childObj).find("input[name=ordQty]");
		
		var val_target_childObj = Number($(target_childObj).val());
	
        if (val_target_childObj <= 1) {
            return false;
        }
		
		
		$(target_childObj).val(val_target_childObj - 1);
    }

</script>

<script>
	// 바로구매 from 장바구니 to 주문결제
	function buyProductCore(obj, prd_board_id, prd_id) {
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";

		var childObj = $(obj).closest("td");
		var target_childObj = $(childObj).find("input[name=ordQty]");
		
		var val_target_childObj = Number($(target_childObj).val());
	
		
		var orderList = [];
		var order = {
				prd_board_id : prd_board_id, 
				prd_id : prd_id, 
				prd_count : val_target_childObj
				};
		orderList.push(order);
		
		for(var i=0; i<orderList.length;i++){
			console.log(orderList[i]);
		}
		
		$.ajax({
			url : "${app}/order",
			method : "POST",
			data : JSON.stringify(orderList),
			contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				if(data.orderSuccess=='True'){
					location.href = '${app}/order';
				}
			}
		});


	}
</script>

<script>

	// 전체바로구매 from 장바구니 to 주문결제
	function buyProductAllCore(obj) {
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";

		var orderList = [];
		
		$(".cart_info_td").each(function(index, element){
			
			if($(element).find(".individual_cart_checkbox").is(":checked") === true){
				
				val_prd_board_id = ($(element).find(".individual_prd_board_id").val());
				val_prd_id = ($(element).find(".individual_prd_id").val());
				val_amount = ($(element).find(".individual_cart_amount").val());
				
				var order = {
						prd_board_id : val_prd_board_id,
						prd_id : val_prd_id,
						prd_count : val_amount
						};
				
				orderList.push(order);
			}
		});
		
		if(orderList.length==0){
			alert('선택한 상품이 없습니다');
			return
		}
		
		for(var i=0; i<orderList.length;i++){
			console.log(orderList[i]);
		}
		
		$.ajax({
			url : "${app}/order",
			method : "POST",
			data : JSON.stringify(orderList),
			contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				if(data.orderSuccess=='True'){
					location.href = '${app}/order';
				}
			}
		});


	}

</script>
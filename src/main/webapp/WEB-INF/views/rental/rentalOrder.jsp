<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 우편번호 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<main class="cmain main" role="main" id="mainContents">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	
	<sec:authentication property="principal" var="principal_user" />
   	<c:if test="${principal_user != 'anonymousUser' }">
    	<sec:authentication property="principal.user.email" var="principal_email" />
    	<sec:authentication property="principal.user.user_id" var="principal_user_id" />
    	<sec:authentication property="principal.user.user_nm" var="principal_user_nm" />
   	</c:if>
	
	<!-- 메인페이지 'main' 클래스 추가 -->
	<div class="container">
		<div class="cbody gird-full">
			<div class="contents">
				<div class="order-wrap">
					<div class="order-content">
            
						<!-- breadcrumb -->
						<div class="order-top">
							<h2 class="title30">주문서 작성</h2>
							<ol class="list-step">
								<li><strong>01</strong> <span>장바구니</span></li>
								<li class="active"><strong>02</strong> <span>주문서작성</span></li>
								<li><strong>03</strong> <span>주문완료</span></li>
							</ol>
						</div>
						
						<!-- 배송지 입력 -->
						<div id="chkStlmType">
							<h3 class="title22" id="dlvTitleH3">
								<span id="dlvTypeTitle">일반배송</span> <span class="txt">배송/결제
									정보를 정확히 입력해주세요.</span>
							</h3>
							<div class="shipping-area">
								<c:choose>
									<c:when test="${empty activeDeliever}">
									<!-- 배송지 선택 (기본배송지 없을경우 나옴) //-->
									<div class="shipping-box" id="singleDstn">
										<a href="javascript:changeDstn();" class="link-box"> <span
											class="name">선택하여 배송지를 입력해 주세요.</span>
										</a>
									</div>
									<!-- // 배송지 선택 (기본배송지 없을경우 나옴) -->
									</c:when>
								
									<c:when test="${not empty activeDeliever}">
									<!-- 배송지 선택하거나 기본 배송지 있으면 나옴 //  -->
									<div class="shipping-box" id="singleDstn">
										<!-- divDlvInfArea// -->
										<div class="hidden" id="divDlvInfArea"> 
		                                    <input type="hidden" name="receiver_nm" value="${activeDeliever.receiver_nm}">
		                                    <input type="hidden" name="deliever_hp_no" value="${activeDeliever.deliever_hp_no}">
		                                    <input type="hidden" name="address_f" value="${activeDeliever.address_f}">
		                                    <input type="hidden" name="address_l" value="${activeDeliever.address_l}">
		                                    <input type="hidden" name="active_yn" value="${activeDeliever.active_yn}">
		                                    <input type="hidden" name="deliever_id" value="${activeDeliever.deliever_id}">
		                               </div>
										<a href="javascript:changeDstn();" class="link-box">
											<span class="name">${activeDeliever.receiver_nm} <em class="tag">기본 배송지</em></span>
											
											<span class="txt">${activeDeliever.address_l}</span>
											<ul class="user-info">
												<li>${activeDeliever.deliever_hp_no}</li>
											</ul>
										</a>
										<!-- //divDlvInfArea -->
									</div>
									<!-- // 배송지 선택하거나 기본 배송지 있으면 나옴 -->
									</c:when>
								</c:choose>
								
								<div class="shipping-box" id="singleDstnMsg" <c:if test="${empty activeDeliever}">style="display:none;"</c:if>>
										
										<div class="bg-box">
											<span>주문자명</span>
											<div class="inputbox sm">
												<label class="inplabel"><input type="text"
													onblur="nameChk(this);" name="senderName" value="${user_nm}"
													placeholder="주문자명을 입력하세요" maxlength="25"></label>
											</div>
										</div>
	
										<div class="form-wrap">
											<input type="hidden" name="deliever_msg" value="" />
											<div class="custom-selectbox" data-modules-selectbox="">
												<select id="dlvMsgSelect" name="dlvMsgSelect" onchange="changeDlvMsg(this);">
													<option value="">배송 메시지를 선택해주세요.</option>
													<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
													<option value="부재 시 연락주세요.">부재 시 연락주세요.</option>
													<option value="배송 전 연락주세요.">배송 전 연락주세요.</option>
													<option value="직접 입력">직접 입력</option>
												</select>
											</div>
											<!-- 직접 입력 선택시 노출 -->
											<div class="textareabox" style="display:none">
												<label class="txtlabel"> <input type="text"
													name="prsnMsg" placeholder="배송 메시지를 입력해주세요."
													aria-placeholder="배송 메시지를 입력해주세요."
													onkeyup="checkBytes(this, 100);">
												</label> <span class="txtcount"><em id="cntnLen">0</em><b>100</b></span>
											</div>
										</div>
										
									</div>
									
									
									
									
							</div>
						</div>

						<!-- 상품정보 -->
						<h3 class="title22 selected only">
							<button data-modules-collapse="" class="accordion-trigger"
								aria-expanded="false">
								대여 상품정보<i class="icon"></i>
							</button>
						</h3>

						<div class="accordion-panel selected" role="region" aria-label="">
							<div class="order-list" id="orderItems">
								
								<ul>
									
										<li name="orderItem">
											<input type="hidden" name="prd_id" value="${rentalProduct.prd_id}">
											<input type="hidden" name="prd_nm" value="${rentalProduct.prd_nm}">
											<input type="hidden" name="prd_image" value="${rentalProduct.prd_image}">
											<input type="hidden" name="category" value="${rentalProduct.category}">
											<input type="hidden" name="sdate" value="${rentalProduct.sdate}">
											<input type="hidden" name="edate" value="${rentalProduct.edate}">
											<input type="hidden" name="prd_price" value="${rentalProduct.prd_price}">
											<input type="hidden" name="ticket" value="${rentalProduct.ticket}">
											
											<a href="./${rentalProduct.prd_id}" target="_blank">
											<span class="img">
												<img src="${rentalProduct.prd_image}" onerror="#">
											</span>
												<div class="box">
													<span class="tit">${rentalProduct.prd_nm}</span>
													<div class="info">
														<ul>
															<li>
																대여기간 : 
																<c:if test="${not empty rentalProduct.sdate}"><fmt:formatDate value="${rentalProduct.sdate}" /> ~ 
																	<c:if test="${not empty rentalProduct.edate}"><fmt:formatDate value="${rentalProduct.edate}" /></c:if>
																</c:if>
															</li>
														</ul>
													</div>
													<span class="price"><strong><fmt:formatNumber value="${rentalProduct.prd_price}" /></strong>원</span>
												</div>
											</a>
										</li>
								</ul>
							</div>
						</div>
						
						<!-- //상품정보 -->
						
						<!-- 할인/포인트 적용 // -->
						<div id="chkStlmType">
							<h3 class="title22">할인/포인트 적용</h3>
							<div class="discount-box">
								<!-- 쿠폰 -->
								<div class="coupon-area">
									<ul class="row-list">
										<li id="copnSaleDiv">
											<div class="hidden" id="divCopnInfArea">
												<input type="hidden" name="coupon_id" value="${top1Coupon.coupon_id}">
												<input type="hidden" name="coupon_nm" value="${top1Coupon.coupon_nm}">
												<input type="hidden" name="coupon_price" value="${top1Coupon.coupon_price}">
												<input type="hidden" name="coupon_min_price" value="${top1Coupon.coupon_min_price}">
												<input type="hidden" name="coupon_valid_dt" value="${top1Coupon.coupon_valid_dt}">
												<input type="hidden" name="user_id" value="${top1Coupon.user_id}">
												<input type="hidden" name="coupon_active" value="${top1Coupon.coupon_active}">
											</div>
											<div class="row-title">
												<label class="chklabel">
													<input type="checkbox" name="copnDcAply" onclick="applyCopnDc();" <c:if test="${not empty top1Coupon}">checked</c:if> >
													<i class="icon"></i> 
													<span>쿠폰</span>
												</label>
												<button class="btn btn-linelgray small34" onclick="getCouponList();">
													<span>조회/변경</span>
												</button>
											</div>
											<div class="row-value">
											
												<c:if test="${not empty top1Coupon}">
													<p class="price">
														<strong style="margin-right:24px; color:#09f; font-size:14px;">${top1Coupon.coupon_nm}</strong>
														<strong id="copnDcAplyAmt">-<fmt:formatNumber value="${top1Coupon.coupon_price}" /></strong>원
													</p>
												</c:if>
												
											</div>
										</li>
									</ul>
								</div>
								
								<!-- 적립금 -->
								<div class="point-area">
									<ul class="row-list">
										<li id="hpointUseLi">
											<input type="hidden" name="useUPoint" value="0">
											<div class="row-title">
												<label class="chklabel"> 
													<input type="checkbox" name="upointCheck" onclick="useUpoint()">
													<i class="icon"></i> 
													<span>적립금 <em class="num"><fmt:formatNumber value="${user_reserve}" /></em></span>
													<input type="hidden" name="uPoint" value="${user_reserve}">
												</label>
												<button type="button" class="btn-tooltip" onclick="$('#pec009').modal().show();">
													<i class="icon que-mark"></i><span class="hiding">툴팁</span>
												</button>
											</div>
											<div class="row-value">
												<div class="inputbox sm">
													<label class="inplabel">
													<input type="text" 
														oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g, '$1');"
														name="useUPoint" value="" placeholder="0"
														onchange="directInsertUPoint(this);">
													</label> 
													<span class="unit point">P</span>
													<button class="btn ico-clearabled">
														<i class="icon"></i>
													</button>
												</div>
											</div>
										</li>
									</ul>
								</div>
								
								<!-- 예치금 -->
								<div class="point-area">
									<ul class="row-list">
										<li id="hpointUseLi">
											<input type="hidden" name="useUBalance" value="0">
											<div class="row-title">
												<label class="chklabel"> 
													<input type="checkbox" name="uBalanceCheck" onclick="useUBalance()">
													<i class="icon"></i> 
													<span>예치금 <em class="num"><fmt:formatNumber value="${user_balance}" /></em></span>
													<input type="hidden" name="uBalance" value="${user_balance}">
												</label>
												<button type="button" class="btn-tooltip" onclick="$('#pec009').modal().show();">
													<i class="icon que-mark"></i><span class="hiding">툴팁</span>
												</button>
											</div>
											<div class="row-value">
												<div class="inputbox sm">
													<label class="inplabel">
													<input type="text" 
														oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g, '$1');"
														name="useUBalance" value="" placeholder="0"
														onchange="directInsertUBalance(this);">
													</label> 
													<span class="unit point"> 원</span>
													<button class="btn ico-clearabled">
														<i class="icon"></i>
													</button>
												</div>
											</div>
										</li>
									</ul>
								</div>
								
							</div>
						</div>
						<!-- // 할인/포인트 적용 -->

						<!-- 총 결제금액 // -->
						<div class="box-toggle">
							<h3 class="selected">
								<button data-modules-collapse="" class="accordion-trigger"
									aria-expanded="false">
									<span class="row-title">총 결제금액</span> <span
										class="row-value color-ff5340"> <em class="tag"
										id="main_totDiscountRate" style="">약 40% 절약</em> <strong
										id="main_totPayAmt">94,800</strong>원
									</span> <i class="icon"></i>
								</button>
							</h3>
							<div class="accordion-panel selected" role="region" aria-label="">
								<ul class="row-list">
									<li>
										<div class="row-title">
											<p class="tit">주문금액</p>
										</div>
										<div class="row-value">
											<p class="price">
												<strong id="main_orderAmt">158,000</strong>원
											</p>
										</div>
									</li>
									<li>
										<div class="row-title">
											<p class="tit">할인금액</p>
										</div>
										<div class="row-value">
											<p class="price">
												<strong id="main_discountAmt">-63,200</strong>원
											</p>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<!-- // 총 결제금액 -->
						
						<!-- 결제정보// -->
						<div class="sticky-ui-wrapper util-option-sticky">
							<div class="sticky-placeholder" style=""></div>
							<div class="util-option sticky"
								data-modules-sticky="padding:-40;breakPoint:.container;className:util-option-sticky;"
								style="">
								<div class="sticky-inner">
									<h4 class="title20">총 결제금액</h4>
									
									<input type="hidden" name="totPayAmt" />
									<input type="hidden" name="couponDcAmt" />
									<input type="hidden" name="usePointAmt" />
									<input type="hidden" name="useBalanceAmt" />
									<input type="hidden" name="prdPriceAmt" />
									<input type="hidden" name="ExpectPoint" />
									<input type="hidden" name="discountAmt" />
									
									<ul class="payment-list">
										<li>
											<div id="orderAmt">
												<span class="tit">총 판매금액</span> <span class="txt"><strong>158,000</strong>원</span>
											</div>

											<div id="copnDcAmtDiv" class="">
												<span class="tit">쿠폰할인</span> <span class="txt"><strong>-63,200</strong>원</span>
											</div>

											<div id="totDcAmtDiv">
												<span class="tit">할인 합계금액</span> <span class="txt"> <strong
													id="totDcAmtDd">-63,200</strong>원 <em style="">약 40%
														절약</em>
												</span>
											</div>
											
											<div class="" id="useUPointDiv">
                                                 <span class="tit">적립금 사용</span>
                                                 <span class="txt"><strong>-1,001</strong>P</span>
                                            </div>
                                            
                                            <div class="" id="useUBalanceDiv">
                                                 <span class="tit">예치금 사용</span>
                                                 <span class="txt"><strong>-1,001</strong>원</span>
                                            </div>
										</li>

										<li>
											<div class="total">
												<span class="tit">최종 결제금액</span> <span class="txt"
													id="lastStlmAmtDd"><strong>89,000</strong>원</span>
											</div>
										</li>
										
										<li>
											
											<ul class="check-list agreeCheck">
                                                <li>
                                                    <label class="chklabel sm">
                                                        <input type="checkbox" id="ordAgreeChk" name="ordAgreeChk">
                                                        <i class="icon"></i>
                                                        <span>주문하실 상품의 상품명, 가격,<br>배송정보를 확인하였으며,<br>이에 동의합니다.<br>(전자상거래법 제8조 제2항)</span>
                                                    </label>
                                                </li>
                                            </ul>
										</li>
										
									</ul>
									
									<div class="btngroup agreeCheck">
										<button type="button" class="btn btn-default medium"
											onclick="order();">
											<span> 결제 </span>
										</button>
									</div>
									
								</div>
							</div>
						</div>
						<!-- //결제정보 -->

						<h3 class="title22">결제 수단</h3>
						<div class="payment-way-box" id="payTypeHpp">
							<ul>
								<!-- 결제수단 -->
								<li class="payment-group">
									<input id="payment-type-3" class="payment-title" type="radio" name="payment-type" value="3">
									<label for="payment-type-3" class="payment-label">
										<i class="icon"></i><span>결제수단</span>
									</label>

									<div class="payment-content">
										<div id="payTypeDiv">
											<div class="radio-box pay-radio">
												<!-- 신용카드 -->
												<span> 
													<input type="radio" name="payType" id="payType1" value="10"> 
													<label for="payType1" class="sm50"> 
														<span class="text">신용카드</span>
													</label>
												</span>
												<!-- // 신용카드 -->
												
												<!-- 무통장 입금 -->
												<span> <input type="radio" name="payType" id="payType2" value="20">
													<label for="payType2" class="sm50">
														<span class="text">무통장입금</span>
													</label>
												</span>
												<!-- // 무통장 입금 -->
												
												<!-- 카카오페이 -->
												<span> <input type="radio" name="payType" id="payType3" value="30">
													<label for="payType3" class="sm50">
														<span class="text">카카오페이</span>
													</label>
												</span>
												<!-- // 카카오페이 -->
											</div>
										</div>
									</div>
								</li>
								
							</ul>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //.container -->
	
	<!-- 배송지 모달 -->
	<div class="ui-modal pop-pec003" id="pec003" tabindex="-1" role="dialog" aria-label="배송지 입력" style="z-index: 1031; display: none; padding-right: 0px;">
        <div class="ui-modal-dialog" role="document">
            <div class="content">
                <p class="ui-title">배송지 입력</p>
                <div class="content-body">
                    <div>
                        <!-- Nav tabs -->
                        <ul class="ui-tab ff5340" role="tablist">
                            <li role="presentation" class="ui-active">
                            	<a href="#addresslist" aria-controls="addresslist" role="tab" data-modules-tab="" aria-expanded="true">배송지 목록</a>
                            </li>
                            <li role="presentation" class="">
                            	<a href="#addressadd" aria-controls="addressadd" role="tab" data-modules-tab="" onclick="clearAddrInput();" aria-expanded="false">배송지 추가/수정</a>
                            </li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                        	<!-- 배송지 목록 -->
                            <div role="tabpanel" class="tab-pane ui-active" id="addresslist">
                                <div class="nodata">
                                	<span class="bgcircle"><i class="icon nodata-type15"></i></span>
                                	<p>지정된 배송지가 없습니다.</p>
                                </div>
                                
                                <div class="btngroup">
                                    <button type="button" class="btn btn-default" onclick="selectDstnAddr();">
                                    	<span>확인</span>
                                    </button>
                                    <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
                                </div>
                            </div>
                            
                            <!-- 배송지 추가/수정 -->
                            <div role="tabpanel" class="tab-pane" id="addressadd">
                            	<!-- 받은실 분 -->
                                <div class="inputbox">
                                    <input type="hidden" name="" value="" id="selectedDelieverId">
                                    <label class="inplabel">
                                    	<input type="text" onblur="nameChk(this);" name="" value="" placeholder="받으실 분" id="selectedReceiverNm" maxlength="25">
                                    </label>
                                </div>
                                
                                <!-- 주소, 우편찾기 -->
                                <div class="inputbox">
                                    <label class="inplabel btnlabel">
                                    	<input type="text" name="address_f" value="" placeholder="주소" id="selectedAddressF" readonly="">
                                    </label>
                                    <button type="button" class="btn btn-lineblack btn-confirm" onclick="kakaopost();"><span>우편번호 찾기</span></button>
                                </div>
                                
                                <!-- 상세주소 -->
                                <div class="inputbox">
                                    <label class="inplabel">
                                    	<input type="text" name="address_l" value="" placeholder="상세 주소를 입력해주세요." id="selectedAddressL" maxlength="100">
                                    </label>
                                </div>
                                
                                <!-- 전화번호 -->
                                <div class="inputbox">
                                    <label class="inplabel">
                                    	<input type="text" class="onlyNumber" name="" value="" placeholder="전화번호(필수입력) (예 : 01012345678)" id="selectedDelieverHpNo" maxlength="12">
                                    </label>
                                </div>
                                
                                <!-- 기본 배송지 설정여부 -->
                                <label class="chklabel">
                                    <input type="checkbox" name="" id="selectedActiveYn" value="">
                                    <i class="icon"></i>
                                    <span>기본배송지로 지정</span>
                                </label>
                                
                                <div class="btngroup">
                                    <button class="btn btn-linelgray" onclick="$('#pec003').modal('hide');"><span>취소</span></button>
                                    <button class="btn btn-default" id="updateAddrBtn" onclick="modifyAddr('', '');"><span>확인</span></button> <!-- modifyAddr() 인자 비어있는거 두개면 배송지 추가임. -->
                                    <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //.content-body -->

                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
            </div>
            <!-- //.content -->
        </div>
        <!-- //.ui-modal-dialog -->
    </div>
	
	<!-- 쿠폰 선택 모달 -->
	<div class="ui-modal pop-pec007-01" id="pec007-01" tabindex="-1" role="dialog" aria-label="쿠폰 할인" style="z-index: 1041; display: none;">
                <div class="ui-modal-dialog" role="document">
                    <div class="content">
                        <p class="ui-title">쿠폰 할인</p>
                        <div class="content-body">
                            <div class="mycoupon-body">
                                <div class="coupon-list">
                                    
                                    <!-- <div class="coupon-box">
                                    	<input type="hidden" name="coupon_id" value="">
	                                    <input type="hidden" name="coupon_nm" value="">
	                                    <input type="hidden" name="coupon_price" value="">
	                                    <input type="hidden" name="coupon_min_price" value="">
	                                    <input type="hidden" name="coupon_valid_dt" value="">
	                                    <input type="hidden" name="user_id" value="">
	                                    <input type="hidden" name="coupon_active" value="">
                                        <div class="coupon">
                                            <p class="discount"><strong>15</strong><b>%</b></p>
                                            <div class="coupon-info">
                                                <p class="title"><strong>15% 바로사용쿠폰</strong></p>
                                                
                                                <label class="radlabel">
                                                    <input type="radio" name="gnrlCopn_2138263418_00002_0_0" id="dc-select-gcpn-0-" value="00004161|2138263418|00002|0|1|15|1|0||0|03|40|N">
                                                    <i class="icon"></i>
                                                    <span class="hiding">Default</span>
                                                </label>
                                            </div>
                                            // .coupon-info
                                        </div>
                                        // .coupon
                                        <div class="coupon-bg"><div></div><div></div></div>
                                    </div>
                                    //.coupon-box -->
                                    
                                </div>
                                <!-- //.coupon-list -->
                            </div>
							
                            <div class="btngroup">
                                <button class="btn btn-linelgray" onclick="cancleCopn();"><span>적용 안함</span></button>
                                <button class="btn btn-default" onclick="selectCoupon();"><span>적용하기</span></button>
                                <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
                            </div>
                        </div>
                        <!-- //.content-body -->

                        <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
                    </div>
                    <!-- //.content -->
                </div>
                <!-- //.ui-modal-dialog -->
	</div>

</main>

<script>

$(document).ready(function(){
	payAmtCalculate();
});






var token = $("input[name='_csrf']").val();
var header = "X-CSRF-TOKEN";

function changeDstn() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	var deliever_id = $("#divDlvInfArea input[name='deliever_id']").val();
	
	
    // 배송지 목록 싹 지워줌 (배송지가 없는경우, 있는경우 둘 다 지움.)
    $('#addresslist ul').remove(); //배송지가 있는 경우에도 지워줌
    $('#addresslist div.nodata').remove(); //배송지가 없는 경우에도 지워줌
    
    // 유저가 가지고있는 배송지 정보 요청
	$.ajax({
		method : "get",
		url : "${app}/deliever/selectDelieverList",
		dataType:"json",
		async: true,
		contentType: "application/json",
		success : function(data) {
			
			//console.log(data);
			var addrHtml = "";
			
			$("#pec003 #selectedDelieverId").val($("#singleDstn input[name=deliever_id]").val());
			if (data.length == 0) {
				addrHtml += "<div class='nodata'>";
                addrHtml += "<span class='bgcircle'><i class='icon nodata-type15'></i></span>";
                addrHtml += "<p>지정된 배송지가 없습니다.</p>";
                addrHtml += "</div>";
			}else {
				addrHtml += "<ul class='addresslist'>";
				for (var i=0; i< data.length; i++) {
					addrHtml += "<li>";
					addrHtml += "    <label class='radlabel'>";
                    addrHtml += "        <input type='radio' name='dstnRadio'" + ((data[i].deliever_id == deliever_id) ? " checked " : "" ) +" >"; //기본배송지면 checked
                    addrHtml += "        <i class='icon'></i>";
                    addrHtml += "        <span class='hiding'>text</span>";
                    addrHtml += "    </label>";
                    
                    addrHtml += "    <div class='info'>";
                    addrHtml += "        <p class='name'>"+data[i].receiver_nm;
                    if ( data[i].active_yn == "1" ) { //기본 배송지일 경우 추가
                        addrHtml += " <span class='tag red'>기본 배송지</span>";
                    }
                    addrHtml += "</p>";
                    addrHtml += "        <p class='add'>("+data[i].address_f+") "+data[i].address_l+"</p>";
                    addrHtml += "        <p class='tel'>"+data[i].deliever_hp_no+"</p>";
                    addrHtml += "    </div>"; // end info
                    
                    addrHtml += "    <div class='btngroup abs'>";
                    addrHtml += "        <button class='btn btn-linelgray small30' onclick='modifyAddr(this, \"toMod\");'><span>수정</span></button>";
                    if ( data[i].active_yn != "1" ) {
                        addrHtml += "        <button class='btn btn-linelgray small30' onclick='modifyAddr(this, \"delete\");'><span>삭제</span></button>";
                    }
                    addrHtml += "    </div>"; //end btngroup abs
                    
                    addrHtml += "<input type='hidden' name='user_id' value='"+data[i].user_id+"'/>";
                    addrHtml += "<input type='hidden' name='deliever_id' value='"+data[i].deliever_id+"'/>";
                    addrHtml += "<input type='hidden' name='receiver_nm' value='"+data[i].receiver_nm+"'/>";
                    addrHtml += "<input type='hidden' name='deliever_hp_no' value='"+data[i].deliever_hp_no+"'/>";
                    addrHtml += "<input type='hidden' name='address_f' value='"+data[i].address_f+"'/>";
                    addrHtml += "<input type='hidden' name='address_l' value='"+data[i].address_l+"'/>";
                    addrHtml += "<input type='hidden' name='active_yn' value='"+data[i].active_yn+"'/>";
                    
                    addrHtml += "</li>";
				} //end for
				
				addrHtml += "</ul>";
				
			} // end if
			
			$('#addresslist .btngroup').before(addrHtml); // .before() 선택한 요소 앞에 새 요소를 추가 또는 다른 곳에 있는 요소를 이동시킴
			$("#pec003 li[role=presentation]").eq(0).addClass("ui-active"); // .eq() : 선택한 요소의 인덱스 번호에 해당하는 요소를 찾음(없으면 null 반환)
            $("#pec003 div[role=tabpanel]").eq(0).addClass("ui-active"); // 처음에 배송지 목록 ui를 active 해줌.
            $("#pec003 li[role=presentation]").eq(1).removeClass("ui-active");
            $("#pec003 div[role=tabpanel]").eq(1).removeClass("ui-active");
            
            $('#pec003').modal("show");
			
		} //end success
		,
		error : function(error) {
			alert(error);
		}
		
		
	});
    
}

//배송지 추가/수정 클릭시 창 인풋 클리어(clearAddrInput() 완)
// 배송지 추가/수정에서 취소버튼 누를시 모달을 닫음 (html에서 완)

/* 배송지 추가,수정,삭제 */
function modifyAddr(obj, modType) {
	
	//수정버튼을 통해 들어갈시 확인버튼의 onclick 속성의 파라미터를 modSubmit으로 변경
	if (modType != 'addSubmit') {
		$("#updateAddrBtn").removeAttr("onclick");
		$("#updateAddrBtn").attr("onclick", "modifyAddr('', \"modSubmit\");");
	}
	
	// 수정하기 버튼 클릭시
	if ( modType == "toMod" ) {
		// 배송지 추가/수정 탭으로 이동
        $("#pec003 li[role=presentation]").eq(1).addClass("ui-active");
        $("#pec003 div[role=tabpanel]").eq(1).addClass("ui-active");
        $("#pec003 li[role=presentation]").eq(0).removeClass("ui-active");
        $("#pec003 div[role=tabpanel]").eq(0).removeClass("ui-active");

        $("#pec003 #selectedDelieverId").val($(obj).parent().siblings("input[name=deliever_id]").val()); //siblings : obj 요소의 형제 요소 중"input[name=deliever_id]" 요소를 반환함.
        $("#pec003 #selectedReceiverNm").val($(obj).parent().siblings("input[name=receiver_nm]").val());
        $("#pec003 #selectedAddressF").val($(obj).parent().siblings("input[name=address_f]").val());
        $("#pec003 #selectedAddressL").val($(obj).parent().siblings("input[name=address_l]").val());
        $("#pec003 #selectedDelieverHpNo").val($(obj).parent().siblings("input[name=deliever_hp_no]").val().replace(/[^0-9]/g,""));
        //기본 배송지 여부
        if ( $(obj).parent().siblings("input[name=active_yn]").val() == "1" ) {
            $("#pec003 #selectedActiveYn").prop("checked", true);
            $("#pec003 #selectedActiveYn").prop("type", "checkbox");
        } else {
            $("#pec003 #selectedActiveYn").prop("checked", false);
            $("#pec003 #selectedActiveYn").prop("type", "checkbox");
        }
        return;
    }
	
	//배송지 추가/수정 탭에서 확인버튼을 눌렀을 때 먼저 유효성 검증을 해줌
	if ( modType != "delete" ) {
        if ( isEmpty($("#pec003 #selectedReceiverNm").val()) ) {
            alert("받으실분이 입력되지 않았습니다.");
            $("#pec003 #selectedReceiverNm").focus();
            return;
        }

        if ( isEmpty($("#pec003 #selectedAddressF").val()) ) {
            alert("주소가 입력되지 않았습니다.");
            return;
        }

        if ( isEmpty($("#pec003 #selectedAddressL").val()) ) {
            alert("상세주소가 입력되지 않았습니다.");
            $("#pec003 #selectedAddressL").focus();
            return;
        }

        if ( $("#pec003 #selectedAddressL").val().indexOf('\"') > -1 ) {
            alert("상세주소에 \" 는 입력할 수 없습니다.");
            $("#pec003 #selectedAddressL").focus();
            return;
        }

        if ( !checkMoblie($("#pec003 #selectedDelieverHpNo"), "전화번호") ) {
            return;
        }
    }
	
    //전송할 배송지 데이터
	var delieverId = "";
    var receiverNm = "";
    var addressF = "";
    var addressL = "";
    var delieverHpNo = "";
    var activeYn = "0";
    var url = ""; //배송지 curd 요청 url
    
    // 배송지 삭제요청
    if ( modType == "delete" ) {
    	console.log("배송지 삭제 요청")
    	console.log($("#pec003 #selectedDelieverId").val());
    	delieverId = $(obj).parent().siblings("input[name=deliever_id]").val();
        if (delieverId == $("#pec003 #selectedDelieverId").val()) {
        	console.log($("#pec003 #selectedDelieverId").val());
            alert("선택 되어있는 배송지는 삭제 할 수 없습니다.");
            return;
        }
        url = "${app}/deliever/deleteDeliever";
    } else { // 삭제요청이 아닌경우 modType이 modSubmit이면 수정요청, addSubmit이면 생성 요청
    	delieverId = $("#pec003 #selectedDelieverId").val();
    	receiverNm = $("#pec003 #selectedReceiverNm").val();
    	addressF = $("#pec003 #selectedAddressF").val();
    	addressL = $("#pec003 #selectedAddressL").val();
    	delieverHpNo = $("#pec003 #selectedDelieverHpNo").val();
    	activeYn = $("#pec003 #selectedActiveYn").prop("checked")?"1":"0";
    	
    	if (modType == "modSubmit") { //수정 요청인 경우
    		url = "${app}/deliever/updateDeliever";
    	}
    	else if( modType == "addSubmit") { //생성 요청인 경우
    		url = "${app}/deliever/insertDeliever";
    	}
    	
    }
    
    $.ajax({
        type: "post"
        //,url: "/p/oda/updateDstnAdrList.do"
        ,url: url
        ,data : {
        	"deliever_id":delieverId,
        	"receiver_nm":receiverNm,
        	"address_f":addressF,
        	"address_l":addressL,
        	"deliever_hp_no":delieverHpNo,
        	"active_yn":activeYn,
        }
        ,beforeSend : function(xhr) { //post요청은 beforeSend 필수 (csrf)
			xhr.setRequestHeader(header, token);
		}
        ,dataType: "text"
        ,async: true
        ,success : function(data) {
        	//console.log(data);
        	changeDstn();
        }
        ,error: function(error) {
        	alert(error);
        }
    });
    
    
}

// 배송지 추가/수정 창 인풋 클리어
function clearAddrInput() {
    $("#pec003 #selectedDelieverId").val("");
    $("#pec003 #selectedReceiverNm").val("");
    $("#pec003 #selectedDelieverHpNo").val("");
    $("#pec003 #selectedAddressF").val("");
    $("#pec003 #selectedAddressL").val("");
    
  	//배송지 추가/수정 버튼을 통해 들어갈시 확인버튼의 onclick 속성의 파라미터를 toAdd로 변경
	$("#updateAddrBtn").removeAttr("onclick");
	$("#updateAddrBtn").attr("onclick", "modifyAddr('', \"addSubmit\");");
}

//배송지 목록에서 확인버튼 누르면 selectDstnAddr
function selectDstnAddr() {

	//배송지 선택 안했을 경우
	if ( $("input[name=dstnRadio]:checked").val() != "on" ) {
        alert("주소를 선택해주세요.");
        return;
    }
	
	//모달에 있는 값을 화면에 띄워줘야함/
	$("#pec003 ul.addresslist input[name=dstnRadio]").each(function(index) {
		
		if ( $(this).prop("checked") ) {
			// 모달창에서 체크되어있는 배송지의 정보들
			var user_id = $("#pec003 ul.addresslist input[name=user_id]").eq(index).val();
			var deliever_id = $("#pec003 ul.addresslist input[name=deliever_id]").eq(index).val();
			var receiver_nm = $("#pec003 ul.addresslist input[name=receiver_nm]").eq(index).val();
			var deliever_hp_no =  $("#pec003 ul.addresslist input[name=deliever_hp_no]").eq(index).val();
			var address_f = $("#pec003 ul.addresslist input[name=address_f]").eq(index).val();
			var address_l = $("#pec003 ul.addresslist input[name=address_l]").eq(index).val();
			var active_yn = $("#pec003 ul.addresslist input[name=active_yn]").eq(index).val();
			
			//배송지정보 먼저 초기화 후 모달에 있는값으로 바꿔줌
			$("#singleDstn").empty();
			var addInfoHtml = "";
			addInfoHtml += "<div class='hidden' id='divDlvInfArea'>";
			addInfoHtml += "	<input type='hidden' name='user_id' value='"+user_id+"'>";
			addInfoHtml += "	<input type='hidden' name='deliever_id' value='"+deliever_id+"'>";
			addInfoHtml += "	<input type='hidden' name='receiver_nm' value='"+receiver_nm+"'>";
			addInfoHtml += "	<input type='hidden' name='deliever_hp_no' value='"+deliever_hp_no+"'>";
			addInfoHtml += "	<input type='hidden' name='address_f' value='"+address_f+"'>";
			addInfoHtml += "	<input type='hidden' name='address_l' value='"+address_l+"'>";
			addInfoHtml += "	<input type='hidden' name='active_yn' value='"+active_yn+"'>";
			addInfoHtml += "</div>";
			addInfoHtml += "<a href='javascript:changeDstn();' class='link-box'>";
			addInfoHtml += "	<span class='name'>"+receiver_nm;
			if(active_yn == "1"){
				addInfoHtml += "	<em class='tag'>기본 배송지</em>";
			}
			addInfoHtml += "	</span>";
			addInfoHtml += "	<span class='txt'>"+address_l+"</span>";
			addInfoHtml += "	<ul class='user-info'>";
			addInfoHtml += "		<li>"+deliever_hp_no+"</li>";
			addInfoHtml += "	</ul>";
			addInfoHtml += "</a>";
			$("#singleDstn").append(addInfoHtml);
			
			
			//배송 메시지 초기화
			$("#dlvMsgSelect").find('option:first').prop('selected',true);
			changeDlvMsg($("#dlvMsgSelect")[0] );
			$(".ui-label a").text($("#dlvMsgSelect").find("option:selected").text());
			
		}
	});
	
	$('#singleDstnMsg').show();
	$('#pec003').modal("hide");
	
}


//배송지 선택시 배송메시지
function changeDlvMsg(obj) {
	$("input[name=deliever_msg]").val($(obj).find("option:selected").val());
    var sel = $(obj).find("option:selected").val();
    $(obj).parent().parent().parent().find("div.textareabox").hide();
    $(obj).parent().parent().parent().find("input[name=prsnMsg]").val(sel);
    if ( sel == "직접 입력" ) {
        $(obj).parent().parent().parent().find("div.textareabox").show();
        $(obj).parent().parent().parent().find("input[name=prsnMsg]").val("");
        $(obj).parent().parent().parent().find("span.txtcount em").html("0");
    }
}



// 휴대폰번호 체크
function checkMoblie(obj, name) {
    var inputValue = $(obj).val();
    var mobileDdd = "";
    var mobilePhone1 = "";
    var mobilePhone2 = "";

    var pattern = /\D/g;

    if (pattern.test(inputValue)){
        isValidMobilePhone = false;
        alert("숫자만 입력해주세요.");
        $(obj).focus();
        return false;
    }


    if(inputValue.length < 10 || inputValue.length > 11 ){
        isValidMobilePhone = false;
        alert(name+"을 확인 해주세요.");
        $(obj).focus();
        return false;
    }

    //번호 3등분
    //국번 010/011/016/017/018/019/로 시작하는 3자리
    var numF = inputValue.substring(0,3);
    var numPattern = /01[016789]/;
    if(!numPattern.test(numF)){
        isValidMobilePhone = false;
        alert(name+"을 확인 해주세요.");
        $(obj).focus();
        return false;
    }

    if(inputValue.length == 10){
        mobileDdd  = inputValue.substring(0,3);
        mobilePhone1  = inputValue.substring(3,6);
        mobilePhone2  = inputValue.substring(6,10);

    }else if(inputValue.length == 11){
        mobileDdd  = inputValue.substring(0,3);
        mobilePhone1  = inputValue.substring(3,7);
        mobilePhone2  = inputValue.substring(7,11);

    }else{
        isValidMobilePhone = false;
        alert(name+"을 확인 해주세요.");
        $(obj).focus();
        return false;
    }

    return true;
}

// 이름 공백 체크
function nameChk(obj){
    var pattern1 = /\s{2,}/g;
    var name = $(obj).val();
    var vali_1 = false;
    var vali_2 = false;
    var vali_3 = false;

    if(pattern1.test(name)){
        name = name.replaceAll(pattern1,"");
        vali_1 = true;
    }
    if(name[0]== " " || name[0] == "\t"){
        name = name.slice(1,name.length);
        vali_2 = true;
    }
    if (name[name.length-1] == " " || name[name.length-1] == "\t") {
        name = name.slice(0,name.length-1);
        vali_3 = true;
    }

    if(vali_1){
        alert("공백은 연속해서 입력할 수 없습니다.");
    }else if(vali_2){
        alert("이름은 공백으로 시작할 수 없습니다.");
    }else if(vali_3){
        alert("이름은 공백으로 끝날 수 없습니다.");
    }

    $(obj).val(name);
}

/* 배송 요청사항 (직접입력시) */
function checkBytes(obj, limitByte) {
    var inputStr = $(obj).val();

    var iByteLength = 0;
    for (var i = 0; i < inputStr.length; i++) {
        var sChar = escape(inputStr.charAt(i));
        iByteLength += calculateByte(sChar);
        
        if(iByteLength > limitByte){
            alert('최대 '+limitByte+'Byte 까지 입력가능합니다.');
            $(obj).val(inputStr.substring(0, i));
            iByteLength = iByteLength - calculateByte(escape(inputStr.charAt(i)));

            break;
        }
    }
    $("input[name=deliever_msg]").val($("input[name=prsnMsg]").val());
    $(obj).parent().parent().find("span em").text(iByteLength);
}
/**
 * 바이트 계산
 * @param sChar
 * @returns {Number}
 */
function calculateByte(sChar) {
    var byte = 0;
    if (sChar.length == 1 ) {
        byte = 1;
    } else if (sChar.indexOf("%u") != -1) {
        byte = 2;
    } else if (sChar.indexOf("%") != -1) {
        byte = 3;
    }

    return byte;
}



/* 카카오 우편번호 */
function kakaopost() {
    new daum.Postcode({
    	// oncomplete : 주소 선택 후 콜백
        oncomplete: function(data) {
        	// kakaoPost에서 가져온 우편번호, 주소값을 저장
           $("input[name='address_f']").val(data.zonecode);
           $("input[name='address_l']").val(data.address+", ");
           $("input[name='address_f']").attr('readonly', true);
           
           
           $("input[name='address_l']").focus();
        }
    }).open();
}

function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

/* 쿠폰 리스트 받아오기 */
function getCouponList() {
	
	var coupon_id = $("#divCopnInfArea input[name='coupon_id']").val();
	
	
    $.ajax({
		method : "get",
		url : "${app}/coupon/selectCouponList",
		dataType:"json",
		async: true,
		contentType: "application/json",
		success : function(couponList) {
			$(".coupon-list").empty();
			couponList.map((coupon) => {
				
				if (Number($("input[name=prdPriceAmt]").val()) > coupon.coupon_min_price) { //쿠폰 최소 사용금액 보다 낮은 상품은 쿠폰 안보여줌
					
		        	var addCouponHtml = "";
		        	addCouponHtml += "<div class='coupon-box'>";
		        	addCouponHtml += "	<input type='hidden' name='coupon_id' value='"+coupon.coupon_id+"'>";
		        	addCouponHtml += "	<input type='hidden' name='coupon_nm' value='"+coupon.coupon_nm+"'>";
		        	addCouponHtml += "	<input type='hidden' name='coupon_price' value='"+coupon.coupon_price+"'>";
	                addCouponHtml += "	<input type='hidden' name='coupon_min_price' value='"+coupon.coupon_min_price+"'>";
	                addCouponHtml += "	<input type='hidden' name='coupon_valid_dt' value='"+coupon.coupon_valid_dt+"'>";
	                addCouponHtml += "	<input type='hidden' name='user_id' value=''>";
	                addCouponHtml += "	<input type='hidden' name='coupon_active' value='"+coupon.coupon_active+"'>";
	                addCouponHtml += "	<div class='coupon'>";
	                addCouponHtml += "		<p class='discount'><strong>"+priceToString(coupon.coupon_price)+"</strong><b>원</b></p>";
	                addCouponHtml += "		<div class='coupon-info'>";
	                addCouponHtml += "			<p class='title'><strong>"+coupon.coupon_nm+"</strong></p>";
	                addCouponHtml += "			<ul class='coupon-info-list'>";
	                addCouponHtml += "				<li>기간: "+moment(coupon.coupon_valid_dt).format('YYYY-MM-DD')+"</li>";
	                addCouponHtml += "			</ul>";
	                addCouponHtml += "			<p class='type' style='line-height: 20px; color: #ff5340; font-size: 13px;'>남은기간 : "+Math.floor(moment.duration(moment(coupon.coupon_valid_dt).diff(moment())).asDays())+"일</p>";
	                addCouponHtml += "			<label class='radlabel'>";
	                addCouponHtml += "				<input type='radio' name='couponRadio'" + ((coupon.coupon_id == coupon_id) ? " checked " : "" ) +" >";
	                addCouponHtml += "				<i class='icon'></i>";
	                addCouponHtml += "				<span class='hiding'>Default</span>";
	                addCouponHtml += "			</label>";
	                addCouponHtml += "		</div>";
	                addCouponHtml += "	</div>";
	                addCouponHtml += "	<div class='coupon-bg'><div></div><div></div></div>";
	                addCouponHtml += "</div>";
	                
	                $(".coupon-list").append(addCouponHtml);
				}
	        }); // end map
	        
	    },
		error: function(error) {
			console.log(error);
		}
	
    });
    
    $('#pec007-01').modal('show');

}


/* 쿠폰 선택 */
function selectCoupon() {
	
	
	
	$("#pec007-01 .coupon-list input[name=couponRadio]").each(function(index) {
		if ( $(this).prop("checked") ) {
			// 모달창에서 체크되어있는 배송지의 정보들
			var coupon_id = $("#pec007-01 .coupon-box input[name=coupon_id]").eq(index).val();
			var coupon_nm = $("#pec007-01 .coupon-box input[name=coupon_nm]").eq(index).val();
			var coupon_price = $("#pec007-01 .coupon-box input[name=coupon_price]").eq(index).val();
			var coupon_min_price =  $("#pec007-01 .coupon-box input[name=coupon_min_price]").eq(index).val();
			var coupon_valid_dt = $("#pec007-01 .coupon-box input[name=coupon_valid_dt]").eq(index).val();
			var user_id = $("#pec007-01 .coupon-box input[name=user_id]").eq(index).val();
			var coupon_active = $("#pec007-01 .coupon-box input[name=coupon_active]").eq(index).val();
			
			
			$("#copnSaleDiv").empty()
			var addCopnHtml = "";
			addCopnHtml += "<div class='hidden' id='divCopnInfArea'>";
			addCopnHtml += "	<input type='hidden' name='coupon_id' value='"+coupon_id+"'>";
			addCopnHtml += "	<input type='hidden' name='coupon_nm' value='"+coupon_nm+"'>";
			addCopnHtml += "	<input type='hidden' name='coupon_price' value='"+coupon_price+"'>";
			addCopnHtml += "	<input type='hidden' name='coupon_min_price' value='"+coupon_min_price+"'>";
			addCopnHtml += "	<input type='hidden' name='coupon_valid_dt' value='"+coupon_valid_dt+"'>";
			addCopnHtml += "	<input type='hidden' name='user_id' value='"+user_id+"'>";
			addCopnHtml += "	<input type='hidden' name='coupon_active' value='"+coupon_active+"'>";
			addCopnHtml += "</div>";
			addCopnHtml += "<div class='row-title'>";
			addCopnHtml += "	<label class='chklabel'>";
			addCopnHtml += "		<input type='checkbox' name='copnDcAply' onclick='applyCopnDc();' checked />";
			addCopnHtml += "		<i class='icon'></i>";
			addCopnHtml += "		<span>쿠폰</span>";
			addCopnHtml += "	</label>";
			addCopnHtml += "	<button class='btn btn-linelgray small34' onclick='getCouponList();'>";
			addCopnHtml += "		<span>조회/변경</span>";
			addCopnHtml += "	</button>";
			addCopnHtml += "</div>";
			addCopnHtml += "<div class='row-value'>";
			addCopnHtml += "	<p class='price'>";
			addCopnHtml += "		<strong style='margin-right:24px; color:#09f; font-size:14px;'>"+coupon_nm+"</strong>";
			addCopnHtml += "		<strong id='copnDcAplyAmt'>-"+priceToString(coupon_price)+"</strong>원";
			addCopnHtml += "	</p>";
			addCopnHtml += "</div>";
			
			$("#copnSaleDiv").append(addCopnHtml);
			$('#pec007-01').modal('hide');
		} else{ //가지고 있는 쿠폰이 없을시
			
		}
	});
	
	payAmtCalculate();
	
}

// 쿠폰 적용 안함 누를시
function cancleCopn() {
	
	$("#divCopnInfArea input[name=coupon_id]").val('');
	$("#divCopnInfArea input[name=coupon_nm]").val('');
	$("#divCopnInfArea input[name=coupon_price]").val('');
	$("#divCopnInfArea input[name=coupon_min_price]").val('');
	$("#divCopnInfArea input[name=coupon_valid_dt]").val('');
	$("#divCopnInfArea input[name=user_id]").val('');
	$("#divCopnInfArea input[name=coupon_active]").val('');
	
	$("#copnSaleDiv .price").empty();
	
	$('input[name=copnDcAply]').prop('checked', false);
	$('#pec007-01').modal('hide');
	
	payAmtCalculate();
}

/* 쿠폰 취소 or 선택가능 */
function applyCopnDc() {
	
	var top1Coupon = '${top1Coupon}';
	//console.log(top1Coupon);
	
	// 쿠폰이 선택되어있을때
	if(!$("input[name=copnDcAply]").prop("checked")){
		$("#divCopnInfArea input[name=coupon_id]").val('');
		$("#divCopnInfArea input[name=coupon_nm]").val('');
		$("#divCopnInfArea input[name=coupon_price]").val('');
		$("#divCopnInfArea input[name=coupon_min_price]").val('');
		$("#divCopnInfArea input[name=coupon_valid_dt]").val('');
		$("#divCopnInfArea input[name=user_id]").val('');
		$("#divCopnInfArea input[name=coupon_active]").val('');
		
		$("#copnSaleDiv .price").empty();
	} else {
		$("#divCopnInfArea input[name=coupon_id]").val('${top1Coupon.coupon_id}');
		$("#divCopnInfArea input[name=coupon_nm]").val('${top1Coupon.coupon_nm}');
		$("#divCopnInfArea input[name=coupon_price]").val('${top1Coupon.coupon_price}');
		$("#divCopnInfArea input[name=coupon_min_price]").val('${top1Coupon.coupon_min_price}');
		$("#divCopnInfArea input[name=coupon_valid_dt]").val('${top1Coupon.coupon_valid_dt}');
		$("#divCopnInfArea input[name=user_id]").val('${top1Coupon.user_id}');
		$("#divCopnInfArea input[name=coupon_active]").val('${top1Coupon.coupon_active}');
		
		var addCouponPriceHtml = '';
		addCouponPriceHtml += "<strong style='margin-right:24px; color:#09f; font-size:14px;'>${top1Coupon.coupon_nm}</strong>";
		addCouponPriceHtml += "<strong id='copnDcAplyAmt'>-"+priceToString(${top1Coupon.coupon_price})+"</strong>";
		addCouponPriceHtml += "원";
		$("#copnSaleDiv .price").append(addCouponPriceHtml);
		
	}
	payAmtCalculate();
	
}

/* 적립금 사용 */
function useUpoint() {
	
	// 적립금 체크 안되어있을시
    if ( $("input[name=upointCheck]").prop("checked") ) {

        var upoint = Number($("input[name='uPoint']").val()); // 가지고 있는 적립금
        $("input[name=useUPoint]").val(priceToString(upoint));
        
    } else { //적립금 체크 되어있을시
        $("input[name=useUPoint]").val("0");
    }
	
   directInsertUPoint($("input[name=useUPoint]"));
   payAmtCalculate();
}


/* 적립금 얼마나 사용할지 */
function directInsertUPoint(obj) {
	
	//console.log($(obj).val())
	
	var upoint = Number($("input[name='uPoint']").val()); //현재 내가 가지고있는 적립금
	var usePoint = isEmpty($(obj).val()) ? 0 : Number(($(obj).val()).replace(/[^0-9]/g,'')); //사용할 적립금
	var total_amount = Number($("input[name='totPayAmt']").val());
	
	// 적립금 100원 이상 써야함 체크
	if (usePoint < 100 && usePoint > 0) {
		alert("최소 100P를 사용해야 합니다.");
		$("input[name=useUPoint]").val("0");
		$("input[name=upointCheck]").prop("checked", false);
		usePoint = 0;
		return;
	}
	
	//현재 내가 가진 적립금보다 더 큰 금액을 쓸 경우
	if (usePoint > upoint) {
		alert("사용하실 적립금이 보유한 적립금보다 큽니다.");
		$("input[name=useUPoint]").val(priceToString(upoint));
		return;
	}
	
	if (usePoint > total_amount) {
		alert("총 결제금액보다 많이 사용할 수 없습니다.");
		$("input[name=useUPoint]").val("0");
		$("input[name=upointCheck]").prop("checked", false);
		usePoint = 0;
		return;
	}
	
	$("input[name=upointCheck]").prop("checked", false);
	
	if ( Number(($(obj).val()).replace(/[^0-9]/g,'')) > 0 ) {
        $("input[name=upointCheck]").prop("checked", true);
    }
	
	$(obj).val(priceToString(usePoint));
	$("#hpointUseLi > input[name=useUPoint]").val(usePoint);
	
	payAmtCalculate();
}

/* 예치금 사용 */
function useUBalance() {
	
	// 적립금 체크 안되어있을시
    if ( $("input[name=uBalanceCheck]").prop("checked") ) {

        var uBalance = Number($("input[name='uBalance']").val()); // 가지고 있는 적립금
        $("input[name=useUBalance]").val(priceToString(uBalance));
        
    } else { //적립금 체크 되어있을시
        $("input[name=useUBalance]").val("0");
    }
	
   directInsertUBalance($("input[name=useUBalance]"));
   payAmtCalculate();
}


/* 예치금 얼마나 사용할지 */
function directInsertUBalance(obj) {
	
	//console.log($(obj).val())
	
	var uBalance = Number($("input[name='uBalance']").val()); //현재 내가 가지고있는 적립금
	var useBalance = isEmpty($(obj).val()) ? 0 : Number(($(obj).val()).replace(/[^0-9]/g,'')); //사용할 적립금
	var total_amount = Number($("input[name='totPayAmt']").val());
	
	//현재 내가 가진 적립금보다 더 큰 금액을 쓸 경우
	if (useBalance > uBalance) {
		alert("사용하실 예치금이 보유한 예치금보다 큽니다.");
		$("input[name=useUBalance]").val('0');
		$("input[name=uBalanceCheck]").prop("checked", false);
		return;
	}
	
	//총 결제금액보다 많이 사용한 경우
	if (useBalance > total_amount) {
		alert("총 결제금액보다 많이 사용할 수 없습니다.");
		$("input[name=useUBalance]").val("0");
		$("input[name=uBalanceCheck]").prop("checked", false);
		useBalance = 0;
		return;
	}
	
	
	$("input[name=uBalanceCheck]").prop("checked", false);
	
	if ( Number(($(obj).val()).replace(/[^0-9]/g,'')) > 0 ) {
        $("input[name=uBalanceCheck]").prop("checked", true);
    }
	
	$(obj).val(priceToString(useBalance));
	$("#hpointUseLi > input[name=useUBalance]").val(useBalance);
	
	payAmtCalculate();
}

function payAmtCalculate() {
	var totPayAmt = 0; //총 결제금액
	var prd_price = 0; //상품 총 금액
	var coupon_price = 0; //쿠폰 할인 금액
	var usePoint = 0; //적립금 사용 금액
	var useBalance = 0; // 예치금 사용 금액
	var totDiscountRate = 0;
	
	$("li[name=orderItem]").each(function(index) { //상품 총 금액 계산
		prd_price += Number($("input[name=prd_price]").eq(index).val());
	});
	
	coupon_price = Number($("#divCopnInfArea input[name=coupon_price]").val());
	usePoint = Number($("#hpointUseLi input[name=useUPoint]").val());
	useBalance = Number($("#hpointUseLi input[name=useUBalance]").val());
	totPayAmt = prd_price - (coupon_price + usePoint + useBalance);
	
	// 할인율 할인액/정가 * 100
	totDiscountRate = (coupon_price / prd_price * 100)
	
	
	
	
	$("input[name=totPayAmt]").val(totPayAmt);
	$("input[name=couponDcAmt]").val(coupon_price);
	$("input[name=usePointAmt]").val(usePoint);
	$("input[name=useBalanceAmt]").val(useBalance);
	$("input[name=prdPriceAmt]").val(prd_price);
	$("input[name=discountAmt]").val(coupon_price+usePoint);

	// 하단 결제금액
	$("#main_totPayAmt").text(priceToString(totPayAmt));
	$("#main_orderAmt").text(priceToString(prd_price));
	$("#main_discountAmt").text('-'+priceToString(coupon_price));
	
	//오른쪽 옆 결제금액
	$("#orderAmt strong").text(priceToString(prd_price));
	$("#copnDcAmtDiv strong").text('-'+priceToString(coupon_price));
	$("#totDcAmtDd").text('-'+priceToString(coupon_price))
	$("#lastStlmAmtDd strong").text(priceToString(totPayAmt));
	$("#useUPointDiv strong").text(priceToString(usePoint));
	$("#useUBalanceDiv strong").text(priceToString(useBalance));
	
	//적립 예정 적립금
	$("input[name=ExpectPoint]").val(Math.ceil((totPayAmt+useBalance) * 0.01)); //예치금도 사용한걸로 판단하고 적립금을 줌..
	$("#ExpectPoint").text(priceToString(Math.ceil((totPayAmt+useBalance) * 0.01)));
	
	// 절약 금액
	$("#main_totDiscountRate").text("약 "+Math.round(totDiscountRate)+"% 절약");
	$("#totDcAmtDiv em").text("약 "+Math.round(totDiscountRate)+"% 절약");
}


</script>
<!-- 아임포트 -->
<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp49827942"); // 예: imp00000000

function order() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	console.log('${rentalProduct.sdate}');
	
	/* 결제 전 결제정보 입력 검사 */
	// 배송지가 입력되지 않았을 경우
	if (!$("#divDlvInfArea input[name=deliever_id]").val()) {
		alert("배송지를 입력해주세요.");
		var offset = $("#singleDstn").offset()
		$('html, body').animate({scrollTop : offset.top-($(window).height() / 2)}, 100);
		return;
	}
	// 주문자명이 입력되지 않았을 경우
	if(!$("#singleDstnMsg input[name=senderName]").val()) {
		alert("주문자명를 입력해주세요.");
		$("#singleDstnMsg input[name=senderName]").focus();
		return;
	}
	// 배송메시지가 없을 경우
	if(!$("#singleDstnMsg input[name=deliever_msg]").val()) {
		alert("배송 메시지를 선택해주세요.");
		$("#singleDstnMsg select[name=dlvMsgSelect]").focus();
		return;
	}
	// 배송 메시지를 입력하지 않았을 경우
	if ($("#singleDstnMsg input[name=deliever_msg]").val() =='직접 입력') {
		alert("배송 메시지를 입력해주세요.");
		$("#singleDstnMsg input[name=prsnMsg]").focus();
		return;
	}
	
	// 결제수단 체크 안되어있을경우
	if (!$("#payTypeHpp input[name=payment-type]").is(':checked')) {
		alert("결제 수단을 확인해주세요.");
		var offset = $("#payTypeHpp input[name=payment-type]").offset()
		$('html, body').animate({scrollTop : offset.top-($(window).height() / 2)}, 100);
		return;
	}
	
	// 결제수단 선택과 이에 따른 pg, pay_method 설정
	var objName = document.getElementsByName("payType");
	var pay_type='';
	
	var val_pg='';
	var val_pay_method='';
	
	for(var i=0; i<objName.length; i++){
	    if(objName[i].checked){
		   	//alert("선택한 결제수단 번호는 "+objName[i].value+"입니다");
		   	pay_type=objName[i].value;
		   	//alert(pay_type)
		}
	}
	
	switch (pay_type) {
	  case '10':
		  val_pg='kcp';
		  val_pay_method='card';
		  break;
	  case '20':
		  val_pg='html5_inicis';
		  val_pay_method='vbank';
		  break;
	  case '30':
		  val_pg='kakaopay';
		  val_pay_method='card';
		  break;
	  default:
	    alert( "결제 수단을 선택해주세요." );
	  	var offset = $("#payTypeHpp input[name=payment-type]").offset()
			$('html, body').animate({scrollTop : offset.top-($(window).height() / 2)}, 100);
	  	return;
	}
	
	// 주문동의 체크하지 않았을 경우
	if (!$("input[name=ordAgreeChk]").is(':checked')) {
		alert( "주문 동의를 확인해주세요." );
		return;
	}
	
	
	
	

	// 주문번호 생성
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var hours = ('0' + today.getHours()).slice(-2); 
	var minutes = ('0' + today.getMinutes()).slice(-2);
	var seconds = ('0' + today.getSeconds()).slice(-2);

	//console.log(val_merchant_uid);
	
	// 아임포트 결제 데이터
	var val_merchant_uid = year+month+day+hours+minutes+seconds;
	var val_name = $("input[name=prd_nm]").val();
	var val_amount = $("input[name=totPayAmt]").val();
	var val_buyer_email = '${principal_email}';
	var val_buyer_name = $("input[name=senderName]").val();
	var val_buyer_tel = $("#divDlvInfArea input[name=deliever_hp_no]").val();
	var val_buyer_addr = "("+$("#divDlvInfArea input[name=address_f]").val()+") "+ $("#divDlvInfArea input[name=address_l]").val();
	
	
	IMP.request_pay({
	    pg : val_pg,
	    pay_method : val_pay_method,
	    merchant_uid: val_merchant_uid, // 상점에서 관리하는 주문 번호를 전달
	    name : val_name,
	    amount : val_amount,
	    buyer_email : val_buyer_email,
	    buyer_name : val_buyer_name,
	    buyer_tel : val_buyer_tel,
	    buyer_addr : val_buyer_addr
	}, function(rsp) {
		if (rsp.success) {
			// below rsp is come from import
			//console.log('빌링키 발급 성공',rsp)
			
			
			//rental_prd_order_t
			var prd_order_id = rsp.merchant_uid; //주문번호
			var user_id = '${principal_user_id}'; //유저 id
			var recipient = $("#divDlvInfArea input[name=receiver_nm]").val(); //받는사람이름
			var pmt_amount = rsp.paid_amount; //최종 주문 금액
			var address_dest = rsp.buyer_addr; //배송지
			var tel_no = rsp.buyer_tel;
			var hp_no = rsp.buyer_tel;
			var order_comment = $("input[name=deliever_msg]").val();
			var order_date = new Date().valueOf();
			var prd_id = $("li[name=orderItem] input[name=prd_id]").val();
			//var prd_pmt_id = prd_pmt_id의 시퀀스
			var order_flag = 'STEP5';
			//var cancel_date = new Date();
			var ticket = $("li[name=orderItem] input[name=ticket]").val();
			
			
			// rental_user_dt_t
			var sdate = new Date();
			var edate = new Date();
			var rental_flag = 'STEP2';
			
			// prd_payment_t
			//var prd_pmt_id = 시퀀스
			//var prd_order_id = rsp.merchant_uid;
			var pmt_time = new Date().valueOf(); //결제 시간
			var pmt_id = rsp.pg_tid; //결제 고유 번호
			var user_nm = rsp.buyer_name; //입금자명

			var vbank_holder = rsp.vbank_holder;
			var vbank_name = rsp.vbank_name;
			var vbank_num = rsp.vbank_num;
			var vbank_date = new Date(rsp.vbank_date).valueOf(); //입금기한
			var pay_status = rsp.status;
			var pay_method = rsp.pay_method;
			
			var coupon_discount_amount = Number($("input[name=couponDcAmt]").val());
			var reserve_discount_amount = Number($("input[name=usePointAmt]").val());
			var balance_discount_amount = Number($("input[name=useBalanceAmt]").val());
			
			// 가상계좌 외
			if (pay_method != 'vbank'){
				pay_method = 'card';
				
				vbank_holder='';
				vbank_name='';
				vbank_num='';
				vbank_date= new Date()-new Date();
				
				order_flag = 'STEP5';
			}
			
			// 사용한 coupon 삭제용
			var coupon_id = $("#divCopnInfArea input[name=coupon_id]").val();
			
			// 주문화면과 아임포트로부터 날라온 정보로 정보 생성
			// 결제 관련 테이블들에 Insert되거나 세션에 저장될 정보들		
			
			var rentalCompleteDTO = {
					// rental_prd_order_t
					prd_order_id : prd_order_id,
					user_id : user_id,
					recipient : recipient,
					pmt_amount : pmt_amount,
					address_dest : address_dest,
					tel_no : tel_no,
					hp_no : hp_no,
					order_comment : order_comment,
					order_date : order_date,
					prd_id : prd_id,
					order_flag : order_flag,
					ticket : ticket,
					
					// rental_user_dt_t
					sdate : sdate,
					edate : edate,
					rental_flag : rental_flag,
					
					// prd_payment_t
					pmt_time : pmt_time,
					pmt_id : pmt_id,
					user_nm : user_nm,
					
					vbank_holder : vbank_holder,
					vbank_name : vbank_name,
					vbank_num : vbank_num,
					vbank_date : vbank_date,
					pay_status : pay_status,
					pay_method : pay_method,
					
					coupon_discount_amount : coupon_discount_amount,
					reserve_discount_amount : reserve_discount_amount,
					balance_discount_amount : balance_discount_amount,
					
					coupon_id : coupon_id
					//expectPoint : expectPoint
			};
			
			
			// 유효한 결제정보를, rentalOrderComplete post controller로 전송 for DB 테이블
			$.ajax({
				url : "${app}/rental/rentalComplete",
				method : "POST",
				data : JSON.stringify(rentalCompleteDTO),
				contentType : "application/json",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(data) {
					alert('결제가 완료되었습니다.');
					//console.log(data);
					location.href = '${app}/rental/rentalComplete';
				},
				error : function(error) {
					alert(error);
				}
				
			});
			
		} else {
			//alert('빌링키 발급 실패');
			var msg = '결제에 실패하였습니다.\n';
            msg += rsp.error_msg;
            alert(msg);
            return false;
		}
	});
}
	
</script>
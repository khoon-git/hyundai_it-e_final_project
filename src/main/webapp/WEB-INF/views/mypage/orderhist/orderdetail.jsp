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
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/mp/mypage.css">
<script type="text/javascript" src="//image.hmall.com/p/js/co/jquery.form.js"></script>
</head>

                        <h3 class="title22">상세 주문 내역</h3>
                        
                        <!-- 주문접수/추가구상품 있는 경우 -->
                        <div class="order-list">
                            <dl>
                                <dt>
                                    <div class="date">
                                        <span>주문일</span>
                                        <strong><fmt:formatDate value="${orderDTO.order_date}" type="date" /></strong>
                                        <span>주문번호</span>
                                        <strong>${orderDTO.prd_order_id}</strong>
                                        <span style="display:none">주문매체</span>
                                        <strong style="display:none">PC주문</strong>
                                    </div>
<!-- 	                                    <div class="abs">
	                                        20200915 총결제금액 삭제 주문내역삭제 버튼 추가 (시안 09/11 기준)
	                                        <button class="btn atext" onclick="openLayerPup('ordHidePupLayer');"><span>주문내역 삭제</span><i class="icon xiconsm"></i></button>
	                                    </div> -->
                                </dt>
                                	<c:forEach items="${orderDTO.orderDetailList}" var="list" varStatus="vs">
										<!--상품 및 배송지 정보 그룹-->
										<!--상품정보 테이블 컨테이너-->
			                                <!-- 주소정보 시작 -------------------------------------------------------- -->
		                                    <!-- 주소정보 종료 -------------------------------------------------------- -->
		                                    <!--  2020.07.31 박민성 묶음상품 조건 추가  -->
		                                    <!-- 상품정보 시작 -------------------------------------------------------- -->
				                                <!-- <input type="hidden" name="lastOrdStatGbcdNm"    value="주문취소"/> -->
				                                <!-- 20201230 날짜 조건추가  -->
			                                    <!-- 배송비 변경 버튼 제어 조건  -->
			                                    <!-- 묶음 상품일 경우 배송비비용발생번호와 같은 상품들끼리 카운트 및 추가 배송비를 합한다. -->
		                                        <!-- 배송사 코드  -->
			                                    <!-- 상품정보 세팅 -->
			                                    <%-- <c:choose>
												    <c:when test="${fn:length(list) == 1}">
												    	<dd class="btn-col"><!-- 버튼 1개일경우 class="btn-col" 추가, 버튼 2개 이상일경우 class="btn-col2" 추가 -->
												</c:when>
												    <c:otherwise> --%>
												    	<dd class="btn-col2"><!-- 버튼 1개일경우 class="btn-col" 추가, 버튼 2개 이상일경우 class="btn-col2" 추가 --> <%--
												    </c:otherwise> 
												</c:choose> --%>
				                                    <a href="${app}/p/${list.prd_board_id}">
				                                        <span class="img"><img src="${list.upload_path}" alt="${list.prd_nm}" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')"/></span>
				                                        <div class="box">
				                                        	<c:choose>
				                                        		<c:when test="${list.order_flag == '주문취소'}">
				                                        			<span class="state red">
				                                        		</c:when>
				                                            	<c:otherwise>
				                                            		<span class="state sky">
				                                            	</c:otherwise>
				                                        		</c:choose>
				                                        		${list.order_flag}
				                                        		<em class="color-999">
						                                        </em>
						                                        </span>
				                                            <span class="tit">${list.prd_nm}</span>
			                                                <!--엄지펀딩 배송예정시작일 시작-->
			                                                <!--엄지펀딩 배송예정시작일 끝-->
				                                            <div ttt class="info" >
				                                                <ul>
				                                                    <li>${list.prd_count}개</li>
				                                                </ul>
				                                            </div>			
				                                            <span class="price">
																<strong><fmt:formatNumber value="${list.prd_price}" pattern="#,###"/></strong>원
				                                            </span>
				                                            <!-- 2017.11.07 최연태 설치상품 배송예정일 노출 -->
				                                        </div>
				                                    </a>
													
													<c:if test="${list.order_flag == '주문접수' || list.order_flag == '결제완료' || list.order_flag == '상품준비중'}">
													<div class="btngroup">
						                            	<button class="btn btn-linelgray small30" type="button"
							                            	onclick="location.href='${app}/mypage/oc?orderDetailNo=${list.prd_orderdetail_id}&orderNo=${orderDTO.prd_order_id}'">
							                            	<span>주문취소</span>
						                            	</button>
						                            </div>
													</c:if>
													<c:if test="${list.order_flag == '상품발송' || list.order_flag == '배송완료'}">
													<div class="btngroup">
														<button class="btn btn-linelgray small30" type="button"
															onclick="openCnslAcptPup('20220527277541','1','rtp');">
															<span>반품신청</span>
														</button>
														<button class="btn btn-linelgray small30" type="button"
															onclick="openCnslAcptPup('20220527277541','1','exch');">
															<span>교환신청</span>
														</button>
														<button class="btn btn-linelgray small30" type="button"
															onclick="openDlvTrcUrlPup('20220527277541', '1')">
															<span>배송조회</span>
														</button>
														<button class="btn btn-linelgray small30" type="button"
															onclick="openItemEvalPopup('2068295310', '00005', '20220527277541')">
															<span>상품평쓰기</span>
														</button>
													</div>
													</c:if>
											</dd> <!-- //.btn-col2 -->
				                 </c:forEach>
				                                <!-- 선물하기 합주문 - 배송정보 나뉘는것 방지 -->
			                                <!-- 2020.12.21 선물하기 케이스 UI변경(상단 주소지 정보에서 보여주던 방식에서 스토어픽 형태로 보여주는 방식으로 변경한다.) -->
                            </dl>
                        </div> <!-- //.order-list -->
                        <!-- // 주문접수/추가구상품 있는 경우 -->
                        <!-- 스토어픽 조건이 아닌경우 처리한다. -->
			                        <h3 class="title22">배송지</h3>
		                                <div class="address-box" data-dstnseq="0000000001">
                                            <form name="updateDstnAdr" method="post">
                                                <input type="hidden" name="ordNo" value="20220526293164">
                                                <input type="hidden" name="dstnSeq" value="0000000001">
                                                <input type="hidden" name="rcvCustNm">
                                                <!-- 같은 배송지에 여러 상품이 있는 경우 주소변경 시 같이 변경되도록... 2020.12.30 김기호 -->
                                                <input type="hidden" name="adrKndGbcd">
                                                <input type="hidden" name="dstnPostNo">
                                                <input type="hidden" name="dstnPostNoSum">
                                                <input type="hidden" name="dstnBaseAdr">
                                                <input type="hidden" name="dstnPtcAdr">
                                                <input type="hidden" name="dstnTela">
                                                <input type="hidden" name="dstnTels">
                                                <input type="hidden" name="dstnTeli">
                                                <input type="hidden" name="dstnHpIdntNo">
                                                <input type="hidden" name="dstnHpIntmNo">
                                                <input type="hidden" name="dstnHpBckNo">
                                                <input type="hidden" name="dawnDlvYn" value="N">
                                                <input type="hidden" name="dsrvCoMsg">
                                                <input type="hidden" name="halfDlvYn" value="N">
                                            </form>
		                                    <div class="top-box">
		                                        <p class="name" name="rcvCustNm">${orderDTO.recipient}
			                                        <!-- span class="tag red">기본 배송지</span 2020.12.09 Hmall기획에서 제거 요청 -->
		                                        </p>
												<!-- 일반주소 -->
												<p class="add" name="dstnAdr">${orderDTO.address_dest}</p>
		                                        <p class="tel" name="hpNo">${orderDTO.hp_no}</p>
		                                        <!-- 전화번호2 추가[2021.01.06] -->
		                                                <p class="tel" name="telNo"></p>
		                                        <!-- 주소 변경 버튼 조회 기준 변경[2021.01.20] -->
		                                    </div>

		                                    <div class="bottom-box">
		                                        <dl>
		                                            <dt>주문자명</dt>
		                                            <dd name="ordCustNm">${orderDTO.user_id}</dd>
		                                        </dl>
                                                <dl>
                                                    <dt>배송메모</dt>
                                                    <dd name="dsrvCoMsg">
                                                    	${orderDTO.order_comment}
                                                    </dd>
                                                </dl>
		                                    </div>
		                                </div> <!-- //.address-box -->
                        <h3 class="title22">결제 정보</h3>
                        <div class="pay-info-box">
                            <ul>
                                <li>
                                    <dl class="between top">
                                        <dt>총 주문금액</dt>
                                        <dd>
													<strong><fmt:formatNumber value="${orderDTO.total_amount}" pattern="#,###"/></strong>원
                                        </dd>
                                    </dl>
                                </li>
                                <li>
                                    <span class="minus-icon"><i class="icon"></i></span>
                                    <dl class="between top">
                                        <dt>할인금액</dt>
                                        <dd><strong><span class="sumjH"><fmt:formatNumber value="${orderDTO.discount_amount}" pattern="#,###"/></span></strong>원</dd>
                                    </dl>
                                </li>
                                <li>
                                    <span class="result-icon"><i class="icon"></i></span>
                                    <dl class="between top">
                                        <dt>결제하신 금액</dt>
                                        <dd class="result">
                                        	<strong><fmt:formatNumber value="${orderDTO.total_amount - orderDTO.discount_amount}" pattern="#,###"/></strong>원
                                        </dd>
                                    </dl>
                                    <div class="detail-info">
		                                    <!-- 클래스 sumj3Tip 와 sumj3Tip2는 상항에 따라서 보여줬다가 숨겨줬다가 하시면 됩니다.SB 99, 133페이지참고. -->
                                    </div> <!-- //.detail-info -->
                                </li>
                            </ul>
                            <ul class="col">
				                <!-- 20140306 - 적립예정 포인트 -->
				                <!-- TODO 곽희섭 20170511 H포인트를 적립금으로 수정 -->
                            </ul>
                        </div> <!-- //.pay-info-box -->
	                        <h3 class="title22">결제/취소 내역
	                            <div class="btngroup abs">
	                            </div>
	                        </h3>
			                        <div class="history-box">
				                        <p class="ctypo15 bold">[결제] <fmt:formatDate value="${orderDTO.order_date}" type="date" pattern="yyyy. MM. dd"/></p>
					                    <ul>
					                    	<c:if test="${orderDTO.reserve_discount_amount != 0}">
											<li>
											    <div class="tit-wrap">H.Point</div>
											    <div class="txt-wrap"><strong><fmt:formatNumber value="${orderDTO.reserve_discount_amount}" pattern="#,###"/></strong>P (에누리 대상 5)</div>
											</li>
											</c:if>
											<c:if test="${orderDTO.coupon_discount_amount != 0}">
											<li>
											    <div class="tit-wrap">쿠폰</div>
											    <div class="txt-wrap"><strong><fmt:formatNumber value="${orderDTO.coupon_discount_amount}" pattern="#,###"/></strong>원</div>
											</li>
											</c:if>
											<c:if test="${orderDTO.balance_discount_amount != 0}">
											<li>
											    <div class="tit-wrap">예치금</div>
											    <div class="txt-wrap"><strong><fmt:formatNumber value="${orderDTO.balance_discount_amount}" pattern="#,###"/></strong>원</div>
											</li>
											</c:if>
											<li>
												<c:if test="${orderDTO.pay_method == 'card'}">
													<div class="tit-wrap">카드</div>
												</c:if>
												<c:if test="${orderDTO.pay_method == 'vbank'}">
													<div class="tit-wrap">현금</div>
												</c:if>
												<div class="txt-wrap"><strong><fmt:formatNumber value="${orderDTO.pmt_amount}" pattern="#,###"/></strong>원</div>
											</li>
					                    </ul>
			                        </div>
			                        <c:forEach items="${orderDTO.orderDetailList}" var="odl">
			                        <c:if test="${odl.cancel_date != null}">
			                        <div class="history-box">
				                        <p class="ctypo15 bold">[취소] <fmt:formatDate value="${odl.cancel_date}" type="date" pattern="yyyy. MM. dd"/></p>
					                    <ul>
					                    	<c:if test="${orderDTO.reserve_discount_amount != 0}">
											<li>
											    <div class="tit-wrap">H.Point</div>
											    <div class="txt-wrap"><strong><fmt:formatNumber value="${orderDTO.reserve_discount_amount}" pattern="#,###"/></strong>P (에누리 대상 5)</div>
											</li>
											</c:if>
											<c:if test="${orderDTO.balance_discount_amount != 0}">
											<li>
											    <div class="tit-wrap">예치금</div>
											    <div class="txt-wrap"><strong><fmt:formatNumber value="${orderDTO.balance_discount_amount}" pattern="#,###"/></strong>원</div>
											</li>
											</c:if>
											<li>
												<c:if test="${orderDTO.pay_method == 'card'}">
													<div class="tit-wrap">카드</div>
												</c:if>
												<c:if test="${orderDTO.pay_method == 'vbank'}">
													<div class="tit-wrap">현금</div>
												</c:if>
												<div class="txt-wrap"><strong><fmt:formatNumber value="${odl.prd_price}" pattern="#,###"/></strong>원</div>
											</li>
					                    </ul>
			                        </div>
			                        </c:if>
			                        </c:forEach>
                        <!-- [2020.12.09] 기획에서 서비스 안내 영역 제거 요청
                        <div class="guide-box">
                            <h4 class="ctypo18">서비스 안내</h4>
                            <ul class="dotlist">
                                <li>반품, 교환 신청은 배송 완료 후 7일 이내에만 가능합니다. 16:00 이전 접수 문의는 당일 처리/답변을 원칙으로 하며, 16:00이후 접수문의는 익일 처리됩니다.</li>
                                <li>반품 후 환불은 결제 수단에 따라 회수완료 시점으로부터 최대 7일 내 처리됩니다.</li>
                                <li>현금결제수단(무통장, 실시간 계좌이체 등) 환불은 예치금으로 환불됩니다.</li>
                                <li>주말이나 휴일 접수건의 경우 월요일 또는 익영업일에 처리 되오니 시간 양해 부탁드립니다.</li>
                                <li>취소 신청은 주문 완료 후 주문 당일 24시까지만 가능합니다.</li>
                            </ul>
                        </div>
                        -->
                        <div class="guide-box">
                            <h4 class="ctypo18">청약 철회 청구 안내</h4>
                            <ul class="dotlist">
                                <li>상품을 인도받은 날로부터 7일 이내에 대해 계약에 대한 청약철회가 가능합니다.<br>(상품명 주변에 TV쇼핑이 표시된 상품은 상품 인도일 이후 30일/의류,보석,핸드백,슈즈,선글라스 15일/농산물,수산물,축산물 등 신선식품 7일 이내 교환 및 반품가능)</li>
                            </ul>
                        </div>
                        <!-- 2020-09-03 텍스트 수정 -->
                        <div class="guide-box">
                            <h4 class="ctypo18">꼭 읽어보세요! Notice</h4>
                            <ul class="dotlist">
                                <li>주문상태가 '상품발송'인 경우 배송조회가 가능합니다. 단 주문하신 상품을 업체에서 직접 배송하는 경우 배송조회가 이루어지지 않을 수 있습니다.</li>
                                <li>결제수단을 무통장 입금이나 상품권으로 선택한 경우, 주문일로부터 <strong class="color-666">7일 이내 입금 및 접수확인이 되지 않으면 주문이 취소</strong>됩니다.</li>
                                <li>복합결제 후 일부 금액만 결제한 경우 주문일로부터 7일 후 주문이 취소되며, 결제한 금액은 환불처리됩니다. 단, 현금 결제는 예치금으로 환불됩니다.</li>
                                <li><strong class="color-666">반품 및 교환 신청은 상품발송 후 7일 이내</strong>에 가능합니다.</li>
                                <li>반품 신청 시 반품상품이 도착한 후 상품 상태를 점검한 다음에 결제가 취소됩니다. 단, 상품 점검 시 반품 불가 사유에 해당하는 경우 고객님께 통보 후 상품을 다시 발송해 드립니다.</li>
                                <li>주문과 관련하여 문의사항이 있으실 경우 고객센터(1600-0000) 혹은 Hmall 1:1상담신청을 통해 문의 바랍니다.</li>
	                            <li class="non-dot">
	                            	<strong class="title16 color-666">1:1상담신청</strong>
		                                <button type="button" class="btn btn-linelgray small25" name="pop820x685" onClick="window.open('${app}/cs/qnaInsPopUp','1:1 문의하기','width=756,height=700')"><span>1:1 게시판상담</span></button>
                                </li>
                            </ul>
                        </div>
                    </div> <!-- //.mypage-order-wrap -->

                </div> <!-- // .contents -->  
            </div> <!-- //.gird-l2x -->
        </div> <!-- //.container -->
    </main> <!-- //.cmain -->
    <!-- footer include-->
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="app" value="${pageContext.request.contextPath}" />

<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />

<div class="order-wrap">
	<div class="order-top">
		<h2 class="title30">주문완료</h2>
		<ol class="list-step">
			<li><strong>01</strong> <span>장바구니</span></li>
			<li><strong>02</strong> <span>주문서작성</span></li>
			<li class="active"><strong>03</strong> <span>주문완료</span></li>
		</ol>
	</div>

	<!-- 5만원 이사의 첫 구매가 아닐 때-->

	<div class="order-complete-box">
		<span class="bgcircle check-on-sm"><i class="icon check-on"></i></span>
		<p class="tit">대여주문이 완료되었습니다.</p>
		<p class="txt">
			(주문번호 : <em>${rentalDTO.prd_order_id }</em>)
		</p>
		<div class="btngroup">
			<button class="btn btn-default medium" onclick="location.href='${app}/mypage/retalListgo';">
				<span>주문 확인&amp;변경</span>
			</button>
		</div>
	</div>


	<h3 class="title22">상품/배송 정보</h3>

	<div class="order-info-box">
		<ul class="list">
			<li>
				<div class="tit-wrap">
					주문상품
				</div>
				<div class="txt-wrap">
					<p class="txt">${rentalDTO.prd_nm }
					</p>
				</div>
			</li>

			<li>
				<div class="tit-wrap">받는 분</div>
				<div class="txt-wrap">
						<p class="txt">${rentalDTO.recipient }</p>
				</div>
			</li>

			<li>
				<div class="tit-wrap">배송지</div>
				<div class="txt-wrap">
						<p class="txt">${rentalDTO.address_dest }</p>
					<ul class="user-info">
						<li>${rentalDTO.hp_no }</li>
					</ul>
				</div>
			</li>
		</ul>
	</div>

	<h3 class="title22">대여 정보</h3>

	<div class="order-info-box">
		<ul class="list">
			<li>
				<div class="tit-wrap">
					대여시작일
				</div>
				<div class="txt-wrap">
					<fmt:formatDate value="${rentalDTO.sdate }" />
				</div>
			</li>

			<li>
				<div class="tit-wrap">
					대여만료일
				</div>
				<div class="txt-wrap">
					 <fmt:formatDate value="${rentalDTO.edate }" />
				</div>
			</li>

		</ul>
	</div>

	<h3 class="title22">결제 정보</h3>
	<div class="order-info-box">

		<table>
			<caption>결제 정보</caption>
			<colgroup>
				<col style="width: 95px">
				<col style="width: auto">
				<col style="width: 100%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">주문 금액</th>
					<td>
						<p class="price">
							<strong><fmt:formatNumber value="${rentalDTO.pmt_amount}" pattern="###,###,###" /></strong>원
						</p>
					</td>
					<td></td>
				</tr>

				<tr>

					<th scope="row" rowspan="1">결제 방법</th>

					<td>
						<p class="price">
							<strong><fmt:formatNumber value="${rentalDTO.pmt_amount}" pattern="###,###,###" /></strong>원
						</p>
					</td>
					<td>
					<c:choose>
						<c:when test="${rentalDTO.pay_method == 'vbank' }">
							<p class="txt">(무통장입금)</p>
						</c:when>
						<c:when test="${rentalDTO.pay_method == 'card' }">
							<p class="txt">(간편/신용결제)</p>
						</c:when>
					</c:choose>
					</td>
				</tr>

			</tbody>
		</table>
		<c:choose>
			<c:when test="${rentalDTO.pay_method == 'vbank' }">
				<div class="bg-gray-box">
					<p class="bank">
						<strong>${rentalDTO.vbank_name }</strong> <em>${rentalDTO.vbank_num }</em>
					</p>
					<p class="txt">
						고객전용 계좌번호가 생성됩니다. <br>주문 완료 화면에서 확인하실 수 있습니다.
					</p>
				</div>
			</c:when>
			<c:when test="${rentalDTO.pay_method == 'card' }">
				<div class="bg-gray-box">
					<p class="bank">
						<strong>카드결제</strong>
					</p>
				</div>
			</c:when>
			<c:otherwise>
			</c:otherwise>

		</c:choose>

		<ul class="dotlist color-red">
			<li>결제완료 순서대로 배송이 진행되므로, 무통장 결제 시 입금이 늦어지면 결제가 되었더라도 품절 및 재고부족으로 대여주문이 취소될
				수 있습니다.</li>
		</ul>

	</div>

</div>

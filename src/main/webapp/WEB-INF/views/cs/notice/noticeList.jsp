<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 스프링 시큐리티 관련 태그 라이브러리 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<head>
<style>
ul.pagination.justify-content-center {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    margin-top: 15px;
    margin-bottom: 15px;
}

li.paginate_button {
    margin-left: 10px;
}

li.paginate_button {
    margin-left: 10px;
    display: block;
    border: 1px solid #eee;
    background: #eee;
    border-radius: 4px;
    padding: 2px;
    text-align: center;
    font-size: 12px;
}

li.paginate_button.active {
    font-family: none;
    font-weight: 900;
    font-size: inherit;
    background: space;
    border: none;
}

form#searchForm {
    display: flex;
    align-items: center;
    justify-content: end;
}

select.form-control {
    width: 170px !important;
}

input.form-control {
    padding: 8px;
    border: 1px solid #eee;
    margin-left: 3px;
    margin-right: 5px;
    width: 200px;
}

select {
    height: 35px !important;
}

.btn {
    height: 35px !important;
}

.btn-default {
    background-color: #eee;
}

</style>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${app}/resources/css/customer.css">
	<script type="text/javascript">
	$(document).ready(function() {
		console.log("test");
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr('href'));
			actionForm.submit();
		});
		
		
		// 게시물 클릭 시 페이징 정보와 함께 전송
		$(".move").on("click", function(e) {
			e.preventDefault();
			var aid = $(this).children("input[name='articleid']").val();
			let uri = "${app}" + '/cs/noticeView';
			actionForm.find("input[name='articleid']").val(aid);
			console.log(uri);
			actionForm.attr('action', uri);
			actionForm.submit();
		});
	});
	</script>
</head>
			<div class="contents">
				<!--공지사항-->
				<div class="cus-wrap">
					<h3>공지사항</h3>
					<!--tblwrap tbl-list-->
					<div class="tblwrap tbl-list">
						<table>
							<caption>고객센터 공지사항</caption>
							<colgroup>
								<col style="width:675px">
								<col style="width:125px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="dto" varStatus="vs">
								<tr>
									<%-- <td class="nowrap">
										<a href="${app}/cs/noticeView?articleid=${dto.article_id}">${dto.title}</a>
										<c:if test="${dto.file_yn == '1'}">
											<!-- 파일 있으면 이미지 띄우기 -->
										</c:if>
									</td>
									<td class="txt-center"><span class="date"><fmt:formatDate value="${dto.ins_dt}" type="date" /></span></td> --%>
									<%-- <td style="width: 10%" class="text-center">${pageMaker.total - vs.index - ((pageMaker.cri.pageNum-1)*pageMaker.cri.amount)}</td> --%>
									<td class="nowrap">
										<a class="move" href="${app }/cs/noticeView">
											<input type="hidden" name="articleid" value="<c:out value="${dto.article_id}"></c:out>" /> 
											${dto.title}</a></td>
										<%-- <c:if test="${dto.file_yn == '1'}">
											<!-- 파일 있으면 이미지 띄우기 -->
										</c:if> --%>
									<td class="txt-center"><span class="date"><fmt:formatDate value="${dto.ins_dt}" type="date" /></span></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!--//tblwrap tbl-list-->
					<!--paging-->
					<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a href="${pageMaker.startPage - 1}">&lt;</a></li>
							</c:if>
			
							<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active': '' }"><c:if test="${pageMaker.cri.pageNum != num}">
								<a href="${num }">${num }</a></c:if><c:if test="${pageMaker.cri.pageNum == num}"><div>${num }</div></c:if></li>
							</c:forEach>
			
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next">
								<a href="${pageMaker.endPage + 1}">&gt;</a></li>
							</c:if>
					</ul>
					<!--paging-->
					<%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
						<a class="btn btn-default pull-right" style="border:1px soild" href="insert">글쓰기</a>
					</sec:authorize> --%>
					<br/>
					<div class="row">
						<form class="form-inline" id="searchForm" action="${app }/cs/noticeList" method="get">
							<select class="form-control" name="type">
								<option value="T"
									>제목</option>
								<option value="C"
									>내용</option>
								<option value="W"
									>작성자</option>
								<option value="TC"
									>제목
									+ 내용</option>
								<option value="TW"
									>제목
									+ 작성자</option>
								<option value="TWC"
									>제목
									+ 작성자 + 내용</option>
							</select> 
								<input class="form-control" type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'> 
								<input type="hidden" value="${pageMaker.cri.pageNum }"> 
								<input type="hidden" value="${pageMaker.cri.amount }">
							<button class="btn btn-default">검색</button>
						</form>
					</div>
					
					<form id="actionForm" method="get">
						<input type="hidden" name="articleid"	value="">
						<input type="hidden" name="pageNum"	value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		
						<!-- 페이지 이동 시에도 검색 데이터와 함께 전송 -->
						<input type="hidden" name="type" value="${pageMaker.cri.type }">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
					</form>
					<!--//paging-->
				</div>
				<!--//공지사항-->
			</div>
			<!-- // .contents -->	
<!--
	<script type="text/javascript">

		var skySclbrodEndTime = "";
		var skyScldtvEndTime = "";

		function setOnAirSkySc() {
			try {
				$.ajax({
					type: "get"
					, url: "https://wwwca.hmall.com/p/coe/onAirList?time=051710"
					, dataType: "html"
					, async: true
					, success: function (data) {
						$('#skyScOnAirArea').append(data);

						if ($('#onAirHtime').length > 0) {
							skySclbrodEndTime = "" + $('#onAirHtime').data("brodenddtm");
							onAirTimerSkySc();
						}

						if ($('#onAirHdtime').length > 0) {
							skyScldtvEndTime = "" + $('#onAirHdtime').data("brodenddtm");

							// TV+샵은 마직막이 '00' 으로 끝남
							if (skyScldtvEndTime != "" && skyScldtvEndTime.length > 12)
								skyScldtvEndTime = skyScldtvEndTime.substring(0, 12) + "00";

							onAirTimer2SkySc();
						}

						// 카드 프로모션 
						setCardPromotion();

					}
					, error: function (e) {

						if ("https://wwwca.hmall.com" == "")
							return;

						$.ajax({
							type: "get"
							, url: "/p/coe/onAirList?time=051710"
							, dataType: "html"
							, async: true
							, success: function (data) {
								$('#skyScOnAirArea').append(data);

								if ($('#onAirHtime').length > 0) {
									skySclbrodEndTime = "" + $('#onAirHtime').data("brodenddtm");
									onAirTimerSkySc();
								}

								if ($('#onAirHdtime').length > 0) {
									skyScldtvEndTime = "" + $('#onAirHdtime').data("brodenddtm");

									// TV+샵은 마직막이 '00' 으로 끝남
									if (skyScldtvEndTime != "" && skyScldtvEndTime.length > 12)
										skyScldtvEndTime = skyScldtvEndTime.substring(0, 12) + "00";

									onAirTimer2SkySc();
								}

								// 카드 프로모션 
								setCardPromotion();

							}
							, error: function (e) {
							}
						});
					}
				});
			} catch (err) { }
		}

		function setCardPromotion() {
			try {
				$.ajax({
					type: "get"
					, url: "https://wwwca.hmall.com/p/coe/onAirCardPrmoList?time=051710"
					, dataType: "html"
					, async: true
					, success: function (data) {
						$('#skyScCardArea').append(data);
						$('body').commonUi('initLibrary'); //PC인경우
					}
					, error: function (e) {

						if ("https://wwwca.hmall.com" == "")
							return;

						$.ajax({
							type: "get"
							, url: "/p/coe/onAirCardPrmoList?time=051710"
							, dataType: "html"
							, async: true
							, success: function (data) {
								$('#skyScCardArea').append(data);
								$('body').commonUi('initLibrary'); //PC인경우
							}
							, error: function (e) {

							}
						});
					}
				});
			} catch (err) { }
		}

		function onAirTimerSkySc() {
			var now = new Date();
			var lbrdEndTime = new Date();
			lbrdEndTime.setHours(skySclbrodEndTime.substring(8, 10));
			lbrdEndTime.setMinutes(skySclbrodEndTime.substring(10, 12));
			lbrdEndTime.setSeconds(skySclbrodEndTime.substring(12, 14));

			var gap = (lbrdEndTime.getTime() - now.getTime()) / 1000;
			var leftTime = "";

			if (gap <= 0) {
				leftTime = "00:00:00";
				$("#onAirHtime").text(leftTime);
				return;
			}

			var hour = parseInt(gap / 3600);
			var min = parseInt((gap % 3600) / 60);
			var sec = parseInt(gap % 60);

			leftTime += ((hour < 10) ? "0" : "") + hour;
			leftTime += ((min < 10) ? ":0" : ":") + min;
			leftTime += ((sec < 10) ? ":0" : ":") + sec;

			$("#onAirHtime").text(leftTime);
			setTimeout("onAirTimerSkySc()", 1000);

		}

		function onAirTimer2SkySc() {
			var now = new Date();
			var lbrdEndTime = new Date();
			lbrdEndTime.setHours(skyScldtvEndTime.substring(8, 10));
			lbrdEndTime.setMinutes(skyScldtvEndTime.substring(10, 12));
			lbrdEndTime.setSeconds(skyScldtvEndTime.substring(12, 14));

			var gap = (lbrdEndTime.getTime() - now.getTime()) / 1000;
			var leftTime = "";

			if (gap <= 0) {
				leftTime = "00:00:00";
				$("#onAirHdtime").text(leftTime);
				return;
			}

			var hour = parseInt(gap / 3600);
			var min = parseInt((gap % 3600) / 60);
			var sec = parseInt(gap % 60);

			leftTime += ((hour < 10) ? "0" : "") + hour;
			leftTime += ((min < 10) ? ":0" : ":") + min;
			leftTime += ((sec < 10) ? ":0" : ":") + sec;

			$("#onAirHdtime").text(leftTime);
			setTimeout("onAirTimer2SkySc()", 1000);
		}

	</script>
-->
	<!-- 스카이 스크래퍼 (우측 배너광고) -->
	<!-- <div class="wing-banner banner-right"
		data-modules-sticky="padding:0;breakPoint:.header-menu-wrap;className:wing-banner-sticky">
		fixed 클래스 추가 시 고정
		<a href="/pevent/eva/evntTmplDivideView?prmoNo=00049341">
			<div class="visit-indicator">바로접속
				<span class="visit-staus on" style="margin-left: 0px">ON</span>
			</div>
		</a>
		<div class="recent-view-area" id="skyScOnAirArea">
		</div>
		<div class="qr_view_area">
			<span class="qr_txt">쇼핑라이브</span>
			<span class="img_qr"><img src="https://image.hmall.com/p/img/co/img-qr.jpg" alt="쇼핑라이브 qr이미지"></span>
		</div>
		<div class="wing-slide exhibition01" id="skyScCardArea">
		</div>
		// .wing-slide
		<div class="btn-top"><a href="javascript:;">TOP</a></div>
	</div>
	// 스카이 스크래퍼
	<script type="text/javascript">
		setTimeout(function () {
			setOnAirSkySc();
		}, 100);
		/*
		setTimeout(function() { 
			setCardPromotion();
		}, 300);
		*/
	</script>
	스카이스크래퍼 -->
	</body>
</html>
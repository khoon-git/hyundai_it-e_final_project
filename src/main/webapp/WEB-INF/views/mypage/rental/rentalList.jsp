<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.user.user_id" var="principal_user_id" />
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script>
<!-- jQuery Plugin -->
<script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script>
<!-- jQuery UI Effect -->
<script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script>
<!-- jQuery UI js -->
<link rel="stylesheet" type="text/css"
	href="${app}/resources/css/mypage.css">
<style>
					.mypage-order-wrap .title22 {
					    position: relative;
					    margin: 30px 10px 25px !important;
					}
					
					.inputbox {
							    display: flex;
							    justify-content: center !important;
							    position: relative;
							    height: 46px;
							    padding: 0;
							  }
							  
							.inputbox .btn-find {
							    position: inherit !important;
							    right: 34px !important;

							}
							.inplabel {
									    width: auto !important;
									}
							.filter-box {
								    padding: 14px !important;

								}
								
								.tblwrap {
									    margin-top: 100px !important;
									}
									
									.date {
									    display: inline-flex;
									    align-items: center;
									    color: #333;
    									font-size: 15px;
									}
									
									h5.rentaldate {
									    margin-right: 10px;
									}

										h5.wave {
										    margin: 0px 7px;
										    font-size: 14px;
										}
										.order-list > dl > dt .date span {
										    position: relative;
										    color: #666 !important;
										    font-size: 14px !important;
										    font-weight: 400;
										}
										.btngroup {
										    margin-left: 380px;
										}
										.order-list > dl > dt {
										    position: relative;
										    padding: 18px 20px;
										    background: #f8f8f8;
										}
										.hidden {
										    display: none;
										}
										
										
										.sample0 {
										    background: rgb(240, 246, 234);
										    padding: 10px;
										    font-size: 14px;
										    border: solid 1px transparent;
										    border-radius: 30px;
										    margin-top: 8px;
										    width: fit-content;
										}
</style>
 <script type="text/javascript">
 
 
 const countDownTimer = function (id, date) {
		var _vDate = new Date(date); // 엔드날짜
		var _second = 1000;
		var _minute = _second * 60;
		var _hour = _minute * 60;
		var _day = _hour * 24;
		var timer;

		function showRemaining() {
			var now = new Date(); // 현재날짜 
			var distDt = _vDate - now;
			if (distDt < 0) {
				clearInterval(timer);
				document.getElementById(id).textContent = '해당 대여가 종료 되었습니다!';
				return;
			}

			var days = Math.floor(distDt / _day);
			var hours = Math.floor((distDt % _day) / _hour);
			var minutes = Math.floor((distDt % _hour) / _minute);
			var seconds = Math.floor((distDt % _minute) / _second);
		
		
			document.getElementById(id).textContent = days + '일 ';
			document.getElementById(id).textContent += hours + '시간 ';
			document.getElementById(id).textContent += minutes + '분 ';
			document.getElementById(id).textContent += seconds + '초';
		}
	
		timer = setInterval(showRemaining, 1000);
	}
 
	
 $(document).ready(function(){
	 makeList();
 }); 
 
 
 
 function makeList() {
     var keyword = $("input[name='keyword']").val();
     var no_image_url = "https://image.hmall.com/hmall/pd/no_image_100x100.jpg";

     $.ajax({
         type: "GET"
         , url: "${app}" + "/mypage/rentalList"
         , dataType: 'json'
         , data: {
             keyword: keyword
         }
         , async : false
         , crossDomain: true
         , success: function (data) {
             var rentallist = data[0];
             var list = "";
             

             if (rentallist.length == 0) {
                 list += `<div class="nodata">
	  	 		            <span class=" bgcircle"><i class="icon nodata-type7"></i></span>
	  	 		            <p>대여한 상품이 없습니다.</p>
	  	 		           </div>`
             } else {
                 for (var i = 0; i < rentallist.length; i++) {

                     list += `<dl>
	  							<dt>
						<div class="date">
										<h5 class="rentaldate">대여 시작 : </h5>
											<span>` + Unix_timestamp(Unix_timestampConv(rentallist[i].sdate)) + `</span>
										<h5 class = "wave"> ~</h5>
										<h5 class="rentaldate">대여 종료 : </h5>
											<span>` + Unix_timestamp(Unix_timestampConv(rentallist[i].edate)) + `</span>`


                     if (rentallist[i].rental_flag == '대여중') {
                         list += `<div class="btngroup">
							  	 		       <button class="btn btn-linelgray small30" type="button"
							  	 		               onClick="window.open('${app}/mypage/rr?rentalorderNo=` + rentallist[i].prd_id + `','교환신청','width=588,height=724')"><span>반납접수</span>
							  	 		       </button>
							  	  </div>`
                 		}

                 list += `</div>
				  	 		   	</dt>
									<dd class="btn-col2">
									   <a href="${app}/rental/` + rentallist[i].prd_id + `">
				  					   <span class="img"><img src="` + rentallist[i].upload_path + `" alt=" ` + rentallist[i].prd_nm + `" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')"/></span>
									<div class="box">
											<span class="state sky">` + rentallist[i].rental_flag + `<em class="color-999">
											</em>
											</span> 
										<span class="tit">` + rentallist[i].prd_nm + `</span>`
										if (rentallist[i].rental_flag == '대여중') { 
										list += `
										<h2 class = "sample0" id="sample`+ i + `"></h2>
										<div class = "hidden">		             
										`+ countDownTimer('sample'+ i, rentallist[i].edate) + `
								  	 	</div>
										`
										}
										list += `</div>									
									</a>					                     	             
								</dd>				
							</dl>`
             }            
         }
             $(".order-list").html(list);
         }
     });
     $(".state:contains('대여접수')").css({color:"#3abbd5"});																													
     $(".state:contains('대여중')").css({color:"#0fc961"});
	 $(".state:contains('반납접수')").css({color:"#737373"});
	 $(".state:contains('반납완료')").css({color:"#ff5340"});
}

 <!--
function Unix_timestampHi(t){
	    var date = new Date(t*1000);
	    var year = date.getFullYear();
	    var month = " " + (date.getMonth()+1);
	    var day = " " + date.getDate();
	    var hour = "0" + date.getHours();
	    var minute = "0" + date.getMinutes();
	    var second = "0" + date.getSeconds();
	    return month.substr(-2) +"/"+ day.substr(-2) + "/" + year + hour + ":"   ;
	}
 
 -->
 
 

 
 

 	<!-- 유닉스 시간 전환 함수 --> 
	function Unix_timestamp(t){
	    var date = new Date(t*1000);
	    var year = date.getFullYear();
	    var month = " " + (date.getMonth()+1);
	    var day = " " + date.getDate();
	    var hour = "0" + date.getHours();
	    var minute = "0" + date.getMinutes();
	    var second = "0" + date.getSeconds();
	    return year + "." + month.substr(-2) + "." + day.substr(-2);
	}
	
	function Unix_timestampConv(t)
	{
	    return Math.floor(t/ 1000);
	}
	


 	
	

	

	function search(keyword){		
		$("input[name='keyword']").val(keyword);	
		makeList();
		$("input[name='keyword']").val("");
	}
	
	
	$(function () {
	    $("#txtItemNm").keyup(function (e) {
	    	if (e.keyCode == 13) {   		
	    		var keyword = $("input[name='txtItemNm']").val();
	    		search(keyword);
	    	}
	    })
    })

		
	 

 </script>
</head>
	<form id="formrental" method="get" action="${app}/mypage/rentalList">
		<input type="hidden" name="keyword" value="" />
	</form>
		<h3 class="title22">대여 조회</h3>

	<!-- 검색과 날짜 검색 start -->	
		<div class="filter-box">
				<input type="hidden" id="searchType" name="searchType" value="2" />
				<input type="hidden" class="from" name="strtDt" id="txtOrdStrtDt"
					maxlength="8" value="" /> <input type="hidden" class="to"
					name="endDt" id="txtOrdEndDt" maxlength="8" value="" />
				<div class="inputbox sm">
					<label class="inplabel icon-find"><input type="text"
						name="txtItemNm" id="txtItemNm" value="" placeholder="상품명 검색"></label>
					<button class="btn btn-find" type="button" id="serach">
						<i class="icon find"></i><span class="hiding">검색</span>
					</button>
					<button class="btn ico-clearabled">
						<i class="icon"></i><span class="hiding">지우기</span>
					</button>
				</div>
		</div>
	
		<div class="order-list">			
		</div>
		
		
		

		<div class="tblwrap">
			<h4 class="ctypo17">주문상태 안내</h4>
			<table>
				<caption>테이블 제목</caption>
				<colgroup>
					<col style="width: 140px">
					<col style="width: 160px">
					<col style="width: auto">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" rowspan="6">접수 → 배송완료</th>
						<td>주문접수</td>
						<td>주문접수 후 입금을 확인하는 단계 입니다.</td>
					</tr>
					<tr>
						<td>결제완료</td>
						<td>주문/결제가 완료되었거나 입금확인이 완료된 단계입니다.</td>
					</tr>
					<tr>
						<td>상품 준비중</td>
						<td>주문하신 상품을 발송하기 위해 상품을 준비하는 단계입니다.</td>
					</tr>
					<tr>
						<td>발송 준비중</td>
						<td>주문하신 상품을 택배사로 전달하는 단계입니다.</td>
					</tr>
					<tr>
						<td>상품 발송</td>
						<td>택배사를 통해 상품발송이 완료되어 배송추적이 가능한 단계입니다. <br>(H.Point는
							상품발송 단계에서만 내려받으실 수 있습니다.)
						</td>
					</tr>
					<tr>
						<td>배송 완료</td>
						<td>택배 송장 조회결과 배송완료된 단계입니다.</td>
					</tr>
					<tr>
						<th scope="row" rowspan="2">대여</th>
						<td>대여중</td>
						<td>결제가 완료되어 대여 처리중인 상태입니다.</td>
					</tr>
					<tr>
						<td>반납 완료</td>
						<td>반납이 완료된 상태입니다.</td>
					</tr>				
				</tbody>
			</table>
		</div>

		<!-- // 2020-09-03 텍스트 수정 -->
	</div>
</div>
<!-- // .contents -->
</div>
</div>
<!-- //.container -->

</main>
</html>